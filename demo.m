%% demo

plotFlag = 1;
depth = 4;

alef1 = im2bw(imread('Training Set\57\AACACACGACGCCCUGUAUU.jpg'));   %% Binary image
alef2 = imcomplement(im2bw(imread('Training Set\57\AACACACGACGCCCUGUAUU.jpg')));   %% Intensity image
tav = imcomplement(im2bw(imread('Training Set\57\AACACACGACGCCCUGUAUU.jpg')));       %% Binary image

subplot(1,3,1);
vec1 = hierarchicalCentroid(alef1,depth,plotFlag);
subplot(1,3,2);
vec2 = hierarchicalCentroid(alef2,depth,plotFlag);
subplot(1,3,3);
vec3 = hierarchicalCentroid(tav,depth,plotFlag);

dist_1_2 = sum((vec1 - vec2) .^ 2);
dist_1_3 = sum((vec1 - vec3) .^ 2);

size(vec1)
size(vec2)
size(vec3)

fprintf('The distance between alef1 and alef2: %1.3f\n', dist_1_2);
fprintf('The distance between alef1 and tav: %1.3f\n', dist_1_3);
