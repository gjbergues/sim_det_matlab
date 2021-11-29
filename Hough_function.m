%'pc' Hough detected center position.
%'sv' real position of each line. 
%This Hough function is used when the images have noise
     
    clear all
    
    load('D:\PhD\Simulation Data\frimN23_05.mat');
    load('D:\PhD\Simulation Data\frim05.mat');
      
    n = 100; % 100 lines
    J = 0;
    

    for i = 1:n
        
        %Without noise
        %I = Gfn(:,:,i);
        
        %With Noise
        I = Gfn(:,:,i)*200;             
       
        %Thresholds without noise
%         max_h = max(max(I));
%         th1 = 23;
%         th2 = 10;
%         th3 = 23;
%         th4 = 100;
        
        %With noise 13 dB
%         max_h = max(max(I));
%         th1 = 3;
%         th2 = 10;
%         th3 = 20;
%         th4 = 97;
%         
%         %With noise 23 dB
        max_h = max(max(I));
        th1 = 3;
        th2 = 12;
        th3 = 28;
        th4 = 100;
        
        %Creations of the gray level matrices (use only 5 gray levels)
        A = (I >= max_h);
        B = (max_h > I & I >= max_h-th1);
        C = (max_h-th1 > I & I >= max_h-th2);
        D = (max_h-th2 > I & I >= max_h-th3);
        E = (max_h-th3 > I & I >= max_h-th4);
        
        T = A+B+C+D+E;
       
        %Hough transform
        [H,theta,rho] = hough(T, 'RhoResolution', 1, 'Theta', -90:1:89.5);
        %[Hfil, Hcol] = find(H >= (0.99 * mean(max(H))));
        [Hfil, Hcol]= find(H >= 0.5*(max(max(H)))); %It works better this deteccion of the peaks
        
        y1 = rho(Hfil(:,1));%y1 gives the two edges position for each line
           
        %Separation of the vector y1 in its positives and negatives values
        
        ypos = y1(y1>=0); 
        yneg = abs(y1(y1<0));
    
        %final position of the horizontal line
        pos_hough = (mean(ypos)+ mean(yneg))/2;
        
        %vector with all positions      
        pc(i) = pos_hough;
        
         
        
        
    end
    
    %this shift is use for centering the fitted curve in the center of the
    %graphic.
    shift = mean(pc - sv);
    
    pc = pc - shift;
    
    shiftF = mean(pc - sv);
    
    %Fitting process and correlation coeficients
    
    r = corcoef(sv,pc');%coeficiente de correlación
    p = pearson(sv,pc);%coeficiente de pearson
%     plot(sv, pc,'*r')
%     title('Hough Detection - 23 dB'); 
%     xlabel('Real Line Position');
%     ylabel('Center Detected');

     mdl = LinearModel.fit(sv, pc); 
%     figure; plot(mdl)
%     title('Hough Detection - 13 dB - Linear Model');
%     xlabel('Simulated Line Position');
%     ylabel('Center Detected');
    
    res = mdl.Residuals.Raw
    figure; plot(sv, res, '*b');  

    xlabel('Posiciones de linea');
    ylabel('Residuos');


 
        


    

    