function T = orbital_period(x,y,t)

%Searches for index when x changes from non-positive to positive
j = 1;
found = false;
for i = 1:length(x)-1
    
    if x(i) <= 0 && x(i+1)>0
        ix(j) = i;
        j = j+1;
        found = true;
    end
end

if found
    if length(ix)<2
        error ("could not calculate period!")
    end
else
    error ("could not calculate period!")
end

%Searches for index when y changes from non-positive to positive
j = 1;
found = false;
length(y)
for i = 1:length(y)-1
    
    if y(i) <= 0 && y(i+1)>0
        iy(j) = i;
        j = j+1;
        found = true;
    end

end

if found
    if length(iy)<2
        error ("could not calculate period!")
    end
else
    error ("could not calculate period!")
end
%Calculate period by x-data and y-data
for i = 1:length(ix)-1
    tempx(i) = t(ix(i+1))-t(ix(i));
end
for i = 1:length(iy)-1
    tempy(i) = t(iy(i+1)) - t(iy(i));
end

%Calculate mean
T = (mean(tempx)+mean(tempy))/2;