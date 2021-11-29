
clear all

ND = 5;

Nx = 100; %Column
Ny = 100; %rows
n = 100; %100 images

load('D:\PhD\Simulation Data\frimN23_05.mat');
load('D:\PhD\Simulation Data\frim05.mat');

I = Gfn;

%position of the line
i0 = round(Ny/2)-8;
j0 = round(Nx/2);

yy = 1:50;
xx = 1:30;

bh = zeros(100,n);
ih = zeros(100,5);
r = zeros(100);

acbh = 0;

for i = 1:n
%       J= mat2gray(I(:,:,i),[0,255]); %It seem not necesary to do this
%       J2 = J(i0+xx, j0+yy); 
      
      J= I(:,:,i); %I only use the created image, works better.
      J2 = J(i0+xx, j0+yy);
      
      
      for j = 1:5
        cv = squeeze(J2(:,j+5));
        [fit, gof] =  fitgauss23(xx', cv);
 
        ch = coeffvalues(fit);
        cih = confint(fit, 0.95);
 
        bh(i,j) = ch(2) + i0; %gaussian detected center value for each cut
        
        acbh = acbh + bh(i,j);%acumulator of center values
        
        ih(i,j) = (cih(2,2) - cih(1,2))/2; %Uncertinity for each cut
        
      end
      bhu(i)= acbh/5;  %center value for each line
      
      acbh=0;
end 

%this shift is use for centering the fitted curve in the center of the
%graphic.

shift = mean(bhu - sv);
bhu = bhu - shift;
shiftF = mean(bhu - sv);

%Fitting process and correlation coeficients
r = corcoef(sv,bhu');
p = pearson(sv,bhu);
 
% plot(sv, bhu, '*b')
% title('Gaussian Detection'); 
% xlabel('Real line position');
% ylabel('Center detected');   
 
mdl = LinearModel.fit(sv, bhu); 
figure; plot(mdl)
title('Gaussian Detection - Linear Model - 23dB');
xlabel('Simulated line position');
ylabel('Center detected');
% lab{1}='horizontal values' ;
% figure;boxplot([bhh', BVV'],lab)

res = mdl.Residuals.Raw
figure; plot(sv, res, '*r');  

title('D_k vs X_k (Hough)');
xlabel('Posiciones simuladas');
ylabel('Residuos');

