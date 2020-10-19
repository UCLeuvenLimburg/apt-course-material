def functional(evaluations)
    evaluations.group_by { |evaluation| evaluation.course }
               .transform_values do |course_evals|
                    course_evals.select { |evaluation| evaluation.grade >= 10 }
                                .max_by(3) { |evaluation| evaluation.grade }
                                .map(&:student)
    end
end
