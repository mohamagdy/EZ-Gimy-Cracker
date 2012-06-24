function [correct, wrong, failed] = hack_captchas()
load 'chars.mat'
words = textread('words.txt', '%s');
correct = 0;
wrong = 0;
failed = 0;

for i = 1:191
    file_name = strcat('Dataset/', num2str(i));
    file_name = strcat(file_name, '.jpg');
    binary_image = im2bw(imread(file_name));
    h = fspecial('unsharp');
    binary_image = imfilter(binary_image, h, 'replicate');
    try
        characters = extract_word(binary_image);
%         word = [num2str(i) ' -> '];
        word = '';
        for j = 1:size(characters, 1)
            if(chars.containsKey(j))
                word = strcat(word, chars.get(characters(j)));
            end
        end
        if(strcmp(words(i), word))
            correct = correct + 1;
        else
            wrong = wrong + 1;
        end
    catch
        failed = failed + 1;
    end
end


end

