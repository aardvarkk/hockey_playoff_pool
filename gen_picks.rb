require './teams'
require './seeds'
require './simulations'

sims = 100000

@results = []

@gp = {}
Teams::SHORT.each{ |t| @gp[t] = 0.0 }

def load_players(filename)
  players = []
  f = File.open(filename, 'r')
  f.each_line.each_slice(4) do |ls|
    player = {}
    player[:name] = ls[0].strip!
    player[:team] = ls[1].split.last
    player[:gp]   = ls[2].to_i
    player[:pts]  = ls[3].to_i
    players << player
  end
  f.close
  return players
end

# puts Teams::SHORT
# Teams::SHORT.each_with_index{|t,i| puts "#{i+1} #{t}"}
# puts Teams::LONG
# puts Seeds::MATCHUPS

# Check that everybody has played the same number of games
Teams::RECORDS.each{|k,v| puts "#{k} has incorrect record" if v.inject(:+) != 82}

@results = []
for i in 1..sims
  matchups = Seeds::MATCHUPS
  round = 0
  while matchups.length > 1
    matchups = simulate_round(matchups)
    @results[round] ||= []
    @results[round] << matchups.to_s
    round += 1
  end
end

# Find average number of games played per player
@gp.each{ |k,v| @gp[k] = v / sims }
puts @gp

# common_results = {}
# @results.each do |r|
#   common_results[r] ||= 0
#   common_results[r] += 1
# end
# commonest_results = common_results.sort_by{ |result, occurrences| occurrences }
# puts commonest_results[-1]
# puts commonest_results[-2]
# puts commonest_results[-3]
# puts commonest_results[-4]
# puts commonest_results[-5]

# puts @results

# Choose most common result for each round
# Choose winning teams in each bracket
common_results = []
for i in 0..@results.length-1
  common_results[i] = {}
  @results[i].each do |r|
    common_results[i][r] ||= 0
    common_results[i][r] += 1
  end
  freq = common_results[i].sort_by{ |result, occ| occ}
  # puts freq

  for j in 1..3
    puts "Round Common Outcome #{j}: #{freq[-j]}"
  end
end

# Calculate expected points based on number of games played * average PPG
player_sets = {}
player_sets[:fwd] = load_players('fwd')
player_sets[:def] = load_players('def')
player_sets[:gls]  = load_players('gls')

tops = {}
player_sets.each do |key,ps|
  ps.each do |f|
    f[:ppg] = f[:pts].to_f / f[:gp]
    f[:playoff_pts] = f[:ppg] * @gp[f[:team].to_sym]

    # We reward people who played the whole season
    # f[:playoff_pts] *= f[:gp].to_f / 82

    # We ignore people who didn't play much
    f[:playoff_pts] *= f[:gp] >= 30 ? 1 : 0
  end

  tops[key] = ps.sort_by{|p| p[:playoff_pts]}.reverse
end

puts "FORWARDS"
puts tops[:fwd][0..15]
puts "DEFENSE"
puts tops[:def][0..7]
puts "GOALIES"
puts tops[:gls][0..3]

# Check for injuries...