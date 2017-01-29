function [stitch, indexed, map] = cross_stitch(image, new_height, new_width, num_colors)
    warning('off','all');
    image = imresize(image, 1/2);
    stitch = sample(image, new_height, new_width);
    filt_stitch = imguidedfilter(stitch);
    [indexed, map] = rgb2ind(filt_stitch, num_colors);
    indexed = one_filter(indexed);
    fig = figure;
    imagesc(indexed);
    colormap(map);
    add_grid(new_height, new_width);
    fig.Position = [0 0 new_width*10 new_height*10];
    saveas(gcf, 'output.jpg');
   % symbols(indexed);
end
