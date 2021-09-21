function [RA,RB,n,X] = lianghuaGauss(A,b)
%LIANGHUAGAUSS �ú����ǽ�������Ԫ�ظ�˹��ȥ���ĺ���
% ���룺A-���̵�ϵ������  b-���̵ĵȺ��ұߵĳ�������
% �����RA-ϵ���������  RB-����������  ����������Ҫ�����Ƿ��н���ж�
% n�����̵Ľ���
% X������ķ��̵Ľ�

B=[A b];
n=length(b);

%�����Ҫ���Ƚ����жϣ��Ͱ�judge=1,������judge=0
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
    disp('��ע�⣬�������û�н⣡')
    return
end

if RA==RB
    if RA==n
        disp('��ע�⣬����RA=RB=n,�������������Ψһ�⣡')
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
        disp('��ע�⣬����RA=RB<n,��������������������⣡')
        X=0;
    end
    
end











