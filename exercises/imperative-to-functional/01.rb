require 'json'

DATA = JSON.parse(STDIN.read)


result = []

for exam in DATA
    course = exam['course']
    result.push(course) unless result.include?(course)
end

result.sort!

for course in result
    puts course
end
