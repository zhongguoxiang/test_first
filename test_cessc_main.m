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
gammajjj=-0.03;%-0.03---0.5
gammajjk=0.00034%0.0001
% delta=0.05;%0.1
% cessc
[cessc_lable,cesscmatrix]=test_cessc(x,miu,nlei,gammajjj,gammajjk);
% cesscn_lable_test=cesscn_lable;
% [cesscn_lable,n,nn,nnn]=iris_pair(cesscn_lable,30,30,30);
[AR_cessc,RI_cessc,MI_cessc,HI_cessc]=valid_RandIndex(cessc_lable,xlable);
DBI_cessc = (valid_internal_deviation(x,cessc_lable,3));%labels����õ���ǩ