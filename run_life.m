% This is the main interaction of the Game of Life program
% it allows the user to show the image and update it each
% time the user wants to toggle the board
% Code and debug time: 4 hr 30 Min (Conrad Zborowski) 9 hr (Ted)
function [] = run_life(arr, steps)
img = disp_board(arr);
imhandle = imshow(img);
while 1  
    [xi, yi, but] = ginput(1);
    if but == 113 % Q Button
        break
    end 
    
    if but == 1 % Left Click
        arr = detect_click(arr, xi, yi);  
        img = disp_board(arr);
        set(imhandle, 'CData', img)
    end
    
    if but == 3 % Right click
        x1 = xi;
        y1 = yi;
        if check_click_bounds(arr, x1, y1)
            [real_x1,real_y1] = get_xy(x1,y1);
            og_value1 = arr(real_y1,real_x1);
            arr(real_y1,real_x1) = 2;
            img = disp_board(arr);
            set(imhandle, 'CData', img)
            while 1
                [x2, y2, but2] = ginput(1);
                if but2 == 1
                    arr(real_y1,real_x1) = og_value1;
                    img = disp_board(arr);
                    set(imhandle, 'CData', img)
                    break
                end 
                if but2 == 3
                    if check_click_bounds(arr, x2, y2)
                        arr(real_y1,real_x1) = og_value1;
                        start_x = x1; end_x = x2; start_y = y1; end_y = y2;
                        if x1 > x2
                            start_x = x2; end_x = x1;
                        end 
                        if y1 > y2
                            start_y = y2; end_y = y1;
                        end 
                        arr = handle_bulk_click(arr, start_x, start_y, end_x, end_y);
                        img = disp_board(arr);
                        set(imhandle, 'CData', img)
                        break
                    end 
                end 
            end 
        end 
    end 
                
    if but == 115 % S button
        disp("s pressed");
        for step = 1 : steps
            arr = game_of_life(arr);
            img = disp_board(arr);
            set(imhandle, 'CData', img)
            pause(.5);
        end 
    end
    
    if but == 99 % C button
        arr = zeros(size(arr));
        img = disp_board(arr);
        set(imhandle, 'CData', img);
    end 
    disp(but)
end 

% Hides the current image -- exits simulation
close(imhandle)
end

% This function detects the click, checks
% if it is out of bounds, then gets the assosiated
% coordinate, and changed it to negative one for the game of life
% Code and debug time: 3 hr (Conrad) 3 hr (Ted)
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

% This function detects handles bulk clicking 1.5 hr (Ted)
function [new_array] = handle_bulk_click(arr, x1, y1, x2,y2)
% Set the variable to the opposite toggle.
[rx1,ry1] = get_xy(x1,y1);
[rx2,ry2] = get_xy(x2,y2);
arr(ry1:ry2,rx1:rx2) = ~arr(ry1:ry2,rx1:rx2);
new_array = arr;
end 

function in_bounds = check_click_bounds(arr, x, y)
sz = size(arr);
% If out of bounds
if x < 40 || y < 40 || x > (sz(1) + 2) * 20 || y > (sz(2) + 2) * 20
    disp('Out of bounds')
    in_bounds = 0;
else 
    in_bounds = 1;
end 
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

