%starting point for a simple simulation program
function [x, y, vx, vy, ax, ay, t] = orbit_1body(G,M,x0,y0,vx0,vy0,dt,tmax)
    %select number of time steps based
    %on dt and tmax and elapsed time at each step
    steps= tmax/dt;
    %preallocate memory (increases performance)
    x = zeros(steps, 1);
    y = zeros(steps, 1);
    vx = zeros(steps, 1);
    vy = zeros(steps, 1);
    ax = zeros(steps, 1);
    ay = zeros(steps, 1);
    t = zeros(steps, 1);
    % define a function for calculating the distance between two points
    r = @(x,y) sqrt(x.^2+y.^2);
    %define functions for calculating acceleration based on position
    acx = @(x,y) -G*M*x/(r(x,y).^3);
    acy = @(x,y) -G*M*y/(r(x,y).^3);
    %set initial conditions
    x(1) = x0;
    y(1) = y0;
    vx(1) = vx0;
    vy(1) = vy0;
    ax(1) = acx(x0, y0);
    ay(1) = acy(x0, y0);
    %simulate orbit
    for i = 1:(steps-1)
        x(i+1) = x(i) + dt*vx(i)+dt.^2.*ax(i)./2; % update position
        y(i+1) = y(i) + dt*vy(i)+dt.^2.*ay(i)./2; %
        ax(i+1) = acx(x(i+1), y(i+1)); % update acceleration
        ay(i+1) = acy(x(i+1), y(i+1)); %
        vx(i+1) = vx(i) + dt.*(ax(i)+ax(i+1))./2; % update velocity
        vy(i+1) = vy(i) + dt.*(ay(i)+ay(i+1))./2; %
        t(i+1) = t(i) + dt;
    end
end