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
% k_mean
 code_k_mean_lable=code_k_mean(x,nlei);
 [AR_code_k_mean,RI_code_k_mean,MI_code_k_mean,HI_code_k_mean]=valid_RandIndex(code_k_mean_lable,xlable);
 DBI_k_mean = valid_internal_deviation(x,code_k_mean_lable,3);%labels����õ���ǩ
% code_fcm
code_fcm_lable=code_fcm(x,miu,nlei);
[AR_code_fcm,RI_code_fcm,MI_code_fcm,HI_code_fcm]=valid_RandIndex(code_fcm_lable,xlable);
DBI_fcm = valid_internal_deviation(x,code_fcm_lable,3);%labels����õ���ǩ
% code_fec
code_fec_lable=code_fec(x,miu,nlei);
[AR_code_fec,RI_code_fec,MI_code_fec,HI_code_fec]=valid_RandIndex(code_fec_lable,xlable);
DBI_fec = valid_internal_deviation(x,code_fec_lable,3);%labels����õ���ǩ
% cessc
gammajjj=-0.03;%-0.03---0.5
gammajjk=0.00034%0.0001
[cessc_lable,cesscmatrix]=test_cessc(x,miu,nlei,gammajjj,gammajjk);
% cesscn_lable_test=cesscn_lable;
% [cesscn_lable,n,nn,nnn]=iris_pair(cesscn_lable,30,30,30);
[AR_cessc,RI_cessc,MI_cessc,HI_cessc]=valid_RandIndex(cessc_lable,xlable);
DBI_cessc = (valid_internal_deviation(x,cessc_lable,3));%labels����õ���ǩ
