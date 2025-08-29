%{
    这个源文件主要是层次分析法的使用
%}

%% 获取判断矩阵
disp('请输入矩阵A');
A = input('A = ');
[n, n] = size(A);
[V, D] = eig(A);
max_eig = max(max(D)); % max函数是按列求最大值，返回行向量


%% 进行一致性检验
CI = (max_eig - n) / ( n - 1); % 一致性检验指标
RI = [0, 0.0001, 0.52, 0.89, 1.12, 1.26, 1.36, 1.41, 1.46, 1.49, 1.52, ... 
1.54 1.56 1.58 1.59]; % 随机一致性检验指标 
% 随机指标中 n = 2时，一定为一致矩阵，则CI = 0，而为避免分母为0，这里改成一个很接近0的正数
CR = CI / RI(n);
disp('一致性指标 CI = ');
disp(CI);
disp('一致性比例 CR = ');
disp(CR);

flag = 0; % 用于标记一致性检验是否通过
if CR < 0.10
    disp('因为 CR < 0.10，所以一致性检验通过!');
    flag = 1;
else
    disp('因此 CR >= 0.10，不符合要求，一致性检验未通过，需要修改!');
end

%% 通过一致性检验后，进行求结果
if flag == 1
    % 方法1：算术平均法
    sum_A = sum(A);
    sum_A = repmat(sum_A, n, 1);
    stand_A = A ./ sum_A;

    disp('算数平均法求得权重')
    w1 = sum(stand_A, 2) ./ n; % w1所得各行即为权重
    disp(w1); 

    % 方法2：特征值求权重
    [r, c] = find(D == max_eig, 1); 
    disp('特征值求得权重');
    w2 = V(:, c) ./ sum_A (V(:, c));
    disp(w2);

    %% 最后通过两个方法综合得权重，减少误差
    result = (w1 + w2) ./ 2;
    disp(result);
end

