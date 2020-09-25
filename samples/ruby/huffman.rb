Leaf = Struct.new :datum, :weight do
    def codes(hash={}, acc=[])
        hash[datum] = acc
        hash
    end
end

Branch = Struct.new :left, :right do
    def weight
        @weight ||= left.weight + right.weight
    end

    def codes(hash={}, acc=[])
        left.codes(hash, [*acc, 0])
        right.codes(hash, [*acc, 1])
        hash
    end
end

def huffman(xs)
    nodes = xs.tally.to_a.map { |datum, weight| Leaf.new datum, weight }
    nodes = nodes.sort_by(&:weight).then { |x, y, *rest| [ Branch.new(x, y), *rest ] } until nodes.size == 1
    codes = nodes.first.codes
    xs.flat_map { |x| codes[x] }
end


p huffman([1,2,3,2])