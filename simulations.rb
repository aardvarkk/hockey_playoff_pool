def simulate_game(t1, r1, t2, r2)
  # puts "Simulate Game"
  # puts "#{t1} vs #{t2}"

  w1 = w2 = false

  # Increment games played
  if @gp
    @gp[t1] += 1
    @gp[t2] += 1
  end

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
  outcome = {}
  outcome[:scores] = scores
  outcome[:winner] = scores[t1] > scores[t2] ? t1 : t2
  return outcome
end

def simulate_round(matchups)
  # puts "Simulate Round"
  # puts matchups

  winners = []
  (0..matchups.length-1).step(2) do |i|
    outcome = simulate_series(matchups[i], matchups[i+1])
    winners << outcome[:winner]
  end
  return winners
end

