require 'json'

DATA = JSON.parse(STDIN.read)


result = DATA['exams'].map { |exam| exam['location'] }
                      .tally
                      .max_by { |location, frequency| frequency }
                      .first

puts result
