function [error,NMSE] = Mean_Squared_Error(h, w, i)
    error(i) = h(i) - w(i);
    NMSE = abs(error(i))^2/abs(h(i))^2;
end