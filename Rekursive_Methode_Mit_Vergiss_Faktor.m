function [mess_rausch,w, K, cov_matrix] = Rekursive_Methode_Mit_Vergiss_Faktor(theta, X,output_y,cov_matrix,iteration,lambda)
    disp('iteration anzahl: ' + (iteration));
    %disp("error e Matrix: ")
    mess_rausch(iteration) = output_y(iteration) - X'*theta;
    K = cov_matrix * X * inv(eye*lambda + X'*cov_matrix*X);
    %disp("Parameter filter Matrix: ")
    theta = theta+ K*mess_rausch(iteration);
    %disp("Kovarianz Matrix")
    cov_matrix = (cov_matrix - K*X'*cov_matrix)/lambda;
    w = theta;
end