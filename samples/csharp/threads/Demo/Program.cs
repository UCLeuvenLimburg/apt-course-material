using System;
using System.Threading;
using System.Diagnostics;
using System.Collections.Generic;
using System.Linq;

namespace Demo
{
    class Program
    {
        static void Proc(List<DateTime> list)
        {
            while ( list.Count < 10000000 )
            {
                list.Add(DateTime.Now);
            }
        }

        static void Analyze(List<DateTime> list)
        {
            Console.WriteLine(string.Join("\n", list.Zip(list.Skip(1), (x, y) => (y - x).TotalMilliseconds).OrderBy(x => x).Reverse().Take(10).Select(x => x.ToString())));
        }

        static void Main(string[] args)
        {
            var process = Process.GetCurrentProcess();
            process.ProcessorAffinity = (IntPtr) 1;

            var list1 = new List<DateTime>();
            var list2 = new List<DateTime>();

            var t1 = new Thread(() => Proc(list1));
            var t2 = new Thread(() => Proc(list2));

            t1.Start();
            t2.Start();
            t1.Join();
            t2.Join();

            Analyze(list1);
            Console.WriteLine("---");
            Analyze(list1);
        }
    }
}
