cmn_fld = 'E:\Soulib\khalid\Text Non_Text Data Printed Showmik\';

savefile = ('E:\Soulib\khalid\Text Non_Text Data Printed Showmik\LTrP_R.csv');
csv = fopen(savefile, 'w');


maxm = 36*13+1;
for i=1:maxm
st = strcat('attr_', num2str(i));
fprintf(csv, '%s,',st);
end
fprintf(csv, '\n');
thresold = 5;

dict = MapR();

for i = 1:2
    a = num2str(i);
    folder_in = strcat(cmn_fld,a,'\');
    listing = dir(strcat(folder_in,'*.','bmp'));
    file_names = {listing.name};
    num_pages = length(file_names);
    for j = 1:num_pages
        
        fprintf("Image count = %d\n", j);
        img = imread(strcat(folder_in,file_names{j}));
        [~,~,w] = size(img);
        if w == 3
            img = rgb2gray(img);
        end
        
        %img = imresize(img,[32 32]);
        
        a = hist_rotation(img, dict);
        
        class = strcat('a',num2str(i));
        
        l = length(a);
        for k=1:l
            fprintf(csv, '%f,', a(k));
        end
        
        fprintf(csv, '%s\n', class);
        
    end
    
end

fclose(csv);


    