using System;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.IO;
using System.Linq;
using System.Collections.Generic;


namespace csharp_solution
{
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
            var data = JsonSerializer.Deserialize<Data>(rawData);
            var result = data.exams.Select(exam => exam.course).Distinct().OrderBy(x => x);

            Console.WriteLine(string.Join("\n", result));
        }
    }
}
