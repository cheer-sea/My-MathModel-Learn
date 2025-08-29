## 这是一个记录个人数模学习过程的仓库，希望能从各种题目中学习与数模相关的编程知识，感受数模解决实际问题的魅力，提高自我能力。
### 一. 已做题目：
- 2023数学建模C题

### 二. 总结收获
1. **C2023_corresponding_goods.m** 文件中尝试了从Excel的时间格式转化为按年月日分列的形式，并将其写入到新Excel中方便处理，其中重要实现代码如下：
> data_2_date = datetime(data_2{:, 1}, 'InputFormat', 'yyyy-mm-dd');

这行代码使用 datetime 函数，通过设置 'InputFormat' 参数，按固定格式读取Excel中的日期数据，并在后续通过 year、month、day 等属性转换为我们所需格式。

2. **C2023_plus_cost.m** 文件中尝试了一个重要函数 innerjoin ，其示例代码如下：
> data = innerjoin(data, data_loss, 'Keys', {'Number', 'Name'});
 
 innerjoin 函数，在此是可以将两个数据集 data 和 data_loss 按照 'Keys' 中的键值来匹配，而此题就是使用了'Number' 和 'Name' 两个键值进行匹配合并，大概理解如下：

假设 'Keys' 只用到了 'Number'，则一旦两数据集的 'Number' 列中存在相同的值，如 'Number' 列中值同时为 1，函数就会自动合并这两个数据集中对应行的数据，即把 data_loss 中对应行的数据直接添加到 data 对应行中。

而本题中 'Keys' 使用了 'Number' 和 'Name' 两个键值，则需要同时对应两个值，如 'Number' 列中值同时为 2 且 'Name' 列中值同时为 'Hello'。方可进行合并。







