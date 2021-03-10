
% This is the function to call to actually use the game of life
% Call this function to start the interface
% Code Time: 1 Hour 30 min (Conrad) 2 Hour (Ted)
function [] = interface()
prompt = {'Enter X Size:','Enter Y size:','Enter # of steps', 'Random initialization (0/1)?', 'Custom Cell Color (0/1)?', 'Custom Background Color(0/1)?'};
dlgtitle = 'Game of Life Simulator';
dims = [1 60];
definput = {'20','20','1','0','0','0'}; % Set up base stats

ans = inputdlg(prompt,dlgtitle,dims,definput); % Convert to numbers
x = str2num(cell2mat(ans(1)));
y = str2num(cell2mat(ans(2)));
steps = str2num(cell2mat(ans(3)));
random = str2num(cell2mat(ans(4)));
custom_cell_color = str2num(cell2mat(ans(5)));
custom_bg_color = str2num(cell2mat(ans(5)));
cell_color = [0 256 0];
bg_color = [256 256 256];
start = zeros(x,y);

if custom_cell_color
    cell_color = prompt_color("Enter your cell color", {'0','256','0'});
end 
if custom_bg_color
    bg_color = prompt_color("Enter your background color",{'256','256','256'});
end 
if random
    start = randi([0 1], x,y);
end 

run_life(start, steps, cell_color, bg_color);
end

function color = prompt_color(title, default)
    color_prompt = {'R:', 'G:', 'B:'};
    title = title;
    dims = [1 60];
    color_ans = inputdlg(color_prompt,title,dims,default);
    r = str2num(cell2mat(color_ans(1)));
    g = str2num(cell2mat(color_ans(2)));
    b = str2num(cell2mat(color_ans(3)));
    color = [r g b];
end 