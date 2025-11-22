% image_processing_demo.m
% Use the uploaded screenshot, convert to grayscale, enhance and detect edges.

clc; clear; close all;
%clc → clears the Command Window
%clear → removes variables from workspace
%close all → closes all open figure windows


I = imread("doremon.png"); %Stores it as matrix I

figure('Name','Original Image'), imshow(I), title('Original');

% Convert to grayscale if needed
if size(I,3) == 3  % If the image has 3 color channels → it is RGB → convert to grayscale
    Ig = rgb2gray(I);
else
    Ig = I;
end

% Resize for demonstration
Ig_small = imresize(Ig, 0.6); %Shrinks image to 60% of original size

% Contrast enhancement
Ig_adj = imadjust(Ig_small); % imadjust stretches pixel intensity

% Edge detection
edges = edge(Ig_adj, 'Canny'); %Finds sharp intensity changes

% Morphological cleanup  %Edges might be thin, broken, or noisy.
edges_clean = imdilate(edges, strel('disk',1)); %Dilation: thickens edges & connects broken lines
edges_clean = imerode(edges_clean, strel('disk',1)); %Erosion: thins edges back to normal size

% Display
figure('Name','Image Processing Results');
subplot(2,2,1), imshow(Ig_small), title('Grayscale (resized)');
subplot(2,2,2), imshow(Ig_adj), title('Contrast adjusted');
subplot(2,2,3), imshow(edges), title('Canny edges');
subplot(2,2,4), imshow(edges_clean), title('Cleaned edges');

% Save results
imwrite(Ig_adj, 'image_gray_adj.png');
imwrite(edges_clean, 'image_edges.png');
fprintf('Saved image_gray_adj.png and image_edges.png\n');
