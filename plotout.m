figure;
hold on;
% plot3( out.pos.Data(:,1), out.pos.Data(:,2), out.pos.Data(:,3));
color = 1 : size(out.pos.Data(:,1),1);
alpha = linspace(0.2,1,size(out.pos.Data(:,1),1)+1)';

% C1 = TheColor('sci',1,'map',256,'seka',0);
plot3( out.desire_pos.Data(:,1),out.desire_pos.Data(:,2),...
    out.desire_pos.Data(:,3),'--','color',[38 205 38]./255,'linewidth',1);
a = patch([out.pos.Data(:,1);nan],[out.pos.Data(:,2);nan],[out.pos.Data(:,3);nan],...
    [color(:);nan],'edgecolor','flat','FaceVertexAlphaData',alpha,...
    'AlphaDataMapping','none','EdgeAlpha','interp', 'linewidth',3,'facecolor','none');
view(3);grid on;
xlabel('position x(m)')
ylabel('position y(m)')
zlabel('position z(m)')
axis equal;

load ZJU;
plot3( P(:,1),P(:,2),P(:,3),'--','color',[205 38 38]./255,'linewidth',2);

figure;
for i = 1:3
    subplot(3,1,i);
    plot( out.desire_pos.Data(:,i));
    hold on;
    plot(out.pos.Data(:,i));
    legend('desire','real');
end


% a.color(4) = 0.5;
% camlight;
% lighting gouraud;
% patch(x,y,y,'EdgeColor','flat','LineWidth',1,'MarkerFaceColor','flat','FaceColor','none')
% patch(x,y,c,'EdgeColor','interp','Marker','o','MarkerFaceColor','flat');