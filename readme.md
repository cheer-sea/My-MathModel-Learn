## 这是一个记录个人数模学习过程的仓库，希望能从各种题目中学习与数模相关的编程知识，感受数模解决实际问题的魅力，提高自我能力。
### 1. 已做题目：
- 2023数学建模C题

### 2. 总结收获
1. C2023_corresponding_goods.m 文件中尝试了从Excel的时间格式转化为按年月日分列的形式，并将其写入到新Excel中方便处理，其中重要实现代码如下：
> data_2_date = datetime(data_2{:, 1}, 'InputFormat', 'yyyy-mm-dd');

这行代码的可以通过设置 'InputFormat' 参数，按固定格式读取Excel中的日期数据，并在后续通过year、month、day等属性转换为我们所需格式。