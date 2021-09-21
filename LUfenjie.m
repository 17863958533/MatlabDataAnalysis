function [h1,L,U,x] = LUfenjie(A,b)
%LUFENJIE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[n,n]=size(A);
RA=rank(A);
if RA~=n
    disp('��Ϊ����ʽΪ0�����Բ��ܽ���LU�ֽ⣡A�������£�'),RA,h1=det(A);
    L=0;U=0;x=0;
    return
end

if RA==n
    for p=1:n
        h(p)=det(A(1:p,1:p));
    end
    h1=h(1:n);
    for i=1:n
        if h(1,i)==0
            disp('��ע�⣬��ΪA��r������ʽΪ0�����Բ��ܽ���LU�ֽ⣬A���Ⱥ͸���˳������ʽh1���£�'),h1;RA
            return
        end
    end
    if h(1,i)~=0
        disp('��ע�⣬��ΪA�ĸ���˳������ʽ��������0�����A�ܽ���LU�ֽ�!')
        for j=1:n
            U(1,j)=A(1,j);
        end
        
        for k=2:n
            for i=2:n
                for j=2:n
                    L(1,1)=1;
                    L(i,i)=1;
                    if i>j
                        L(1,1)=1;
                        L(2,1)=A(2,1)/U(1,1);
                        L(i,1)=A(i,1)/U(1,1);
                        L(i,k)=(A(i,k)-L(i,1:k-1)*U(1:k-1,k))/U(k,k);
                    else
                        U(k,j)=A(k,j)-L(k,1:k-1)*U(1:k-1,j);
                    end
                end
            end
        end
        h1;
%         RA,U,L
        U1=pinv(U);
        L1=pinv(L);
        X=U1*L1*b;
        x=A\b;
    end
end




end

