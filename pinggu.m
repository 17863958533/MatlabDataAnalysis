function [y,err] = pinggu(n)
%PINGGU �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
c=[2:(n+1)]';
A=vander(c);
A=fliplr(A);
i=[1:n]';
b=((1+i).^n-1)./i;
x=A\b;
% x=pinv(A)*b;%������Ϊ�˷�ֹ�ӽ���̬����˿���ʹ����α�溯��

[RA,RB,n,X1]=lianghuaGauss(A,b);%����Ԫ�ظ�˹��ȥ��
[h1,L,U,X2] = LUfenjie(A,b);%LU�ֽⷨ


if X1==0
    if X2==0
        disp('LU�ֽ�ʧ�ܣ������鲡̬��������������޷���⣡')
    end
    disp('�����鲡̬��������������޷���⣡')
    y=0.0000;
    err=0.00000;    
else
%     y=[x X1 X2];
%     disp('y�ĵ�һ�����������Ľ⣬�ڶ���������Ԫ�ظ�˹��ȥ����õĽ⣬��������LU�ֽ���õĽ⣺');
%     err=[max(abs(x-1)) max(abs(X1-1)) max(abs(X2-1))];  
    
    y=[x X1 ];
    disp('y�ĵ�һ�����������Ľ⣬�ڶ���������Ԫ�ظ�˹��ȥ����õĽ�:');
    err=[max(abs(x-1)) max(abs(X1-1))]; 
end

end

