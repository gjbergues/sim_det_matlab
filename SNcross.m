
%Valores obtenidos snr(con fondo)=1.5
%snr2(sin fondo)= 17,68

y = 1:186; %filas
x = 1:327; %columnas

rgb_img= imread('cruzfinal.bmp');
I = .2989*rgb_img(:,:,1)+.5870*rgb_img(:,:,2) +.1140*rgb_img(:,:,3);
I = double(I);     
    wx = 203;
    wy = 617;
	y = 1:wy;
	x = 1:wx;
    Isf=zeros(1234,1624);
    
    k=1;
    for i = 0:1
        ymin= i*617+1;
        for j=0:7
            k=k+1;
            xmin= j*203+1;
            Ic = imcrop(I,[xmin ymin 202 616]);%[xmin ymin width height]%
        
        
            [fitresult, gof] = Fit_fondo_cruz_H(x, y, Ic);
            %figure; surf(x, y, I);
            [t1,t2] = meshgrid(x,y);
            promfit = fitresult( t1, t2);
            %figure; surf(t1, t2, promfit);
        
            J = abs(promfit-Ic);
            Isf((1+i*617):(617*(i+1)),(1+j*203):(203*(j+1)))=J;
            %figure; imagesc(J); colormap(gray)
            %figure; surf(xx, yy, J2);
        end
        xmin = 0;
    end
    
    %figure; imshow(Isf);

    i = 0;
    acbh = 0;
     
    for j = 1:1624
        i=i+1;
        cv = squeeze(Isf(:,j));%cortes verticales       
 
        [M,Inh] = max(cv);%M= valor, I=índices.      
        
        bh(i) = Inh; %valor central detectado para cada corte             
    end
    
        bhu = median(bh);  %posición línea horizontal 
      
     
     acbv = 0;
     i = 0;
     for j = 1:1234
        i=i+1;
        ch = squeeze(Isf(j,:));%cortes horizontales
      
        [M,Inv] = max(ch);%M= valor, I=índices.
       
        bv(i) = Inv; %valor central detectado de la gaussiana para cada corte                
     end
     
      bvu = median(bv);  %posición línea vertical
      



%Image with background 
In = imcrop(I,[900 500 100 100]); %[xmin ymin width height]
figure; imshow(In);
n = mean(mean(In));

Is = imcrop(I,[791 731 40 10]);
figure; imshow(Is);
s = mean(mean(Is));
snr = 10*log10(s/n);

%Imagen sin fondo
Ins = imcrop(Isf,[900 500 100 100]); %[xmin ymin width height]
figure; imshow(Ins);
ns = mean(mean(Ins));

Iss = imcrop(Isf,[791 731 40 10]);
figure; imshow(Iss);
ss = mean(mean(Iss));
snr2 = 10*log10(ss/ns);


