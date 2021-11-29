 clear all
% 
ND = 5;
% Nx = 1624; %Column
% Ny = 1:1234; %rows

Nx = 100; %Column
Ny = 1:100; %rows
n = 100;

% load('function1234n_18.mat');
% load('function1234.mat');

%load('D:\PhD\Simulation Data\frimN23_05.mat');
load('D:\PhD\Simulation Data\100im_wshift\frim05.mat');
load('D:\PhD\Simulation Data\100im_wshift\frimN23_05.mat');
%load('D:\PhD\Simulation Data\100im_woshift\frim.mat');


ey = 1:21;
ex = 1:100;

I = Gfn;
%position of the line


y = zeros(1,100);
x = 1:100;


%For for each image
for i = 1:100
      J = (I(:,:,i));
          
      
                 
      %Vector W of Weights
      s = sum(J(:));
      P = J/s;
             
      %For for each column
      for j = 1:100
        cv = J(:,j);
        cvP = P(:,j);
        [M,indm] = max(cv);
        maxIndex = find(cv == M);
        ind = mean(maxIndex)
        % Vector y and W from the maximun value per each column
        y(j) = ind;
        W(j) = cvP(indm);
      end
      
      a = ((sum(W .* x .* y) * sum(W)) - (sum(W .* y) * sum(W .* x) )) /((sum(W .* x.^2) * sum(W)) - (sum(W.*x))^2);
 
      b = ((sum(W .* x.^2) * sum(W .* y)) - ( sum(W .* x) * sum(W .* x .* y))) / ((sum(W.*x.^2)*sum(W)) - (sum(W.*x))^2);
      
      
      %Center detection for each position
      Cd(i) = b;
      %Slope for each detection
      Sd(i)= a;
      
end 


%Probing the algorithm
% yprueba = [1 1.5 1.6 1.8 2.1 2.3 2.35 2.5 2.7 2.6];
% 
% xprueba = 1:10;
% W = [1 1 1 1 1 1 1 1 1 1 ];
% 
% a = ((sum(W .* xprueba .* yprueba) * sum(W)) - (sum(W .* yprueba) * sum(W .* xprueba) )) /((sum(W .* xprueba.^2) * sum(W)) - (sum(W.*xprueba))^2)
% 
% b = ((sum(W .* xprueba.^2) * sum(W .* yprueba)) - ( sum(W .* xprueba) * sum(W .* xprueba .* yprueba))) / ((sum(W.*xprueba.^2)*sum(W)) - (sum(W.*xprueba))^2)
% 
% mdl = LinearModel.fit(xprueba, yprueba); 
% plot(xprueba,yprueba, '*r');hold on
plot(a*x+b);



% 
% Beta =[a b];


p = pearson(sv, Cd);
plot(sv,Cd, '*b')
title('Detección Probabilistica V2'); 
xlabel('Gauss function position');
ylabel('center detect');   

mdl = LinearModel.fit(sv, Cd); 
figure; plot(mdl)
title('Probabilistic Detection - Linear Model');
xlabel('Simulated Line Position');
ylabel('Center Detected');
    
