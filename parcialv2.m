X= [210 249.4098 346.0248 443.2596 540.8900 638.6340 736.4553 833.9640 931.4279 1029.0776 1126.4877 1223.5168 1320.5132 1416.1696 1450 ];

Y= -[13 14.3754 15.8603 16.2575 16.7216 16.5339 16.4334 16.5090 16.3183 16.4318 16.7494 16.8072 16.1113 13.9578 13];

Y2=Y + 16.2875;

Y2 = Y2/10;
[xData, yData] = prepareCurveData( X, Y2 );

% Set up fittype and options.
ft = fittype( 'poly4' );
opts = fitoptions( ft );
opts.Lower = [-Inf -Inf -Inf -Inf -Inf];
opts.Upper = [Inf Inf Inf Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'Y vs. X', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel( 'X' );
ylabel( 'Y' );
grid on
