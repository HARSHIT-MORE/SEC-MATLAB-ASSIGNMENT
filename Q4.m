clc; clear; close all;

img = imread("doremon.png");      % change file if needed
img_gray = rgb2gray(img);

img_gray = imresize(img_gray, [300 300]); 


% Emoji mapping based on brightness
emoji_list = ["⬛","🟥","🟧","🟨","🟩","🟦","🟪","⬜"];
num_emojis = length(emoji_list);

% Each emoji covers equal brightness range
range_step = 256 / num_emojis;


% Define block size
block_size = 20;      % each emoji = block average
rows = size(img_gray, 1);
cols = size(img_gray, 2);

rows_b = rows / block_size;
cols_b = cols / block_size;

emoji_art = strings(rows_b, cols_b);


% Build emoji matrix
for r = 1:rows_b
    for c = 1:cols_b

        % extract block
        block = img_gray((r-1)*block_size+1 : r*block_size, ...
                         (c-1)*block_size+1 : c*block_size);

        % compute average brightness 0–255
        avg_brightness = mean(block(:));

        % convert brightness → emoji index
        idx = ceil(avg_brightness / range_step);
        idx = max(1, min(num_emojis, idx));

        emoji_art(r, c) = emoji_list(idx);
    end
end


emoji_str = strjoin(join(emoji_art, ""), newline);


fig = uifigure('Name','Emoji Image Compressor', 'Position',[100 100 800 600]);
txt = uitextarea(fig, ...
    'Value', emoji_str, ...
    'FontName','Segoe UI Emoji', ...
    'FontSize', 14, ...
    'Position',[20 20 760 560]);

% Done!
disp("Emoji compression completed!");
