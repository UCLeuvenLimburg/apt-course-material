const fs = require('fs')


const data = JSON.parse(fs.readFileSync(process.argv[2]));
const exams = data.exams;
const courses = exams.map(exam => exam.course);
const result = [...new Set(courses)].sort();

process.stdout.write(result.join('\n'));