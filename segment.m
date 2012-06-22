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
% figure;
imshow(image(rows(1):rows(2), cols(1):cols(2)));
imshow(image(rows(1):rows(2), cols(1):cols(2))); figure;
imshow(image(rows(3):rows(4), cols(3):cols(4))); figure;
imshow(image(rows(5):rows(6), cols(5):cols(6))); figure;
imshow(image(rows(7):rows(8), cols(7):cols(8)));

% for i = 1:2:size(rows, 1)
%     for j = 1:2:size(cols, 1)
%         try
%             file_name = strcat('tt/', randseq(20,'alphabet','rna'));
%             file_name = strcat(file_name, '.jpg');
%             imwrite(image(rows(i):rows(i + 1), cols(j):cols(j + 1)), file_name);
%         catch
%             'aa'
%         end
%     end
% end

% imwrite(image(rows(1):rows(2), cols(1):cols(2)), 'b.png'); 
% imwrite(image(rows(3):rows(4), cols(3):cols(4)), 'i.png'); 
% imwrite(image(rows(5):rows(6), cols(5):cols(6)), 'r.png'); 
% imwrite(image(rows(7):rows(8), cols(7):cols(8)), 't.png'); 
% imwrite(image(rows(9):rows(10), cols(9):cols(10)), 'h.png'); 

end


