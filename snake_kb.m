function snake(objeto,objeto2, obx, oby,obr,score_text,maxscore_text)
global myhead gameover snk fruit status score pause0 r allow maxscore
while 1
    setup(maxscore_text);
        while (~gameover)
            draw(objeto,objeto2);
            input();
            logic();
            %while pause0 == 1
            %end
            set(obx,"String",num2str(myhead.X));
            set(oby,"String",num2str(myhead.Y));
            set(obr,"String",num2str(r));
            set(score_text , "String" , num2str(score));
            if score > maxscore
                maxscore = score;
                wdata("data.txt",num2str(score));
            end
            set(maxscore_text , "String" , num2str(maxscore));
        end
    uiwait(msgbox("GAME OVER"))
    c = menu("Play again?", "YES","NO");
    if c ==1
        continue
    else 
        break
    end
end
end 

function setup(maxscore_text)
global myhead fruit snk status r gameover pause0 arrows score bkg maxscore

file = "data.txt";
maxscore = textread(file);
set(maxscore_text,"String",num2str(maxscore));

status = enum.up;
gameover = 0;
pause0 = 0 ;
temp = imread("arrow.png");
arrows = {imrotate(temp,0),imrotate(temp,90),imrotate(temp,180),imrotate(temp,270)};
score =0;
p = imread('yellow_square.png');
r = 0;

myhead = pixel;
myhead.head = 1;
myhead.X = randi([0 , Xmax-1]);
myhead.Y = randi([0 ,Ymax-1]);
myhead.N = 0;
myhead.icon = p;
myhead.ri = imref2d(size(myhead.icon));
myhead.ri.XWorldLimits = [myhead.X, myhead.X+1];
myhead.ri.YWorldLimits = [myhead.Y, myhead.Y+1];


fruit = pixel;
fruit.head = 0;
fruit.X = randi([0, Xmax-1]);
fruit.Y = randi([0 ,Ymax-1]);
fruit.icon =  imread('cherry.jpg');
fruit.ri = imref2d(size(fruit.icon));
fruit.ri.XWorldLimits = [fruit.X, fruit.X+1];
fruit.ri.YWorldLimits = [fruit.Y, fruit.Y+1];

bkg = pixel;
bkg.icon = imread("bkg.jpg");
bkg.ri = imref2d(size(bkg.icon));
bkg.ri.XWorldLimits = [-Xmax, Xmax+1];
bkg.ri.YWorldLimits = [-Ymax, Ymax+1];


snk = myhead;
end

function draw(objeto,objeto2)
global snk fruit myhead arrows r bkg
axes(objeto2);
imshow(arrows{r+1});
axis off;
hold off;


axes(objeto);
cla(objeto,'reset');
%imshow(bkg.icon,bkg.ri);
hold on;
for cont = snk
    cont.ri.XWorldLimits = [cont.X, cont.X+1];
    cont.ri.YWorldLimits = [cont.Y, cont.Y+1];
    imshow(cont.icon,cont.ri);
end
imshow(fruit.icon,fruit.ri);
grid on;
hold off;
axis([0 Xmax 0 Ymax]);
axis off;
%drawnow

end

function input()
%msgbox("input")
global status allow current
prev = status;
value=getkeywait(0.4);
if value == -1
        allow = 1;
elseif value == 'd' && prev ~= enum.left
        status = enum.right;
        allow = 1;
        current = status;
elseif value == 'a' && prev ~= enum.right
        status = enum.left;
        allow = 1;
        current = status;
elseif value == 'w' && prev ~= enum.down
        status = enum.up;
        allow = 1;
        current = status;
elseif value == 's' && prev ~= enum.up
        status = enum.down;
        allow = 1;
        current = status;
elseif value == 'p'
    if status == enum.stop
        status = current;
        allow=0;
    else
        status = enum.stop;
    end
end

end

function logic()
global status myhead snk fruit pause gameover allow score 

if allow == 1
    thecopy = snk;
    if status == enum.right
            myhead.X = myhead.X +1;
    elseif status == enum.left
            myhead.X = myhead.X -1;
    elseif status == enum.up
            myhead.Y = myhead.Y -1;
    elseif status == enum.down
            myhead.Y = myhead.Y +1;   

    end
    snk = [snk(2:length(snk)) , myhead];
end

if (fruit.X == myhead.X) && (fruit.Y == myhead.Y)
    fruit.X = randi([0, Xmax-1]);
    fruit.Y = randi([0 ,Ymax-1]);
    fruit.ri.XWorldLimits = [fruit.X, fruit.X+1];
    fruit.ri.YWorldLimits = [fruit.Y, fruit.Y+1];
    score = score +10;
    snk = [thecopy,myhead];
    
end

if (myhead.X<0) | (myhead.X>Xmax) | (myhead.Y<0) | (myhead.Y>Ymax)
    gameover = 1;

end

end

function h = Xmax 
h = 12;

end

function h = Ymax
h = 12;
end

