

%function [BW,thr]= besthresh
%'pc' posición de cada centro detectado por Hough
%'pci' promedio de las posiciones
%'sv' posición real de los centros  


load('function1234.mat'); %cargo la matriz Gf con las 100 imagenes, y la posición de los centros 'sv'
load('function1234n_1.mat');

%I = Gf;
n = 100;
pacum = 0;
J = 0;

%J= mat2gray(I(:,:,1),[0,255]);

s = 'sobel';
c = 'canny';
p = 'prewitt';
%for i = 1:200
             
      
       [BW,thr] = edge(Gf(:,:,1),s);
       figure; imshow(BW)
       %i
       %k = waitforbuttonpress;
       %Hough transform
         %[H,theta,rho] = hough(BW,'RhoResolution',0.1,'Theta',-90:0.5:89.5);
         
       %Encontrar los picos en la transformada anterior
        %[Hfil, Hcol]= find(H >= (max(max(H))));
        
       %Mostrar picos

        %x = theta(Hcol(:,1));
        %y = rho(Hfil(:,1));
               
        %centro del pico entre las dos líneas
        %pc(i) = -((y(1) + y(2))/2);
       
        %pacum = pacum + pc(i);
        
        
%end

%    pci = pacum/n;
%    r = corcoef(sv,pc');%coeficiente de correlación
%    
%    plot(sv,pc,'*r')
%    title('Canny bajo ruido'); 
%    xlabel('Gauss function position');
%    ylabel('center detect');
% 
%     mdl = LinearModel.fit(sv, pc); 
%     figure; plot(mdl)
%     xlabel('Gauss function position');
%     ylabel('center detect');
%end
