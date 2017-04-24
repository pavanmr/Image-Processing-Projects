function nimg = PLT(fileName,L,gamma)

M = 480; % No. of rows
N = 640; % No. of columns
c = findc(L,gamma);

nimg = zeros(M,N);

fid=fopen(fileName,'r');
img=fread(fid,[N,M],'uint8');
img=img';

figure;
colormap gray;
imagesc(img,[0 255]);
title(sprintf('Original raw file %s',fileName));

lut = genLUT(c,gamma,L);

for i = 1:M
    for j= 1:N
        nimg(i,j) = lut(img(i,j)+1);
    end
end

figure;
colormap gray;
imagesc(nimg,[0 255]);
title(sprintf('Power-Law transformed image %s',fileName));

end


function c = findc(L,gamma)
c = L/(L^gamma);
end


function y = genLUT(c,gamma,L)
x = 0:L;
y = c*(x.^gamma);
end