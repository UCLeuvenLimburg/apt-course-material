require 'json'

rid, = ARGV

data = JSON.parse(STDIN.read)

data['exams'].select { |exam| exam['student_id'] == rid }
             .map { |exam| exam['timeslot'] }
             .tally
             .select { |timeslot, frequency| frequency > 1 }
             .map(&:first)
             .sort
             .then { |result| puts result }