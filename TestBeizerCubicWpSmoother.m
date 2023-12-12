blue = '#2a5caa';
pp = '#c77eb5';
curve_color1 = '#78a355';
curve_color2 = '#76becc';

waypoints = [0,  50,  25;...
             0,   0, -50]';
CPs = BeizerCubicWpSmoother(waypoints(1,:), waypoints(2,:), waypoints(3,:), 0.15);

figure;

draw_line_and_point(waypoints, blue);
hold on;

draw_line_and_point(CPs, pp);
hold on;


t = (0:0.001:1);

curve1 = BezierCurve(length(t), CPs(1:4,:));
plot(curve1(:,1), curve1(:,2),'Linewidth', 2, 'color', curve_color1);

curve2 = BezierCurve(length(t), CPs(4:7,:));
plot(curve2(:,1), curve2(:,2),'Linewidth', 2,  'color', curve_color2);

axis equal;
