function press()
%对键盘输入字符的处理
global showtextx showtexty ballx door bally;
ch=get(gcbf,'CurrentCharacter');
if((abs(ballx-door)<1&&abs(bally-0)<1)||(abs(ballx+door)<1&&abs(bally-0)<1))%进球
    close all;
    return;
else
    switch ch
        case {'w','W'}
            move('w');%向上移动
        case {'s','S'}
            move('s');
        case {'a','A'}
            move('a');
        case {'d','D'}
            move('d');
        case {'x','X','0','1','2','3','4','5','6','7','8','9','e','f','g','h','i','j','k','l','m','n','o','E','F','G','H','I','J','K','L','M','N','O'}
            pass(ch);%传球给ch
        case ' '
            goal();
        otherwise
           text(showtextx,showtexty+100,'按键有误，请重新输入！','fontsize',15);
    end
end
end

