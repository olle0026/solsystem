clear

%Data
m = 0.01;
M = 10;
G = 1;
x0 = 10;
y0 = 0;
vx0 = 0;
vy0 = 0.75;

%Simulation time
tmax = 200;
dt = 0.1;

%Amount of ploted vectors
simplifiedsize = 100;
arrow_factor = (tmax/dt)/simplifiedsize;

%Simulate orbit
[x, y, vx, vy , ax, ay, t] = orbit_1body(G, M, x0, y0, vx0, vy0, dt, tmax);

%Create vectors for arrows
simplifiedx = zeros(simplifiedsize, 1);
simplifiedy = zeros(simplifiedsize, 1);
simplifiedvx = zeros(simplifiedsize, 1);
simplifiedvy = zeros(simplifiedsize, 1);
simplifiedax = zeros(simplifiedsize, 1);
simplifieday = zeros(simplifiedsize, 1);

for i = 1:simplifiedsize
    old = arrow_factor * (i-1) + 1;
    simplifiedx(i) = x(old);
    simplifiedy(i) = y(old);
    simplifiedvx(i) = vx(old);
    simplifiedvy(i) = vy(old);
    simplifiedax(i) = ax(old);
    simplifieday(i) = ay(old);
end

%Calculate Mass centrum location
mcentrumx = (m/(m+M)).*x;
mcentrumy = (m/(m+M)).*y;

%Calculate Energy and Momentum
rnorm = sqrt(x.^2 + y.^2);
vnorm = sqrt(vx.^2+ vy.^2);
Ek = (m*vnorm.^2)./2;
Ep = (-G.*M.*m)./rnorm;
p = m*vnorm;

%Plot Orbit
figure
axis equal
plot(x, y)
hold on
plot(mcentrumx, mcentrumy)
quiver(simplifiedx, simplifiedy, simplifiedvx, simplifiedvy)
quiver(simplifiedx, simplifiedy, simplifiedax, simplifieday)

%Plot Energy and Momentum
figure
plot(t, Ek)
xlabel("Time")
ylabel("Kinetic energy")

figure
plot(t, Ep)
xlabel("Time")
ylabel("Potential energy")

figure
plot(t, Ek + Ep)
xlabel("Time")
ylabel("Total energy")

figure
plot(t,p)
xlabel("Time")
ylabel("Momentum")

period = orbital_period(x,y,t)