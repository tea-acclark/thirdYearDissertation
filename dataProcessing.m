%% Load in FER-2013 database 
data = readtable('fer2013.csv');

%% Reorangise data
[rows, columns] = size(data);
emotion_cat = ones(rows, 1);
first_pixel = emotion_cat;

for i = 1:rows
 emotion_cat(i) = str2double(data.Var1{i}(1));
 first_pixel(i) = str2double(data.Var1{i}(3:end));
end

VarNames = {'Emotional cat', 'Zeros', 'First pixel'};
T1 = table(emotion_cat, zeros(rows, 1), first_pixel, 'VariableNames', VarNames );
l = data(:, 2:end);
 
datareorg = [T1, l];

%% Sorting rows in to square matrices.
% data processing has been broken down into chunkcs to make it more
% manageable given memory limitations.

%initiate array
images5000 = cell(1, 5000);

%% 

for i = 1:ceil(rows/20)
    a = datareorg{i, 2:end-1}; % collect relevant row
    b = reshape(a, 48, 48)'; % resize into square matrix
    images5000{i} = [b(:, 2:end) b(:,1)]; % assign to cell array
    i % counter variable to display progress
end

%%
for i = floor((rows/20)+1):ceil(2*rows/20)
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images5000{i} = [b(:, 2:end) b(:,1)];
    i
end

%%
for i = floor((2*rows/20+1)+1):5000
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images5000{i} = [b(:, 2:end) b(:,1)];
    i
end

%%
images10500 = cell(1, 5500);

for i = 5001:ceil(4*rows/20)
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images10500{i-5000} = [b(:, 2:end) b(:,1)];
    i
end
%%
for i = floor((4*rows/20)+1):ceil(5*rows/20)
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images10500{i-5000} = [b(:, 2:end) b(:,1)];
    i
end
%%
for i = floor((5*rows/20)+1):10500
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images10500{i-5000} = [b(:, 2:end) b(:,1)];
    i
end
%%
images15500 = cell(1, 5000);

for i = 10501:ceil(7*rows/20)
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images15500{i-10500} = [b(:, 2:end) b(:,1)];
    i
end
%%
for i = floor((7*rows/20)+1):ceil(8*rows/20)
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images15500{i-10500} = [b(:, 2:end) b(:,1)];
    i
end
%%
for i = floor((8*rows/20)+1):15500
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';    
    images15500{i-10500} = [b(:, 2:end) b(:,1)];
    i
end

%%
images21000 = cell(1, 5500);

for i = 15501:ceil(10*rows/20)
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images21000{i-15500} = [b(:, 2:end) b(:,1)];
    i
end

%%
for i = floor((10*rows/20)+1):ceil(11*rows/20)
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images21000{i-15500} = [b(:, 2:end) b(:,1)];
    i
end

%%
for i = floor((11*rows/20)+1):21000
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images21000{i-15500} = [b(:, 2:end) b(:,1)];
    i
end
%%
images26500 = cell(1, 5500);

for i = 21001:ceil(13*rows/20)
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images26500{i-21000} = [b(:, 2:end) b(:,1)];
    i
end
%%
for i = floor((13*rows/20)+1):ceil(14*rows/20)
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images26500{i-21000} = [b(:, 2:end) b(:,1)];
    i
end
%%
for i = floor((14*rows/20)+1):26500
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images26500{i-21000} = [b(:, 2:end) b(:,1)];
    i
end
%%
images31500 = cell(1, 5000);

for i = 26501:ceil(16*rows/20)
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images31500{i-26500} = [b(:, 2:end) b(:,1)];
    i
end
%%
for i = floor(16*rows/20+1):ceil(17*rows/20)
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images31500{i-26500} = [b(:, 2:end) b(:,1)];
    i
end
%%
for i = floor((17*rows/20)+1):31500
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    images31500{i-26500} = [b(:, 2:end) b(:,1)];
    i
end
%%
imagesend = cell(1, rows-31500);

for i = 31501:ceil(19*rows/20)
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    imagesend{i-31500} = [b(:, 2:end) b(:,1)];
    i
end
%%
for i = floor((19*rows/20)+1):rows
    a = datareorg{i, 2:end-1};
    b = reshape(a, 48, 48)';
    imagesend{i-31500} = [b(:, 2:end) b(:,1)];
    i
end
%%

map = [0 255];


%% Collate all arrays into singular array

imagestotal = [images5000 images10500 images15500 images21000 images26500 images31500 imagesend];


%% Find the indices identifying which images belong to which categories
index0 = [find(emotion_cat == 0)]';
index1 = [find(emotion_cat == 1)]';
index2 = [find(emotion_cat == 2)]';
index3 = [find(emotion_cat == 3)]';
index4 = [find(emotion_cat == 4)]';
index5 = [find(emotion_cat == 5)]';
index6 = [find(emotion_cat == 6)]';
%% Assign images to their relevant emotional categories

emotion0 = imagestotal(index0);
emotion1 = imagestotal(index1);
emotion2 = imagestotal(index2);
emotion3 = imagestotal(index3);
emotion4 = imagestotal(index4);
emotion5 = imagestotal(index5);
emotion6 = imagestotal(index6);

%% Save images as png files to their respective folders

folderName = '.\images\Emotion4';
fig = figure('visible', 'off'); %stopping new figures populating screen
map = [0 255]; %set up pixel value map to ensure imshow works as expected

%% Emotion 0
folderName = '.\images\Emotion0'; %file to be saved to

for i = 0:length(emotion0)
    imgName = sprintf("emotion0_%d", i); %setting up file name with counter 
    img = imshow(emotion0{i}, map); % turning matrix into visible image
    saveas(img, fullfile(folderName, imgName), 'png') % saving as a png file to relevant folder
end

%% Emotion 1
folderName = '.\images\Emotion1'; 

for i = 0:length(emotion1)
    imgName = sprintf("emotion1_%d", i);
    img = imshow(emotion1{i}, map);
    saveas(img, fullfile(folderName, imgName), 'png')
end

%% Emotion 2
folderName = '.\images\Emotion3'; 

for i = 0:length(emotion2)
    imgName = sprintf("emotion2_%d", i);
    img = imshow(emotion2{i}, map);
    saveas(img, fullfile(folderName, imgName), 'png')
end

%% Emotion 3
folderName = '.\images\Emotion3'; 

for i = 0:length(emotion3)
    imgName = sprintf("emotion3_%d", i);
    img = imshow(emotion3{i}, map);
    saveas(img, fullfile(folderName, imgName), 'png')
end

%% Emotion 4
folderName = '.\images\Emotion4'; 

for i = 0:length(emotion4)
    imgName = sprintf("emotion4_%d", i);
    img = imshow(emotion4{i}, map);
    saveas(img, fullfile(folderName, imgName), 'png')
end

%% Emotion 5
folderName = '.\images\Emotion5'; 

for i = 0:length(emotion5)
    imgName = sprintf("emotion5_%d", i);
    img = imshow(emotion5{i}, map);
    saveas(img, fullfile(folderName, imgName), 'png')
end

%% Emotion 6
folderName = '.\images\Emotion6'; 

for i = 0:length(emotion6)
    imgName = sprintf("emotion6_%d", i);
    img = imshow(emotion6{i}, map);
    saveas(img, fullfile(folderName, imgName), 'png')
end

%% Loading images into image data store

ids = imageDatastore(% file address of images \Emotion*.png','LabelSource','foldernames');
[idstrain,idsvalid] = splitEachLabel(ids,0.7); %seperation of data into training and validation sets
auidstrain = augmentedImageDatastore([48 48], idstrain, 'ColorPreprocessing', 'gray2rgb'); %preprocessing of data
auidsvalid = augmentedImageDatastore([48 48], idsvalid, 'ColorPreprocessing', 'gray2rgb');

