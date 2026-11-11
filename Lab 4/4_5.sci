atomsLoad('IPCV');
clear; clc; clf;

img = imread("C:\Users\khanh\Downloads\images.jpg");

if size(img, 3) == 3 then
    gray_img= rgb2gray(img);
else
    gray_img= img;
end

eq_img= imhistequal(gray_img);

h_orig= zeros(1, 256);
h_eq= zeros(1, 256);

vals_orig= double(gray_img(:));
vals_eq= double(eq_img(:));

for i=1:length(vals_orig)
    val= vals_orig(i);
    h_orig(val+1)= h_orig(val+1)+1;
end

for i= 1:length(vals_eq)
    val= vals_eq(i);
    h_eq(val+1)= h_eq(val+1)+1;
end

bins= 0:255;

figure(1);
clf(1);
subplot(1, 2, 1);
imshow(gray_img);
title("Origin image");

subplot(1, 2, 2);
imshow(eq_img);
title("After histogram qualization image");

figure(2); clf(2);

subplot(2, 1, 1);
plot2d3(bins, h_orig);
gca().children.children.foreground = color("blue");
gca().data_bounds = [0, 0; 255, max(h_orig) * 1.01];
title("Origin Histogram");
xlabel("Gray level (0 - 255)");
ylabel("Pixel count");

subplot(2, 1, 2);
plot2d3(bins, h_eq);
gca().children.children.foreground = color("red");
gca().data_bounds = [0, 0; 255, max(h_eq) * 1.01];
title("After Equalization Histogram");
xlabel("Gray level (0 - 255)");
ylabel("Pixel count");
