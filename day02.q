input:read0 `:Advent22/inputs/day02.txt

//Part 1

/A X rock     1
/B Y paper    2
/c Z scissors 3

/win 6
/draw 3
/loss 0

outcomes:(!). flip(
    ("A Y"; 2+6); 
    ("B Y"; 2+3);
    ("C Y"; 2+0);
    ("A X"; 1+3);
    ("B X"; 1+0);
    ("C X"; 1+6);
    ("A Z"; 3+0);
    ("B Z"; 3+6);
    ("C Z"; 3+3)
    )


sum outcomes @/:input

//Part 2

/x lose
/y draw
/z win

outcomes:(!). flip(
    ("A Y"; 3+1); 
    ("B Y"; 3+2);
    ("C Y"; 3+3);
    ("A X"; 0+3);
    ("B X"; 0+1);
    ("C X"; 0+2);
    ("A Z"; 6+2);
    ("B Z"; 6+3);
    ("C Z"; 6+1)
    )

sum outcomes @/:input
