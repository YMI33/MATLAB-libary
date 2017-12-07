% draw Picture
%-----------------------------------------------contour--------------------------------------------------
scrsz = get(0,'ScreenSize');   %丈量屏幕的宽度scrsz(3)和高度scrsz(4)
figure('Position',[1 1 scrsz(3) scrsz(4)]); %全屏输出

%shaded
contourf(x,y,data,30); %画等值面图，30为温度分为30个间隔
shading flat %去掉等值线

hold on    
%contour
[c,h]=contour(x,y,data,9,'Linecolor','k','LineWidth',0.5);  %后面的是设置等值线的颜色和宽度
text_handle=clabel(c,h);   %加入等值线数值 
set(h,'LevelList',[-35:10:45],'TextList',[-35:10:45]); %设置等值线间距


%plot
load coast  %导入海岸线数据
plot(long,lat,'-k','LineWidth',1);   %画海岸线
hold off

colorbar('SouthOutside','Position',[0.05,0.33,0.4,0.04]) %添加颜色条
set(gca,'LineWidth',2,'FontSize',12,'Ylim',[-90 90],'Xlim',[-180 180],'clim',[-35 45],'Position',[0.05 0.4 0.4 0.45]...  
    ,'XTick',[-180:60:180],'XTicklabel',{'-180W','-120W','-60W','0','60E','120E','180E'}...
    ,'YTick',[-90:30:90],'YTicklabel',{'-90S','-60S','-30S','0','30S','60S','90S'}); %添加坐标经纬度坐标轴



