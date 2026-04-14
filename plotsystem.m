clear

%Data
m = [10,0.01,0.02];
G = 1;
x0 = [0,5,-7];
y0 = [0,0,0];
vx0 = [0,0,0];
vy0 = [0,1.1,-0.7];

%Simulation time
tmax = 200;
dt = 0.1;

%Simulate orbit
[x, y, vx, vy , ax, ay, t] = orbit_Nbody(G,m,x0,y0,vx0,vy0,dt,tmax);

figure
title ("orbit 1")
plot(x(:,1),y(:,1),"o")
hold on
plot(x(:,2),y(:,2),"r--")
legend("star","planet")

figure
title ("orbit 2")
plot(x(:,1),y(:,1),"o")
hold on
plot(x(:,3),y(:,3),"b--")
legend("star","planet")

figure
title ("system")
plot(x(:,1),y(:,1),"k")
hold on
plot(x(:,2),y(:,2),"r--")
plot(x(:,3),y(:,3),"b--")
legend("star","planet 1","planet 2")