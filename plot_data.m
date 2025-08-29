%{
    这个源文件主要用于显示一些常用的绘图函数和图片设置
%}

%% 图片基本信息
font_name = 'Times New Roman'; % 使用罗马字体
font_size = 24; % 字体大小
pic_size = [200, 200, 950, 600] ; % 前两个数字200可以不动，后两个数字依次为图片的长宽
pic_name = " "; % 对生成图片的命名
pic_resolution = '-r300'; % 生成图片的精度

x = [];
y = [];

%% 绘图(仅仅显示主要部分，如设置颜色，线宽，但不设置具体值)
for i = 1: last
    plot('x轴对应数据(即上面的 x )', 'y轴对应数据(即上面的 y )', 'Color', ...
    color(i, :), 'LineWidth',  lineWidth, 'Marker', symbol(:, i), ...
   'MarkerSize', markerSize);
end

legend('First', 'Second') 
% 会按顺序给各个线命名，如 i = 1 这条线第一个绘画，则命名为 'First', i = 2 则为 'Second'

xlabel(xLabel); % x坐标轴名称
ylabel(yLabel); % y坐标轴名称

set(gca, 'FontName', font_name, 'FontSize', font_size);
% set 函数可以在绘图结束后进行图片属性的编辑，其中 gca 表示获取当前图片的属性，然后
% 如可以改变 'FontName' 的值来改变字体，进而对图片进行修改美化

set(gcf, 'Position', pictureSize) % 控制图片生成尺寸

print('-djpeg', pic_name, pic_resolution) 
% 生成相应名字和精度的图片，注意后缀 -djpeg 和其余变量的位置，先 pic_name 再 pic_re...
