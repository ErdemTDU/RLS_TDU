function [M,w,P] = FaltungFIR(y,h,x)
    delta = 1;   
    M = length(h);
    w = zeros(M,1);
    P = eye(M)/delta;

end



