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
dt = 0.001;

%Amount of ploted vectors
simplifiedsize = 100;
arrow_factor = (tmax/dt)/simplifiedsize;

%Simulate orbit
[x, y, vx, vy , ax, ay, t] = orbit_1body(G, M, x0, y0, vx0, vy0, dt, tmax);

%Calculate energy and momentum
rnorm = sqrt(x.^2 + y.^2);
vnorm = sqrt(vx.^2 + vy.^2);
Ek = (m.*vnorm.^2)./2;
Ep = -(G.*m.*M)./rnorm;
px = m.*vx;
py = m.*vy;
pnorm = sqrt(px.^2+py.^2);

%Calculate mass centrum
mx = (m.*x)./(m+M);
my = (m.*y)./(m+M);

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


%Plot Orbit
figure
axis equal
plot(x, y)
hold on
plot(mx,my)
quiver(simplifiedx, simplifiedy, simplifiedvx, simplifiedvy)
quiver(simplifiedx, simplifiedy, simplifiedax, simplifieday)
legend("Satelite orbit","Mass Centrum" ,"Velocity", "Acceleration")

%Plot Energy and Momentum
figure
plot(t, Ek)
hold on
plot(t, Ep)
plot(t, Ek + Ep)
xlabel("Time")
legend("Kinetic energy", "Potential energy", "Total Energy")

figure
plot(t, px)
hold on
plot(t, py)
xlabel("Time")
legend("Momentum in x","Momentum in y")


period = orbital_period(x,y,t)