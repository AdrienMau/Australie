function [ p ] = fit_hgauss(x,y,n)
%pour amplitude negative
%approxgauss4: renvoie les coefficients correspondant à l'approximation d'une
%hypergaussienne avec offset
%de la forme y=A+Bexp((x-D)^2)/(2s*s)
%Entrees:
%   x et y: données à approximer
%    n : puissance de l'hypergaussienne
%Sortie:
%   p0: coefficients autours desquels on va chercher la bonne approximation
%       p0(1) -> offset selon y => A
%       p0(2) -> amplitude
%       p0(3) -> moyenne
%       p0(4) -> ecart type
%%

%Calcul des coefficients probables
p0(1)=max(y);
[p0(2),i]=min(y);
p0(2)=p0(2)-p0(1); %negatif min-max
p0(3)=x(i);

p0(4)=length(x)/2;

%variance: on trouve le x correspondant a la moitié du maximum
% j=i;
% while (y(j)>y(i)/2) && (j<length(y))
%     j=j+1;
% end 
% p0(4)=sqrt(((x(j)-p0(3))^2)*log(2*p0(2)/(p0(2)-p0(1)))/2); 
options = optimoptions('lsqnonlin','Display','off');
% opts1=  optimset('display','off');
p=lsqnonlin(@(p)(y-p(1)-p(2)*exp(-((x-p(3))./(sqrt(2)*p(4))).^n )),p0,[],[],options);

end