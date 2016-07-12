%By Adrien Mau
%Swinburne Intern
%Gives the coordinates of a Fermat Spiral (points)

n=-10:0.005:10;
theta=n*137.50776405; %degree - golden angle
r=abs(sqrt(theta));
x=r.*cosd(theta).*(n>=0)-r.*cosd(theta).*(n<0);
y=r.*sind(theta);
coord=[x;y]
plot(x,y)

points=transpose(coord);