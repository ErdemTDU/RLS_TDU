h = 0.5.^([0:4]);
x = randn(1000,1);
y = conv(x,h);
M = length(h);
w = zeros(M,1);
delta = 1;
cov_matrix = eye(M)/1;
theta = w;
theta_speicher = zeros(M,1);
N = length(x);
output_y = y(:);
x = x(:);
e = output_y;
lambda = 0.9;
Error_matrix = zeros(1,M);
J_matrix = zeros(N-M,1);
NMSE_Matrix = zeros(50000,1);
for i = M:N
   
    X = x(i:-1:i-M+1);
    [mess_rausch,w, K, cov_matrix] = rekursive_methode_mit_vergiss_faktor(theta, X,output_y,cov_matrix,i,lambda); % mit vergiss faktor
    theta_speicher(i) = w(1); %Muss annaehern zu filter parameter h(:)
    theta_speicher(i+1) = w(2); %Muss annaehern zu filter parameter h(:)
    theta_speicher(i+2) = w(3); %Muss annaehern zu filter parameter h(:)
    theta_speicher(i+3) = w(4); %Muss annaehern zu filter parameter h(:)
    [e,J] = Erhalten_kosten(output_y, w, X, N, M, lambda, i); % Anrufen Kostenfunktion
    J_matrix(i) = J(i); % Güte kriterium
    Guete_kriterium = (1/(N-M))*sum(J_matrix); % Güte kriterium
    sum(mess_rausch); % Summation von Messrausch
    
    
end
%
for iter = 1:length(h)
    [error,NMSE] = Mean_Squared_Error(h, w, iter); % Performance Kriterium von Filter matrix und geschätzte Filter
    Error_matrix(iter) = error(iter); % Speichern von Errormatrix
       
end
summation_error_with_vergiss_faktor = sum(Error_matrix(:));
NMSE_as_log_with_vergiss = 10*log(summation_error_with_vergiss_faktor);