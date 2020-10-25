function dir = direction(dx, dy)

if dx >= 0 && dy >= 0
    dir = 1;
elseif dx < 0 && dy >= 0
    dir = 2;
elseif dx < 0 && dy < 0
    dir = 3;
else
    dir = 4;
end

end

