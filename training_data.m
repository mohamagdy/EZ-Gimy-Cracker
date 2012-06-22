function [ p, t ] = training_data
%TRAINING_DATASET trains the dataset and returns the Neural Network
%   nn the Neural Network

% The training data are located in Trainingset/SampleXXX/imageXXX-YYY
directory_name = 'Training Set';
training_sets = dir(directory_name);

p = [];
t = [];

% Looping over the directories of the training data
for i = 3:size(training_sets, 1)
    training_data = dir(fullfile(directory_name, training_sets(i).name));

    % Looping over the files of a given directory
    for j = 3:size(training_data, 1)
        % Getting the image path
        image_file_path = fullfile(directory_name, training_sets(i).name, training_data(j).name);
        
        % Getting the image complement
        h = fspecial('unsharp');
        binary_image = imread(image_file_path);
        binary_image = imfilter(binary_image, h, 'replicate');
        
        try
            % Extracting the features from the image
            p(end + 1, :) = hierarchicalCentroid(binary_image, 4, 0);
            
            % p(end + 1, :) = feature_extractor(binary_image)';
            
            % Saving the character
            t(end + 1, 1) = str2num(training_sets(i).name);
        catch
            'Exception occured!';
        end
        
    end
end
end






