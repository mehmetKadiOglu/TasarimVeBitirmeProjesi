% Rewritten by H. YAPICI
function f=ackley(x)
    
d = 30;



for i = 1:d
	ft(i)=(x(i).^2);
    ff(i)=cos((2*pi).*x(i));
end
ftt=sum(ft);
fff=sum(ff);
f=-20.*exp(-0.2.*sqrt((1/d).*ftt))-exp((1/d).*fff) ...
        +20+exp(1);

