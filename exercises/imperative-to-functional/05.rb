require 'json'

DATA = JSON.parse(STDIN.read)


location, timeslot = ARGV
result = 0

timeslot = timeslot.to_i

for exam in DATA['exams']
    result += 1 if exam['location'] == location and exam['timeslot'] == timeslot
end

puts result