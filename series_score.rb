require './teams'
require './seeds'
require './simulations'

t1 = ARGV[0].to_sym
t2 = ARGV[1].to_sym

sims = 100000
results = []
for i in 0..sims-1
  outcome = simulate_series(t1, t2)
  results << [outcome[:scores][t1], outcome[:scores][t2]].to_s
end

freq = {}
results.each do |r|
  freq[r] ||= 0
  freq[r] += 1
end
most_common = freq.sort_by { |k,v| v }
puts most_common