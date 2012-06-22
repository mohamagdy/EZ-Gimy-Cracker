function [ character ] = nn_classifier( character_image )
%nn_classifier takes a character image as an input and returns a character
% that represents this image

character_image_features = hierarchicalCentroid(character_image, 4, 0);
load('p.mat'); % loading the features of the training characters data
distances = zeros(size(p, 1), 1);

for i = 1:size(p, 1)
    distances(i, 1) = sum((character_image_features - p(i, :)) .^ 2);
end

[value, index] = min(distances);
character = t(index, 1);

end

