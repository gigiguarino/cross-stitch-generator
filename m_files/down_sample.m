function down_sampled = down_sample(image, dim, height_div, width_div)

sizes = size(image);
height_in = sizes(1); % pixels
width_in = sizes(2);

height_out = height_in / height_div;
width_out = width_in / width_div;
temp = uint8(0);
down_sampled(height_out, width_out) = temp;

for row = 1:height_out
    for col = 1:width_out
        for color = 1:dim
        down_sampled(row, col, color) = image(row*height_div, col*width_div, color);
        end
    end
end
end