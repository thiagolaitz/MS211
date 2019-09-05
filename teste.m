%Resolvendo o sistema linear pelo método de Gauss-Seidel:
clear all
clc

A = [2 3 4;1 7 2; 1 2 4]
b = [28;36;20]
%resposta = [2;4;3]
x_zero = zeros(3,1);%Matriz coluna com os valores iniciais
k_max = 5;%número máximo de interações
tolerancia = 0.001;
dr = tolerancia + 1;
[L, U] = lu(A);%Fatoração LU da matriz A
k = 0;%variavel para contagem das interações

while k <= k_max
  k = k + 1;
  x = L\(b - U*x_zero)
  aux = x - x_zero;
  dr = (norm(aux,inf))/(norm(x,inf));
  x_zero = x;
endwhile

x_zero
