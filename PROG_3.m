

clear all
plot_data=cell(1,1001);
for N=1:1000
N
N_ladder=randsample(50,1);
r=50-N_ladder;
if r==0
    N_snakes=0;
else
    N_snakes=randsample(r,1);
end
pos=randperm(100,N_ladder*2);
pos_sort=sort(pos);
for i=1:N_ladder
    pos_start(i)=pos_sort(i);
end
for i=1:N_ladder
    pos_end(i)=pos_sort(i+N_ladder);
end
f_ladder=randsample(pos_start,N_ladder);
g_ladder=randsample(pos_end,N_ladder);
k=0;
for i=1:100
    
    flag=0;
    for j=1:length(pos_sort)
        if i==pos_sort(j)
            flag=1;
        end
    end
    if flag == 0
        k=k+1;
        pos_remain(k)=i;
    end
end
  if N_snakes~=0      
pos_snake=randsample(pos_remain,N_snakes*2);
pos_snake_sort=sort(pos_snake);
for i=1:N_snakes
    pos_end_snake(i)=pos_snake_sort(i);
end

for i=1:N_snakes
    pos_start_snakes(i)=pos_snake_sort(i+N_snakes);
end
  end

f=pos_start;
if N_snakes~=0   
for i=1:length(pos_start_snakes)
    f(end+1)=pos_start_snakes(i);
end
end
g=pos_end;
if N_snakes~=0   
for i=1:length(pos_end_snake)
    g(end+1)=pos_end_snake(i);
end
end

for M=1:1000
    M
    count=0;
    step=0;
    flag=0;
    start=0;
    while flag==0
        %flag=1
            count=count+1;
        die=randsample(6,1);
         if die ==6 && start==0
            start=1;
            step=1;
            for h=1:length(f)
            if step== f(h)
                    step=g(h);
            end
            end
        end
    if start==1
        if ( (step ~= 95) && (step ~= 96) && (step ~= 97) && (step ~= 98) && (step ~= 99) && (step ~= 100))
            step=step+die;
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
       end
    end
    cnt(M,1)=count;
end
avg_steps(N)=mean(cnt);

plot_data{1,N}={N_ladder,mean(cnt)}
end

N_ladder=0
ladder_number(N+1)=N_ladder;
N_snakes=randsample(50,1)
pos=randperm(100,N_ladder*2);
pos_sort=sort(pos);        
pos_snake=randsample(100,N_snakes*2);
pos_snake_sort=sort(pos_snake);
for i=1:N_snakes
    pos_end_snake(i)=pos_snake_sort(i);
end

for i=1:N_snakes
    pos_start_snakes(i)=pos_snake_sort(i+N_snakes);
end

f=pos_start_snakes;
%for i=1:length(pos_start_snakes)
  %  f(end+1)=pos_start_snakes(i);
%end

g=pos_end_snake;

for M=1:1000
    count=0;
    step=0;
    flag=0;
    start=0;
    while flag==0
      
        count=count+1;
        die=randsample(6,1);
         if die ==6 && start==0
            start=1;
            step=1;
            for h=1:length(f)
            if step== f(h)
                    step=g(h);
            end
                end
        end
    if start==1
        if ( (step ~= 95) && (step ~= 96) && (step ~= 97) && (step ~= 98) && (step ~= 99) && (step ~= 100))
            step=step+die;
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
    end
    end
    cnt(M,1)=count;
end
N=N+1
tables{1,N}=tabulate(cnt);
avg_steps(N)=mean(cnt);
table_avg=tabulate(round(avg_steps))
plot_data{1,N}={N_ladder,round(mean(cnt))}
save('plot_data','plot_data')
