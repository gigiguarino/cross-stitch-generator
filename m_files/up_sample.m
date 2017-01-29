function up_sampled = up_sample(image, dim, height_mult, width_mult)

sizes = size(image);
height_in = sizes(1); % pixels
width_in = sizes(2);
tic
temp = uint8(0);
up_sample_temp(height_in, width_mult * width_in) = temp;
toc
for row = (1:height_in)
    for col = 1:width_in
        for us_col = 1:width_mult
            for color = 1:dim
                up_sample_temp(row, (width_mult*(col-1)+us_col), color) = image(row, col, color);
            end
        end
    end
end
toc
up_sampled(height_in*height_mult, width_in*width_mult) = temp;
toc

for col = (1:(width_in*width_mult))
    for row = 1:height_in
        for us_row = 1:height_mult
            for color = 1:dim
                up_sampled((height_mult*(row-1)+us_row), col, color) = up_sample_temp(row, col, color);
            end
        end
    end
end
toc
%up_sampled = uint8(up_sampled);
end