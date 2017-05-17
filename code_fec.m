function ii=code_fec(x,miu,nlei)
[row,col]=size(x);
 degree=5; 
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
    for t=1:nlei
        temp=0;
        for j=1:nlei
            temp=temp+(exp(GetDistance(x(i,:),v(t,:))-GetDistance(x(i,:),v(j,:))))^(1/degree);
        end
        miumiu(i,t)=1/temp;
    end
end
 if max(max(abs(miumiu-miu))) < 0.00001 
        break;
    end
%     VV = V;
miu=miumiu;
end
for rr=1:1:row
[maa(rr,:),ii(rr,:)]=max(miu(rr,:));%ii为类标号
end