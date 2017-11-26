%imageData is image
%cp:center of pupil
%ci:center of iris
function [imageData] = extract(imageData,cp,ci)
[rows,columns] = size(imageData);
imagePupil = zeros(rows,columns);
imageIris = zeros(rows,columns);

for i=0:cp(3)
    imagePupil=drawcircle(imagePupil,[cp(1),cp(2)],i,600);
end

for i=0:ci(3)
    imageIris=drawcircle(imageIris,[ci(1),ci(2)],i,1440);
end

imageFeature = imageIris - imagePupil;

for i=1:rows
    for j=1:columns
        if(imageFeature(i,j)==0)
            imageData(i,j)=256;
        end
    end
end
imshow(imageData);
imwrite(imagePupil,'imageOutput/imagePupil.jpg');
imwrite(imageIris,'imageOutput/imageIris.jpg');
imwrite(imageFeature,'imageOutput/imageFeature.jpg');
imwrite(imageData,'imageOutput/imageData.jpg');
end