% Rewritten by H. YAPICI

function z=Rosen(x)
    for i=1:19
        a(i)=(100.*(((x(i+1)-x(i).^2)).^2)+(x(i)-1).^2);
    end
    z=sum(a);
end