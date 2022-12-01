clear all;
f=[1,4,9,21,28,36,51,71,80,16,47,49,56,62,64,87,93,95,98];
g=[38,14,31,42,84,44,67,91,100,6,26,11,53,19,60,24,73,75,78];
for M=1:1000
    count=0;
    step=0;
    flag=0;
    start=0;
    while flag==0
        %flag=1
        count=count+1
        die=randsample(6,1);
       
        if ( (step ~= 95) && (step ~= 96) && (step ~= 97) && (step ~= 98) && (step ~= 99) && (step ~= 100))
            step=step+die
            for i=1;length(f)
                if step== f(i)
                    step=g(i);
                end
            end
        elseif step==95
                if die<=5
                step=step+die;
                 for i=1;length(f)
                     if step== f(i)
                         step=g(i);
                     end
                 end
                end
        elseif step==96
                 if die<=4
                step=step+die;
                 for i=1;length(f)
                     if step== f(i)
                         step=g(i);
                     end
                 end
                end
        elseif step==97
                  if die<=3
                step=step+die;
                 for i=1;length(f)
                     if step== f(i)
                         step=g(i);
                     end
                 end
                end
        elseif step== 98
                 if die<=2
                step=step+die;
                 for i=1;length(f)
                     if step== f(i)
                         step=g(i);
                     end
                 end
                end
        elseif step== 99
                if die<=1
                step=step+die;
                 for i=1;length(f)
                     if step== f(i)
                         step=g(i);
                     end
                 end
                end
        elseif step==100
            flag=1;
        end
        %flag=1;
    end
    step
    cnt(M,1)=count;
end





