require './teams'
require './seeds'

@gp = {}
@results = []

def simulate_game(t1, r1, t2, r2)
  # puts "Simulate Game"
  # puts "#{t1} vs #{t2}"

  w1 = w2 = false

  # Increment games played
  @gp[t1] ||= 0.0
  @gp[t2] ||= 0.0
  @gp[t1] += 1
  @gp[t2] += 1

  while (w1 == w2) do
    rnd1 = rand(1..82)
    rnd2 = rand(1..82)
    w1 = rnd1 <= r1[0]
    w2 = rnd2 <= r2[0]
    # puts rnd1
    # puts r1[0]
    # puts rnd2
    # puts r2[0]
    # puts "#{w1} #{w2}"
  end

  if w1
    # puts "#{t1} Wins Game"
    return t1
  else
    # puts "#{t2} Wins Game"
    return t2
  end
end

def simulate_series(t1, t2)
  # puts "Simulate Series"
  # puts "#{t1} vs #{t2}"

  # Play seven games and see who gets to four first
  r1 = Teams::RECORDS[t1]
  r2 = Teams::RECORDS[t2]

  scores = {
    t1 => 0,
    t2 => 0
  }

  # Simulate games
  while scores.values.max < 4
    scores[simulate_game(t1, r1, t2, r2)] += 1
    # puts "Series at #{scores}"
  end

  # Return a winner
  if scores[t1] > scores[t2]
    # puts "#{t1} Wins Series"
    return t1
  else
    # puts "#{t2} Wins Series"
    return t2
  end
end

def simulate_round(matchups)
  # puts "Simulate Round"
  # puts matchups

  winners = []
  (0..matchups.length-1).step(2) do |i|
    winners << simulate_series(matchups[i], matchups[i+1])
  end
  return winners
end

# puts Teams::SHORT
# Teams::SHORT.each_with_index{|t,i| puts "#{i+1} #{t}"}
# puts Teams::LONG
# puts Seeds::MATCHUPS

# Check that everybody has played the same number of games
Teams::RECORDS.each{|k,v| puts "#{k} has incorrect record" if v.inject(:+) != 82}

sims = 1000

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

# Choose winning teams in each bracket


# Calculate expected points based on number of games played * average PPG

# Check for injuries