function [correct, wrong, failed] = hack_captchas()
chars = java.util.Hashtable;
chars.put(1, '0');
chars.put(2, '1');
chars.put(3, '2');
chars.put(4, '3');
chars.put(5, '4');
chars.put(6, '5');
chars.put(7, '6');
chars.put(8, '7');
chars.put(9, '8');
chars.put(10, '9');
% Upper case
chars.put(11, 'A');
chars.put(12, 'B');
chars.put(13, 'C');
chars.put(14, 'D');
chars.put(15, 'E');
chars.put(16, 'F');
chars.put(17, 'G');
chars.put(18, 'H');
chars.put(19, 'I');
chars.put(20, 'J');
chars.put(21, 'K');
chars.put(22, 'L');
chars.put(23, 'M');
chars.put(24, 'N');
chars.put(25, 'O');
chars.put(26, 'P');
chars.put(27, 'Q');
chars.put(28, 'R');
chars.put(29, 'S');
chars.put(30, 'T');
chars.put(31, 'U');
chars.put(32, 'V');
chars.put(33, 'W');
chars.put(34, 'X');
chars.put(35, 'Y');
chars.put(36, 'Z');
% Lower case
chars.put(37, 'a');
chars.put(38, 'b');
chars.put(39, 'c');
chars.put(40, 'd');
chars.put(41, 'e');
chars.put(42, 'f');
chars.put(43, 'g');
chars.put(44, 'h');
chars.put(45, 'i');
chars.put(46, 'j');
chars.put(47, 'k');
chars.put(48, 'l');
chars.put(49, 'm');
chars.put(50, 'n');
chars.put(51, 'o');
chars.put(52, 'p');
chars.put(53, 'q');
chars.put(54, 'r');
chars.put(55, 's');
chars.put(56, 't');
chars.put(57, 'u');
chars.put(58, 'v');
chars.put(59, 'w');
chars.put(60, 'x');
chars.put(61, 'y');
chars.put(62, 'z');

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

