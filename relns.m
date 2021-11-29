p_Gauss = fliplr(xlsread('noiseangle.xlsx', 1, 'B10:M10'));
noise = xlsread('noiseangle.xlsx', 1, 'B29:m29');

plot(noise, p_Gauss,'*b'); 


% %legend('Gauss', 'Hough', 'WLS','Max', 'Probabilistic')
% title('r_G vs. N/S');
% xlabel('N/S');
% ylabel('Pearson Coefficient');


[xData, yData] = prepareCurveData( noise, p_Gauss );

% Set up fittype and options.
ft = fittype( 'poly2' );
opts = fitoptions( ft );
opts.Lower = [-Inf -Inf -Inf];
opts.Upper = [Inf Inf Inf];
ex = excludedata( xData, yData, 'Indices', [9 10 11 12] );
opts.Exclude = ex;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData, ex );
legend( h, 'p_Gauss vs. noise', 'Excluded p_Gauss vs. noise', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel( 'noise' );
ylabel( 'p_Gauss' );
grid on