function T = orbital_period(x,y,t)

d = [0,0];

for i = 1:length(y)-1
    if y(i)<=0  && y(i+1)>0
        if d(1) == 0
            d(1) = i;
        else
            d(2) = i;
            break
        end
    end
end

if d(1)==0 || d(2)==0
    T = NaN;
else
    T = (t(d(2)) - t(d(1))); % Calculate the orbital period
end