clc
clear all
% ����
% ��������
load x.csv;
load xlable.csv
[row,col]=size(x);  %���ݼ����������r������c
x=x+rand(row,col);  %����˹����
x=zscore(x);  %���ݱ�׼��
nlei=3;   %�����Ŀ
b=rand(row,nlei);
%���ɳ�ʼ�����Ⱦ���
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
DBI_cesscn = (valid_internal_deviation(x,cesscn_lable,3));%labels����õ���ǩ

