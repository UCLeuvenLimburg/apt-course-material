import { Evaluation } from './shared';


export function top_students(evaluations : Evaluation[]) : { [key : string] : string[] }
{
    const evaluations_by_course : { [key : string] : Evaluation[] } = {};

    for ( const evaluation of evaluations )
    {
        if ( evaluation.grade >= 10 )
        {
            if ( !(evaluation.course in evaluations_by_course) )
            {
                evaluations_by_course[evaluation.course] = [];
            }

            const course_evaluations = evaluations_by_course[evaluation.course];

            let i = 0;
            while ( i < course_evaluations.length && evaluation.grade < course_evaluations[i].grade )
            {
                ++i;
            }

            course_evaluations.splice(i, 0, evaluation);

            if ( course_evaluations.length > 3 )
            {
                course_evaluations.pop();
            }
        }
    }

    const result : { [key : string] : string[] } = {};

    for ( const course in evaluations_by_course )
    {
        const students = [];

        for ( const evaluation of evaluations_by_course[course] )
        {
            students.push(evaluation.student);
        }

        result[course] = students;
    }

    return result;
}