%{
    2023年数模真题C，第二问，求解
    计算每日的各种类成本加成率(需要每日成本，每日种类总销量)。
    第一次运行时，时间非常久，以为是读入和处理的Excel数据相对较多，运行时间较长，
    还需改进。
    后一想，该代码运算过程中涉及大量矩阵，是否是矩阵运算没有注意点乘，检查后发现一处
    没用点乘，使得变为求逆运算，因此时间非常久。（该问题已经处理）
%}

%% 第一，读取Excel
data1 = readtable('每日每一菜品销售总量结果.xlsx', 'VariableNamingRule','preserve');
data2 = readtable('每日每一种类销售总量结果.xlsx', 'VariableNamingRule','preserve');
data_price = readtable('附件三(已处理).xlsx', 'VariableNamingRule', 'preserve');
data_loss = readtable('附件四(已处理).xlsx', 'VariableNamingRule', 'preserve');

%% 第二，把所需数据合并到data1变量中
% 合并每日种类销量
data = innerjoin(data1, data2, 'Keys', {'Year', 'Month', 'Day', 'Type'});
% 合并每日成本
data = innerjoin(data, data_price, 'Keys', {'Year', 'Month', 'Day', 'Number'});
data = innerjoin(data, data_loss, 'Keys', {'Number', 'Name'});

%% 第三，计算每行数据成本加成率，公式 P = C(1 + W)，P 是平均价格，C 是平均成本，W 即为加成率
% 每日，菜占其种类的比例
goods_rate = data.Sales ./ data.Sales_all;
% 每日，菜对应比例成本和售价
goods_cost = 100 * goods_rate .* data.Cost ./ (100 - data.Loss_rate);
goods_price = goods_rate .* data.Price;

vari_name = {'Year', 'Month', 'Day', 'Number', 'Price', 'Cost', 'Name', ...
     'Sales_all', 'Type', 'g_c', 'g_p'};
result_1 = table(data.Year, data.Month, data.Day, data.Number, data.Price, ...
    data.Cost, data.Name, data.Sales_all, data.Type, goods_cost, goods_price, ...
    'VariableNames', vari_name);

%% 第四，计算最终种类成本加成率，需要菜权重成本求和，权重价格求和
[data_r, data_y, data_m, data_d, data_sa, data_ty] = findgroups(result_1.Year, ...
    result_1.Month, result_1.Day, result_1.Sales_all, result_1.Type);

ty_cost = splitapply(@sum, result_1.g_c, data_r);
ty_price = splitapply(@sum, result_1.g_p, data_r);

cost_plus_rate = (ty_price ./ ty_cost) - 1;

%% 第五，输出处理结果
vari_name_r = {'Year', 'Month', 'Day', 'Type', 'Sales_all', 'Day_cost', ...
    'Day_price', 'Cost_Plus_Rate'};
re = table(data_y, data_m, data_d, data_ty, data_sa, ty_cost, ty_price, ...
    cost_plus_rate, 'VariableNames', vari_name_r);

writetable(re, '各种类每日结果.xlsx');

























