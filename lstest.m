%对第一节课的例题进行分析，这里是主函数
clc;
clear all;

%这里的n是自然数，表示方程的n阶
n=17;
[y,err] = pinggu(n)

%最终确定n=11时LU分解崩溃
%最终确定n大于12时这个方程组列主元素高斯消去法和左除法崩溃
