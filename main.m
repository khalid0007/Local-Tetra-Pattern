clear;
clc;

DATASET_SIZE = 200;

% bool to indicate
% whether we want to resize the image or not
resize_on = 1;
% Resize dimension
resize_size = 256;

% Data set for all images:
data = zeros(DATASET_SIZE*2, 59*13);


% Map for uniform values versus index
% calculation of histogram
dict = map_for_uniform();

for file = 1:DATASET_SIZE
    
    % Clear the command window and refresh
    clc;
    fprintf("<====================Generating feature set matrix============================>\n ");

    % <====================================<NON-TEXT>==================================>
    % loading text image
    image_name_str = ("DATA\non text\ntxt (" + int2str(file) + ")" + ".bmp");
    
    
    % Converting image_name_str into character vector
    % We can only pass character vector into imread function
    image_name = convertStringsToChars(image_name_str);
    
    % Show image number which is being processed;
    fprintf("\n\nProcessing image: %s\n", extractAfter(image_name, 14));
    
    % Loading i - th image from folder.
    img = imread(image_name);
    
    % Resize if the resize indicator is on
    if resize_on == 1
        img = imresize(img, [resize_size, resize_size]);
    end

    % Converting to gray scale
    % If it's RGB image then convert to Gray Scale
    if size(size(img), 2) == 3
        img = rgb2gray(img);
    end
    
    
    [h, d] = size(img);
    
    image = zeros(h+4, d+4);
    
    image(3:h+2, 3:d+2) = img;
    
    
    % Histogram for certain image;
    hist = zeros(1, 59*13);
    
    for i = 3:h+2
        for j = 3:d+2
            
            % Segment of 5 x 5 for a certain pixel
            % This will be used to calculate all 13 binary pattern
            segment = image(i-2:i+2, j-2:j+2);
                        
            % Thirteen binary pattern
            bin_patterns = ThirteenBinPattern(segment);

            histnum = 0;
            
            for k = 1:13
                % k-th binary pattern
                curr_pattern = bin_patterns(k, :);
                
                % Calculate total number of changes in binary pattern
                % to calculate the uniformity of the binary pattern
                diff = cal_diff(curr_pattern);
                
                % If it's nonuniform
                if diff > 2
                    % Index for calculate the histogram
                    indx = dict(-1);
                else
                    indx = dict(bin2dec(int2str(curr_pattern)));
                end
                
                % Frequecy update with normalisation
                hist(1, indx + histnum*59) = hist(1, indx + histnum*59) + (1/(h*d));
                
                % Increment histnum for next pattern
                histnum = histnum + 1;
            end
        end
    end
    data(file, :) = hist;
    
    
    % <====================================<TEXT>==================================>
    
    % loading non-text image:
    image_name_str = ("DATA\text\txt (" + int2str(file) + ")" + ".bmp");
    
    % Converting image_name_str into character vector
    % We can only pass character vector into imread function
    image_name = convertStringsToChars(image_name_str);
    
    % Show image number which is being processed;
    fprintf("Processing image: %s\n\n", extractAfter(image_name, 10));
    
    % Loading i - th image from folder.
    img = imread(image_name);
    
    
    % Resize if the resize indicator is on
    if resize_on == 1
        img = imresize(img, [resize_size, resize_size]);
    end

    % Converting to gray scale
    % If it's RGB image then convert to Gray Scale
    if size(size(img), 2) == 3
        img = rgb2gray(img);
    end
    
    [h, d] = size(img);
    
    image = zeros(h+4, d+4);
    
    image(3:h+2, 3:d+2) = img;
    
    hist = zeros(1, 59*13);
    
    for i = 3:h+2
        for j = 3:d+2
            % Segment of 5 x 5 for a certain pixel
            % This will be used to calculate all 13 binary pattern
            segment = image(i-2:i+2, j-2:j+2);
            
            
            % Thirteen binary pattern
            bin_patterns = ThirteenBinPattern(segment);
            
            histnum = 0;
            
            for k = 1:13
                % k-th binary pattern
                curr_pattern = bin_patterns(k, :);
                
                % Calculate total number of changes in binary pattern
                % to calculate the uniformity of the binary pattern
                diff = cal_diff(curr_pattern);
                
                % If it's nonuniform
                if diff > 2
                    % Index for calculate the histogram
                    indx = dict(-1);
                else
                    indx = dict(bin2dec(int2str(curr_pattern)));
                end
                
                % Frequecy update with normalisation
                hist(1, indx + histnum*59) = hist(1, indx + histnum*59) + (1/(h*d));
                
                % Increment histnum for next pattern
                histnum = histnum + 1;
            end
        end
    end
    
    % Update featureset for perticular image
    data(DATASET_SIZE + file, :) = hist;
    
end

clc;

fprintf("<====================Feature set extracted====================================>\n ");

fprintf("Writing .csv file in directory.......\n");
csvwrite("txt_ntxt.csv", data);
fprintf("txt_ntxt.csv successfully written in directory!!\n");


fprintf("\nCongrats!! Feature set successfully generated and saved!!!\n");

