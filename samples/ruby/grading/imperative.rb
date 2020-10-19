def imperative(evaluations)
    result = {}

    for evaluation in evaluations
        if evaluation.grade >= 10
            unless result.has_key? evaluation.course
                result[evaluation.course] = [ ]
            end

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
