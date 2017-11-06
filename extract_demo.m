%extract iris image
cp=[137,153,54];
ci=[136,154,112];
%
imageData = imread('./image/L.jpg');
[rows,columns] = size(imageData);
imagePupil = zeros(rows,columns);
imageIris = zeros(rows,columns);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%drawcircle(I,C,r,n)
%i is image
%c is center x y
%r is radius
%n is number of sides original is 600
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=0:cp(3)
    imagePupil=drawcircle(imagePupil,[cp(1),cp(2)],i,600);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=0:ci(3)
    imageIris=drawcircle(imageIris,[ci(1),ci(2)],i,1440);
end
imageEmpty = imageIris - imagePupil;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:rows
    for j=1:columns
        if(imageEmpty(i,j)==0)
            imageData(i,j)=256;
        end
    end
end
