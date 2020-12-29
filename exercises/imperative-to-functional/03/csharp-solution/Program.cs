using System;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.IO;
using System.Linq;
using System.Collections.Generic;


namespace csharp_solution
{
    public static class IEnumerableExtensions
    {
        public static IDictionary<T, int> Tally<T>(this IEnumerable<T> xs)
        {
            var result = new Dictionary<T, int>();

            foreach ( var x in xs )
            {
                if ( !result.ContainsKey(x) )
                {
                    result[x] = 0;
                }

                result[x] += 1;
            }

            return result;
        }
    }

    class Data
    {
        public List<Exam> exams { get; set; }
    }

    class Exam
    {
        public string student_id { get; set; }
        public string course { get; set; }
        public int timeslot { get; set; }
        public string location { get; set; }
    }

    class Program
    {
        static void Main(string[] args)
        {
            var rawData = File.ReadAllText(args[0]);
            var rid = args[1];
            var data = JsonSerializer.Deserialize<Data>(rawData);
            var result = data.exams.Where(exam => exam.student_id == rid).Select(exam => exam.timeslot).Tally().Where(pair => pair.Value > 1).Select(pair => pair.Key).OrderBy(x => x).Select(x => x.ToString());

            Console.WriteLine(string.Join("\n", result));
        }
    }
}
