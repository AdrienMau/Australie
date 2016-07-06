%Select a hole on the image
%the script gives the parameters of a fitted gaussian
tic

%Loading img (if do not exist)
if ~exist('img','var')
    % Construction boite dialogue pour choisir l'image
choice = questdlg('Voulez vous charger une image déjà existant?', ...
    'Choix img',...
	'Oui (Parcourir)', ...
	'Non (Choix images)',...
    'Quitter','Quitter');
% Réponse
switch choice
    case 'Oui (Parcourir)'
        'Choix de l-image:'
        load(uigetfile());
    case 'Non (Choix images)',
        img=imread('C:\Users\Adrien\Documents\GitHub\Australie\Experiences\30juin-MembraneAg\Images BMP\14-fprectangle-20Loop-6.992pA-DD0.1-LD20000-AD1000resol.bmp');
    case 'Quitter'
end
end
    
%Grey
s=size(img)
if(length(s)==3)
    img=rgb2gray(img);
    s=[s(1) s(2)];
end


imshow2(img)
rect = round(getrect())
img2=img(rect(2):(rect(2)+rect(4)),rect(1):(rect(1)+rect(3)));
imshow2(img2)




toc

    