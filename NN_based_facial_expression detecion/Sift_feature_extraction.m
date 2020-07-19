
load('Angry_Faces_256.mat');
load('Happy_Faces_256.mat')
load('eliptic_mask.mat');

i = 82;
    
I_read = angry(:,:,i);
% I=imread('an2i_left_angry_open_4.pgm');                    % to read the image
% I_read=imresize(I,[30 32]);
I1=imresize(I_read,[512 512]);       % image resize
if(rem(i,3) == 0)
    I = f3.*I1;
elseif(rem(i+1,3) == 0)
    I = f2.*I1;
elseif(rem(i+2,3) == 0)
    I = f1.*I1;
end
imshow(I,[]);
I=im2double(I);

[descriptors, locs] = sift(I);
