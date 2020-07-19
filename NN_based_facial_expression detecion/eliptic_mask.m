I = zeros(512);
% I1=imresize(I_read,[512 512]);       % image resize
% I=rgb2gray(I);                      % rgb to gray conversion
[m,n]=size(I);
% fim=fftshift(fft2(I));
d0=220 ;
%////////COORDINATES///////////////
x=0:(m-1);
y=0:(n-1);
    dx=find(x>m/2);
x(dx)=x(dx)-m;
    dy=find(y>n/2);
y(dy)=y(dy)-n;
[y,x]=meshgrid(y,x);
d=sqrt(x.^2+y.^2);


%//////////Mask for Left Image///////////////
    ff=double(d<=d0);
    ff1 = imresize(ff,[512,380]);
    ff2=fftshift(ff1);
    ff3 = [zeros(512,40) ff2 zeros(512,92)];
    f1 = [zeros(30,512);ff3(1:482,:)];
    f1 = im2bw(abs(f1),0);
    figure;imshow(f1,[]);

%//////////Mask for Right Image///////////////
    ff=double(d<=d0);
    ff1 = imresize(ff,[512,380]);
    ff2=fftshift(ff1);
    ff3 = [zeros(512,90) ff2 zeros(512,42)];
    f2 = [zeros(30,512);ff3(1:482,:)];
    f2 = im2bw(abs(f2),0);
    figure;imshow(f2,[])
    
%//////////Mask for Straight Image///////////////
d0 = 230;
    ff=double(d<=d0);
    ff1 = imresize(ff,[512,380]);
    ff2=fftshift(ff1);
    ff3 = [zeros(512,66) ff2 zeros(512,66)];
    f3 = [zeros(20,512);ff3(1:492,:)];
    f3 = im2bw(abs(f3),0);
    figure;imshow(f3,[])
    
    save('eliptic_mask','f1','f2','f3');