sort []     = []
sort [x]    = [x]
sort (x:xs) = sort left ++ [x] ++ sort right
  where
    left  = filter (<= x) xs
    right = filter (> x) xs
