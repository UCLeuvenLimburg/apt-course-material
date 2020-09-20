using System;
using System.Collections;
using System.Collections.Generic;
using static System.Linq.Enumerable;

namespace PrimeGeneratorDemo
{
    class Program
    {
            public static bool IsPrime(int n)
            {
                return n >= 2 && Range(2, n - 2).All(k => n % k != 0);
            }

            public static IEnumerable<int> Primes()
            {
                var n = 2;

                while ( true )
                {
                    if (IsPrime(n))
                    {
                        yield return n;
                    }

                    n++;
                }
            }

        static void Main(string[] args)
        {
            foreach ( var prime in Primes() )
            {
                Console.WriteLine(prime);
            }
        }
    }
}
