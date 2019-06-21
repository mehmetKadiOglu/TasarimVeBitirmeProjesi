% Rewritten by H. YAPICI
function y=Griewank(x)
 for i=1:20
     a(i)=x(i).^2;
 end
 for i=1:20
     b(i)=cos(x(i)./sqrt(i));
 end
 y1=sum(a);
 y2=prod(b);
 y=y1./4000-y2+1;