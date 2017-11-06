function [imageData,center,radius] = coarse(imageData)
%clear;
%clc;
%imageData = imread('L.jpg'); %read image
%imageHist = imhist(imageData); % find image histogram
%imshow(imageData);%show image after load image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%step 1 threshold 3 level
[rows, columns] = size(imageData);
%imageEmpty = zeros(rows,columns); %use this give me white image
%imageEmpty = imageData;
for i=1:rows
    for j=1:columns
        if(imageData(i,j)>150)
            imageData(i,j) = 115;
        elseif(imageData(i,j)<100)
            imageData(i,j) = 50;
        else
            imageData(i,j)= 85;
        end
    end
end
imshow(imageData); % show image after threshold 3 level
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%step 2 fill NIR 
imageData = imcomplement(imageData);
imageData = imfill(imageData,'holes');
imshow(imageData);% show image after fill NIR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%step 3 normal threshold
level =graythresh(imageData); % histogram analysis
imageData=im2bw(imageData, level);
imshow(imageData);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%step 4 find xc, yc ,r
%output
%center is metrix of xc yc
%radius is radius of pupil
Rmin = 30; %Define the radius range.
Rmax = 65; %Define the radius range.
[center, radius] = imfindcircles(imageData,[Rmin Rmax],'ObjectPolarity','bright');
%Find all the bright circles in the image within the radius range.
%Find all the dark circles in the image within the radius range.
%imshow(imageData);
%h = viscircles(center,radius);
%Draw blue lines around the edges of the bright circles.
end