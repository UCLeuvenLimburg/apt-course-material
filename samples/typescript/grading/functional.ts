import { Evaluation } from './shared';


function group_by<T>(ts : T[], keyFunction : (t : T) => string) : { [key : string] : T[] }
{
    const result : { [key : string] : T[] } = {};

    for ( const t of ts )
    {
        const key = keyFunction(t);

        if ( !(key in result) )
        {
            result[key] = [];
        }

        result[key].push(t);
    }

    return result;
}

function map_values<T, U>(object : { [key : string] : T }, f : (x : T) => U) : { [key : string] : U }
{
    const result : { [key : string] : U } = {};

    for ( const [key, value] of Object.entries(object) )
    {
        const transformedValue = f(value);

        result[key] = transformedValue;
    }

    return result;
}

function filter<T>(ts : T[], predicate : (t : T) => boolean) : T[]
{
    const result : T[] = [];

    for ( const t of ts )
    {
        if ( predicate(t) )
        {
            result.push(t);
        }
    }

    return result;
}

function find_index<T>(ts : T[], predicate : (t : T) => boolean) : number | null
{
    for ( let index = 0; index !== ts.length; ++index )
    {
        if ( predicate(ts[index]) )
        {
            return index;
        }
    }

    return null;
}

function insert_at<T>(ts : T[], index : number, t : T) : T[]
{
    const left = ts.slice(0, index);
    const right = ts.slice(index);

    return [ ...left, t, ...right ];
}

function max_by<T>(ts : T[], metric : (t : T) => number, n : number) : T[]
{
    let result : T[] = [];

    for ( const t of ts )
    {
        const index = find_index(result, e => metric(e) < metric(t) ) || result.length;
        result = insert_at(result, index, t);
        result = result.slice(0, 3);
    }

    return result;
}

function map<T, U>(ts : T[], f : (t : T) => U) : U[]
{
    const result : U[] = [];

    for ( const t of ts )
    {
        result.push(f(t));
    }

    return result;
}

export function top_students(evaluations : Evaluation[]) : { [key : string] : string[] }
{
    const passing_evaluations = filter(evaluations, e => e.grade >= 10);
    const evaluations_by_course = group_by(passing_evaluations, e => e.course);
    return map_values(evaluations_by_course, find_top_3);

    function find_top_3(course_evaluations : Evaluation[]) : string[]
    {
        const best_three_evaluations = max_by(course_evaluations, e => e.grade, 3);
        const names = map(best_three_evaluations, e => e.student);

        return names;
    }
}