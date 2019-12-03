function [mess_rausch,w, K, cov_matrix] = Erhalten_Rekursive_Verfahren(M,input_x,output_y,lambda,delta)
    
%   RLS funktion für Prädiktion von Filterparameter 
%   theta       : Parametermatrix alsauch ist gleich zu w matrix
%   input_x     : Systemmatrix
%   output_y    : Ausgang von Faltung
%   M           : Laenge von Filtermatrix
%   lambda      : Vergissfaktor / Forgettingfaktor
%   mess_rausch : Rauschmatrix von Messung
%   K           : Verstärkung
%   cov_matrix  : Kovarianzmatrix
%   w           : Prädiktion von Filtermatrix
    
    theta = zeros(M,1);
    cov_matrix = eye(M)/delta;
    output_y = output_y(:);
    input_x = input_x(:);    
    N = length(input_x);
    mess_rausch = output_y;
    
    for iteration = M:N
        X = input_x(iteration:-1:iteration-M+1);
        %disp("error e Matrix: ")
        mess_rausch(iteration) = output_y(iteration) - X'*theta;
        K = lambda^(-1)*cov_matrix * X / (1 + lambda^(-1)*X'*cov_matrix*X);
        %disp("Parameter filter Matrix: ")
        theta = theta+ K*conj(mess_rausch(iteration));
        %disp("Kovarianz Matrix")
        cov_matrix = (cov_matrix - K*X'*cov_matrix)*lambda^(-1);
        w = theta;
    end
end