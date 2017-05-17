function [cesscn_lable,n,nn,nnn]=iris_pair(cesscn_lable,n1,nn1,nnn1)
n=0;
for i=1:1:50
    if cesscn_lable(i,1)~=1&&n<=n1
        cesscn_lable(i,1)=1;
        n=n+1;
    end
end
nn=0;
for ii=51:1:100
    if cesscn_lable(ii,1)~=2&&nn<=nn1
        cesscn_lable(ii,1)=2;
        nn=nn+1;
    end
end
nnn=0;
for ii=101:1:150
    if cesscn_lable(ii,1)~=3&&nnn<=nnn1
        cesscn_lable(ii,1)=3;
        nnn=nnn+1;
    end
end
