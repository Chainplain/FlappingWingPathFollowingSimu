function  draw_line_and_point(waypoints, color)
filled_color = '#f2eada';
face_size = 60;
hold on;
plot(waypoints(:,1), waypoints(:,2),'Linewidth', 2, 'color',color);
scatter(waypoints(:,1), waypoints(:,2), 'filled','MarkerEdgeColor',color,...
                        'MarkerFaceColor',filled_color, 'Linewidth', 1.5, ...
                        'SizeData', face_size);
hold off;
end

