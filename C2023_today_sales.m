%{
    2023年数模真题C，第一问，数据预处理，
    在前一问得到的Excel表格的基础上，细分为每一天每一单品每一种类的数据。
%}

%% 第一，读取Excel
data = readtable('附件二处理结果(仅销售)_1.xlsx');

%% 第二，进行日期和菜品名称划分和求解
% 划分
[data1, year_1, month_1, day_1, number_groups, name_groups, type_groups_g] = ...
    findgroups(data.Year, data.Month, data.Day, data.Number, data.Name, data.Type);
% 计算每一天每一菜品的销售总量
today_sales_goods = splitapply(@sum, data.Sales, data1);
% 记录每一天每一菜品的价格
today_price_goods = splitapply(@(x) x(1), data.Price, data1);

%% 第三，进行日期和菜品种类划分和求解
[data2, year_2, month_2, day_2, type_groups_t] = findgroups(data.Year, data.Month, ...
    data.Day, data.Type);
today_sales_ty = splitapply(@sum, data.Sales, data2);

%% 第四，把两类划分输出为两个Excel表格
vari_name_goods = {'Year', 'Month', 'Day', 'Number', 'Price', 'Sales', ...
    'Name', 'Type'};
today_sales_g = table(year_1, month_1, day_1, number_groups, ...
    today_price_goods, today_sales_goods, ...
    name_groups, type_groups_g, 'VariableNames', vari_name_goods);

vari_name_ty = {'Year', 'Month', 'Day', 'Sales_all', 'Type'};
today_sales_t = table(year_2, month_2, day_2, today_sales_ty, type_groups_t, ...
    'VariableNames', vari_name_ty);

writetable(today_sales_g, '每日每一菜品销售总量结果.xlsx');
writetable(today_sales_t, '每日每一种类销售总量结果.xlsx');

% 除去其余变量，方便观察结果
clearvars -except today_sales_t today_sales_g











