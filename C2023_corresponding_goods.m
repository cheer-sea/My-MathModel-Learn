%{
    2023年数模真题C，第一问，数据预处理，
    通过附件一的单品编码确认附件二各数据的单品。
%}

%% 第一，读取Excel文件

% 设置附件一读取方式（第1列编码，第2列名称，第4列分类）
opts_num = detectImportOptions('附件1.xlsx');
opts_num.SelectedVariableNames = opts_num.VariableNames([1, 2, 4]);
% 设置附件二读取方式（第1列日期，第3列编码，第4列销量，第5列单价）
opts_goods = detectImportOptions('仅销售.xlsx');
opts_goods.SelectedVariableNames = opts_goods.VariableNames([1, 3, 4, 5]);

% 读取需要数据
data_number = readtable('附件1.xlsx', opts_num);
data_2 = readtable('仅销售.xlsx', opts_goods);

% 把附件二中的数据转为年月日，并先用变量储存
date_2_date = datetime(data_2{:, 1}, 'InputFormat', 'yyyy-mm-dd');
years = year(date_2_date);
months = month(date_2_date);
days = day(date_2_date);

%% 第二，开始匹配编码

% 附件一总编码
num_all = data_number{:, 1};
% 附件二各记录编码
num_eve = data_2{:, 2};

% 匹配编码并添加相应单品名称和分类
[~, row_index] = ismember(num_eve, num_all);
name = data_number{row_index, 2};
ty = data_number{row_index, 3};

%% 第三，制作结果表格并输出为Excel形式

vari_name = {'Year', 'Month', 'Day', 'Sales', 'Price', 'Name', 'Type'};
data_2_res = table(years, months, days, data_2{:, 3}, data_2{:, 4}, ...
    name, ty, 'VariableNames', vari_name);

writetable(data_2_res, '附件二处理结果(仅销售)_1.xlsx');
% 除去其余变量，方便观察结果
clearvars -except data_2_res data_number










