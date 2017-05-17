clc
clear all
% 分子
% 聚类中心
load x.csv;
load xlable.csv
[row,col]=size(x);  %数据集矩阵的行数r，列数c
x=x+rand(row,col);  %带高斯噪声
x=zscore(x);  %数据标准化
nlei=3;   %类簇数目
b=rand(row,nlei);
%生成初始隶属度矩阵
for i=1:1:row
    miu(i,:)=b(i,:)/sum(b(i,:));
    sm(i,:)=sum(miu(i,:));
end
gammajj=0.050;%-0.03---0.5
gammajk=0.003;%0.0001
delta=0.05;%0.1
% cesscn
[cesscn_lable,cesscnmatrix]=test_cesscn(x,miu,nlei,gammajj,gammajk,delta);
cesscn_lable_test=cesscn_lable;
[cesscn_lable,n,nn,nnn]=iris_pair(cesscn_lable,30,30,30);
[AR_cesscn,RI_cesscn,MI_cesscn,HI_cesscn]=valid_RandIndex(cesscn_lable,xlable);
DBI_cesscn = (valid_internal_deviation(x,cesscn_lable,3));%labels计算得到标签

