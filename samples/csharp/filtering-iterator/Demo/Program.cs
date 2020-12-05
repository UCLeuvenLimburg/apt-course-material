using System;
using System.Collections;
using System.Collections.Generic;

namespace Demo
{
    interface Iterator<T>
    {
        T Current { get; }
        bool HasNext { get; }

        void Next();
    }

    class RangeIterator : Iterator<int>
    {
        private int current;

        private int maximum;

        public RangeIterator(int from, int to)
        {
            this.current = from;
            this.maximum = to;
        }

        public int Current => current;

        public bool HasNext => current < maximum;

        public void Next()
        {
            ++current;
        }
    }

    class FilteringIterator<T> : Iterator<T>
    {
        private Iterator<T> iterator;

        private Predicate<T> predicate;

        private T current;

        public FilteringIterator(Iterator<T> iterator, Predicate<T> predicate)
        {
            this.iterator = iterator;
            this.predicate = predicate;
        }

        public T Current => current;

        public bool HasNext => iterator != null;

        public void Next()
        {
            current = iterator.Current;

            AdvanceToNext();
        }

        private void AdvanceToNext()
        {
            if (!iterator.HasNext)
            {
                iterator = null;
            }
            else
            {
                iterator.Next();

                while (!predicate(iterator.Current))
                {
                    if (!iterator.HasNext)
                    {
                        iterator = null;
                        return;
                    }

                    iterator.Next();
                }
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            var rit = new RangeIterator(0, 10);
            var it = new FilteringIterator<int>(rit, x => x % 3 == 0);

            while ( it.HasNext )
            {
                it.Next();
                Console.WriteLine(it.Current);
            }
        }
    }
}
