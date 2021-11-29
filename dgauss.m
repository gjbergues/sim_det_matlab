
%function [cv, I, sv, J2, bh, ih, r, p, mdl]= dgauss(n)

ND = 5;
Nx = 1624; %Column
Ny = 1234; %rows

n=100;

%[I,sv] = gaussf(A,c,n);

%load('function1234n_30.mat');
%load('function1234_10.mat');
load('D:\PhD\Simulation Data\frim.mat');

I = GfF;

%position of the line
i0 = round(Ny/2)-8;
j0 = round(Nx/2);
yy = 1:200;
xx = 1:30;
bh=zeros(100,n);
ih=zeros(100,5);
r=zeros(100);
acbh=0;

for i = 1:n
      J= mat2gray(I(:,:,i),[0,255]);
      J2 = J(i0+xx, j0+yy);%los valores fijos cambian con la imagen 
               
      for j = 1:5
        cv = squeeze(J2(:,j+5));
        [fit, gof] =  fitgauss(xx', cv);
 
        ch = coeffvalues(fit);
        cih = confint(fit, 0.95);
 
        bh(i,j) = ch(2)+i0; %valor central detectado de la gaussiana para cada corte
        
        acbh = acbh + bh(i,j);%acumulador de valores centrales para cada corte de la imagen
        
        ih(i,j) = (cih(2,2)-cih(1,2))/2; %incertidumbre para cada corte
        
      end
      bhu(i)= acbh/5;  %valor central único para cada imagen 
      acbh=0;
end 

 
r = corcoef(sv,bhu');
p = pearson(sv,bhu);
 
plot(sv,bhu, '*b')
title('Detección Gaussina'); 
xlabel('Gauss function position');
ylabel('center detect');   
 
mdl = LinearModel.fit(sv, bhu); 
figure; plot(mdl)
title('Detección Gaussina');
xlabel('Gauss function position');
ylabel('center detect');
% lab{1}='horizontal values' ;
% figure;boxplot([bhh', BVV'],lab)

%end
