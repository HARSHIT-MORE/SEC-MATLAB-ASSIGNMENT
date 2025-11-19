
% Problem 1 Solution
img = imread('input.png');
img = rgb2gray(img);
[m,n] = size(img);

% Compute min/max manually
mn = 255; mx = 0;
for i=1:m
    for j=1:n
        if img(i,j) < mn
            mn = img(i,j);
        end
        if img(i,j) > mx
            mx = img(i,j);
        end
    end
end

enh = double(img - mn) / double(mx - mn) * 255;
enh = uint8(enh);

subplot(1,2,1), imshow(img), title('Original');
subplot(1,2,2), imshow(enh), title('Enhanced');

imwrite(enh, 'enhanced_output.png');
