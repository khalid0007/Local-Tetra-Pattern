function value = RotLBP(x)

% Binary string of 8-bit number
S = dec2bin(x, 1);
S = reshape(S, [1 8]);

value = 256;

%bin2dec(S)

for i = 0:8
    value = min(value, bin2dec(circshift(S,i)));
end

end

