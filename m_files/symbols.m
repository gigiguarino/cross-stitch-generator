function symbols(image)
    symbol_dict = ['*', 'x', 'c', '-', 'd', 'e', 'v', 'a', '+', '#', 'w', 'o', 'i' ,'&', '$'];
    sizes = size(image);
    height2 = sizes(1);
    width2 = sizes(2);
    symbol_image = zeros(height2, width2);
    symbol_image = char(symbol_image);
    
    for i = (1:height2)
        for j = (1:width2)
            num = image(i, j);
            num = num + 1;
            symbol_image(i, j) = symbol_dict(num);
        end
    end 
    
    dlmwrite('symbols.txt', symbol_image, '');
    fid = fopen('symbols.txt');
    num = 0;
    fig = figure;
    fig.Units = 'normalized';
    xlim([0 width2]);
    ylim([0 height2]);
    while 1
        line = fgetl(fid);
        if ~ischar(line)
            break
        end
        pos = [0 (height2-num) width2 1];
        pos1 = ds2nfu(pos); % function from matlab file exchange online
        % it transforms x and y axis points to normalized axis points
        annotation(fig, 'textbox', pos1, 'String', line, 'LineStyle', 'none', 'FontName', 'FixedWidth', 'FontUnits', 'normalized', 'FontSize', 0.025);
        num = num + 1;
    end
    fig.Position = [0 0 width2/140 height2/75];
    add_grid(height2, width2);
    saveas(fig, 'sym_image.jpg');
end