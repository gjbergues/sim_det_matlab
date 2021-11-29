%Función que crea las 100 imágenes. 
%Gf= función con las 100 imágenes, es una función, no son imágenes.
%sv= posición de cada uno de los centros de línea.
% A = Amplitude
% c = line with
% n = number of images
% d = inclinación arctg 1/d=angulo positivo
%Creo n imágenes de una línea gaussiana dada por los parámetros anteriores

function [GfF,sv] = creagfrim(A,c,n)


    %Build the matrix
    Gf = 0;
    
    %Basler-Cam spatial resolution
    % Nx = 1624; %Column
    % Ny = 1234; %rows
    
    Nx = 100; %Column
    Ny = 100; %rows
    
    %Initial position of the line
    i0 = round(Ny/2);

    %Generate n images
    Gf = zeros(Nx,Ny,n);%inicializo para no sobrecargar memoria
    Gf2 = zeros(Nx,Ny,n);%inicializo para no sobrecargar memoria
    GfF = zeros(Nx,Ny,n);%inicializo para no sobrecargar memoria
    sv = zeros(1,n);
    
    %(i,j) subíndices de cada imagen
    %"k" es cada imagen
    in = 0;%inclinación
    for i = 1:Nx %columns
        
        for j = 1:Ny %rows
            for k = 1:n 
                sv = i0 + (k)/n; %subpixel varitation (n=100-> centécima)
                 
                % j = center position.
                % sv = function independent variable
                Gf(j,i,k)= round(A*exp(-(sv-j)^2/(2*c^2)));%gaussian line  
                Gf2(j,i,k)= round(A*exp(-(sv+1-j)^2/(2*c^2)));%gaussian line  
                GfF(j,i,k)= Gf2(j,i,k) + Gf(j,i,k);
            end
        sv = 0;
        end
    end

    for k = 1:n 
       sv(k) = i0 + 0.5 + (k)/n; %subpixel vatiation with shift
       %sv(k) = i0  + (k)/n;  %subpixel vatiation without shift
       %sv(k) = i0 + (k); %pixel vatiation
    end
    

save('D:\PhD\Simulation Data\frim05.mat', 'sv', 'GfF');   

end%final de la función