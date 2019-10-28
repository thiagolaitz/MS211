%Projeto 04 - Thiago laitz - Henrique Weber
load DadosTreinamento.mat
clc

%parametros dos dados
d = 30; %quantidade de funções para cada paciente
m = 393; %quantidade de pacientes
n=20; 

%Parâmetros W e b:
W = randn(n,d);
b = randn(n,1);

%Matriz utilizada para descobrir os coeficientes alfa:
G = tanh(W*Xtr + b); %(20x393)

%Encontrando os parâmetros da rede neural pelo método dos mínimos quadrados:
%Para isso, faremos o sistema linear B*Alfa = D

%Encontrando a matriz B:
B = zeros(n,n);

for i = 1:n%Varia a linha
  for j = 1:n %varia a coluna
   soma = 0;
   for k = 1:m %responsável pela soma das funções(precisa percorrer as colunas)
      soma = soma + G(i,k) * G(j,k);
    endfor
   B(i,j) = soma;
  endfor
endfor

%Encontrando a matriz D;
D =  zeros(n,1);

for i = 1:n
  soma = 0;
  for j = 1:m
    soma = soma + ytr(1,j)*G(i,j);
  endfor
  D(i,1) = soma;
endfor

%Resolvendo o sistema linear B*alfa = D
coeficientes = B\D;

%Encontrando a rede neural a partir do arquivo RNA:
for k = 1:m
 
%Resultado s = αT G
