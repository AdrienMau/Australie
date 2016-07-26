
%1dim
im=imread('C:\Users\Adrien\Documents\GitHub\Australie\Matlab\1test2.png');

%4dim
% im=imread('C:\Users\Adrien\Documents\GitHub\Australie\Experiences\All pictures by number of exp\31\31 backside.tif');

s=size(im)
try
    if s(3)==3
        'conversion gris'
        im=rgb2gray(im);
    end
end
subplot(1,2,1)

maxiter=10;
iter=0;
n_holes=5;
num=0;

%on fait varier le seuil jusqua trouver n_holes trous:
while((iter<maxiter)*(num~=n_holes))
imbinary=im<median(median(im))/(1+iter/5);
[L,num]=bwlabel(imbinary);
iter=iter+1
end

imshow(L);
subplot(1,2,2)
imshow(im)

%detection des contours: quand il n'y a pas de '1' sur une colonne
Histo=max(imbinary);
i=1:length(Histo)-1;
contours=(Histo(i)~=Histo(i+1))
% for exemple Histo= [0 0 1 1 1 0 0 a] will give contours=[0 1 0 0 1 0 0 ]
position_contours=contours.*i; % give 0 2 0 0 5 0 0


%now we have the area with position of binary edges, but we may want to take
%them a bit bigger, to be sure to have the whole circle. For exemple
%enlarge by a certain maximum number of pixels.
inside_hole=0;
free=0;
max_enlarge=4;
j=zeros(2,nholes) % store the coordinates of
for(j=1:length(position_contours))
    if(position_contours) %detect an edge
        inside_hole=(inside_hole==1)
        
    
    end
end

% plot(mean(im));