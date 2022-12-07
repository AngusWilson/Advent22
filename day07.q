//Horrible solution

iterate:{[input]
    
        input,:enlist"$ cd ..";
        listings:where input ~\:"$ ls";
        cdsdown: where (input like "$ cd *") and not input like "$ cd ..";
        cdsup:(where input like "$ cd ..");
        dirs:where input like "dir *";
        
        summable:where not any each (split:1_/:listings cut input) like\: "dir *";
    
        //Take the first one that is summable
        toSum:first summable;
              
        size:sum raze "J"$ " " vs/: split[toSum];
        
        newKey:last " " vs (input listings-1) toSum;
        .dir.sizes,: size;
        
        //Replace the bits we've summed with the sizes
        
        replace:listings toSum;
        
        inds:replace,cdsup first where replace<cdsup;
        
        stringSizes:string[size]," ",newKey;
        
        start:first inds;
        end:last inds;
        

        before:((start-1)#input);
        before:before til[count[before]] except last where before like  "dir ",newKey;
        .global.input:before,enlist[stringSizes],-1_(end+1) _input;
 

    
    
        .global.input
        }
        

input:read0 `:Advent22/inputs/day07.txt      


.global.input:input
.dir.sizes:()
   while[1<count .global.input;
        iterate[.global.input];
        ];
    
//Part 1
sum v where (v:.dir.sizes)<=100000


//Part 2
totalUsed: max .dir.sizes
toFree:30000000-(70000000-totalUsed)

s first where toFree<=(s:asc .dir.sizes)


