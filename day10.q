input:read0 `:Advent22/inputs/day10.txt

inst:sum each 0,/:"I"$1_/: " " vs/: input
ind:raze sums (("addx";"noop")!(2 1))1#/:" " vs/: input

res:(enlist[0]!enlist[1]),ind!(1+\ inst )

//Part 1
sum c*'res key[res] last each where each key[res] </:c:20+40*til 6

//Part 2
i:0^last each key[res] where each key[res]<=/:til 240
hash: ((til 240) mod 40) in' res[i]+\:(-1;0;1)
40 cut @[240# ".";where hash;:;"#"]
