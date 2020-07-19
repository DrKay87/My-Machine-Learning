clc
clear all
close all
load nn.mat;
% vid=videoinput('winvideo',1,'YUY2_640x480');
% preview(vid);
% im = getsnapshot(vid);
% im=ycbcr2rgb(im);
% im=rgb2gray(im);

im = imread('Angry01_S.jpg');
i = 3;      % i = 1 for left pose, 2 for right and 3 for straight pose
figure;
imshow(im,[]);
title('Input Image');
target = [0 1 0 0];
size(im)
im1 = rgb2gray(im);
[face] = Masking(im1,i);
feature_vect = SIFT_features(face,i);
% feature_vect - angry_features(:,191)
output = net(double(feature_vect));
[m ind] = max(output);

if(ind == 1)
    disp('Happy');
elseif( ind == 2)
    disp('Angry');
elseif( ind == 3)
    disp('Nuetral');
elseif( ind == 4)
    disp('Disgusted');
end

