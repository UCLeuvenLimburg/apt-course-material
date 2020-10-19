Evaluation = Struct.new :student, :grade, :course

N = 20

rnd = Random.new

courses = ['bop', 'oop', 'ooo', 'vgo', 'pvm']

$evaluations = (1..N).map do
    id = "r#{rnd.rand(1000).to_s.rjust(3, '0')}"
    grade = (rnd.rand.then { |x| 1 - x**2 } * 20).round
    course = courses[rnd.rand(courses.size)]

    Evaluation.new id, grade, course
end

def functional
    $evaluations.group_by { |evaluation| evaluation.course }
                .transform_values do |evaluations|
                    evaluations.select { |evaluation| evaluation.grade >= 10 }
                               .max_by(3) { |evaluation| evaluation.grade }
                               .map(&:student)
    end
end

def imperative
    result = {}

    for evaluation in $evaluations
        unless result.has_key?(evaluation.course)
            result[evaluation.course] = [ ]
        end

        if evaluation.grade >= 10
            course_evaluations = result[evaluation.course]

            i = 0
            while i < course_evaluations.size and evaluation.grade < course_evaluations[i].grade
                i += 1
            end

            course_evaluations.insert(i, evaluation)

            if course_evaluations.size > 3
                course_evaluations.pop
            end
        end
    end

    for course, course_evaluations in result
        for i in 0...course_evaluations.size
            course_evaluations[i] = course_evaluations[i].student
        end
    end

    result
end

p imperative
p functional
