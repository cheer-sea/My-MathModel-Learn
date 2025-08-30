%{
    这个源文件用于尝试最小生成树的算法
%}
a = zeros(6); % 构造一个6×6的矩阵作为邻接矩阵

% 输入边权重
a(1, [2 3]) = [14 18];
a(2, [3: 5]) = [13 18 16];
a(3, [4 5]) = [12 16];
a(4, [5 6]) = [14 19];
a(5, 6) = 10;

s = cellstr(strcat('城市', int2str([1: 6]')));
G = graph(a, s, 'upper');
p = plot(G, 'EdgeLabel', G.Edges.Weight);

T = minspantree(G) % 调用函数求解

L = sum(T.Edges.Weight);
highlight(p, T, 'EdgeColor', 'red', 'LineWidth', 2.5);

disp('最小生成树边权总和：');
disp(L);

