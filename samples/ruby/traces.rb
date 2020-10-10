require 'set'


class Array
    def extract(i)
        [ self[0...i], self[i], self[i+1..-1] ]
    end
end

def traces_without_reordering(threads)
    threads = threads.reject(&:empty?)

    if threads.empty?
        [ [] ]
    else
        (0...threads.size).flat_map do |i|
            first, *rest = threads[i]
            left, _, right = threads.extract(i)

            traces_without_reordering( [ *left, rest, *right ] ).map do |trace|
                [ first, *trace ]
            end
        end
    end
end

def traces_with_reordering(threads)
    threads.flatten.permutation.to_a
end

def simulate
    a = 0
    b = 0
    x = 0
    y = 0

    t1 = [ -> { y = a }, -> { b = 1 } ]
    t2 = [ -> { x = b }, -> { a = 2 } ]

    yield([t1, t2]).each_with_object(Set.new) do |trace, set|
        a = 0
        b = 0
        x = 0
        y = 0

        trace.each(&:call)

        set.add([a, b, x, y])
    end
end

without = simulate { |*args| traces_without_reordering(*args) }
with = simulate { |*args| traces_with_reordering(*args) }

p without
p
p with
p
p(with - without)
