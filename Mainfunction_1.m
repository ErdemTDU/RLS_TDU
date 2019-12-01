h = 0.5.^([0:4]);
x = randn(1000,1);
y = conv(x,h);
M = length(h);
w = zeros(M,1);
delta = 1;
cov_matrix = eye(M)/1;
w = w;
theta_speicher = zeros(M,1);
N = length(x);
output_y = y(:);
x = x(:);
e = output_y;
lambda = 0.9;
Error_matrix = zeros(1,M);
J = zeros(N-M,1);
for n = M:N   
    
    X = x(n:-1:n-M+1);
    [e,w, K, cov_matrix] = rekursive_methode(w, X,output_y,cov_matrix,n);
    theta_speicher(n) = w(1); %Muss annaehern zu filter parameter h(:)
    theta_speicher(n+1) = w(2); %Muss annaehern zu filter parameter h(:)
    theta_speicher(n+2) = w(3); %Muss annaehern zu filter parameter h(:)
    theta_speicher(n+3) = w(4); %Muss annaehern zu filter parameter h(:)
    
end
for iterasyon = 1:5
    [error,NMSE] = Mean_Squared_Error(h, w, iterasyon);
    Error_matrix(iterasyon) = error(iterasyon);
       
end
summation_error = sum(Error_matrix(:));
NMSE_as_log = 10*log(summation_error);

e = e(N);