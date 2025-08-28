%{
    数模2023C题，第二问
    拟合数据。
%}


%% 第一，读取Excel
data = readtable('第二问各品类加成定价之和与销量.xlsx', 'VariableNamingRule', 'preserve');
% 去除异常销售量
data = data(data.Sales_all <= 350, :);
% 去除异常加成成本
data = data(data.Sum_plus_price <= 850, :);


x1 = data.Sum_plus_price(strcmp(data.Type, '水生根茎类'));
x2 = data.Sum_plus_price(strcmp(data.Type, '花叶类'));
x3 = data.Sum_plus_price(strcmp(data.Type, '花菜类'));
x4 = data.Sum_plus_price(strcmp(data.Type, '茄类'));
x5 = data.Sum_plus_price(strcmp(data.Type, '辣椒类'));
x6 = data.Sum_plus_price(strcmp(data.Type, '食用菌'));

y1 = data.Sales_all(strcmp(data.Type, '水生根茎类'));
y2 = data.Sales_all(strcmp(data.Type, '花叶类'));
y3 = data.Sales_all(strcmp(data.Type, '花菜类'));
y4 = data.Sales_all(strcmp(data.Type, '茄类'));
y5 = data.Sales_all(strcmp(data.Type, '辣椒类'));
y6 = data.Sales_all(strcmp(data.Type, '食用菌'));
 
[r1, p1] = corr(x1, y1);
c1 = polyfit(x1, y1, 1);

[r2, p2] = corr(x2, y2);
c2 = polyfit(x2, y2, 1);

[r3, p3] = corr(x3, y3);
c3 = polyfit(x3, y3, 1);

[r4, p4] = corr(x4, y4);
c4 = polyfit(x4, y4, 1);

[r5, p5] = corr(x5, y5);
c5 = polyfit(x5, y5, 1);

[r6, p6] = corr(x6, y6);
c6 = polyfit(x6, y6, 1);

r = [r1, r2, r3, r4, r5, r6];
p = [p1, p2, p3, p4, p5, p6];

clear r1 r2 r3 r4 r5 r6 p1 p2 p3 p4 p5 p6


