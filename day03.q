input:read0 `:Advent22/inputs/day03.txt

//Part1
sum 1+(.Q.a,.Q.A)? {distinct x inter y}./: (`int$(count each input)%2)cut' input 

//Part2
sum 1+(.Q.a,.Q.A)? {distinct x inter y inter z}./:3 cut input
