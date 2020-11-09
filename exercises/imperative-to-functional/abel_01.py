import json
import sys

f = sys.stdin.read()
data = json.loads(f)

courses = map(lambda exam: exam['course'], data['exams'])
unique_courses = list(set(courses))
sorted_courses = sorted(unique_courses)

print("\n".join(sorted_courses))
