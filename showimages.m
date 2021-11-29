
%Gf=3D matrix
%n=how many images do you want to see?

load('D:\PhD\Simulation Data\Previous\function100.mat', 'sv', 'Gf');   

i = 1;
    
    Im= mat2gray(Gf(:,:,i),[0,255]);
    imshow(Im);
    k=waitforbuttonpress;
