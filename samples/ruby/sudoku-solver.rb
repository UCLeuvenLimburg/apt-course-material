Pos = Struct.new :x, :y

def same_row?(p, q)
    p.y == q.y
end

def same_col?(p, q)
    p.x == q.x
end

def same_sqr?(p, q)
    p.x / 3 == q.x / 3 and p.y / 3 == q.y / 3
end

def same_group?(p, q)
    same_row?(p, q) or same_col?(p, q) or same_sqr?(p, q)
end

def solve(pairs, solution={})
    if pairs.empty?
        solution
    else
        pairs.sort_by do |pos, domain|
            domain.size
        end.then do |(pos, domain), *rest|
            domain.flat_map do |n|
                leftovers = rest.map { |p, d| same_group?(p, pos) ? [p, d-[n]] : [p, d] }
                solve(leftovers, solution.merge({pos => n}))
            end
        end
    end
end

def parse(string)
    string.lines.flat_map.with_index do |line, y|
        line.strip.chars.map.with_index do |char, x|
            [ Pos.new(x, y), char == '.' ? (1..9).to_a : [char.to_i] ]
        end
    end
end

def format(solution)
    (0..8).map do |y|
        (0..8).map do |x|
            solution[Pos.new(x, y)]
        end.join
    end.join("\n")
end

puzzle = parse <<END
53..7....
6..195...
..8....6.
8...6...3
4..8.3..1
7...2...6
.6....28.
...419..5
....8..79
END

solve(puzzle).each do |solution|
    puts(format solution)
end