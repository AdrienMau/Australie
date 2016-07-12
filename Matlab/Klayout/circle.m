theta=2:2:780;
r=5;
x=exp(theta/360).*cosd(theta);
y=exp(theta/360).*sind(theta);
coord=[x;y]
plot(x,y)