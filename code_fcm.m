function label=code_fcm(data,U,cluster_n)
% clc
% clear
% close all
% %% create samples:
% for i=1:100  
%     x1(i) = rand()*5;      %��Ϊ��֤������  
%     y1(i) = rand()*5;    
%     x2(i) = rand()*5 + 3; %��Ϊ��֤������  
%     y2(i) = rand()*5 + 3;
% end  
% x = [x1,x2];  
% y = [y1,y2];  
% data = [x;y];
% data = data';%һ������ÿһ�д���һ������
% %plot(data(:,1),data(:,2),'*');  %������ 
% %%---
% cluster_n = 2;%�����
iter = 100;%��������
m = 2;%ָ��
U=U';
num_data = size(data,1);%��������
num_d = size(data,2);%����ά��
% %--��ʼ��������u��������ÿһ�к�Ϊ1
% U = rand(cluster_n,num_data);
% col_sum = sum(U);
% U = U./col_sum(ones(cluster_n,1),:);
%% ѭ��--�涨����������Ϊ��������
for i = 1:iter
    %����c
    for j = 1:cluster_n
        u_ij_m = U(j,:).^m;
        sum_u_ij = sum(u_ij_m);
        sum_1d = u_ij_m./sum_u_ij; 
        c(j,:) = u_ij_m*data./sum_u_ij;
    end
    %-����Ŀ�꺯��J
    temp1 = zeros(cluster_n,num_data);
    for j = 1:cluster_n
        for k = 1:num_data
            temp1(j,k) = U(j,k)^m*(norm(data(k,:)-c(j,:)))^2;
        end
    end
    J(i) = sum(sum(temp1));
    %����U
    for j = 1:cluster_n
        for k = 1:num_data
            sum1 = 0;
            for j1 = 1:cluster_n
                temp = (norm(data(k,:)-c(j,:))/norm(data(k,:)-c(j1,:))).^(2/(m-1));
                sum1 = sum1 + temp;
            end
            U(j,k) = 1./sum1;
        end
    end
end
[~,label] = max(U);%�ҵ���������
label=label';