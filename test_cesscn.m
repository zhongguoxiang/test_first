function [cesscn_lable,cesscnmatrix]=test_cesscn(x,miu,nlei,gammajj,gammajk,delta)
% clear all
% clc
% load x.csv
[row,col]=size(x);%���ݼ����������row������col
% x=x+rand(row,col);%����˹����
% x=zscore(x);%�����Ŀ
% nlei=3;%�����Ŀ
jiayi=0.00001;
% gammajj=-0.03;%-0.03---0.5
% gammajk=0.00034;%0.0001
% delta=0.09;%0.1
ak=2;
%���ɳ�ʼ�����Ⱦ���
% b=rand(row,nlei);
% for i=1:1:row
%     miu(i,:)=b(i,:)/sum(b(i,:));
%     sm(i,:)=sum(miu(i,:));
% end
for iteration=1:1:100
%���������
for i1=1:1:nlei
v1=(miu(1,1)).^2*x(1,:);  % miu��x���
for j1=2:1:row
v1=(miu(j1,i1)).^2*x(j1,:)+v1;
end
v2=(miu(1,1)).^2; % miu���
for k=2:1:row
v2=v2+(miu(k,i1)).^2;
end
v(i1,:)=v1/v2; %��������
end
%��������
%fmiuij��һ����
[r1,c1]=size(v);
for i=1:1:nlei
    for j=1:1:row
        b1(j,i)=2*miu(j,i)^(ak-1)*GetDistance(x(j,:),v(i,:));
%fmiuij�ڶ�����
    he1=sum(miu(j,:))-min(miu(j,:));
    a1(j,:)=ak*delta^2*(1-he1)^(ak-1);
%a1Ϊ���
B = [];
for ahh = 1:length(a1(1,:))
        B = [B a1(:,ahh)*ones(1,nlei)];
end
% hmiuij
a(j,i)=0;
for k=1:1:row
    if k~=j
        a(j,i)=a(j,i)+gammajk*miu(k,i);
    end
end
a1a(j,i)=0;
for k=1:1:row
    if k~=j
        gai=miu(j,i)*gammajk*log(miu(k,i));
        if miu(k,i)>0.9
            gai=0;
        end
        a1a(j,i)=a1a(j,i)+gai;
    end
end
a2(j,i)=a(j,i)+a1a(j,i);
fenzi(j,i)=exp(b1(j,i)*miu(j,i)-B(j,i)*miu(j,i)+a2(j,i))/(gammajj*miu(j,i));
    end
end
for dede=1:1:row
    fenmu(dede,:)=sum(fenzi(dede,:))+jiayi;
    miumiu(dede,:)=fenzi(dede,:)/fenmu(dede,:);
end
if max(max(abs(miumiu-miu))) < 0.00001
    break;
end
miu=miumiu;
end
for rr=1:1:row
[maa(rr,:),ii(rr,:)]=max(miu(rr,:));%iiΪ����
end
cesscn_lable=ii;
cesscnmatrix=maa;