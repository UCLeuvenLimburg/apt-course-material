require 'json'

rid, = ARGV

JSON.parse(STDIN.read)['exams']
    .filter{|element| element['student_id'] == rid}
    .map{|element| element['course']}
    .sort
    .each{|element| puts element}
