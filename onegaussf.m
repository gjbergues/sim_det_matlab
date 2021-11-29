function [Iim] = onegaussf(A,c)

%Build the matrix
I=0;
%spatial resolution
Nx = 1624; %Column
Ny = 1234; %rows

%position of the line
i0 = round(Ny/2);

%Generate one image

for i = 1:Nx
    for j = 1:Ny
       I(i,j)= round(A*exp(-(i0-j)^2/(2*c^2)));    
    end
end
I= I';

Iim=mat2gray(I,[0,255]);

imshow(Iim)

end

