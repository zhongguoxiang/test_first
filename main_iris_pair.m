clc
clear all
% ����
% ��������
load x.csv;
load xlable.csv
[row,col]=size(x);  %���ݼ����������r������c
x=x+rand(row,col);  %����˹����
x=mapminmax(x,0,1);  %���ݱ�׼��
nlei=3;   %�����Ŀ
b=rand(row,nlei);
%���ɳ�ʼ�����Ⱦ���
for i=1:1:row
    miu(i,:)=b(i,:)/sum(b(i,:));
    sm(i,:)=sum(miu(i,:));
end
% cesscn
[cesscn_lable,cesscnmatrix]=cesscn(x,miu,nlei);
cesscn_lable_test=cesscn_lable;
[cesscn_lable,n,nn,nnn]=iris_pair(cesscn_lable,3,3,4);
[AR_cesscn,RI_cesscn,MI_cesscn,HI_cesscn]=valid_RandIndex(cesscn_lable,xlable);
Rerror_cesscn= valid_errorate(cesscn_lable,xlable);
% k_mean
 k_mean_lable=k_mean(x,nlei);
 [AR_k_mean,RI_k_mean,MI_k_mean,HI_k_mean]=valid_RandIndex(k_mean_lable,xlable);
  Rerror_k_mean= valid_errorate(k_mean_lable,xlable);
% code_fcm
code_fcm_lable=code_fcm(x,miu,nlei);
[AR_code_fcm,RI_code_fcm,MI_code_fcm,HI_code_fcm]=valid_RandIndex(code_fcm_lable,xlable);
Rerror_code_fcm= valid_errorate(code_fcm_lable,xlable);
% code_fec
code_fec_lable=code_fec(x,miu,nlei);
[AR_code_fec,RI_code_fec,MI_code_fec,HI_code_fec]=valid_RandIndex(code_fec_lable,xlable);
Rerror_code_fec= valid_errorate(code_fec_lable,xlable);