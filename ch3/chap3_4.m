clc;clear;
A=[1 0.5]; B=[0.1 0.5 1]; C=[0.2 1];
A1=[0.8 0.1]; B1=[0.5 0.2 0];
C1 = fr(A, B, C, A1, B1)


function C1 = fr(A, B, C, A1, B1)
AB = circ(A',B);
ABT1 = AB';
R = circ(ABT1(:),C); % R = (A X B)^T1 * C
AB1 = circ(A1',B1);
ABT2 =AB1';
C1 = circ(ABT2(:)',R); % c1 = (A1 X B1)^T2 * R
end


function C = circ(A, B)
[ma,na]=size(A); [mb,nb]=size(B); %na=mb
C=zeros(ma,nb);
for i=1:ma %A的每一行
    for j=1:nb %B的每一列
        for k=1:na %A的第i行的第k个元素，B的第j列的第k个元素
            t(k)=min(A(i,k),B(k,j));
        end
        C(i,j)=max(t);
    end
end
end