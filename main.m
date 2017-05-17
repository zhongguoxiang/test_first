clc
clear all
% 分子
% 聚类中心
load x.csv;
load xlable.csv
[row,col]=size(x);  %数据集矩阵的行数r，列数c
x=x+rand(row,col);  %带高斯噪声
x=mapminmax(x,0,1);  %数据标准化
nlei=3;   %类簇数目
b=rand(row,nlei);
%生成初始隶属度矩阵
for i=1:1:row
    miu(i,:)=b(i,:)/sum(b(i,:));
    sm(i,:)=sum(miu(i,:));
end
gammajj=-0.03;%-0.03---0.5
gammajk=0.00034;%0.0001
delta=0.09;%0.1
% cesscn
[cesscn_lable,cesscnmatrix]=cesscn(x,miu,nlei,gammajj,gammajk,delta);
[AR_cesscn,RI_cesscn,MI_cesscn,HI_cesscn]=valid_RandIndex(cesscn_lable,xlable);
DBI_cesscn = valid_internal_deviation(x,cesscn_lable,3);%labels计算得到标签
% cessc
[cessc_lable,cesscmatrix]=code_cessc(x,miu,nlei,gammajj,gammajk,delta);
[AR_cessc,RI_cessc,MI_cessc,HI_cessc]=valid_RandIndex(cessc_lable,xlable);
DBI_cessc = valid_internal_deviation(x,cessc_lable,3);%labels计算得到标签
% k_mean
 code_k_mean_lable=code_k_mean(x,nlei);
 [AR_code_k_mean,RI_code_k_mean,MI_code_k_mean,HI_code_k_mean]=valid_RandIndex(code_k_mean_lable,xlable);
 DBI_k_mean = valid_internal_deviation(x,code_k_mean_lable,3);%labels计算得到标签
% code_fcm
code_fcm_lable=code_fcm(x,miu,nlei);
[AR_code_fcm,RI_code_fcm,MI_code_fcm,HI_code_fcm]=valid_RandIndex(code_fcm_lable,xlable);
DBI_fcm = valid_internal_deviation(x,code_fcm_lable,3);%labels计算得到标签
% code_fec
code_fec_lable=code_fec(x,miu,nlei);
[AR_code_fec,RI_code_fec,MI_code_fec,HI_code_fec]=valid_RandIndex(code_fec_lable,xlable);
DBI_fec = valid_internal_deviation(x,code_fec_lable,3);%labels计算得到标签

  