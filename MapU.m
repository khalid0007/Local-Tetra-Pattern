function dict = MapU()

% Key is == (indx - 1)
% value == dict(indx)

dict = ones(1, 256);

cnt = 2;

for i = 0:255
    a = dec2bin(i, 8);
    a = bin2dec(a(:));
    a = reshape(a, [1, 8]);
    
    diff = cal_diff(a);
    
    if diff <= 2
        dict(i+1) = cnt;
        cnt = cnt + 1;
    end
end

end

