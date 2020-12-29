const fs = require('fs')



const data = JSON.parse(fs.readFileSync(process.argv[2]));
const location = process.argv[3];
const timeslot = process.argv[4];

const result = data['exams'].filter(exam => exam.location == location && exam.timeslot == timeslot).length;

process.stdout.write(`${result}`);