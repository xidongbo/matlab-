global speed door showtextx showtexty goalkeeper xa ya xb yb ballx bally frame court textstring xmin ymin;
court=imread('court.png');%读入800*500的足球场
textstring={'已发球，按相应编号将球';'传给相应球员，按';'W、S、A、D控制球员';'运动方向，按空格射门！'};
showtextx=-600;
showtexty=-200;
frame=120;%每秒帧
speed=2;%球员移动速度
%以下四项为足球场坐标范围
xmin=-400;
door=-370;
xmax=400;
ymax=250;
ymin=-250;
ballx=0;%足球x初始位置
bally=25;%足球y初始位置
goalkeeper=-350;%守门员初始位置
xa=[-250,-250,-250,-250,-150,-150,-150,-150,0,0];%a队442横坐标
ya=[-150,-50,50,150,-150,-50,50,150,-25,25];%a队442纵坐标
xb=fliplr(-xa)+[50,50,0,0,0,0,0,0,0,0];%b队442横坐标,与a队横坐标相反，
                                       %并将两前锋后移50，因为a队发球
yb=fliplr(ya);%b队442纵坐标
set(gcf,'Position',get(0,'ScreenSize'))%屏幕最大化
init();
%以下为初始位置绘制
hold on;
plot(goalkeeper,0,'ro','MarkerFaceColor','r');%a队守门员
plot(xa,ya,'ro','MarkerFaceColor','r');%a队队员
plot(-goalkeeper,0,'bo','MarkerFaceColor','b');%b队守门员
plot(xb,yb,'bo','MarkerFaceColor','b');%b队队员
plot(ballx,bally,'wo','MarkerFaceColor','k');%足球
hold off;
text(showtextx,showtexty,'按任意键开始发球！','fontsize',15);
%以下为比赛开始发球
waitforbuttonpress;%按任意键继续
for ii=bally:-4:ya(9)
    init();
    hold on;%以下为初始位置绘制
    plot(goalkeeper,0,'ro','MarkerFaceColor','r');%a队守门员
    plot(xa,ya,'ro','MarkerFaceColor','r');%a队队员
    plot(-goalkeeper,0,'bo','MarkerFaceColor','b');%b队守门员
    plot(xb,yb,'bo','MarkerFaceColor','b');%b队队员
    bally=ii;
    plot(ballx,bally,'wo','MarkerFaceColor','k');%足球
    pause(1/frame);%等待
    hold off;
end
 text(showtextx,showtexty,textstring,'fontsize',15);%显示提示信息
 set(gcf,'keypressfcn','press');%监听键盘按键，控制游戏
