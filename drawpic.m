% draw Picture

%----------------------------------------2D----------------------------------------------------
%shaded
ytick=[-.2:.04:.2];%等值线数值
[c,h]=contourf(X,Y,wca_omega(:,:,k)');  %后面的是设置等值线的颜色和宽度
set(h,'LevelList',ytick); %设置等值线间距
shading flat

%contour
[c,h]=contour(X,Y,wca_thetae(:,:,k)','Linecolor','k','LineWidth',2);  %后面的是设置等值线的颜色和宽度
text_handle=clabel(c,h,'Fontsize',12);   %加入等值线数值 
set(h,'LevelList',[335:5:360],'TextList',[335:5:360]); %设置等值线间距

%地形


%----------------------------------------3D----------------------------------------------------
%地形
load coast
costX=long;costY=lat;

[X0 Y0]=meshgrid(lon,lat);
h=surf(X0,Y0,mean(pres(:,:,mon-4,:)/100,4)');
set(h,'CData',ones(size(X0))*1000,'FaceAlpha',.8,'EdgeAlpha',0)

hold on
plot3(coastX,coastY,ones(1,length(coastY))*980,'k')

%

%--------------------------------------axis seting------------------------------------------
%++++++++++++++++++++++++++++++basic longitude&latitude setting
%horizonal
xtick=100:10:150;
ytick=0:5:45;
for k=1:length(ytick)
  ylabel{k}=[num2str(ytick(k)) 'N'];
end
for k=1:length(xtick)
  xlabel{k}=[num2str(xtick(k)) 'E'];
end
set(gca,'Fontsize',16,'LineWidth',2,'xlim',[xtick(1) xtick(end)],'ylim',[ytick(1) ytick(end)],...
    'Xtick',xtick,'Ytick',ytick,'XTickLabel',xlabel,'YTickLabel',ylabel,...
    'XGrid','off','YGrid','off')

%vertical    
ztick=[200 300 400 500 700 850];
for k=1:length(ztick)
  zlabel{k}=[num2str(ztick(k)) 'hPa'];
end
set(gca,,'zlim',[ztick(1) ztick(end)],'Ztick',ztick,'ZTickLabel',zlabel,)

%+++++++++++++++++++++++++++++colormap
set(gca,'clim',[ctick(1) ctick(end)])
colorbar('YTick',ctick)

%+++++++++++++++++++++++++++print setting
set(gcf,'Paperunit','centimeters','PaperPosition',[5 5 20 15]);
print('-dtiff','-r300','.\3Dstructure.tiff')
%format: %03d为001

