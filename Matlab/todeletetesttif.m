
%1dim
im=imread('C:\Users\Adrien\Documents\GitHub\Australie\Experiences\All pictures by number of exp\79\79i 03 backside.tif');

%4dim
% im=imread('C:\Users\Adrien\Documents\GitHub\Australie\Experiences\All pictures by number of exp\31\31 backside.tif');

s=size(im)

exist('s(3)','var')
% max(im(:,:,4))

imshow2(im)
img2=(img2-mini).*255/(maxi-mini);