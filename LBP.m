function value = LBP(img)

% This computes LBP value for a 3 x 3 image segment

% RGB vaue of central pixel
center_val = img(2, 2);

List = [img(1, 1) img(1, 2) img(1, 3) img(2, 3) img(3, 3) img(3, 2) img(3, 1) img(2, 1)];


% convert lbp string to 8 bit integer
value = (List >= center_val);

end

