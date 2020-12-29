require 'json'

DATA = JSON.parse(STDIN.read)


rid, = ARGV
timeslots = []
result = []

for exam in DATA['exams']
    if exam['student_id'] == rid
        timeslot = exam['timeslot']

        if timeslots.include? timeslot
            result.push(timeslot) unless result.include?(timeslot)
        else
            timeslots.push(timeslot)
        end
    end
end

result.sort!

for timeslot in result
    puts timeslot
end
