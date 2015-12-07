function pass(num)
%此函数为传球绘制函数,传给球员num
global goalkeeper xa ya xb yb ballx bally frame showtextx showtexty textstring;
locationx=[goalkeeper,xa,xb,-goalkeeper];
locationy=[0,ya,yb,0];
%将num定位到location的序号
if(num=='x'||num=='X')
    num=1;
elseif(num>='0'&&num<='9')
    num=num-'0'+2;
elseif(num>='e'&&num<='o')
    num=num-'d'+11;
elseif(num>='E'&&num<='O')
    num=num-'D'+11;
end
if(~(locationx(num)==ballx&&locationy(num)==bally))
    detax=locationx(num)-ballx;
    detay=locationy(num)-bally;
    movex=detax*frame/3600;
    movey=detay*frame/3600;
    while(~(abs(detax)<1&&abs(detay)<1))
        ballx=ballx+movex;
        bally=bally+movey;
        detax=locationx(num)-ballx;
        detay=locationy(num)-bally;
        hold off;
        init();
        text(showtextx,showtexty,textstring,'fontsize',15);%显示提示信息
        hold on;
        plot(goalkeeper,0,'ro','MarkerFaceColor','r');%a队守门员
        plot(xa,ya,'ro','MarkerFaceColor','r');%a队队员
        plot(-goalkeeper,0,'bo','MarkerFaceColor','b');%b队守门员
        plot(xb,yb,'bo','MarkerFaceColor','b');%b队队员
        plot(ballx,bally,'wo','MarkerFaceColor','k');%足球
        pause(1/frame);
    end
    ballx=locationx(num);
    bally=locationy(num);
    hold off;
    hold on;
    plot(goalkeeper,0,'ro','MarkerFaceColor','r');%a队守门员
    plot(xa,ya,'ro','MarkerFaceColor','r');%a队队员
    plot(-goalkeeper,0,'bo','MarkerFaceColor','b');%b队守门员
    plot(xb,yb,'bo','MarkerFaceColor','b');%b队队员
    plot(ballx,bally,'wo','MarkerFaceColor','k');%足球
end
end

