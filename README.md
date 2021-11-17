# singleEEG_package
Processing of single channel EEG data
函数包使用方法V1.0
在matlab主页找到设置路径按钮，选择添加文件及子文件
添加singleEEG，保存
功能说明：
singleEEG
单通道脑电功能集成界面
使用方法：
命令栏中直接输入singleEEG

extractiondata
读取脑电数据
使用方法：
输入:
file:文件名，可以不输入
输出:
Ndatabase:脑电数据
TAG:标识
exband

小波包提取频段信号
使用方法：
输入:
data:数据
band_Y:频段区间,例如[x1,x2]
输出:
band_S:频段信号

timefrequencygraph
画出脑电的时频图
使用方法：
输入:
data:脑电数据
samplingfrequency:采样频率
scopedata:显示范围
showornot:是否显示图像
saveornot:是否保存图像
输出:
t:图像时域
f_bd:图像频域
wt_bd:时频数据
enlc
提取上下包络
使用方法：
输入:
data:脑电数据
输出:
Sgup:上包络
Sgd:下包络
