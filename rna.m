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

%Testando o modelo encontrado:
load DadosTeste.mat

%Estudando a rede Neural com os dados de treinamento:
for k = 1:m
  phi(1,k) = RNA(coeficientes,W,b,Xtr(:,k));
endfor

%Calculando o número de acertos
L = 2;%Limiar da função


