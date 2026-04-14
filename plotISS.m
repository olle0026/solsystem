clear

%Data
m = 4.5e+5;
M = 5.972e+24;
G = 6.674e-11;
x0 = 4e5;
y0 = 0;
vx0 = 0;
vy0 = 7.7e3;

%Simulation time
tmax = 200;
dt = 0.001;

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


%Plot Orbit
figure
axis equal
plot(x, y)
hold on
plot(mcentrumx, mcentrumy)
quiver(simplifiedx, simplifiedy, simplifiedvx, simplifiedvy)
quiver(simplifiedx, simplifiedy, simplifiedax, simplifieday)
legend("ISS orbit", "Mass centrum", "Velocity", "Acceleration")

period = orbital_period(x,y,t)