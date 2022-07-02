function Invertedpendulum()
clear all, close all, clc;

global STOP STRENGTH PAUSE
global LCar HCar LStick lines trees
global Distance Velocity Acceleration Disturbance
global AUTO CARRUN

AUTO = 1;
DISTURB = 2; % 0:NO, 1:NOISE, 2:CONST
LINEAR = 1;
CARRUN = 0;

K1 = 10;
K2 = 0.5;

hfig = figure(1);
axis off;
set(hfig, 'KeyPressFcn', @keydown)
set(hfig, 'CloseRequestFcn', @onclose)

g = 9.8;
L = 1;
A = [0,1,0,0;g/L,0,0,0;0,0,0,1;0,0,0,0];
B = [0,0;1,-1/L;0,0;0,1];
s = zeros(4,1); % theta, D(theta), Distance, Velocity
ds = zeros(4,1);
e = zeros(2,1);

hold on;
set(gca,'XLim',[-1,1],'YLim',[0,2.2]);
axis square;
LCar = 0.2;
HCar = 0.2;
LStick = 0.5;
plot([-1,1],0*[1,1],'k--');
plot([-1,1],2.2*[1,1],'k--');
plot(-1*[1,1],[0,2.2],'k--');
plot(1*[1,1],[0,2.2],'k--');
lines = zeros(6,1);
lines(1) = plot(s(3)-LCar/2*[1,1],HCar*[0,1]);
lines(2) = plot(s(3)+LCar/2*[-1,1],HCar*[1,1]);
lines(3) = plot(s(3)+LCar/2*[1,1],HCar*[0,1]);
lines(4) = plot(s(3)+LCar/2*[-1,1],[0,0]);
lines(5) = plot(s(3)+[0,LStick*sin(s(1))],HCar+[0,LStick*cos(s(1))]);
lines(6) = plot(s(3)+LStick*sin(s(1)),HCar+LStick*cos(s(1)),'.','MarkerSize',26);

Distance = plot([0,0], [1,1]*2, 'y-', 'LineWidth', 10);
Velocity = plot([0,0], [1,1]*1.8, 'g-', 'LineWidth', 10);
Acceleration = plot([0,0], [1,1]*1.6, 'r-', 'LineWidth', 10);
Disturbance = plot([0,0], [1,1]*1.4, 'm-', 'LineWidth', 10);
text(0,2,'距离','FontSize',12,'HorizontalAlignment','center','VerticalAlignment','bottom');
text(0,1.8,'速度','FontSize',12,'HorizontalAlignment','center','VerticalAlignment','bottom');
text(0,1.6,'加速度','FontSize',12,'HorizontalAlignment','center','VerticalAlignment','bottom');
text(0,1.4,'扰动加速度','FontSize',12,'HorizontalAlignment','center','VerticalAlignment','bottom');

if ~CARRUN
    trees = stem(-1.5+0.5*[1:7],ones(1,7),'g^','MarkerSize',20,'MarkerFaceColor','g');
end

a = 0;
STRENGTH = 0;
STOP = 0;
PAUSE = 0;
t = 0;
deltaT = 0.01;
while ~STOP
    if PAUSE
        pause(0.1);
        continue;
    end
    t = t + deltaT;
    if DISTURB == 2
        e(1) = (t<0.2);
    elseif DISTURB == 1
        e(1) = 0.3*randn(1);
    else
        e(1) = 0;
    end
    if AUTO
        e(2) = K1*s(1) + K2*s(2);
    else
        e(2) = a;
    end
    if LINEAR
        ds = A*s + B*e;
    else
        ds(1) = s(2);
        ds(2) = g/L*sin(s(1)) + L*e(1) - 1/L*cos(s(1))*e(2);
        ds(3) = s(4);
        ds(4) = e(2);
    end    
    s = s + ds*deltaT;

    s3 = s(3);
    if CARRUN
        while s3 < -1
            s3 = s3 + 2;
        end
        while s3 > 1
            s3 = s3 - 2;
        end
    end
    e2 = e(2);
    
    a = 0.5*a + 0.5*STRENGTH;
    STRENGTH = STRENGTH*0.95;
    refresh(s(1),s3,s(4),e(1),e2);
    pause(0.01);
end

function refresh(s1,s3,s4,e1,e2)
global LCar HCar LStick lines trees
global Distance Velocity Acceleration Disturbance
global CARRUN
if CARRUN
    pos = s3;
else
    pos = 0;
end
set(lines(1),'XData',pos-LCar/2*[1,1],'YData',HCar*[0,1]);
set(lines(2),'XData',pos+LCar/2*[-1,1],'YData',HCar*[1,1]);
set(lines(3),'XData',pos+LCar/2*[1,1],'YData',HCar*[0,1]);
set(lines(4),'XData',pos+LCar/2*[-1,1],'YData',[0,0]);
set(lines(5),'XData',pos+[0,LStick*sin(s1)],'YData',HCar+[0,LStick*cos(s1)]);
set(lines(6),'XData',pos+LStick*sin(s1),'YData',HCar+LStick*cos(s1));

set(Distance, 'XData', [0,s3*0.01]);
set(Velocity, 'XData', [0,s4*0.03]);
set(Acceleration, 'XData', [0,e2*0.1]);
set(Disturbance, 'XData', [0,e1*0.1]);

if ~CARRUN
    offset = s3-round(s3*2)/2;
    set(trees,'XData',-1.5+0.5*[1:7]-offset);
end

function keydown(src,eventdata)
global STOP STRENGTH PAUSE

if strcmp(eventdata.Key, 'escape') == 1
    STOP = 1;
elseif strcmp(eventdata.Key, 'space') == 1
    PAUSE = ~PAUSE;
elseif strcmp(eventdata.Key, 'rightarrow') == 1
    STRENGTH = STRENGTH + 1;
elseif strcmp(eventdata.Key, 'leftarrow') == 1
    STRENGTH = STRENGTH - 1;
end
STRENGTH = max(min(STRENGTH, 10),-10);

function onclose(src,eventdata)
global STOP
STOP = 1;
delete(gcf);

