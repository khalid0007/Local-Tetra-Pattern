function hist = hist_rotation(image, dict)

% This function returns hist for a image
% Rotational invariant of LTrP

hist = zeros(1, 13*36);

[h, d] = size(image);

im = zeros(h + 4, d + 4);

im(3:h+2, 3:d+2) = image;

for i = 3:h+2
    for j = 3:d+2
        % Segment of 5 x 5 for a certain pixel
        % This will be used to calculate all 13 binary pattern
        segment = im(i-2:i+2, j-2:j+2);
                        
        % Thirteen binary pattern
        bin_patterns = ThirteenBinPattern(segment);

        histnum = 0;
            
        for k = 1:13
            % k-th binary pattern
            curr_pattern = bin_patterns(k, :);

            % Indexing
            indx = dict(bin2dec(num2str(curr_pattern)) + 1) + histnum*36;
                
            % Frequecy update with normalisation
            hist(1, indx) = hist(1, indx) + (1/(h*d));
                
            % Increment histnum for next pattern
            histnum = histnum + 1;
        end
    end
end

end

