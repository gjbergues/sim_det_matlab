function [fitresult, gof] = createFit(noise, p_Gauss)
%CREATEFIT(NOISE,P_GAUSS)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : noise
%      Y Output: p_Gauss
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 01-Jul-2015 11:02:03


%% Fit: 'untitled fit 1'.
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

