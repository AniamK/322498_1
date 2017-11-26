clear all; 
close all;
clc;
%Reading the image
Img=imread('./image/S1001L01.jpg');
%%Pre Processing and Normalisation
%figure;imshow(Img);title('INPUT EYE IMAGE');
%%Step 1: Converting to Gray sclae from rgb
%Gray_imag=rgb2gray(Img);
%figure;imshow(Gray_imag);title('IMAGE after Gray conversion');
%Deleting extra portion
%t2=Gray_imag(:,65:708);
%t3=t2(18:563,:);
%figure;imshow(t3);title('IMAGE after Deleting extra portion');
%%Step 2: Resizing the image(546x644) to 512 x 512
t4=imresize(Img,[280,320],'bilinear');
%figure;imshow(t4);title('IMAGE after resize');
%%Step 3: Histogram Equlisation
Hist_eq_img = histeq(t4,512);
%figure;imshow(Hist_eq_img);title('IMAGE after Histogram Equlisation');
% Step 4: Gaussian Filtering
G = fspecial('gaussian',[280 320],20);
%Filter it
Hist_eq_img=double(Hist_eq_img);
Ig = imfilter(Hist_eq_img,G,'same');
%Display
%%Step 5: Canny Edge detection
%BW2 = edge(Ig,'canny',0.53,1);
%figure;imshow(BW2);title('IMAGE after canny edge detection');
imageData = Img - uint8(Hist_eq_img);