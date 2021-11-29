%'pc' Hough detected center position.
%'sv' real position of each line. 
%This hough function is used when we have not noise
     
    clear all
    
    load('D:\PhD\Simulation Data\frim05_in009.mat');
      
    n = 100; % 100 lines
    
    for i = 1:n
        
        %Without noise
        
        I= GfF(:,:,i);
        I = I - min(I(:));
        I = I / max(I(:));
        v1 = var(I(:)) / (10^(23.48/10)); %23.485
        v = mean(I(:)) / (10^(24.48/10));
        V = (v + v1)/2;
        
        I = 200*imnoise(I, 'gaussian', 0, v1);%0.9138       
       
        %Thresholds without noise
        max_h = max(max(I));
        th1 = 0.4;%3%6%0.5
        th2 = 10.;%12
        th3 = 20;%28
        th4 = 99.9999;%100
        
        %Creations of the gray level matrices (use only 5 gray levels)
        A = (I >= max_h);
        B = (max_h > I & I >= max_h-th1);
        C = (max_h-th1 > I & I >= max_h-th2);
        D = (max_h-th2 > I & I >= max_h-th3);
        E = (max_h-th3 > I & I > max_h-th4);
        
        T = A+B+C+D+E;
       
        %Hough transform
        [H,theta,rho] = hough(T, 'RhoResolution', 1, 'Theta', -90:1:89.5);
        [Hfil, Hcol]= find(H >= 0.50*(max(max(H)))); %It works better this deteccion of the peaks
        %surf(H);
        
        x = theta(Hcol(:,1));
        y1 = rho(Hfil(:,1));%y1 gives the two edges position for each line
          
        %Separation of the vector y1 in its positives and negatives values
        
        xpos = x(x>=0); 
        xneg = abs(x(x<0));
        
        inclination = (mean(xpos)+ mean(xneg))/2;
        
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

             
    
%     for i= 1:20
%     
%       pc(i) = pc(i) + 0.1;
%         
%     end
%     
    %Fitting process and correlation coeficients
    
    r = corcoef(sv,pc');%coeficiente de correlación
    p = pearson(sv,pc);%coeficiente de pearson
%     plot(sv, pc,'*r')
%     title('Hough Detection');
%     xlabel('Real Line Position');
%     ylabel('Center Detected');

    mdl = LinearModel.fit(sv, pc); 
    figure; plot(mdl)
    title('Hough Detection - Linear Model');
    xlabel('Real Line Position');
    ylabel('Center Detected');

 
        


    

    