: cube ( n -- n ) dup dup * * ;
: sum-cubes ( n -- x ) dup 0 = [ ] [ dup cube swap 1 - sum-cubes + ] if ;