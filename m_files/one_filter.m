function indexed = one_filter(indexed)

sizes = size(indexed);
temp = uint8(0);

surronding(9) = temp;
for row = 2:sizes(1)-1
    for col = 2:sizes(2)-1
        surronding(1) = indexed(row-1, col-1);
        surronding(2) = indexed(row-1, col);
        surronding(3) = indexed(row-1, col+1);
        surronding(4) = indexed(row, col-1);
        surronding(5) = indexed(row, col);
        surronding(6) = indexed(row, col+1);
        surronding(7) = indexed(row+1, col-1);
        surronding(8) = indexed(row+1, col);
        surronding(9) = indexed(row+1, col+1);
        num_match = 0;

        for i = 1:9
            if (i ~= 5) 
                if (surronding(i) == surronding(5))
                   num_match = num_match+1;
                end
            end
        end
        if (surronding(1) == surronding(2) && surronding(1) == surronding(3) && surronding(1) == surronding(4) && surronding(1) == surronding(6) && surronding(1) == surronding(7) && surronding(1) == surronding(8) && surronding(1) == surronding(9)) 
            indexed(row, col) = surronding(1);
        elseif (num_match == 0)
            indexed(row, col) = mode(surronding);
        elseif (num_match == 1 && surronding(5) ~= surronding(2) && surronding(5) ~= surronding(4) && surronding(5) ~= surronding(6) && surronding(5) ~= surronding(8))
            indexed(row, col) = mode(surronding);
        elseif (surronding(1) == surronding(2) && surronding(1) == surronding(3) && surronding(1) == surronding(4) && surronding(1) == surronding(6) && surronding(1) ~= surronding(5) && surronding(1) ~= surronding(7) && surronding(1) ~= surronding(9))      
            indexed(row, col) = surronding(1);
        elseif (surronding(1) == surronding(2) && surronding(1) == surronding(4) && surronding(1) == surronding(7) && surronding(1) == surronding(8) && surronding(1) ~= surronding(5) && surronding(1) ~= surronding(3) && surronding(1) ~= surronding(9))
            indexed(row, col) = surronding(1);
        elseif (surronding(4) == surronding(7) && surronding(4) == surronding(8) && surronding(4) == surronding(9) && surronding(4) == surronding(6) && surronding(4) ~= surronding(5) && surronding(4) ~= surronding(1) && surronding(4) ~= surronding(3))
            indexed(row, col) = surronding(4);
        elseif (surronding(2) == surronding(3) && surronding(2) == surronding(6) && surronding(2) == surronding(8) && surronding(2) == surronding(9) && surronding(2) ~= surronding(5) && surronding(2) ~= surronding(1) && surronding(2) ~= surronding(7))
            indexed(row, col) = surronding(2);
        else
            indexed(row, col) = surronding(5);
        end 
    end
end
