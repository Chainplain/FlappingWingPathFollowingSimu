axis([0 100 0 100])
hold on
% Initially, the list of points is empty.
xy = [];
n = 0;
% Loop, picking up the points.
disp('Left mouse button picks points.')
disp('Right mouse button picks last point.')
but = 1;
while but == 1
    [xi,yi,but] = ginput(1);
    plot(xi,yi,'ro')
    n = n+1;
    if (~isempty(xy))
        plot ([xy(1,end);xi],[xy(2,end);yi]);
    end
    xy(:,n) = [xi;yi];
    
end
% Interpolate with a spline curve and finer spacing.
P = [xy', zeros(size(xy,2),1)];


hold off

