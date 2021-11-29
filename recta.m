clear all

s_n = xlsread('noiseangle.xlsx', 1, 'B2:L2'); 

% n_s = (10.^(noise/10)).^-1;
% n_s = fliplr(n_s)
% N_S= [0 n_s];

%xlswrite('noiseangle.xlsx', N_S, 'b29:m29');

noise = xlsread('noiseangle.xlsx', 1, 'B29:m29');
In = xlsread('noiseangle.xlsx', 2, 'B18:P18');


R_Hough = fliplr(xlsread('noiseangle.xlsx', 1, 'B4:M4') );
R_Gauss = fliplr(xlsread('noiseangle.xlsx', 1, 'B11:M11'));
R_Max = fliplr(xlsread('noiseangle.xlsx', 1, 'B18:M18'));
R_Prob = fliplr(xlsread('noiseangle.xlsx', 1, 'B25:M25'));

p_Hough = fliplr(xlsread('noiseangle.xlsx', 1, 'B3:M3') );
p_Gauss = fliplr(xlsread('noiseangle.xlsx', 1, 'B10:M10'));
p_Max = fliplr(xlsread('noiseangle.xlsx', 1, 'B17:M17'));
p_Prob = fliplr(xlsread('noiseangle.xlsx', 1, 'B24:M24'));
p_reg = fliplr(xlsread('noiseangle.xlsx', 1, 'B34:M34'));

p_Hough_in = xlsread('noiseangle.xlsx', 2, 'B19:P19') ;
p_Gauss_in = xlsread('noiseangle.xlsx', 2, 'B11:P11');


%%%%%% Method comparison NOISE%%%%%%%%%%%%%%%
plot(noise, p_Gauss,'*b'); hold on;
plot(noise, p_Hough, '.r'); hold on;
plot(noise, p_reg, '*y'); hold on;
plot(noise, p_Max,'.g'); hold on; 
plot(noise, p_Prob, '*y'); 

legend('Gauss', 'Hough', 'WLS','Max', 'Probabilistic')
title('Method comparision');
xlabel('N/S');
ylabel('Pearson Coefficient');

%%% Method comparison Inclination%%%%%%%%%%%

% plot(In, p_Gauss_in,'*b'); hold on;
% plot(In, p_Hough_in, '.r'); hold on;
% 
% 
% legend('Gauss', 'Hough')
% title('Method comparision: line inclination performance ');
% xlabel('Line Inclination (º)');
% ylabel('Pearson Coefficient');
% 


%Hough
% p_Hough = xlsread('noiseangle.xlsx', 1, 'B3:L3'); 
% R_Hough = xlsread('noiseangle.xlsx', 1, 'B4:L4'); 
% rmse_Hough = xlsread('noiseangle.xlsx', 1, 'B5:L5'); 

%figure; plot(mdl)%10 gráfico de la recta de regresión
% title('Hough detection: Pearson coefficient vs. Noise');
% xlabel('Noise (dB)');
% ylabel('Pearson coefficient');

% title('Hough detection: R coefficient vs. Noise');
% xlabel('Noise (dB)');
% ylabel('R');
%plot(noise, rmse_Hough)
% title('Hough detection: RMSE vs. Noise');
% xlabel('Noise (dB)');
% ylabel('RMSE');

%Gauss
% p_Gauss = xlsread('noiseangle.xlsx', 1, 'B10:L10'); 
% R_Gauss = xlsread('noiseangle.xlsx', 1, 'B11:L11'); 
% rmse_Gauss = xlsread('noiseangle.xlsx', 1, 'B12:L12'); 


%figure; plot(mdl)%10 gráfico de la recta de regresión
%plot(noise, R_Gauss, '*');
% title('Gauss detection: Pearson coefficient vs. Noise');
% xlabel('Noise (dB)');
% ylabel('Pearson coefficient');

% title('Gauss detection: R coefficient vs. Noise');
% xlabel('Noise (dB)');
% ylabel('R');
% plot(noise, rmse_Gauss, '*')
% title('Gauss detection: RMSE vs. Noise');
% xlabel('Noise (dB)');
% ylabel('RMSE');


%Max
% p_Max = xlsread('noiseangle.xlsx', 1, 'B17:L17'); 
% R_Max = xlsread('noiseangle.xlsx', 1, 'B18:L18'); 
% rmse_Max = xlsread('noiseangle.xlsx', 1, 'B19:L19'); 


%plot(noise, R_Max, '*');

%mdl = LinearModel.fit(noise, p_Max);
%figure; plot(mdl)
% title('Max detection: Pearson coefficient vs. Noise');
% xlabel('Noise (dB)');
% ylabel('Pearson coefficient');
% 
% title('Max detection: R coefficient vs. Noise');
% xlabel('Noise (dB)');
% ylabel('R');
% plot(noise, rmse_Max, '*')
% title('Max detection: RMSE vs. Noise');
% xlabel('Noise (dB)');
% ylabel('RMSE');

%Probabilistic
% p_Prob = xlsread('noiseangle.xlsx', 1, 'B24:L24'); 
% R_Prob = xlsread('noiseangle.xlsx', 1, 'B25:L25'); 
% rmse_Prob = xlsread('noiseangle.xlsx', 1, 'B26:L26'); 


%plot(noise, rmse_Prob, '*');

%mdl = LinearModel.fit(noise, p_Max);
%figure; plot(mdl)
% title('Probabilistic detection: Pearson coefficient vs. Noise');
% xlabel('Noise (dB)');
% ylabel('Pearson coefficient');
% 
% title('Probabilistic detection: R coefficient vs. Noise');
% xlabel('Noise (dB)');
% ylabel('R');
% plot(noise, rmse_Max, '*')
% title('Probabilistic detection: RMSE vs. Noise');
% xlabel('Noise (dB)');
% ylabel('RMSE');


% %Regression
% p_REGRE = xlsread('noiseangle.xlsx', 1, 'B34:L34'); 
% 
% 
% 
% plot(s_n, p_REGRE, '*');

%mdl = LinearModel.fit(noise, p_Max);
%figure; plot(mdl)
% title('Weighted Least Squares: Pearson coefficient vs. S/N');
% xlabel('S/N (dB)');
% ylabel('Pearson coefficient');
% 
% title('Probabilistic detection: R coefficient vs. Noise');
% xlabel('Noise (dB)');
% ylabel('R');
% plot(noise, rmse_Max, '*')
% title('Probabilistic detection: RMSE vs. Noise');
% xlabel('Noise (dB)');
% ylabel('RMSE');




