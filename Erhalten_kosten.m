function [e,J] = Erhalten_kosten(output_y, w, X, N, M, lambda, i)
    e(i) = output_y(i) - w'*X;
    J(i) = lambda^(N-M-i)*e(i)^2;
end