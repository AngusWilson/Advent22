//Dirty while loops and duplicated code



input:read0`:Advent22/inputs/day08.txt
grid:"I"$/:" ",/:/: input


//y axis
i:0
//x axis
j:0
currentMax:-1
stateMap:(xs:count[first grid]) # enlist (ys:count[grid])#0b

/scan left to right,
while[i<ys;
   while[j<xs;
        stateMap:.[stateMap;(i;j);:;stateMap[i;j] or grid[i;j]>currentMax];
        currentMax:max(grid[i;j];currentMax);
        j+:1;
        ];
    i+:1;
    j:0;
    currentMax:-1;
    ];

i:0;
/scan top to bottom,
while[j<xs;
   while[i<ys;
        stateMap:.[stateMap;(i;j);:;stateMap[i;j] or grid[i;j]>currentMax];
        currentMax:max(grid[i;j];currentMax);
        i+:1;
        ];
    j+:1;
    i:0;
    currentMax:-1;
    ];

i:0;
j:xs-1;
/scan right to left,
while[i<ys;
   while[j>=0;
        stateMap:.[stateMap;(i;j);:;stateMap[i;j] or grid[i;j]>currentMax];
        currentMax:max(grid[i;j];currentMax);
        j-:1;
        ];
    i+:1;
    j:xs-1;
    currentMax:-1;
    ];

i:ys-1;
j:xs-1;
/scan bottom to top,
while[j>=0;
   while[i>=0;
        stateMap:.[stateMap;(i;j);:;stateMap[i;j] or grid[i;j]>currentMax];
        currentMax:max(grid[i;j];currentMax);
        i-:1;
        ];
    j-:1;
    i:ys-1;
    currentMax:-1;
    ];    
    
//part 1
sum sum each stateMap




//part 2
i:j:0
scoreMap:(xs:count[first grid]) # enlist (ys:count[grid])#0;

while[i<ys;
   while[j<xs;
        left:reverse j#grid[i;];
        right:(j+1) _grid[i;];
        up:reverse i#grid[;j];
        down:(i+1) _grid[;j];

        rs:(count right)^1+first where right>=grid[i;j];
        ls:(count left)^1+first where left>=grid[i;j];
        us:(count up)^1+first where up>=grid[i;j];
        ds:(count down)^1+first where down>=grid[i;j];
        scoreMap:.[scoreMap;(i;j);:;prd (rs;ls;us;ds)];
        j+:1;
        ];
    j:0;
    i+:1;
    ];


max max each scoreMap

