require 'json'

JSON.parse(STDIN.read)['exams']
    .map{|element| element['course']}
    .uniq
    .sort
    .each{|element| puts element}

