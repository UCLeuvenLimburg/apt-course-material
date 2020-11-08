require 'json'

DATA = JSON.parse(STDIN.read)


table = {}
result = []

for exam in DATA['exams']
    location = exam['location']

    table[location] = 0 unless table.has_key?(location)
    table[location] += 1
end

for location in table.keys
    capacity = DATA['room_capacities'][location]
    required = table[location]

    result.push(location) if required > capacity
end

result.sort!

for location in result
    puts location
end
