n `divisibleBy` k = n `rem` k == 0

reject predicate = filter (not . predicate)

primes = aux [2..]
  where
    aux (n:ns) = n : aux (reject (`divisibleBy` n) ns)
