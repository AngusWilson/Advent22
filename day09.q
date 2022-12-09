//Disgusting loops and ifs. Not cleaning todays up. It get the result


input:("R 4";
    "U 4";
    "L 3";
    "D 1";
    "R 4";
    "D 1";
    "L 5";
    "R 2")

input:read0`:Advent22/inputs/day09.txt

start:0 0 
map:"RULD"!(0 1;-1 0;0 -1;1 0)
split:" "vs/:input
hMoves:raze ("I"$ split[;1]) #' (map split[;0] )
hloc:enlist[start],start+\ hMoves


tLoc:0 0
i:0
tLocHist:enlist 0 0
while[i<count hloc;
    adj:0 0;
    //If in same row, it's a col move
    if[hloc[i][1] = tLoc[1];
        if[(hloc[i][0])>1+tLoc[0];
            adj+:(1;0);
            ];
        if[(hloc[i][0])<tLoc[0]-1;
            adj+:(-1;0);
            ];
        ];
    //If in same col, it's a row move
    if[hloc[i][0] = tLoc[0];    
        if[(hloc[i][1])>1+tLoc[1];
            adj+:(0;1);
            ];
        if[(hloc[i][1])<tLoc[1]-1;
            adj+:(0;-1);
            ];
        ];
    //Otherwise it has to be diag.
    if[all not hloc[i]='tLoc;
        adj:signum hloc[i]-tLoc;
        ];
    //if same place, no move
    if[all  hloc[i]='tLoc;
        adj:0 0;
        ];
    //If diag but touching, no move
    if[1 1~abs hloc[i]-tLoc;
        adj:0 0;
        ];
    tLoc+:adj;
    
    tLocHist,:enlist tLoc;
    /display:max[1+abs tLocHist[;0],(i+1)#hloc[;0]]# enlist max[1+abs tLocHist[;1],(i+1)#hloc[;1]] # ".";
    /newDisplay:.[display;abs hloc[i];:;"H"];
    /show reverse .[newDisplay;abs tLoc;:;"T"];
    /show "_________";
    i+:1;
    ];


//Part 1
count distinct tLocHist



















//Func now takes location of head, spits out locs of tail.
tailLoop:{[hloc]
    tLoc:0 0;
    i:0;
    tLocHist:enlist 0 0;
    while[i<count hloc;
        adj:0 0;
        //If in same row, it's a col move
        if[hloc[i][1] = tLoc[1];
            if[(hloc[i][0])>1+tLoc[0];
                adj+:(1;0);
                ];
            if[(hloc[i][0])<tLoc[0]-1;
                adj+:(-1;0);
                ];
            ];
        //If in same col, it's a row move
        if[hloc[i][0] = tLoc[0];    
            if[(hloc[i][1])>1+tLoc[1];
                adj+:(0;1);
                ];
            if[(hloc[i][1])<tLoc[1]-1;
                adj+:(0;-1);
                ];
            ];
        //Otherwise it has to be diag.
        if[all not hloc[i]='tLoc;
            adj:signum hloc[i]-tLoc;
            ];
        //if same place, no move
        if[all  hloc[i]='tLoc;
            adj:0 0;
            ];
        //If diag but touching, no move
        if[1 1~abs hloc[i]-tLoc;
            adj:0 0;
            ];
        tLoc+:adj;

        tLocHist,:enlist tLoc;
        /display:max[1+abs tLocHist[;0],(i+1)#hloc[;0]]# enlist max[1+abs tLocHist[;1],(i+1)#hloc[;1]] # ".";
        /newDisplay:.[display;abs hloc[i];:;"H"];
        /show reverse .[newDisplay;abs tLoc;:;"T"];
        /show "_________";
        i+:1;
        ];
    tLocHist,:enlist tLoc;
    tLocHist
    }



//Part 2
input:("R 5";
    "U 8";
    "L 8";
    "D 3";
    "R 17";
    "D 10";
    "L 25";
    "U 20")



render:{[locs]
        bufferx:abs min locs[;0];
        buffery:abs min locs[;1];
        display:(bufferx+1+max abs locs[;0])# enlist(buffery+1+max abs locs[;1]) # ".";
        i:0;
        while[i<count locs;
            display:.[display;(bufferx;buffery)+locs[i];:;"#"];
            i+:1;
            ];
        show display
        }
        

start:0 0 
map:"RULD"!(0 1;-1 0;0 -1;1 0)
split:" "vs/:input
hMoves:raze ("I"$ split[;1]) #' (map split[;0] )
newLoc:enlist[start],start+\ hMoves
l:0
while[l<9;
    newLoc:tailLoop newLoc;
    /render newLoc;
    l+:1;
    ];
count distinct newLoc
