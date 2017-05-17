clc
clear all
% 分子
%  聚类中心
load x.csv;
[row,col]=size(x);  %数据集矩阵的行数r，列数c
% x=x+rand(r,c);  %带高斯噪声
 x=zscore(x);  %数据标准化
nlei=3;   %类簇数目
b=rand(row,nlei);
jiayi=0.15;
 for i=1:1:row
     miu(i,:)=b(i,:)/sum(b(i,:));
     sm(i,:)=sum(miu(i,:));
 end 
% % 生成初始隶属度矩阵
for i1=1:1:nlei
v1=(miu(1,1)).^2*x(1,:);  % miu乘x求和
for j1=2:1:row
v1=(miu(j1,i1)).^2*x(j1,:)+v1;
end
v2=(miu(1,1)).^2; % miu求和
for k=2:1:row
v2=v2+(miu(k,i1)).^2;
end
v(i1,:)=v1/v2; %聚类中心
end
% first_first第一部分中的第一部分
[r1,c1]=size(v);
ak=2;
% gam=0.09;gammajk
% gamm=-0.9900;
% gamma=0.1;

for i=1:1:nlei
    for j=1:1:row
        b1(j,i)=2*miu(j,i)^(ak-1)*sum((x(j,:)-v(i,:)).^2);
    end
end
% 第二部分
for j=1:1:row
    he1=sum(miu(j,:))-min(miu(j,:));
    a1(j,:)=ak*delta^2*(1-he1)^(ak-1);
end %a1为输出
B = [];
for ahh = 1:length(a1(1,:))
        B = [B a1(:,ahh)*ones(1,nlei)];
end
% 第一部分的第三部分
for i=1:1:nlei %i为隶属度列数
    for j=1:1:row %j为隶属度行数
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
        if miu(k,i)>0.8
            gai=0;
        end
        a1a(j,i)=a1a(j,i)+gai;
    end
end
a2(j,i)=a(j,i)+a1a(j,i);
zhishu=(b1*miu(j,i)-B*miu(j,i)+a2(j,i))/(gammajj*miu(j,i));
    end
end
fenzi=exp(zhishu);
% 分母
for dede=1:1:row
    fenmu(dede,:)=sum(fenzi(dede,:))+jiayi;
    jieguo(dede,:)=fenzi(dede,:)/fenmu(dede,:);
end
miumiu(:,:,1)=miu;
miumiu(:,:,2)=jieguo;
% % % % % % % % % % % % % % % % % % % % % % % % % %迭代 % % % % % % % % % % % % % % % % % % % % % % % % % 
for tt=1:1:98
    gt(tt,:)=max(max(abs(miumiu(:,:,tt+1)-miumiu(:,:,tt))));
    if gt(tt,:)>0.000001
        for i1=1:1:nlei
          miu=miumiu(:,:,tt+1);
          v1=(miu(1,1)).^2*x(1,:);  % miu乘x求和
for j1=2:1:row
v1=(miu(j1,i1)).^2*x(j1,:)+v1;
end
v2=(miu(1,1)).^2; % miu求和
for k=2:1:row
v2=v2+(miu(k,i1)).^2;
end
v(i1,:)=v1/v2; %聚类中心
        end
for i=1:1:nlei
    for j=1:1:row
        b1(j,i)=2*miu(j,i)^(ak-1)*sum((x(j,:)-v(i,:)).^2);
    end
end
% 第二部分
for j=1:1:row
    he1=sum(miu(j,:))-min(miu(j,:));
    a1(j,:)=ak*delta^2*(1-he1)^(ak-1);
end %a1为输出
B = [];
for ahh = 1:length(a1(1,:))
        B = [B a1(:,ahh)*ones(1,nlei)];
end
% 第一部分的第三部分
for i=1:1:nlei %i为隶属度列数
    for j=1:1:row %j为隶属度行数
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
        if miu(k,i)>0.8
            gai=0;
        end
        a1a(j,i)=a1a(j,i)+gai;
    end
end
a2(j,i)=a(j,i)+a1a(j,i);
zhishu=(b1*miu(j,i)-B*miu(j,i)+a2(j,i))/(gammajj*miu(j,i));
    end
end
fenzi=exp(zhishu);
% 分母
for dede=1:1:row
    fenmu(dede,:)=sum(fenzi(dede,:))+jiayi;
    jieguo(dede,:)=fenzi(dede,:)/fenmu(dede,:);
end
    end
     for fe=1:1:row
    sume3(fe,:)=sum(jieguo(fe,:));
    end
summ3(:,:,tt)=sume3;
    miumiu(:,:,tt+2)=jieguo;
end
for rr=1:1:row
kiki=miumiu(:,:,100);
[maa(rr,:),ii(rr,:)]=max(kiki(rr,:));%ii为类标号
end