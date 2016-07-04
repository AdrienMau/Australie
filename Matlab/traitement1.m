% C:\Users\Adrien\Documents\GitHub\Australie\30juin-MembraneAg\Images BMP\fprectangle-20Loop-6.99pA-DD0.1-LD20000-AD1000resol.bmp

%Ouverture
img=imread('test-dots.bmp');
s=size(img);
if(s(3)==3) img=rgb2gray(img);
end
s=size(img);

%histogramme
h=histodeg2(img,0,5,32,256,1,1028 );
h2=smooth(h,10);
plot(h2)

%Passe bas
% H=hgaussp([65,512],[32,256],1,500,0,8);
H=ones(65,512);
imgf=fftshift(fft2(img));
imgbas=H.*double((imgf));
imshow2(abs((fft2(imgbas))));

