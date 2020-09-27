def max_7_day_average(data)
    data.each_cons(7)
        .map { |ks| ks.sum / ks.size }
        .max
end