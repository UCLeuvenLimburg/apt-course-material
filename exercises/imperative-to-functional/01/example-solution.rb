require 'json'

data = JSON.parse(STDIN.read)

data['exams'].map { |element| element['course'] }
             .uniq
             .sort
             .each { |element| puts element }
