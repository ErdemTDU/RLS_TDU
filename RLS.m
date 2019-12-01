function [e,w,P] = RLS(x,y,h)
    
    [M,w,P] = FaltungFIR(y,h,x);
    
    x = x(:);
    y = y(:);


    N = length(x);  

    e = y;

    for n = M:N
            xvektor = x(n:-1:n-M+1);
            disp('X issssss.....');

            e(n) = y(n) - w'*xvektor;

            G = P*xvektor;

            w = w + G*e(n);

            P = P-(G*xvektor'*P) / (1+xvektor'*G);
    end

end