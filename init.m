function  init()
%该函数用来初始化绘图
global xmin ymin court goalkeeper xa ya xb yb;
imagesc(xmin,ymin,court);%显示足球场
axis image;%保持图片显示比例
title('足球小游戏(作者：奚冬博161310107)');%双方均442阵型
label(goalkeeper,xa,ya,xb,yb);%对所有队员标号
end

