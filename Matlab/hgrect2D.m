function [ hgauss ] = hgrect2D(size,p,power)
%cree une hypergaussienne rectangulaire en fonction du parametre p, et sur une image de
%taille size.
% ENTREE:
%     size: taille de l'image finale
%   p: parametre
%       p(1) -> offset selon y => A
%       p(2) -> amplitude
%       p(3) -> moyenne (verticale)
%       p(4) -> moyenne (horizontale)
%       p(5) -> ecart-type vertical
%       power :puissance de l'hypergausienne


hgauss=zeros(size);

for(i=1:size(1))
    for(j=1:size(2))
        hgauss(i,j)=p(1)+p(2)*exp(-(1/(sqrt(2)*p(5)).^power) *( ((i-p(3)).^power) + ((j-p(4)).^power)) );
    end
end


end

