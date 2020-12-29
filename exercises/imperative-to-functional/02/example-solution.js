const fs = require('fs')


const data = JSON.parse(fs.readFileSync(process.argv[2]));
const rid = process.argv[3];

const result = data.exams.filter(exam => exam.student_id === rid).map(exam => exam.course).sort();

process.stdout.write(result.join('\n'));