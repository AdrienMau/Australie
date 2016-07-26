% % C:\Users\Adrien\Documents\GitHub\Australie\30juin-MembraneAg\Images BMP\fprectangle-20Loop-6.99pA-DD0.1-LD20000-AD1000resol.bmp
% % 14-fprectangle-20Loop-6.992pA-DD0.1-LD20000-AD1000resol.bmp
% % img2=fftshift(fft2(img));
% % imshowf(img2)
% 
path(path,'C:\Users\Adrien\Documents\PIMS\Code')
%Ouverture et conversion noir blanc
if ~exist('img','var')
img=imread('test-dots.bmp');
s=size(img);
if(s(3)==3) img=rgb2gray(img);
end
s=size(img);
end

% subplot(2,1,1)
% imshow2(img);
% %histogramme
% % h=histodeg2(img,0,10,32,256,1,512 );
% % h2=smooth(h,10);
% subplot(2,1,2)
% % plot(imhist(img))
% 
% histo=sum(img);
% plot((histo))
% axis([1 512 0 Inf])
% 
% %Passe bas
% H=hgaussp([65,512],[32,256],1,150,0,8);
% % H=ones(65,512);
% imgf=fftshift(fft2(img));
% imgbas=H.*double((imgf));
% 
% % imshow2(abs((ifft2(imgbas))));


%On prend deux trous
% imgpart=img(20:50,429:470)';
imgpart=img(20:50,429:470);
subplot(2,1,1)
imshow2(imgpart);
spart=size(imgpart)

histo_imgpart=sum(imgpart)/spart(1);


%approx non linéaire avec parametre p
% p(1) = offset
% p(2),p(5) : amplitudes des 2 gaussiennes
% p(3),p(6) : moyennes des 2 gaussiennes
% p(4),p(7) : variances des 2 gaussiennes
OPTIONS=optimset('Algorithm','levenberg-marquardt');

%recherche parametres proches
p0=zeros(1,7);
p0(1)=max(histo_imgpart); %offset
p0(2)=min(histo_imgpart); %amplitude (negative)
p0(5)=p0(2);  %amplitude (negative)
p0(3)=spart(2)/3; %centre
p0(6)=2*spart(2)/3; %centre
p0(4)=3; %variance
p0(7)=p0(4);

sigmamax=7;
lb = [-Inf,-Inf,-Inf,-sigmamax,-Inf,-Inf,-sigmamax]; %lower bound
ub = -lb;
p=lsqnonlin(@(p)R2gaussJacob(1:spart(2),histo_imgpart,p),p0,lb,ub,OPTIONS);

x=1:spart(2);
subplot(2,1,2)
plot(p(1)- p(2)*exp(-((x-p(3)).*(x-p(3)))/(2*p(4)*p(4))) - p(5)*exp(-((x-p(6)).*(x-p(6)))/(2*p(7)*p(7)))) ;
axis([1 spart(2) 0 Inf])
hold on
plot(histo_imgpart);
plot(p(1)- p(2)*exp(-((x-p(3)).*(x-p(3)))/(2*p(4)*p(4)))) ;
plot(p(1)- p(5)*exp(-((x-p(6)).*(x-p(6)))/(2*p(7)*p(7)))) ;


p(4)
p(7)