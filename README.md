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




 