%% Visual and Audio Script

%% Load Files

%load in visual files
restingopen = imread('restingopen.png');
happyopen = imread('happyopen.png');
happyhalfblink = imread('happyhalfblink.png');
happyblink = imread('happyblink.png');
halfsad = imread('halfsad.png');
sad = imread('sad.png');
sadblink = imread('sadblink.png');
happyhalf = imread('happyhalf.png');
fullyhappy = imread('fullyhappy.png');

%load in audio files
[whimper, Fs] = audioread('whimpering.wav');
samples = [1,3*Fs];
[purr, Fs] = audioread('purring.mp3', samples);

%load in network
netstruct = load('finalnet.mat');
net = netstruct.finalnet;


%% Sequence Demo

figure;
resting(restingopen, happyhalfblink, happyblink)
smile(restingopen, happyhalf, fullyhappy, purr)
pause(3)
smiletorest(happyhalf, restingopen)
resting(restingopen, happyhalfblink, happyblink)
sadface(restingopen, halfsad, sad, whimper)
sadfaceblink(sad, sadblink)
sadtorest(halfsad, restingopen)

%% Live action response 

cam = webcam(1);
figure;
resting(restingopen, happyhalfblink, happyblink)
inputSize = net.Layers(1).InputSize;

for i = 1:50
     im = snapshot(cam);
     subplot(1, 2, 1), imshow(im)
     I = imresize(im,inputSize(1:2));
     [label,scores] = classify(net,I);
     title(label)
     if label == 'Happy'
          smile(restingopen, happyhalf, fullyhappy, purr)
          smiletorest(happyhalf, restingopen)
      else
          sadface(restingopen, halfsad, sad, whimper)
          sadfaceblink(sad, sadblink)
          sadtorest(halfsad, restingopen)
      end  
    resting(restingopen, happyhalfblink, happyblink);   
    pause(5)
 end


%% Sequence Functions

function smile(x, y, z, noise)
    subplot(1, 2, 2),imshow(x);
    subplot(1, 2, 2),imshow(y);
    pause(0.5)
    subplot(1, 2, 2),imshow(z);
    sound(noise, 36000)
    
end

function smiletorest(x, y)
        subplot(1, 2, 2),imshow(x);
        subplot(1, 2, 2),pause(0.5)
        subplot(1, 2, 2),imshow(y);
end

function resting(x, y, z)
    subplot(1, 2, 2), imshow(y);
    subplot(1, 2, 2), imshow(z);
    pause(1);
    subplot(1, 2, 2), imshow(y);
    subplot(1, 2, 2), imshow(x);
    pause(2)
end

function sadface(q, r, s, noise)
    subplot(1, 2, 2),imshow(q);
    subplot(1, 2, 2),imshow(r);
    subplot(1, 2, 2),imshow(s);
    sound(noise, 27000)
end

function sadfaceblink(s, t)
    subplot(1, 2, 2),imshow(s);
    subplot(1, 2, 2),imshow(t);
    pause(1);
    subplot(1, 2, 2),imshow(s);
    pause(4);
end

function sadtorest(r, s)
    subplot(1, 2, 2),imshow(r);
    subplot(1, 2, 2),imshow(s);
end
