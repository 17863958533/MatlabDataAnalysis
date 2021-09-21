function [RA,RB,n,X] = lianghuaGauss(A,b)
%LIANGHUAGAUSS 该函数是进行列主元素高斯消去法的函数
% 输入：A-方程的系数矩阵  b-方程的等号右边的常数矩阵
% 输出：RA-系数矩阵的秩  RB-增广矩阵的秩  这两个量主要用于是否有解的判断
% n：方程的阶数
% X：求出的方程的解

B=[A b];
n=length(b);

%如果需要做稳健性判断，就把judge=1,否则让judge=0
judge=0;

if judge==1
    RA=rank(A);
    RB=rank(B);
else
    RA=n;
    RB=n;
end

zhicha=RB-RA;
if zhicha>0
    disp('请注意，这个方程没有解！')
    return
end

if RA==RB
    if RA==n
        disp('请注意，由于RA=RB=n,所以这个方程有唯一解！')
        X=zeros(n,1);
        C=zeros(1,n+1);
        
        for p=1:n-1
            [Y,j]=max(abs(B(p:n,p)));
            C=B(p,:);
            B(p,:)=B(j+p-1,:);
            B(j+p-1,:)=C;
            for k=p+1:n
                m=B(k,p)/B(p,p);
                B(k,p:n+1)=B(k,p:n+1)-m*B(p,p:n+1);
            end
        end
        
        b=B(1:n,n+1);
        A=B(1:n,1:n);
        X(n)=b(n)/A(n,n);
        
        for q=n-1:-1:1
            X(q)=(b(q)-sum(A(q,q+1:n)*X(q+1:n)))/A(q,q);
        end
    else
        disp('请注意，由于RA=RB<n,所以这个方程有无穷多组解！')
        X=0;
    end
    
end











