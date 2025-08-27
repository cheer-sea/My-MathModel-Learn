%{
    2023年数模真题C，第二问，求解
    成本加成定价和销量的关系。
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

per_cost = 100 .* data.Cost ./ (100 - data.Loss_rate);
per_rate = data.Sales ./ data.Sales_all;

good_cost = per_rate .* per_cost;
good_profit = 100 .* (((data.Price .* per_rate) ./ good_cost) - 1);

re_name = {'Year', 'Month', 'Day', 'Type', 'Cost', 'Profit', 'Sales'};
re = table(data.Year, data.Month, data.Day, data.Type, good_cost, ...
    good_profit, data.Sales, 'VariableNames', re_name);

[data0, year_g, month_g, day_g, type_g] = findgroups(re.Year, re.Month, re.Day, ...
    re.Type);

ty_cost = splitapply(@sum, re.Cost, data0);
ty_profit = splitapply(@mean, re.Profit, data0);
plus_cost = ty_cost + ty_cost .* ty_profit; 
sale = splitapply(@mean, re.Sales, data0);


vari_name = {'Year', 'Month', 'Day', 'Type', 'Sum_plus_price'};
result = table(year_g, month_g, day_g, type_g, plus_cost, ...
    'VariableNames', vari_name);

result = innerjoin(result, data2, 'Keys', {'Year', 'Month', 'Day', 'Type'});

writetable(result, '第二问各品类加成定价之和与销量.xlsx')









