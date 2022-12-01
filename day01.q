input:read0 `:Advent22/inputs/day01.txt


d:deltas s: where null v:get each input;
cals:sum each 1_/:sublist[;v] each ((s-d),'d);

part1:max cals;

part2:sum 3# desc cals;
