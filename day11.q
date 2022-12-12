test:("Monkey 0:";
    "  Starting items: 79, 98";
    "  Operation: new = old * 19";
    "  Test: divisible by 23";
    "    If true: throw to monkey 2";
    "    If false: throw to monkey 3";
    "";
    "Monkey 1:";
    "  Starting items: 54, 65, 75, 74";
    "  Operation: new = old + 6";
    "  Test: divisible by 19";
    "    If true: throw to monkey 2";
    "    If false: throw to monkey 0";
    "";
    "Monkey 2:";
    "  Starting items: 79, 60, 97";
    "  Operation: new = old * old";
    "  Test: divisible by 13";
    "    If true: throw to monkey 1";
    "    If false: throw to monkey 3";
    "";
    "Monkey 3:";
    "  Starting items: 74";
    "  Operation: new = old + 3";
    "  Test: divisible by 17";
    "    If true: throw to monkey 0";
    "    If false: throw to monkey 1")


input:read0 `:Advent22/inputs/day11.txt
input:test
//Parse
cuts:0,1+where ("")~/:input

monkeyTxt:cuts cut enlist[""],input

//Create monkey dict
makeMonkeyDict:{[txt]
    //Monkey number
    num:"I"$-1_last " " vs txt[1];

    
    items:`int$value last ":" vs txt[2];
    op:value "{",last  "new =" vs ssr[txt 3;"old";"x"],"}";
    test: {"I"$(10b!(last " " vs first z;last " " vs last z)) 0= mod[x;"I"$last " " vs y]}[;txt[4];txt[5 6]];
    
    `monkey`items`op`test`inspections!(num;items;op;test;0)
    }


doMonkey:{[md]
    old:first md`items;
    new:md[`op] old;
    m:md[`test] w:`int$floor new%3;
    (m;w)  
    }
     
mds:1!makeMonkeyDict each monkeyTxt   
round:currentMonkey:0
totalMonkeys:count mds;

while[round<20;
        //Lookup current monkey
    while[count (dict:mds currentMonkey)`items;
        //Get the throw and new amount
        out:doMonkey dict ;
        //Drop the throw from current monkey
        mds[currentMonkey]:(dict),`items`inspections!(1_dict[`items];dict[`inspections]+1);
        //Other monkey update new item
        mds[out 0]:(mds out 0),enlist[`items]!enlist (mds out 0)[`items], out 1;
        ];
    currentMonkey+:1;
    if[currentMonkey>totalMonkeys;
        round+:1;
        currentMonkey:0;
        ];
    ];

//part 1
prd 2#desc exec  inspections from mds







//Part 2


makeMonkeyDict:{[txt]
    //Monkey number
    num:"J"$-1_last " " vs txt[1];

    
    items:`int$value last ":" vs txt[2];
    op:value "{",last  "new =" vs ssr[txt 3;"old";"x"],"}";
    test: {"J"$(10b!(last " " vs first z;last " " vs last z)) 0= mod[x;"J"$last " " vs y]}[;txt[4];txt[5 6]];
    
    `monkey`items`op`test`inspections!(num;items;op;test;0)
    }




mds:1!makeMonkeyDict each monkeyTxt   
round:currentMonkey:0
totalMonkeys:count mds;

chop:prd "I"$last each" " vs/:input where input like "*Test*"

doMonkey2:{[md]
    old:first md`items;
    new:md[`op] old;
    if[new>chop;new:new mod chop];
    m:md[`test] w:new;
    (m;w)  
    }

while[round<10000;
        //Lookup current monkey
    while[count (dict:mds currentMonkey)`items;
        //Get the throw and new amount
        out:doMonkey2 dict ;
        //Drop the throw from current monkey
        mds[currentMonkey]:(dict),`items`inspections!(1_dict[`items];dict[`inspections]+1);
        //Other monkey update new item
        mds[out 0]:(mds out 0),enlist[`items]!enlist (mds out 0)[`items], out 1;
        ];
    currentMonkey+:1;
    if[currentMonkey>totalMonkeys;
        round+:1;
        currentMonkey:0;
        ];
    ];

prd 2#desc exec  inspections from mds
