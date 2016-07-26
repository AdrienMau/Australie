function [R,J ] = R2gaussJacob( x,y,p )
% Renvoie l'écart à minimiser: R et la jacobienne d'un problème de
% minimisation.
%Corresond à deux gausiennes 1D, de meme offset
 
%ENTREES:
%   x et y: matrice d'abcisses et ordonnées (x,y) présentées en lignes.
%   p: paramètre initial autour duquel on va chercher l'optimum (à bien choisir )
% p(1) = offset
% p(2),p(5) : amplitudes des 2 gaussiennes
% p(3),p(6) : moyennes des 2 gaussiennes
% p(4),p(7) : variances des 2 gaussiennes
% SORTIES/
%   R: Ecart à minimiser entre les données et la fonction d'approximation
%   J: Jacobienne du problème, à 10 paramètres ici.
% 
R=y-p(1)+ p(2)*exp(-((x-p(3)).*(x-p(3)))/(2*p(4)*p(4))) + p(5)*exp(-((x-p(6)).*(x-p(6)))/(2*p(7)*p(7))) ;
 
 
% On crée la jacobienne de la somme de deux gaussienne et d'une constante
% (7 paramètres) :
 
J=zeros(10,length(x));
J(1,:)=1;
J(2,:)=(exp(-(x-p(3)).*(x-p(3))/(2*p(4)*p(4))))';
J(3,:)=(p(2)*(x-p(3))/(p(4)*p(4)).*exp(-(x-p(3)).*(x-p(3))/(2*p(4)*p(4))))';
J(4,:)=(p(2)*(x-p(3)).*(x-p(3))/(p(4)*p(4)*p(4)).*exp(-(x-p(3)).*(x-p(3))/(2*p(4)*p(4))))';
J(5,:)=(exp(-(x-p(6)).*(x-p(6))/(2*p(7)*p(7))))';
J(6,:)=(p(5)*(x-p(6))/(p(7)*p(7)).*exp(-(x-p(6)).*(x-p(6))/(2*p(7)*p(7))))';
J(7,:)=(p(5)*(x-p(6)).*(x-p(6))/(p(7)*p(7)*p(7)).*exp(-(x-p(6)).*(x-p(6))/(2*p(7)*p(7))))';

end