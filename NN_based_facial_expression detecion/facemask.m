% clear all
function IMask = facemask(im)
%Detect objects using Viola-Jones Algorithm

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Read the input image
% im = imread('AF01DIHR.jpg');
I = rgb2gray(im);
% I = resize(features(:,20),[30,32]);
%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);
if size(BB,1) == 2
    B = BB(2,:);
else
    B = BB;
end

figure,
imshow(I); hold on
for i = 1:size(B,1)
    rectangle('Position',B(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
title('Face Detection');
hold off;

Mask = zeros(size(I));
size(Mask)
Mask(B(2):B(2)+B(3)-1,B(1):B(1)+B(4)-1) = ones(B(3),B(4));
IMask = Mask.*double(I);
figure;
imshow(IMask,[]);