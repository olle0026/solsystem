function [ax,ay]=acceleration(G,m,x,y)

%Amount planet
N = length(m);

%Initialize acceleration arrays
ax = zeros(1,N);
ay = zeros(1,N);

%Define a function for calculating the distance between two points
r = @(x,y) sqrt(x.^2+y.^2);

%For every planet "i" calculate how every planer "j" impact on it
for i = 1:N
    for j = 1:N
        if i ~= j
            dx = x(j) - x(i);
            dy = y(j) - y(i);
            distance = r(dx, dy);
            ax(i) = ax(i) + G * m(j) * (dx) / distance^3;
            ay(i) = ay(i) + G * m(j) * (dy) / distance^3;
        end
    end
end



