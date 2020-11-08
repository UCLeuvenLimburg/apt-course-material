require 'json'

DATA = JSON.parse(STDIN.read)


room_capacities = DATA['room_capacities']
result = [ room_capacities.keys[0] ]

for room, capacity in room_capacities
    if capacity > room_capacities[result[0]]
        result = [ room ]
    elsif capacity == room_capacities[result[0]]
        result.push(room) unless result.include?(room)
    end
end

result.sort!

for room in result
    puts room
end
