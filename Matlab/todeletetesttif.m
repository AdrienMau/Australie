
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

maxiter=5;
iter=0;
n_holes=
while((iter<maxiter)*(num~=n_holes)
imbinary=im<median(median(im))/1.4;
[L,num]=bwlabel(imbinary);
imshow(L);
subplot(1,2,2)
imshow(im)


% plot(mean(im));