theta=2:2:780;
r=1./theta;
x=r.*cosd(theta)/2;
y=r.*sind(theta);
coord=[x;y]
plot(x,y)