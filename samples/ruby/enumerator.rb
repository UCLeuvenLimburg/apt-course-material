def integers
    Enumerator.new do |y|
        i = 0
        while true
            y.yield i
            i += 1
        end
    end.lazy
end

primes = integers.select do |k|
    k > 1 and (2...k).all? { |i| k % i != 0 }
end

p primes.map { |x| x * 2 }.eager.take(10)