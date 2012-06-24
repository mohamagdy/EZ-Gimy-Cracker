function [ rows, cols ] = segment( image )
%SEGMENT Summary of this function goes here
%   Detailed explanation goes here

% Getting the background color
background = image(1, 1);
character_cut = false;
cols = [];
rows = [];

for i = 1:size(image, 2)
    if (sum(image(:, i) ~= background) > 0) && (character_cut == false)
        character_cut = true;
        cols(end + 1, 1) = i;
    elseif character_cut == true && (sum(image(:, i) ~= background) == 0)
        character_cut = false;
        cols(end + 1, 1) = i;
    end
end

% This section horizontally segment the characters
for i = 1:2:size(cols, 1) - 1
    character = image(:, cols(i):cols(i + 1));
    background = character(1, 1);
    horizontal_cut = false;
    
    for j = 1:size(character, 1)
        if (sum(character(j, :) ~= background) > 0) && (horizontal_cut == false)
            horizontal_cut = true;
            rows(end + 1, 1) = j;
            break;
        end
    end
    
    for j = size(character, 1):-1:1
        if (sum(character(j, :) ~= background) > 0) && (horizontal_cut == true)
            horizontal_cut = true;
            rows(end + 1, 1) = j;
            break;
        end
    end
end

end


