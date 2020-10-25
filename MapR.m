function dict = MapR()

% Key is == (indx - 1)
% value == dict(indx)

dict = zeros(1, 256);

a = zeros(1, 256);

for i = 0:255
    S = dec2bin(i, 8);
    Min_val = 256;
    for j = 0:8
        Min_val = min(Min_val, bin2dec(circshift(S, j)));
    end
    a(1, i+1) = Min_val;
end

a = sort(unique(a));

for i = 0:255
    S = dec2bin(i, 8);
    Min_val = 256;
    for j = 0:8
        Min_val = min(Min_val, bin2dec(circshift(S, j)));
    end
    dict(i+1) = find(a == Min_val);
end

end

