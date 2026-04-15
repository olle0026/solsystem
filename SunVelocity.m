function [Svx,Svy]= SunVelocity(m,vx,vy)

px = 0;
py = 0;

for i = 2:length(m)
    px = px+vx(i).*m(i);
    py = py+vy(i).*m(i);
end

Svx = -px./m(1);
Svy = -py./m(1);