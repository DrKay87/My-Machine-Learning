function [face] = Masking(I,i)

load('eliptic_mask.mat');

K = [40,230,370,370; 180,230,370,370; 90,260,370,370]; % Masks
B = K(i,:); 

maskim = I(B(2):B(2)+B(4)-1,B(1):B(1)+B(3)-1);

faceim = imresize(maskim,[256,256]);

figure;
imshow(faceim,[]);
title('Extracted Face of size 256 by 256');

face_512 =double(imresize(double(faceim),[512 512]));       % image resize
if(rem(i,3) == 0)
    face = f3.*face_512;
elseif(rem(i+1,3) == 0)
    face = f2.*face_512;
elseif(rem(i+2,3) == 0)
    face = f1.*face_512;
end

figure;imshow(face,[]);
title('Face features');


