h = 0.5.^([0:4]);
input_x = randn(1000,1);
output_y = conv(input_x,h);
M = length(h);
delta = 1;
lambda = 0.9;
[mess_rausch,w, K, cov_matrix] = Erhalten_Rekursive_Verfahren(M,input_x,output_y,lambda,delta);

J = 0;
[e,J] = Erhalten_Kosten(J,input_x,output_y, w, M, lambda);

