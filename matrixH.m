function [pH] = matrixH(T)

%Hough transform
        [H, theta,rho] = hough(T, 'RhoResolution', 1, 'Theta', -90:1:89.5);
        [Hfil, Hcol]= find(H >= 0.5*(max(max(H)))); %It works better this deteccion of the peaks
                 
        y1 = rho(Hfil(:,1)); %y1 gives the two edges position for each line
           
        %Separation of the vector y1 in its positives and negatives values
        
        ypos = y1(y1>=0); 
        yneg = abs(y1(y1<0));
        
        [np] = size(ypos);
        [nn] = size(yneg);
        
        minp = min(ypos);
        minn = min(yneg);
        
        for i = 1:np
           if (ypos(i) == NaN)
            ypos(i) = minp;           
           end        
        end
        
        for i = 1:nn
           if (yneg(i) == NaN)
            yneg(i) = minn;           
           end        
        end
    
        %final position of the horizontal line
        pH = (mean(ypos)+ mean(yneg))/2; 
        
        
end