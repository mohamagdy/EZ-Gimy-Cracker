function [ p, t ] = train_dataset
%TRAIN_DATASET trains the dataset and returns the Neural Network
%   nn the Neural Network

% The training data are located in Trainingset/SampleXXX/imageXXX-YYY
directory_name = 'Trainingset';
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
        
        % Converting the image to binary
        binary_image = im2bw(imread(image_file_path));
        
        try
            % Extracting the features from the image
            p(end + 1, :) = hierarchicalCentroid(binary_image, 6, 0);
            
            % p(end + 1, :) = feature_extractor(binary_image)';
            
            % Saving the 
            t(end + 1, 1) = i - 2;
        catch
        end
    end
end

adjusted_t = zeros(62, size(t, 1));

for i = 1:size(t, 1)
    adjusted_t(t(i), i) = 1;
end
t = adjusted_t;

% nn = newff(p', t);
% nn = train(nn, p', t);
end


