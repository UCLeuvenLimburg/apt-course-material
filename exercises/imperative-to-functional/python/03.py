import json
import sys

f = sys.stdin.read()
data = json.loads(f)
rid = sys.argv[1]

exams_for_student = [exam for exam in data['exams'] if exam['student_id'] == rid]
timeslots_for_student = [exam['timeslot'] for exam in exams_for_student]
duplicate_timeslots = set([timeslot for timeslot in timeslots_for_student if timeslots_for_student.count(timeslot) > 1])


print("\n".join(map(str, duplicate_timeslots)))
