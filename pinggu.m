function [y,err] = pinggu(n)
%PINGGU 此处显示有关此函数的摘要
%   此处显示详细说明
c=[2:(n+1)]';
A=vander(c);
A=fliplr(A);
i=[1:n]';
b=((1+i).^n-1)./i;
x=A\b;
% x=pinv(A)*b;%这里是为了防止接近病态，因此可以使用了伪逆函数

[RA,RB,n,X1]=lianghuaGauss(A,b);%列主元素高斯消去法
[h1,L,U,X2] = LUfenjie(A,b);%LU分解法


if X1==0
    if X2==0
        disp('LU分解失败，方程组病态，有无穷多组解或无法求解！')
    end
    disp('方程组病态，有无穷多组解或无法求解！')
    y=0.0000;
    err=0.00000;    
else
%     y=[x X1 X2];
%     disp('y的第一列是左除求出的解，第二列是列主元素高斯消去法求得的解，第三列是LU分解求得的解：');
%     err=[max(abs(x-1)) max(abs(X1-1)) max(abs(X2-1))];  
    
    y=[x X1 ];
    disp('y的第一列是左除求出的解，第二列是列主元素高斯消去法求得的解:');
    err=[max(abs(x-1)) max(abs(X1-1))]; 
end

end

