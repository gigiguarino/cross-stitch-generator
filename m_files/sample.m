function new_image = sample(image, height_out, width_out)
    sizes = size(image);
    height_in = sizes(1);
    width_in = sizes(2);
    dim = sizes(3);
    new_image = down_sample(imgaussfilt(up_sample(image, dim, height_out, width_out), 1), dim, height_in, width_in);
end