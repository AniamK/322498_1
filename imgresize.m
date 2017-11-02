io = imread('c1.png');
figure;
imshow(io);
xx = imresize(io, 0.5);
figure;
imshow(xx);