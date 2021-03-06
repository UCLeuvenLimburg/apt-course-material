require 'optparse'
require 'json'

Courses = [ 'bop', 'algo', 'oop', 'ooo', 'pvm', '3dcg', 'scripting', 'mobile', 'bpm', 'tdm', 'db', 'db2', 'web1', 'web2', 'web3', 'web4', 'it&r', 'da', 'cs', 'bs1', 'bs2' ]


$rng = Random.new
$n_students = 10
$n_timeslots = 20
$n_locations = 50


OptionParser.new do |opts|
    opts.on('--seed N', Integer) { |seed| $rng = Random.new seed }
    opts.on('-s', '--nstudents N', Integer) { |n_students| $n_students = n_students }
    opts.on('-t', '--ntimeslots N', Integer) { |n_timeslots| $n_timeslots = n_timeslots }
    opts.on('-l', '--nlocations N', Integer) { |n_locations| $n_locations = n_locations }
end.parse!


def random_integer(range)
    $rng.rand(range.max - range.min + 1) + range.min
end

def random_element(xs)
    i = random_integer(0...xs.size)
    xs[i]
end

def random_elements(xs, n)
    xs.shuffle(random: $rng)[0...n]
end

def random_courses(n)
    random_elements(Courses, n)
end

def random_timeslot
    random_integer(0...$n_timeslots)
end

def make_location(i)
    "L#{i.to_s.rjust($n_locations.to_s.size, '0')}"
end

def random_location
    make_location(random_integer(0...$n_locations))
end


exams = (1..$n_students).flat_map do |id|
    student_id = "r#{id.to_s.rjust($n_students.to_s.size, '0')}"
    n_courses = random_integer(1...Courses.size)
    courses = random_courses(n_courses)

    courses.map do |course|
        timeslot = random_timeslot
        location = random_location

        {
            student_id: student_id,
            course: course,
            timeslot: timeslot,
            location: location
        }
    end
end

room_capacities = (0...$n_locations).map do |i|
    location = make_location i
    capacity = random_integer(5..20)

    [location, capacity]
end.to_h

json = JSON.dump({exams: exams, room_capacities: room_capacities})

puts json