function add_grid(height, width)
    hold on
    dark = [.3 .3 .3];
    light = [.8 .8 .8];
    for i = (1:height)
        z = i-0.5;
        if (mod(i, 10) == 0)
            line([1 width], [z z], 'Color', dark, 'LineWidth', 1);
        else
            line([1 width], [z z], 'Color', dark, 'LineStyle', '-');
            line([1 width], [z z], 'Color', light, 'LineStyle', '--');
        end  
    end
    for i = (1:width)
        z = i-0.5;
        if (mod(i, 10) == 0)
            line([z z], [1 height], 'Color', dark, 'LineWidth', 1);
        else
            line([z z], [1 height], 'Color', dark, 'LineStyle', '-');
            line([z z], [1 height], 'Color', light, 'LineStyle', '--');
        end
    end  
end