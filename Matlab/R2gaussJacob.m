function [R,J ] = R2gaussJacob( x,y,p )
% Renvoie l'�cart � minimiser: R et la jacobienne d'un probl�me de
% minimisation.
%Corresond � deux gausiennes 1D, de meme offset
 
%ENTREES:
%   x et y: matrice d'abcisses et ordonn�es (x,y) pr�sent�es en lignes.
%   p: param�tre initial autour duquel on va chercher l'optimum (� bien choisir )
% p(1) = offset
% p(2),p(5) : amplitudes des 2 gaussiennes
% p(3),p(6) : moyennes des 2 gaussiennes
% p(4),p(7) : variances des 2 gaussiennes
% SORTIES/
%   R: Ecart � minimiser entre les donn�es et la fonction d'approximation
%   J: Jacobienne du probl�me, � 10 param�tres ici.
% 
R=y-p(1)+ p(2)*exp(-((x-p(3)).*(x-p(3)))/(2*p(4)*p(4))) + p(5)*exp(-((x-p(6)).*(x-p(6)))/(2*p(7)*p(7))) ;
 
 
% On cr�e la jacobienne de la somme de deux gaussienne et d'une constante
% (7 param�tres) :
 
J=zeros(10,length(x));
J(1,:)=1;
J(2,:)=(exp(-(x-p(3)).*(x-p(3))/(2*p(4)*p(4))))';
J(3,:)=(p(2)*(x-p(3))/(p(4)*p(4)).*exp(-(x-p(3)).*(x-p(3))/(2*p(4)*p(4))))';
J(4,:)=(p(2)*(x-p(3)).*(x-p(3))/(p(4)*p(4)*p(4)).*exp(-(x-p(3)).*(x-p(3))/(2*p(4)*p(4))))';
J(5,:)=(exp(-(x-p(6)).*(x-p(6))/(2*p(7)*p(7))))';
J(6,:)=(p(5)*(x-p(6))/(p(7)*p(7)).*exp(-(x-p(6)).*(x-p(6))/(2*p(7)*p(7))))';
J(7,:)=(p(5)*(x-p(6)).*(x-p(6))/(p(7)*p(7)*p(7)).*exp(-(x-p(6)).*(x-p(6))/(2*p(7)*p(7))))';

end