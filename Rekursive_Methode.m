function [e,w, K, cov_matrix] = Rekursive_Methode(theta, X,output_y,cov_matrix,iteration)
    disp('iteration anzahl: ' + (iteration));
    %disp("error e Matrix: ")
    e(iteration) = output_y(iteration) - X'*theta;
    K = cov_matrix * X * inv(eye + X'*cov_matrix*X);
    %disp("Parameter filter Matrix: ")
    theta = theta+ K*e(iteration);
    %disp("Kovarianz Matrix")
    cov_matrix = cov_matrix - K*X'*cov_matrix;
    w = theta;
end