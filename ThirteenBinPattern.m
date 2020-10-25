function ptrn = ThirteenBinPattern(segment)

% This function takes input of 5 x 5 image segment
% centering the image pixel of interest
% This will return all thirteen binary_patterns for the certain pixel

[a1, a2, a3, a4, a5] = derivatives(segment);

ptrn = zeros(13, 8);


% 1-12 th binary pattern using LTrP
ptrn(1:3, :) = LTrP(a1);
ptrn(4:6, :) = LTrP(a2);
ptrn(7:9, :) = LTrP(a3);
ptrn(10:12, :) = LTrP(a4);

% 13-th bianry pattern using LBP
ptrn(13, :) = LBP(a5);

end

