%Approximate heliocentric initial conditions
%All planets projected into one XY plane (z ignored)
%Units:
%mass = 1e23 kg
%position = km
%velocity = km/h
%time = hours
%Order: Sun Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune

m = [ ...
25,...
10,...
20.81];

%Use real gravitational constant in km^3/(kg*h^2) multiplied by mass
%scalar
G = 1;

%Sun at origo
%x0 - semimajor axis

x0 = [ ...
0,...
10,...
-10];

y0 = [ ...
20,...
0,...
0];

vx0 = [ ...
0,...
-1,...
1];

%Circular orbit approximation: v = sqrt(G*M_sun/r)
%Direction chosen +y when on +x axis

vy0 = [ ...
-1,...
0.5,...
-0.5];

[vx0(1),vy0(1)] = SunVelocity(m,vx0,vy0); 


%Simulation time
tmax = 2000; %around two neptune years in earth hours
dt = 1;

%Simulate orbit
[x, y, vx, vy , ax, ay, t] = orbit_Nbody(G,m,x0,y0,vx0,vy0,dt,tmax);

%Plot solar system
figure
title ("solar system")
plot(x(:,1),y(:,1),"m");
hold on
plot(x(:,2),y(:,2),"b")
plot(x(:,3),y(:,3),"r")
legend("Planet 1","Planet 2","Planet 3")

