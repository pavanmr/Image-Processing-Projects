%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileName = 'triangle.raw';
M = 480; % No. of rows
N = 640; % No. of columns
newFileName = 'medfilteredTriangle.ras';
fid=fopen(fileName,'r');
img=fread(fid,[N,M],'uint8');
img=img';
him=hist(img(:),0:255);
nimg=medianfilter(img);
nhim=hist(nimg(:),0:255);
imwrite(nimg/255,newFileName);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function nimg = medianfilter(img)
% switch padType
%     case 'replicate'
%         img=padarray(img,[0.5*(maskSize-1) 0.5*(maskSize-1)],'replicate','both');
%
%     case 'zero'
%         img=padarray(img,[0.5*(maskSize-1) 0.5*(maskSize-1)],'both');
%
%     case 'symmetric'
%         img=padarray(img,[0.5*(maskSize-1) 0.5*(maskSize-1)],'symmetric','both');
%
%     case 'none'
% end
del=[zeros(3,7);zeros(1,3) 1 zeros(1,3);zeros(3,7)];
[r,c]=size(img);
testimg=conv2(img,del,'valid');
[nr,nc]=size(testimg);
rr=0.5*(r-nr);
cc=0.5*(c-nc);
for i=rr+1:r-rr
    for j=cc+1:c-cc
        x=img((i-3):(i+3),(j-3):(j+3));
        nimg(i,j)=median(x(:));
    end
end
nimg=nimg(4:end,4:end);
end
