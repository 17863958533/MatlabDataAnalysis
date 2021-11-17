function y = ex32
    
    n=21;
%     x=linspace(-5,5,n)';
    x=5*cos(pi/(n-1)*(0:n-1)');
    h=(5-(-5))/(n-1);
    y=1./(1+x.^2);
    
    for j=2:n
        y(1:n+1-j,j)=diff(y(1:n+2-j,j-1))./(x(j:n)-x(1:n+1-j));
    end
    
    y=y(1,:);
    pz=[ ];
    v=linspace(-5,5,80);
    for t=v
        z=y(n);
        for j=n-1:-1:1
            z=z*(t-x(j))+y(j);
        end
        pz=[pz z];
    end
    
    plot(v,pz,'r+-',v,1./(1+v.^2),'g--');

end


