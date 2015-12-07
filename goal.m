function goal()
%   射门函数
global goalkeeper xa ya xb yb ballx bally frame door;
locationx=[goalkeeper,xa,xb,-goalkeeper];
locationy=[0,ya,yb,0];
for ii=1:22
    if(ballx==locationx(ii))
        if(bally==locationy(ii))
            if(ii>11)
                flag='b';%此时球在b队队员脚下
            else
                flag='a';%此时球在a队队员脚下
            end
        end
    end
end
if(flag=='b')
    detax=door-ballx;
    detay=0-bally;
    movex=detax*frame/3600;
    movey=detay*frame/3600;
    while(~(abs(detax)<1&&abs(detay)<1))
        ballx=ballx+movex;
        bally=bally+movey;
        detax=door-ballx;
        detay=0-bally;
        hold off;
        init();
        hold on;
        plot(goalkeeper,0,'ro','MarkerFaceColor','r');%a队守门员
        plot(xa,ya,'ro','MarkerFaceColor','r');%a队队员
        plot(-goalkeeper,0,'bo','MarkerFaceColor','b');%b队守门员
        plot(xb,yb,'bo','MarkerFaceColor','b');%b队队员
        plot(ballx,bally,'wo','MarkerFaceColor','k');%足球
        pause(1/frame);
    end
    text(-100,0,'恭喜进球！按任意键结束！','fontsize',15);%显示提示信息
else
    detax=-door-ballx;
    detay=0-bally;
    movex=detax*frame/3600;
    movey=detay*frame/3600;
    while(~(abs(detax)<1&&abs(detay)<1))
        ballx=ballx+movex;
        bally=bally+movey;
        detax=-door-ballx;
        detay=0-bally;
        hold off;
        init();
        hold on;
        plot(goalkeeper,0,'ro','MarkerFaceColor','r');%a队守门员
        plot(xa,ya,'ro','MarkerFaceColor','r');%a队队员
        plot(-goalkeeper,0,'bo','MarkerFaceColor','b');%b队守门员
        plot(xb,yb,'bo','MarkerFaceColor','b');%b队队员
        plot(ballx,bally,'wo','MarkerFaceColor','k');%足球
        pause(1/frame);
    end
    text(-100,0,'恭喜进球！按任意键结束！','fontsize',15);%显示提示信息
end
end

