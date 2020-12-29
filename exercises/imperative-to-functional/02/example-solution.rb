require 'json'

rid, = ARGV

data = JSON.parse(STDIN.read)

data['exams'].filter { |element| element['student_id'] == rid }
             .map { |element| element['course'] }
             .sort
             .each { |element| puts element }
