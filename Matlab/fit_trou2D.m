function [ p ] = fit_trou2D( img,p0 )
%img est l'image d'une gaussienne2D à amplitude negative, pour laquelle on souhaite obtenir
%les paramètres
%utilise approxgauss2D

%%%%%
%On fait un fit gaussienne avec lsqnonlin
%   img: image a approximer
%   p0: coefficients autours desquels on va chercher la bonne approximation
%   //SORTIE//
%       p(1) -> offset selon y => A
%       p(2) -> amplitude
%       p(3) -> moyenne (horizontale)
%       p(4) -> moyenne (verticale)
%       p(5) -> ecart-type
%%
%Fait appel à lsqnonlin avec construction de jacobienne
%Nécessite : approxgauss2D.m
%            Rgauss2D.m
%            jaco_der.m
%%

[dim_v,dim_h]=size(img);%nombre de lignes, nombre de colonnes
fline=zeros(1,dim_v*dim_h); %on va ramener l'image a un cas 1D
for i=1:dim_v
    fline((i-1)*dim_h+1:i*dim_h)=img(i,:);
end

% Quels parametres l'utilisateur a t-il choisit ?
if (exist('p0','var'))
    options = optimoptions('lsqnonlin','Jacobian','on');
    p=lsqnonlin(@(p)Rgauss2D(data,p,dim_h,dim_v),p0);
    return
end


[Max,Iv]=max(img);%donne la position verticale de chaque maximum
[Max,I_h]=max(Max);%donne la position horizontale du maximum global
I_v = Iv(I_h);
Min=min(min(img));
rec=[0,0];
k=0;

%permet d'estimer grossièrement la largeur de la gaussienne en param
%d'optimisation
for i=I_v-15:I_v+15
    if img(i,I_h)>round((Max+Min)/2) && k==0
        k=1;
        rec(1)=i;
    end
    if img(i)<Max/2 && k==1
        rec(2)=i;
    end
end




p0 = [ Min, Min-Max, I_h, I_v, (rec(2)-I_v)/sqrt(2*log((2*Max)/(Max-Min))) ];

    options = optimoptions('lsqnonlin','Jacobian','on');
    p=lsqnonlin(@(p)Rgauss2D(data,p,dim_h,dim_v),p0);

end

