# 说明
# 本程序适用于天线方向图的计算

# 1 初始化程序
1. 准备RCS.xls文件，在这个excel文件中放入1，2，3，4四种阵面的方向图；分别放在sheet1~sheet4中。
2. 运行readfiles.m程序，将文件预加载到工作区
3. 如果您需要运行平面阵的程序，请选择main_plant.m
4. 如果您需要运行共性面阵的程序，请选择main.m
# 2 初始化输入参数

|变量名称|解释|示例|
|--|--|--|
|num_of_big|大阵的数量|4|
|num_of_small|大阵中子阵的数量|4|
|center_angle|圆心角（角度制）|80|
|p|周期|0.015|
|lambda|波长|0.0375|
|phi_scan|是否扫描phi方向|'1'或者'180'|
|plotOrNot|是否画图|true或false|
|xlsOrNot|是否输出xls文件|true或false|
|xlsName|输出的文件名称|'result'|