from collections import namedtuple


Position = namedtuple('Position', ['x', 'y'])


def same_row(p, q):
    return p.y == q.y

def same_column(p, q):
    return p.x == q.x

def same_square(p, q):
    return p.x // 3 == q.x // 3 and p.y // 3 == q.y // 3

def same_group(p, q):
    return same_row(p, q) or same_column(p, q) or same_square(p, q)


def solve(done, todo):
    if todo:
        todo = sorted(todo, key=lambda pair: len(pair[1]))
        (position, domain), *rest = todo
        for value in domain:
            updated_done = { **done, position: value }
            updated_todo = [ (p, ns - { value } if same_group(position, p) else ns ) for p, ns in rest ]
            yield from solve(updated_done, updated_todo)
    else:
        yield done


def parse(strings):
    return [ (Position(x,y), set(range(1,10)) if strings[y][x] == '.' else { int(strings[y][x]) }) for x in range(0, 9) for y in range(0, 9) ]

def unparse(bindings):
    return "\n".join(''.join(str(bindings[Position(x,y)]) for x in range(0, 9)) for y in range(0, 9))


bindings = parse('''
53..7....
6..195...
..8....6.
8...6...3
4..8.3..1
7...2...6
.6....28.
...419..5
....8..79
'''.strip().splitlines())

for bs in solve({}, bindings):
    print(unparse(bs))