tic
totalPointCounts = [100, 1000, 10000]; 

len = length(totalPointCounts);
insidePointCounts = zeros(len, 1);
area = zeros(len, 1);

j = 0;
for N = totalPointCounts
    j = j + 1;    
  
    points = rand(N, 2)*5-1;
    

    
   
    axis([-1, 4, -1, 4]);
    grid on; 

    if (j > 1)
        figure;
    end
    
    % 画点
    i = 1:N;
   
    plot(points(i, 1), points(i, 2), '*');
    hold on;

  
    axis square;
    f = ezplot('y=(3/2)*x+(1/2)', [-1, 4, -1, 4]);
    set(f, 'LineWidth', 4, 'color', 'k');
    f2 = ezplot('y=(3/8)*x-(5/8)', [-1, 4, -1, 4]);
    set(f2, 'LineWidth', 4, 'color', 'k');
    f3 = ezplot('y=-(3/4)*x+(11/4)', [-1, 4, -1, 4]);
    set(f3, 'LineWidth', 4, 'color', 'k');
    
   
    count = 0;
    for i = 1:N
        xpoints = points(i, 1);
        ypoints = points(i, 2);
        if ((xpoints*(3/2)+(1/2) > ypoints) && (ypoints > xpoints*(3/8)-(5/8))  && (xpoints*(-3/4)+(11/4) > ypoints))
            plot(xpoints,ypoints, '*');
            count = count + 1;
        end
    end
 
    insidePointCounts(j, 1) = count;
    area(j, 1) = insidePointCounts(j, 1) ./ N;
    area(j, 2) = N;
    result = area(j,1)*25;    
end

%% 画图
figure;
i = 1:3;
plot(area(i, 2), area(i, 1)*25, '*-');
toc