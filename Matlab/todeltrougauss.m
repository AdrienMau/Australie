
power=6;
p=fit_hgauss2D(double(255-img2),power)


%   //SORTIE//
%       p(1) -> offset selon y => A
%       p(2) -> amplitude
%       p(3) -> moyenne (verticale)
%       p(4) -> moyenne (horizontale)
%       p(5) -> ecart-type

s=size(img2)
G=hgauss2D(s,p,power);

subplot(2,1,1)
imshow2(255-G)

subplot(2,1,2)
imshow(img2)
% plot(mean(G))