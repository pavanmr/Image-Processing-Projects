% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileName = 'cat.raw';
newFileName = 'myeqcat.ras';

L = 256;
r = 0:L-1;

M = 480; % No. of rows
N = 640; % No. of columns
fid=fopen(fileName,'r');
img=fread(fid,[N,M],'uint8');
img=img';

h = hist(img(:),0:L-1)';
cdf = cumsum(h);
eqh = cdf(end)/L*ones(L,1);
ncdf = cumsum(eqh);

for i = 1:L
    [m,ind] = min(abs(cdf(i)-ncdf));
    map(i) = ind-1;
end

for i = 1:M
    for j = 1:N
        nimg(i,j) = map(img(i,j)+1);
    end
end

nhis = hist(nimg(:),0:L-1);
nimg = nimg/(L-1);
imwrite(nimg,newFileName);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%