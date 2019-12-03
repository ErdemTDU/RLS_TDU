function [e,J] = Erhalten_Kosten(J,input_x,output_y, w, M, lambda)

%   J        : Gütekriterium als initialwert ist 0
%   e        : Rauschmatrix für Gütekriterium
%   lambda   : Forgettingfaktor
%   output_y : Ausgangsmatrix von Faltung
%   w        : Prädikted Parametermatrix
%   M        : Länge von Filtermatrix
   

N = length(input_x);

    for i = M:N
        X = input_x(i:-1:i-M+1);
        e(i) = output_y(i) - w'*X;
        J = J + lambda^(N-M-i)*e(i)^2;
    end
end