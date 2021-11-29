%Funci�n que crea las 100 im�genes. 
%Gf= funci�n con las 100 im�genes, es una funci�n, no son im�genes.
%sv= posici�n de cada uno de los centros de l�nea.
% A = Amplitude
% c = line with
% n = number of images
% d = inclinaci�n arctg 1/d=angulo positivo
%Creo n im�genes de una l�nea gaussiana dada por los par�metros anteriores

function [Gf,sv] = creagaussf(A,c,n,d)


    %Build the matrix
    Gf = 0;
    
    %Basler-Cam spatial resolution
    Nx = 1624; %Column
    Ny = 1234; %rows
    
    %Nx = 100; %Column
    %Ny = 100; %rows
    
    %Initial position of the line
    i0 = round(Ny/2);

    %Generate n images
    Gf = zeros(Nx,Ny,n);%inicializo para no sobrecargar memoria
    sv = zeros(1,n);
    
    %(i,j) sub�ndices de cada imagen
    %"k" es cada imagen
    in = 0;%inclinaci�n
    for i = 1:Nx
        if d ~= 0
            in = in-1/d;
        end
        for j = 1:Ny
            for k = 1:n 
                %sv = i0 + (k)/n; %subpixel varitation (n=100-> cent�cima)
                sv = i0 + (k); %pixel varitation 
                Gf(j,i,k)= round(A*exp(-(sv+in-j)^2/(2*c^2)));%gaussian line  
            end
        sv = 0;
        end
    end

    for k = 1:n 
       %sv(k) = i0 + (k)/n; %subpixel vatiation
       sv(k) = i0 + (k); %pixel vatiation
    end
    
save('gaussfullim_pix.mat', 'sv', 'Gf');   

end%final de la funci�n
