import itertools


def divisible_by(n, divider):
    return n % divider == 0


def primes():
    n = 2
    while True:
        if not any(divisible_by(n, k) for k in range(2, n)):
            yield n
        n += 1

def primes2():
    return (k for k in itertools.count(2) if all(k % i != 0 for i in range(2, k)))


print(list(itertools.islice(primes(), 0, 10)))
print(list(itertools.islice(primes2(), 0, 10)))