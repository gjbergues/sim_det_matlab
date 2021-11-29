% A=imread('peppers.png');
% B=rgb2gray(A);

% C=double(B);
C=J;


for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        %Sobel mask for x-direction:
        Gx=((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));
        %Sobel mask for y-direction:
        Gy=((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
     
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        B(i,j)=sqrt(Gx.^2+Gy.^2);
     
    end
end
figure,imshow(B); title('Sobel gradient');

%Define a threshold value
% Thresh=10;
% B=max(B,Thresh);
% B(B==round(Thresh))=0;
% 
% B=uint8(B);
% figure,imshow(~B);title('Edge detected Image');

% G_x= [-1 -2 -1; 0 0 0; 1 2 1];
% G_y= [-1 0 1; -2 0 2; -1 0 1 ];
% 
% C1=conv2(G_x,J);
% C2=conv2(G_x,J);
% 
% R= sqrt(C1.^2+C2.^2);


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( [], B_1 );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( ft );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'B_1', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
ylabel( 'B_1' );
grid on

%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( [], B_1 );

% Set up fittype and options.
ft = fittype( 'splineinterp' );
opts = fitoptions( ft );
opts.Normalize = 'on';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'B_1', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
ylabel( 'B_1' );
grid on


