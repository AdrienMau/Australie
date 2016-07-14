function [ output_args ] = ui_nyquist( input_args )



% global trucglobal;


if ~exist('pas','var')
    pas=1;
end


scrsz = get(groot,'ScreenSize'); %screensize
initvalue = 1;

%sinus
T=2*pi; %sinus period
x=(0:initvalue:10)*2*pi/T; % sampling
y=sin(x);
plot(x,y)


%     fpath2=strcat(fpath,'000700.2Ddbl'); %on affiche la 700 en premier
%     h=figure('Position',[scrsz(3)/2 scrsz(4)/4 scrsz(3)/2 scrsz(4)/2]); % Place les figures côte à côte
      
    %crée la figure pour afficher les deux graphes
        f = figure('Visible','off','Position',[1 scrsz(4)/4 scrsz(3)/2 scrsz(4)/2]);
        ax = axes('Units','pixels');
        set(groot,'CurrentFigure',f);
        im=imread('cameraman.tif');
%         image=imshow(im,'DisplayRange',[min(im(:)) max(im(:))],'InitialMagnification','fit');hold on;
        title('');
    
   % Create SLIDER
    sld = uicontrol('Style', 'slider',...
        'Min',0,'Max',1400,'Value',700,'SliderStep',[pas/1400 pas/1400],...
        'Position', [300 3 120 20],...
        'Callback', @newvalue);
					
    % Add a TEXT uicontrol to label the slider.
        txt = uicontrol('Style','text',...
        'Position',[340 25 50 15],...
        'String',initvalue);
    
    % Make figure visble after adding all components
    f.Visible = 'on';
    % This code uses dot notation to set properties. 
    % Dot notation runs in R2014b and later.
    % For R2014a and earlier: set(f,'Visible','on');
    
    function newvalue(source,callbackdata)
        val = source.Value
        % For R2014a and earlier:
        % val = 51 - get(source,'Value');
    
        r=val-mod(val,pas)
        %edit Text
        txt = uicontrol('Style','text',...
        'Position',[340 25 50 15],...
        'String',r);

        set(groot,'CurrentFigure',f);
        x=(0:r:10)*2*pi/T; % sampling
y=sin(x);
plot(x,y)
        

    
 
    end
end

