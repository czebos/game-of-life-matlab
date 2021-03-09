% This is the main interaction of the Game of Life program
% it allows the user to show the image and update it each
% time the user wants to toggle the board
% Code and debug time: 4 hr 30 Min (Conrad Zborowski)
function [] = run_life(arr)
img = disp_board(arr);
imhandle = imshow(img);
while 1  
    [xi, yi, but] = ginput(1);
    if but ~= 1
        arr = game_of_life(arr);
    end
    if but == 113 % Q Button
        break
    end 
    if but == 1 % Left Click
        arr = detect_click(arr, xi, yi);  
    end
    img = disp_board(arr);
    set(imhandle, 'CData', img)
end 

% Hides the current image -- exits simulation
close(imhandle)
end

% This function detects the click, checks
% if it is out of bounds, then gets the assosiated
% coordinate, and changed it to negative one for the game of life
% Code and debug time: 3 hr Conrad Zborowski
function [new_array] = detect_click(arr, xi, yi)
sz = size(arr);
% If out of bounds
if xi < 40 || yi < 40 || xi > (sz(1) + 2) * 20 || yi > (sz(2) + 2) * 20
    new_array = arr;
    disp('Out of bounds')
    return;
end 
% Set the variable to the opposite toggle.
[x,y] = get_xy(xi,yi);
arr(y,x) = ~arr(y,x); 
new_array = arr;
end 

% This function gets the  X and Y coordinate of the 
% array based on the 20 pixel situation
% Code and debug time: 1 hr (Conrad)
function [x,y] = get_xy(xi, yi)
x = (xi - 40) / 20;
y = (yi - 40) / 20;
x = ceil(x);
y = ceil(y);
end

