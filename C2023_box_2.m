%{
    数模2023C题，第二问，
    绘制各菜类加成定价与销量的关系
%}

%% 第一，读取Excel
data = readtable('第二问各品类加成定价之和与销量.xlsx', 'VariableNamingRule','preserve');

%% 第二，设置坐标轴
% 去除异常销售量
data = data(data.Sales_all <= 400, :);
% 去除异常加成成本
data = data(data.Sum_plus_price <= 1000, :);
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

%% 第四，进行绘图
% 设置图片基本信息
fontName = 'Times New Roman'; % 字体
fontSize = 25; % 字体大小
picSize = [350 250 800 550];
color = [[0 0 139] / 255; [105 105 105] / 255; [192 0 0] / 255; [0 191 255] / 255; ...
[0 255 127] / 255; [238 180 180] / 255];
symbol = ['o', 'd', '>', 's', '<', '*'];


% 绘图
figure
plot(x1, y1, symbol(:, 1), 'Color', color(1, :), 'LineWidth', 2.0);
xlabel('Price');
ylabel('Sales');
set(gca, 'FontName', fontName, 'FontSize', fontSize);
set(gcf, 'Position', picSize); % 控制图片生成尺寸
print('-djpeg', '水生根茎类');

figure
plot(x2, y2, symbol(:, 2), 'Color', color(2, :), 'LineWidth', 2.0, 'Marker', symbol(:, 2));
xlabel('Price');
ylabel('Sales');
set(gca, 'FontName', fontName, 'FontSize', fontSize);
set(gcf, 'Position', picSize); % 控制图片生成尺寸
print('-djpeg', '花叶类');

figure
plot(x3, y3, symbol(:, 3), 'Color', color(3, :), 'LineWidth', 2.0, 'Marker', symbol(:, 3));
xlabel('Price');
ylabel('Sales');
set(gca, 'FontName', fontName, 'FontSize', fontSize);
set(gcf, 'Position', picSize); % 控制图片生成尺寸
print('-djpeg', '花菜类');

figure
plot(x4, y4, symbol(:, 4), 'Color', color(4, :), 'LineWidth', 2.0, 'Marker', symbol(:, 4));
xlabel('Price');
ylabel('Sales');
set(gca, 'FontName', fontName, 'FontSize', fontSize);
set(gcf, 'Position', picSize); % 控制图片生成尺寸
print('-djpeg', '茄类');

figure
plot(x5, y5, symbol(:, 5), 'Color', color(5, :), 'LineWidth', 2.0, 'Marker', symbol(:, 5));
xlabel('Price');
ylabel('Sales');
set(gca, 'FontName', fontName, 'FontSize', fontSize);
set(gcf, 'Position', picSize); % 控制图片生成尺寸
print('-djpeg', '辣椒类');

figure
plot(x6, y6, symbol(:, 6), 'Color', color(6, :), 'LineWidth', 2.0, 'Marker', symbol(:, 6));
xlabel('Price');
ylabel('Sales');
set(gca, 'FontName', fontName, 'FontSize', fontSize);
set(gcf, 'Position', picSize); % 控制图片生成尺寸
print('-djpeg', '食用菌');


% %% 第五，把d_p,d_w结果输出为Excel
% vari_name = {'Year', 'Month', 'Day', 'Type', 'w', 'sales'};
% re = table(data.Year, data.Month, data.Day, data.Type, data.Cost_Plus_Rate, ...
%     data.Sales_all, 'VariableNames', vari_name);
% 
% writetable(re, '第二问数据.xlsx');
