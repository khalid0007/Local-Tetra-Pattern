function patern = LTrP(tct)

ref = [1 2 3 4];

cdir = tct(2, 2);

arr = [tct(1, 1) tct(1, 2) tct(1, 3) tct(2, 3) tct(3, 3) tct(3, 2) tct(3, 1) tct(2, 1)];

ptrnInter = arr.*(arr ~= cdir);

patern = zeros(3, 8);

j = 1;

for i = 1:4
    if cdir == ref(i)
        continue;
    end
    
    patern(j, :) = (ptrnInter == ref(i));
    j = j + 1;
end

end

