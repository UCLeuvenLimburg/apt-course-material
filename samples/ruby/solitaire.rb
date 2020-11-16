class Solver
    def initialize
        @cache = {}
    end

    def solved?(configuration)
        configuration.count(true) == 1
    end

    def solve(configuration)
        return @cache[configuration] if @cache.has_key? configuration
        return [ [] ] if solved? configuration

        left_jump_solutions = (2...configuration.size).select do |i|
            configuration[i-2..i] == [false, true, true]
        end.flat_map do |i|
            next_configuration = [ *configuration[0...i-2], true, false, false, *configuration[i+1..-1] ]

            solve(next_configuration).map { |solution| [ [:left, i], *solution ] }
        end

        right_jump_solutions = (0...configuration.size - 2).select do |i|
            configuration[i..i+2] == [true, true, false]
        end.flat_map do |i|
            next_configuration = [ *configuration[0...i], false, false, true, *configuration[i+3..-1] ]

            solve(next_configuration).map { |solution| [ [:right, i], *solution ] }
        end

        @cache[configuration] = left_jump_solutions + right_jump_solutions
    end
end

def parse(string)
    string.chars.map { |char| char != '.' }
end

def solve(string)
    configuration = parse string
    Solver.new.solve(configuration)
end

p solve('..xx..xx..')