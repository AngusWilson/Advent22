//Solution isn't nice but gets it done


test:("    [D]    ";
    "[N] [C]    ";
    "[Z] [M] [P]";
    " 1   2   3 ";
    "";
    "move 1 from 2 to 1";
    "move 3 from 1 to 3";
    "move 2 from 2 to 1";
    "move 1 from 1 to 2")

input:read0 `:Advent22/inputs/day05.txt

cutpoint:first where "" ~/: input
stackNums: get last stacks:cutpoint # input
state:stackNums!`$/:/:trim each 1_/:reverse each flip stacks[;1,-1_1+4*stackNums]
instructions:1_ cutpoint _input
moves:"I"$(" " vs/:instructions)[;1 3 5]


move:{[n;f;t]
    .global.state[t]:.global.state[t],reverse neg[n]#.global.state f;
    .global.state[f]:neg[n]_.global.state f;
    .global.state
    }

//Part 1
.global.state:state
move ./: moves 
raze string value last each .global.state




//Part 2
move2:{[n;f;t]
    .global.state[t]:.global.state[t],neg[n]#.global.state f;
    .global.state[f]:neg[n]_.global.state f;
    .global.state
    }

.global.state:state
move2 ./: moves 

raze string value last each .global.state
