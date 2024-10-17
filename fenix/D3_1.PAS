uses graph,crt;
var g,d:integer;
x0,y0,z0,x1,y1,z1:integer;
monX,monY,monX1,monY1:integer;
camH,camV:integer;
c:char;
procedure VnV(x0,y0,z0,x1,y1,z1:integer);
var H,V:real;
begin
h:=camH*pi/180;
v:=camV*pi/180;
monX:=round(y0*cos(H))-round(x0*sin(H));
monX1:=round(y1*cos(H))-round(x1*sin(H));
monY:=240-round(z0*cos(V))+round(sin(v)*((y0*sin(H))+round(x0*cos(H))));
monY1:=240-round(z1*cos(V))+round(sin(v)*((y1*sin(H))+round(x1*cos(H))));
monx:=monx+320;
monx1:=monx1+320;
end;
procedure L(x0,y0,z0,x1,y1,z1:integer);
begin
VnV(x0,y0,z0,x1,y1,z1);
line(monX,monY,monX1,monY1);
end;
procedure body;
begin
setcolor(red);
L(0,0,0,45,0,0);
setcolor(green);
L(0,-45,0,0,45,0);
setcolor(yellow);
L(0,0,-45,0,0,45);
end;
begin
initgraph(g,d,'');
repeat
body;
c:=readkey;
if c=#0 then c:=readkey;
case c of
#72:camV:=camV+10;
#80:camV:=camV-10;
#75:camH:=camh-10;
#77:camH:=camh+10;
end;
if camH=360 then camH:=0;
if camV>90 then camV:=90;
if camV<0 then camV:=0;
cleardevice;
until c=#27;
end.