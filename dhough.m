

function [pci, pc, sv, r, p, mdl,thr,y]= dhough
%'pc' posición de cada centro detectado por Hough
%'pci' promedio de las posiciones
%'sv' posición real de los centros  

%load('function1234.mat');
%load('function1234_10.mat'); %cargo la matriz Gf con las 100 imagenes, y la posición de los centros 'sv'
%load('function1234n_18.mat');

%load('D:\PhD\Simulation Data\function1234.mat'); 
load('D:\PhD\Simulation Data\Previous\gaussfullim_pix'); 

%I = Gf;
n = 100;
pacum = 0;
J = 0;
c = 'canny';
s = 'sobel';
p = 'prewitt';
r = 'roberts';
l = 'log';
z = 'zerocross';

for i = 1:n
      %J= mat2gray(I(:,:,i),[0,255]);
       
       
       [BW,thr] = edge(Gf(:,:,i), s);
       %figure; imshow(BW);
       
       %Hough transform
         [H,theta,rho] = hough(BW,'RhoResolution',1,'Theta',-90:1:89.5);
         
       %Encontrar los picos en la transformada anterior
        [Hfil, Hcol]= find(H >= (max(max(H))));
        
       %Mostrar picos

        x = theta(Hcol(:,1));
        y = rho(Hfil(:,1));
               
        %centro del pico entre las dos líneas
        pc(i) = -((y(1) + y(2))/2);
       
        pacum = pacum + pc(i);
        
        
end

   pci = pacum/n;
   r = corcoef(sv,pc');%coeficiente de correlación
   p = pearson(sv,pc);%coeficiente de pearson
   plot(sv, pc,'*r')
   title('Zero sin ruido'); 
   xlabel('Gauss function position');
   ylabel('center detect');

    mdl = LinearModel.fit(sv, pc); 
    figure; plot(mdl)
    title('Canny ruido(18dB)');
    xlabel('Gauss function position');
    ylabel('center detect');
end

