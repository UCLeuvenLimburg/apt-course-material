require_relative 'functional.rb'
require_relative 'imperative.rb'


Evaluation = Struct.new :student, :grade, :course

N = 20

rnd = Random.new

courses = ['bop', 'oop', 'ooo', 'vgo', 'pvm']

evaluations = (1..N).map do
    id = "r#{rnd.rand(1000).to_s.rjust(3, '0')}"
    grade = (rnd.rand.then { |x| 1 - x**2 } * 20).round
    course = courses[rnd.rand(courses.size)]

    Evaluation.new id, grade, course
end


p functional(evaluations)
p imperative(evaluations)