function [ii,maa]=code_cessc(x,miu,nlei,gamma_JJ,gamma_JK,delta);
% clear all
% clc
% load x.csv
% x=mapminmax(x,0,1);  %数据标准化
% nlei=3;
% gamma_JJ=0.09;
% gamma_JK=0.1;
gamma_KJ=gamma_JK;
% delta=0.1;
zaosheng=0;
[row,col]=size(x);
% b=rand(row,nlei);
% %生成初始隶属度矩阵
% for i=1:1:row
%     miu(i,:)=b(i,:)/sum(b(i,:));
%     sm(i,:)=sum(miu(i,:));
% end
for iteration=1:100
% 更新聚类中心
for i1=1:1:nlei
v1=miu(1,1)*x(1,:);  % miu乘x求和
for j1=2:1:row
v1=miu(j1,i1)*x(j1,:)+v1;
end
v2=miu(1,1); % miu求和
for k=2:1:row
v2=v2+miu(k,i1);
end
v(i1,:)=v1/v2; %聚类中心
end
% 更新隶属度
for i=1:row
    for j=1:nlei
        f_mu(i,j)=GetDistance(x(i,:),v(j));
        h_mu=0;
        for k=1:row
            if k~=i
                h_mu=h_mu+gamma_JK*log(miu(k,j))+gamma_KJ*miu(k,j)/miu(i,j);
            end
        end
        h_mu(i,j)=h_mu;
        fenzi_mu(i,j)=exp(-(f_mu(i,j)+h_mu(i,j))/gamma_JJ);
    end
    fenmu_mu(i,1)=sum(fenzi_mu(i,:))+zaosheng;
    miumiu(i,:)=fenzi_mu(i,:)/fenmu_mu(i,1);
end
% 比较前后两次迭代隶属度
if max(max(abs(miumiu-miu))) < 0.00001
    break;
end
miu=miumiu;
end
for rr=1:1:row
[maa(rr,:),ii(rr,:)]=max(miu(rr,:));%ii为类标号
end