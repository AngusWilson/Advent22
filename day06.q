input:first read0`:Advent22/inputs/day06.txt


part1:{
    i:0;
    while[(not 4=count distinct 4#i _x) and i<count x;
        i+:1
        ];
    i+4
   }

part1 input



part2:{
    i:0;
    while[(not 14=count distinct 14#i _x) and i<count x;
        i+:1
        ];
    i+14
   }

part2 input
