function Idx=code_k_mean(x,nlei);
%随机获取150个点
opts = statset('Display','final');
 
%调用Kmeans函数
%X N*P的数据矩阵
%Idx N*1的向量,存储的是每个点的聚类标号
%Ctrs K*P的矩阵,存储的是K个聚类质心位置
%SumD 1*K的和向量,存储的是类间所有点与该类质心点距离之和
%D N*K的矩阵，存储的是每个点与所有质心的距离;
 
[Idx,Ctrs,SumD,D] = kmeans(x,nlei,'Replicates',3,'Options',opts);