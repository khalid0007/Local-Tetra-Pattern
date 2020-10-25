function diff = cal_diff(ptrn)

diff = 0;

for i = 1:7
    diff = diff + abs(ptrn(i + 1) - abs(ptrn(i)));
end

end

