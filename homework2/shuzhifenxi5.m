function ex35
    x=linspace(-5,5,41);
    y=1./(1+x.^2);
    y=[5/388 y -5/388];
    pp=csape(x,y,'complete');
    v=linspace(-5,5,100);
    f=1./(1+v.^2);
    s=ppval(pp,v);
    plot(v,f,'b-',v,s,'g:');


end




