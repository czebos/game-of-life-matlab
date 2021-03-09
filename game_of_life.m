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
% Code and debug time: 4 hr (Conrad) 6 hr (Ted) 
% 
% 
function new_board = game_of_life(curr_board)
[cols,rows] = size(curr_board);
new_board = zeros(rows,cols);
for col = 1:cols
    for row = 1:rows
        living_neighbors = 0;
        if calc_neighbor(curr_board,col-1,row-1)
            living_neighbors = living_neighbors + 1;
        end 
        if calc_neighbor(curr_board,col-1,row)
            living_neighbors = living_neighbors + 1;
        end 
        if calc_neighbor(curr_board,col-1,row+1)
            living_neighbors = living_neighbors + 1;
        end 
        if calc_neighbor(curr_board,col,row-1)
            living_neighbors = living_neighbors + 1;
        end 
        if calc_neighbor(curr_board,col,row+1)
            living_neighbors = living_neighbors + 1;
        end 
        if calc_neighbor(curr_board,col+1,row-1)
            living_neighbors = living_neighbors + 1;
        end 
        if calc_neighbor(curr_board,col+1,row)
            living_neighbors = living_neighbors + 1;
        end 
        if calc_neighbor(curr_board,col+1,row+1)
            living_neighbors = living_neighbors + 1;
        end 
        
        if curr_board(col,row) == 1
            if living_neighbors < 2
                new_board(col,row) = 0;
            elseif living_neighbors > 3
                new_board(col,row) = 0;
            else
                new_board(col,row) = 1;
            end 
        end 
        if curr_board(col,row) == 0
            if living_neighbors == 3
                new_board(col,row) = 1;
            end 
        end 
    end 
end 

function is_live_neighbor = calc_neighbor(board,col,row)
[cols,rows] = size(board);
if col >= 1 && col <= cols && row >= 1 && row <= rows
    if board(col,row) == 1
        is_live_neighbor = 1;
    else 
        is_live_neighbor = 0;
    end 
else 
    is_live_neighbor = 0;
end 