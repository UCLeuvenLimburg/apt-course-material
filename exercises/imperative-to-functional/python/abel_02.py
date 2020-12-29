import json
import sys

f = sys.stdin.read()
data = json.loads(f)
rid = sys.argv[1]

exams_for_student = filter(lambda exam: exam['student_id'] == rid, data['exams'])
courses_for_student = map(lambda exam: exam['course'], exams_for_student)
sorted_courses = sorted(courses_for_student)

print("\n".join(sorted_courses))
