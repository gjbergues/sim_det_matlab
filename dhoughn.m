% A = Amplitude
% c = line with
% n = number of images
% d = inclinación arctg 1/d=angulo positivo

%function [pci, pc, sv, r]= dhoughn(n)
%'pc' posición de cada centro detectado por Hough
%'pci' promedio de las posiciones
%'sv' posición real de los centros  

%I = onegaussf(A,c);
%[I,sv] = gaussf(A,c,n);

load('gaussfullim_pix_noise_1.mat');
load('gaussfullim_pix.mat');   
% load('function1234n_18.mat');
% load('function1234.mat');

pacum = 0;
J = 0;
c = 'canny';
s = 'sobel';
p = 'prewitt';
r = 'roberts';
l = 'log';
z = 'zerocross';

for i = 1:100
       %J= mat2gray(I(:,:,i),[0,255]);
       
       [BW,thr] = edge(Gfn(:,:,i), z);
       
              
       %Hough transform
         [H,theta,rho] = hough(BW,'RhoResolution',1,'Theta',-90:1:89.5);
         
       %Encontrar los picos en la transformada anterior
        [Hfil, Hcol]= find(H >= (max(max(H))));
        
       %Mostrar picos

        x = theta(Hcol(:,1));
        y = rho(Hfil(:,1));%detecta sólo un valor cenntral cuando hay ruido
               
        d = size(y);
        
        if d(2)==2
             pc(i) = -((y(1) + y(2))/2);
        end
        
        if d(2)==1
             pc(i) = -y;
        end
        pacum = pacum + pc(i);
        
        
end

   pci = pacum/100;
   r = corcoef(sv,pc');%coeficiente de correlación
   pe = pearson(sv,pc);%coeficiente de pearson
   
   plot(sv,pc,'*r')
   title('Canny bajo ruido'); 
   xlabel('Gauss function position');
   ylabel('center detect');

mdl = LinearModel.fit(sv, pc); 
    figure; plot(mdl)
    title('Zero-cross ruido(18dB)'); 
    xlabel('Gauss function position');
    ylabel('center detect');
%end

