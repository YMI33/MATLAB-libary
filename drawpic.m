% draw Picture

%shaded
ytick=[-.2:.04:.2];
[c,h]=contourf(X(arealev,arealat),Y(arealev,arealat),wca_omega(:,:,k)');  %后面的是设置等值线的颜色和宽度
set(h,'LevelList',ytick); %设置等值线间距
shading flat

hold on
%contour
[c,h]=contour(X(arealev,arealat),Y(arealev,arealat),wca_thetae(:,:,k)','Linecolor','k','LineWidth',2);  %后面的是设置等值线的颜色和宽度
text_handle=clabel(c,h,'Fontsize',12);   %加入等值线数值 
set(h,'LevelList',[335:5:360],'TextList',[335:5:360]); %设置等值线间距

hold off
set(gca,'LineWidth',2,'FontSize',12,'Ylim',[lev(arealev(end)) lev(arealev(1))],'Xlim',[lat(arealat(1)) lat(arealat(end))],'Clim',[ytick(1) ytick(end)]...  
    ,'XTick',lat(arealat(1)):5:lat(arealat(end)),'YDir','reverse'); %添加坐标经纬度坐标轴
colorbar('YTick',ytick)
title('/////','Fontsize',16)



