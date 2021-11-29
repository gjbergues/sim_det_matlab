clear all

incH = xlsread('noiseangle.xlsx', 2, 'B3:K3'); 
incHext = xlsread('noiseangle.xlsx', 2, 'B18:p18'); 
%Hough


p_Hough = xlsread('noiseangle.xlsx', 2, 'B4:K4'); 
p_Hough_ext = xlsread('noiseangle.xlsx', 2, 'B19:p19'); 
R_Hough = xlsread('noiseangle.xlsx', 2, 'B5:K5'); 
rmse_Hough = xlsread('noiseangle.xlsx', 2, 'B6:K6'); 

mdl = LinearModel.fit(incH, p_Hough);

figure; plot(incH, p_Hough, '*')
%figure; plot(mdl)%10 gráfico de la recta de regresión
title('Hough detection: Pearson coefficient vs. Inclination');
xlabel('Line inclination (º)');
ylabel('Pearson coefficient');

figure; plot(incHext, p_Hough_ext, '*')
%figure; plot(mdl)%10 gráfico de la recta de regresión
title('Hough detection: Pearson coefficient vs. Inclination');
xlabel('Line inclination (º)');
ylabel('Pearson coefficient');


figure; plot(incH, R_Hough, '*')
title('Hough detection: R coefficient vs. Inclination');
xlabel('Line inclination (º)');
ylabel('R');

figure; plot(incH, rmse_Hough, '*')
title('Hough detection: RMSE vs. Inclination');
xlabel('Line inclination (º)');
ylabel('RMSE');

%Gauss
incG = xlsread('noiseangle.xlsx', 2, 'B10:P10'); 
p_Gauss = xlsread('noiseangle.xlsx', 2, 'B11:p11'); 
R_Gauss = xlsread('noiseangle.xlsx', 2, 'B12:p12'); 
rmse_Gauss = xlsread('noiseangle.xlsx', 2, 'B13:p13'); 

figure; plot(incG, p_Gauss, '*')
%figure; plot(mdl)%10 gráfico de la recta de regresión
title('Gauss detection: Pearson coefficient vs. Inclination');
xlabel('Line inclination (º)');
ylabel('Pearson coefficient');


figure; plot(incG, R_Gauss, '*')
title('Gauss detection: R coefficient vs. Inclination');
xlabel('Line inclination (º)');
ylabel('R');

figure; plot(incG, rmse_Gauss, '*')
title('Gauss detection: RMSE vs. Inclination');
xlabel('Line inclination (º)');
ylabel('RMSE');
