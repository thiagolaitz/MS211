%Resolvendo o sistema linear pelo método de Gauss-Seidel:
clear all
clc

A = [2 3 4;1 7 2; 1 2 4];
b = [28;36;20];
%resposta = [4;4;2]
[n,n] = size(A);
L = tril(A); %
U = eye(n);
iter = 0;
x0 = zeros(3,1);
r = b - A * x0;
r0 = norm(r);
erro = norm (r);
x = x0

while erro > 0.000001 & iter < 1000
  iter = iter + 1;
  z = L\r;
  z = U\z;
  x = x + z;
  r = b - A*x;
  erro = norm (r) / r0;
endwhile

x
