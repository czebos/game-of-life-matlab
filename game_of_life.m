% This gets the next iteration of the game of life
% The rules of the game of life are as follows:
%    1. Any live cell with fewer than two live neighbours dies, 
%       as if by underpopulation
%    2. Any live cell with two or three live neighbours lives 
%       on to the next generation.
%    3. Any live cell with more than three live neighbours dies, 
%       as if by overpopulation.
%    4. Any dead cell with exactly three live neighbours becomes
%       a live cell, as if by reproduction.
% Given these rules, this function represents the next state of the
% game of life given the current state
% Code and debug time: 4 hr (Conrad)
function [next_state] = game_of_life(curr_state)
sz = size(curr_state);
next_state = zeros(sz);
for i = 1:sz(1)
    for j = 1:sz(2)
        living_amt = check_living(curr_state, i, j);
        if living_amt == 3
            next_state(i,j) = 1;
        end 
        if living_amt == 2 && curr_state(i,j) == 1
            next_state(i,j) = 1;
        end 
    end 
end
end


% This counts the amount of neighbors that are living in
% the array at index i and j
% Code and debug time 4hr (Conrad Zborowski)
function [count] = check_living(arr, i, j)
count = 0;
sz = size(arr);
if i >= 2
    count = arr(i - 1, j) + count;
    if j >= 2
        count = arr(i - 1, j - 1) + count;
    end 
end

if j >= 2
    count = arr(i, j - 1) + count;
    if i < sz(1)
        count = arr(i + 1, j - 1) + count;
    end 
end

if i < sz(1)
    count = arr(i + 1, j) + count;
    if j < sz(2)
        count = arr(i + 1, j + 1) + count;
    end 
end 

if j < sz(2)
    count = arr(i, j + 1) + count;
    if i >= 2
        count = arr(i - 1, j + 1) + count;
    end   
end

end