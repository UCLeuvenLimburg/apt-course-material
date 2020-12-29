require 'json'

rid, = ARGV

data = JSON.parse(STDIN.read)

locFreq = data['exams'].map { |exam| exam['location'] }.tally
locs = locFreq.keys
caps = data['room_capacities']
locs.select { |loc| locFreq[loc] > caps[loc] }
    .sort
    .then { |r| puts r }