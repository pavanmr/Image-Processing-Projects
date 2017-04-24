% Power-Law Transformation
clear
close all
clc

L = 255; % Highest Gray-Level

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Image  = Cat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileName = 'cat.raw';
%%%%%%%%%%%%%%%%%
% Gamma = 0.4
%%%%%%%%%%%%%%%%%
gamma = 0.4;
newFileName = 'plt0_4cat.ras';
nimg = PLT(fileName,L,gamma);
nimg = nimg/L;
imwrite(nimg,newFileName);

%%%%%%%%%%%%%%%%%
% Gamma = 2.5
%%%%%%%%%%%%%%%%%
gamma = 2.5;
newFileName = 'plt2_5cat.ras';
nimg = PLT(fileName,L,gamma);
nimg = nimg/L;
imwrite(nimg,newFileName);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Image  = Traingle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileName = 'triangle.raw';
%%%%%%%%%%%%%%%%%
% Gamma = 0.4
%%%%%%%%%%%%%%%%%
gamma = 0.4;
newFileName = 'plt0_4triangle.ras';
nimg = PLT(fileName,L,gamma);
nimg = nimg/L;
imwrite(nimg,newFileName);

%%%%%%%%%%%%%%%%%
% Gamma = 2.5
%%%%%%%%%%%%%%%%%
gamma = 2.5;
newFileName = 'plt2_5triangle.ras';
nimg = PLT(fileName,L,gamma);
nimg = nimg/L;
imwrite(nimg,newFileName);
