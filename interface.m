
% This is the function to call to actually use the game of life
% Call this function to start the interface
% Code Time: 1 Hour 30 min (Conrad
function [] = interface()
prompt = {'Enter X Size:','Enter Y size:'};
dlgtitle = 'Game of Life Simulator';
dims = [1 60];
definput = {'20','20'}; % Set up base stats

ans = inputdlg(prompt,dlgtitle,dims,definput); % Convert to numbers
x = cell2mat(ans(1));
y = cell2mat(ans(2));
x = str2num(x);
y = str2num(y);

run_life(zeros(x,y));
end