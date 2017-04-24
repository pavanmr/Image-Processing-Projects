close all
clear
clc

imageFileName='cat.raw';
newFileName='cats4.raw';
factor=4;
img=shrink(imageFileName,newFileName,factor);
newFileName='cati4.raw';
nma_zoom(img,newFileName,factor);

imageFileName='cat.raw';
newFileName='cats16.raw';
factor=16;
img=shrink(imageFileName,newFileName,factor);
newFileName='cati16.raw';
nma_zoom(img,newFileName,factor);

imageFileName='triangle.raw';
newFileName='triangles4.raw';
factor=4;
img=shrink(imageFileName,newFileName,factor);
newFileName='trianglei4.raw';
nma_zoom(img,newFileName,factor);

imageFileName='triangle.raw';
newFileName='triangles16.raw';
factor=16;
img=shrink(imageFileName,newFileName,factor);
newFileName='trianglei16.raw';
nma_zoom(img,newFileName,factor);

%%%%%%%%%%%%%%%%%%
%
%
%%%%%%%%%%%%%%%%%%%%%%
function nma_zoom(img,fileName,k)

[M,N]=size(img);
newM=M*k;
newN=N*k;

nimg=zeros(newM,newN);

deltay=(M-1)/(newM-1);
deltax=(N-1)/(newN-1);

for(i=1:newM)
    yp=i*deltay;
    whole_yp=floor(yp);
    fraction=yp-whole_yp;
    if(fraction<=.5)
        D=0;
    else
        D=1;
    end
    
    y=whole_yp+D;
    y=y+1;
    
    for(j=1:newN)
        xp=j*deltax;
        whole_xp=floor(xp);
        fraction=xp-whole_xp;
        if(fraction<=.5)
            D=0;
        else
            D=1;
        end
        
        x=whole_xp+D;
        x=x+1;
        
        nimg(i,j)=img(y,x);
    end
end

fid=fopen(fileName,'wb');
count=fwrite(fid,nimg','uint8');
fclose(fid);
fprintf('written %d elements to file %s\n',count,fileName);
return;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function nimg=shrink(fileName,newFileName,k)

M=480;  % rows
N=640;  % columns

%img=imread(imageFileName,'ras');

fid=fopen(fileName,'r');
img=fread(fid,[N,M],'uint8');
img=img';

figure;
colormap gray;
imagesc(img,[0 255]);
colorbar;
title(sprintf('Original raster file %s',fileName));

%
% Now apply shrink
%
nimg=shrinkit(k,img);
fid=fopen(newFileName,'wb');
count=fwrite(fid,nimg','uint8');
fclose(fid);
fprintf('written %d elements to file %s\n',count,newFileName);
return;

%%%%%%%%%%%%%%%%%
% k is the factor to shrink by.
% img is the 2D image matrix
%%%%%%%%%%%%%%%%%
function nimg=shrinkit(k,img)

[row,col]=size(img);

nrow=0;
ncol=0;

nimg=zeros(row/k,col/k);

for(i=k:k:row)
    nrow=nrow+1;
    ncol=0;
    for(j=k:k:col)
        ncol=ncol+1;
        nimg(nrow,ncol)=img(i,j);
    end
end

figure;
colormap gray;
imagesc(nimg,[0 255]);
colorbar;
title(sprintf('raster file shrink by factor of %d',k));

