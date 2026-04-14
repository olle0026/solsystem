function [x,y,vx,vy,ax,ay,t]=orbit_Nbody(G,m,x0,y0,vx0,vy0,dt,tmax)
%select number of time steps based
    %on dt and tmax and elapsed time at each step
    steps= tmax/dt;
    N = length(m);
    %preallocate memory (increases performance)
    x = zeros(steps, N);
    y = zeros(steps, N);
    vx = zeros(steps, N);
    vy = zeros(steps, N);
    ax = zeros(steps, N);
    ay = zeros(steps, N);
    t = zeros(steps);
    %set initial conditions
    x(1,:) = x0;
    y(1,:) = y0;
    vx(1,:) = vx0;
    vy(1,:) = vy0;
    [ax(1,:),ay(1,:)] = acceleration(G,m,x(1,:),y(1,:));
    %simulate orbit
    for i = 1:(steps-1)
        x(i+1,:) = x(i,:) + dt*vx(i,:)+dt.^2.*ax(i,:)./2; % update position
        y(i+1,:) = y(i,:) + dt*vy(i,:)+dt.^2.*ay(i,:)./2; %
        [ax(i+1,:),ay(i+1,:)] = acceleration(G,m,x(i+1,:),y(i+1,:)); % update acceleration
        vx(i+1,:) = vx(i,:) + dt.*(ax(i,:)+ax(i+1,:))./2; % update velocity
        vy(i+1,:) = vy(i,:) + dt.*(ay(i,:)+ay(i+1,:))./2; %
        t(i+1) = t(i) + dt;
    end
end