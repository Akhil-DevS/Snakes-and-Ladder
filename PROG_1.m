%PROGRAM 1 of readme.
%standard snake and ladder.
clear all; close all; clc;
row=101;
col=101;
f=[1,4,9,21,28,36,51,71,80,16,47,49,56,62,64,87,93,95,98];
g=[38,14,31,42,84,44,67,91,100,6,26,11,53,19,60,24,73,75,78];
n=6;
prob=1/6;

%initialising the P matrix


for i=1:row
    for j=1:col
        p(i,j)=0;
    end
end

for i=1:row
    k=i;
    for j=1:n
         if k<101 && i<101
              p(i,k+1)=prob;
         end
        k=k+1;
    end
end

for i=1:row
    if (row-i)<6 && i<101
        p(i,i)=(6-(row-i))*prob;
    end 
end
p(101,101)=1;

%introducing snakes and ladders
n=0;
fl=1;
 %{
for i=1:length(f)
    n=n+1
    x=f(i);
    y=g(i);
    if x<6
        for j=1:x-1
            p(j,x)=0;
            p(j,y)=prob;
        end
    end
   
if x>=6-1
        for k=1:row
            if p(k,x)>0
                t=k
                for l=1:6
                    p(t,x)=0;
                    p(t,y)=prob;
                    t=t+1; 
                    fl=0
                end
                   
                    p(t,x)=0;
                    p(t,y)=1;
                    for c=1:6
                        if (x+c)>101
                            break;
                        end
                    p(t,x+c)=0;
                    end
                 if fl==0
                        break;
                    end      
            end
    
    
        end
      end

            
end
 %}
for i=1:length(f)
    x=f(i)+1;
    y=g(i)+1;
    p(x+1,x+1)=0;
    for j=1:6
        if(x+j)>101
            break;
        end
         p(x,x+j)=0; %snake or ladder 
    end
    p(x,y)=1;
    for l=1:6
        if (x-l)<1
            break;
        end
        p(x-l,x)=0;
        p(x-l,y)=prob;
    end
end
p(2,15)=0
p(17,43)=0
p(48,12)=0
p(48,63)=0
p(50,68)=0
p(57,20)=0
p(88,74)=0
p(94,79)=0
p(94,76)=0
p(96,79)=0
p(97,97)=0.3333
p(100,100)=0.8333
p(53,54)=2/6
p(59,61)=2/6
p(60,61)=2/6
p(51,54)=2/6

for i=1:100
    for k=1:100
        q(i,k)=p(i,k);
    end
end
Id=eye(100,100);
M=Id-q;
inverse_m=inv(M);
sum=0;
for i=1:100
    j=inverse_m(1,i);
    sum=sum+j;
end
    


 
