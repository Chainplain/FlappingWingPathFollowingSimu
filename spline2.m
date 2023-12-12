points = [0 0; 10 0; 10 10; 0 10].';
values = spcrv(points,3);

plot(points(1,:),points(2,:),'k');
axis([-2 2.25 -2.1 2.2]);
hold on
plot(values(1,:),values(2,:),'r','LineWidth',1.5);
legend({'Control Polygon' 'Quadratic Spline Curve'},  'location','SE');

fnplt(cscvn([points,points(:,1)]), 'g',1.5);
legend({'Control Polygon' 'Quadratic Spline Curve' ...
        'Cubic Spline Curve' 'Interpolating Spline Curve'}, ...
        'location','SE');
