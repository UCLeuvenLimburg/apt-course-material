const fs = require('fs')


Array.prototype.tally = function () {
    return this.reduce((acc, x) => { acc[x] = (acc[x] || 0) + 1; return acc; }, {});
};


const data = JSON.parse(fs.readFileSync(process.argv[2]));
const rid = process.argv[3];

const timeslotFrequencies = data.exams
                                .filter(exam => exam.student_id === rid)
                                .map(exam => exam.timeslot)
                                .tally();

const result = Object.keys(timeslotFrequencies).filter(timeslot => timeslotFrequencies[timeslot] > 1);

process.stdout.write(result.join('\n'));