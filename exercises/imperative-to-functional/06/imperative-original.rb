require 'json'

DATA = JSON.parse(STDIN.read)


table = {}

for exam in DATA['exams']
    location = exam['location']

    table[location] = 0 unless table.has_key?(location)
    table[location] += 1
end

result = table.keys[0]

for location in table.keys
    if table[location] > table[result]
        result = location
    end
end

puts result