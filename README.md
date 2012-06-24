EZ-Gimy-Cracker
===============

This is a MATLAB code that cracks the EZ-Gimpy CAPTCHA. The cracking process consists of 3 steps:

1. Removing the background from the CAPTCHA image. This is done by converting the CAPTCHA image into a binary image

2. Vertically segment the image to extract the letters of the CAPTCHA word

3. We use a character recognition algorithm that recognizes the extracted characters

Running the Examples
====================

To run the cracker with the dataset provided in the folder "Dataset" just type

`[correct, wrong, failed] = hack_captchas;`

The `correct` attribute holds the number of correctly cracked CAPTCAHA, `wrong` contains the number of the wrongly cracked CAPTCHAs and `failed` contains the number of the CAPTCHA images that failed in the cracking process due to exceptions

Files and Folders
=================

Dataset (folder): contains the CAPTCHA images. The dataset is taken from http://www.cs.sfu.ca/~mori/research/gimpy/ez/

Training Set (folder): contains the characters which are used as training set

chars.mat: represents a hash the key is the character number and the value is the character

p.mat: represents the features vector

t.mat: a matrix that represents the excepted output

hack_captchas: checks the "Dataset" folder and loops through all the CAPTCHA images in it to extract the word in it

extract_word.m: takes a CAPTCHA image and returns the word in it 

hierarchicalCentroid.m: the features extracting algorithm used to extract the features from the characters

training_data.m: traing the characters images in the "Training Set" folder




 