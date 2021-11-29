
% A = Amplitude
% c = line with
% n = number of images
% d = inclinaci�n arctg 1/d=angulo positivo
%Creo n im�genes de una l�nea gaussiana dada por los par�metros anteriores

%function [Gfn] = gaussfnoise

%load('function1234.mat');
load('D:\PhD\Simulation Data\frim05.mat');
    
for i = 1:100
    I= GfF(:,:,i);
    I = I - min(I(:));
    I = I / max(I(:));
    v = var(I(:)) / (10^(23/10));
    %Gfn(:,:,i)= abs(awgn(GfF(:,:,i),1)); 
    Gfn(:,:,i) = imnoise(I, 'gaussian', 0, v);%0.9138
end

%save('gaussfullim_pix_noise_1.mat','Gfn');
save('D:\PhD\Simulation Data\frimN23_05.mat', 'Gfn');   

%end%final de la funci�n