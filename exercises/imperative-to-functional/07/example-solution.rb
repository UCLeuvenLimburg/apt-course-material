require 'json'

DATA = JSON.parse(STDIN.read)

rooms = DATA['room_capacities'].keys
max_capacity = DATA['room_capacities'].values.max
result = rooms.select { |room| DATA['room_capacities'][room] == max_capacity }.sort

puts result
