input:read0 `:Advent22/inputs/day04.txt

split:"," vs/: input
fs:raze each "I"$"-"vs/:/: split

//Part 1
sum  ((fs[;0]<='fs[;2]) and fs[;1]>='fs[;3]) or (fs[;0]>='fs[;2]) and fs[;1]<='fs[;3]

//Part 2
sum (fs[;0] within' fs[;2 3]) or (fs[;1] within' fs[;2 3]) or (fs[;2] within' fs[;0 1]) or (fs[;3] within' fs[;0 1])
