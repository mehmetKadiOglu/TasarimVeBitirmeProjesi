function [levy] = Levy()

    levy = 10000;
    %1.5
    while levy > 2
        B = 0.0001 + rand*(2-0.0001);
        r1 = rand;
        r2 = ( rand ^ (1/B) );

        hPay = ( (gamma(1+B)) * sin( (pi*B)/2 ) );
        hPayda = ( (gamma( (1+B)/2 )) * (B*( 2^( (B-1)/2) )) );

        h1 = (hPay/hPayda);
        h = h1^(1/B);

        levy = 0.01*( (r1*h)/(r2));
    end



%x=xmin+rand(1,n)*(xmax-xmin);
end
















