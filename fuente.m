yf=	[618.5162 618.5164 618.516 618.5163	618.516	618.5165 618.5162 618.516 618.516 618.5163 618.5164];
xf=1:11;

mdl = LinearModel.fit(xf, yf); 

%figure; plot(mdl_h)
% title('D_k vs X_k (Hough)');
% xlabel('Measure Angle (sec of arc)');
% ylabel('Discrepancies (sec of arc)');
%     
    
res = mdl.Residuals.Raw
figure; plot(xf, res, '*b');  

xlabel('Posición regulador');
ylabel('Residuos');