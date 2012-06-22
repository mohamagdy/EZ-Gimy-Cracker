function [ characters ] = extract_word( captcha_image )
%EXTRACT_WORD Summary of this function goes here
%   Detailed explanation goes here
[horizontal_segments, vertical_segments]= segment(captcha_image);
characters = [];

for i = 1:2:size(vertical_segments, 1)
    char = captcha_image(horizontal_segments(i):horizontal_segments(i + 1), vertical_segments(i):vertical_segments(i + 1));
    characters(end + 1, 1) = nn_classifier(char);
end
end

