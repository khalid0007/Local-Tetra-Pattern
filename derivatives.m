function [a1, a2, a3, a4, a5] = derivatives(pixel)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

a1 = zeros(3, 3);
a2 = zeros(3, 3);
a3 = zeros(3, 3);
a4 = zeros(3, 3);
a5 = zeros(3, 3);

% First direction
for i = 2:4
    for j = 2:4
        I0 = pixel(i, j + 1) - pixel(i, j);
        I90 = pixel(i - 1, j) - pixel(i, j);
        a5(i-1, j-1) = sqrt(I0*I0 + I90*I90);
        a1(i-1, j-1) = direction(I0, I90);
    end
end

% Second direction
for i = 2:4
    for j = 2:4
        I0 = pixel(i, j + 1) - pixel(i, j);
        I90 = pixel(i + 1, j) - pixel(i, j);
        a2(i-1, j-1) = direction(I0, I90);
    end
end


% Third direction
for i = 2:4
    for j = 2:4
        I0 = pixel(i, j - 1) - pixel(i, j);
        I90 = pixel(i - 1, j) - pixel(i, j);
        a3(i-1, j-1) = direction(I0, I90);
    end
end

% Fourth direction
for i = 2:4
    for j = 2:4
        I0 = pixel(i, j - 1) - pixel(i, j);
        I90 = pixel(i + 1, j) - pixel(i, j);
        a4(i-1, j-1) = direction(I0, I90);
    end
end

end

