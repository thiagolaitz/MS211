%Projeto 04 - Thiago laitz - Henrique Weber
load DadosTreinamento.mat
clc

%parametros dos dados
d = 30; %quantidade de funções para cada paciente
m = 393; %quantidade de pacientes
n=20; 

%Parâmetros W e b:
%W = randn(n,d);
%b = randn(n,1);
%save W.mat
%Save b.mat
load W.mat
load b.mat

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
L = -0.8;%Limiar da função
maligno = 0;%quantidade de maligno
acerto_tfn = 0;%quantidade de diagnósticos corretos
errado_tfn = 0;%quantidade de falso benigno(maligno e o sistema diz que é benigno)
disp("Analisando os dados de treinamento: \n")

%Encontra os dados para o TFN
for i = 1:m
  if(ytr(1,i) == (1))%se for maligno
    if(phi(1,i) < L)%rede neural aponta como benigno
      errado_tfn = errado_tfn + 1;
    endif 
    maligno = maligno + 1;
  endif
endfor

tfn = errado_tfn/maligno
errado_tfn
maligno

%Calculando os dados para o AC
acerto_ac = 0;

for i = 1:m
  if(phi(1,i) > L)%caso maligno
    if(ytr(1,i) == (1))
      acerto_ac = acerto_ac + 1;
    endif
  endif
  if(phi(1,i) < L)%caso benigno
    if(ytr(1,i) == (-1))
      acerto_ac = acerto_ac + 1;
    endif
  endif
endfor
ac = acerto_ac / m
acerto_ac
erros = m - acerto_ac

%Analisando os dados de teste: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = 176;
disp("\n Analisando os dados de teste: \n")

for k = 1:m
  phi_te(1,k) = RNA(coeficientes,W,b,Xte(:,k));
endfor

%Calculando o número de acertos
L = -0.65;%Limiar da função
maligno = 0;%quantidade de maligno
acerto_tfn = 0;%quantidade de diagnósticos corretos
errado_tfn = 0;%quantidade de falso benigno(maligno e o sistema diz que é benigno)

%Encontra os dados para o TFN
for i = 1:m
  if(yte(1,i) == (1))%se for maligno
    if(phi_te(1,i) < L)%rede neural aponta como benigno
      errado_tfn = errado_tfn + 1;
    endif 
    maligno = maligno + 1;
  endif
endfor

tfn = errado_tfn/maligno
errado_tfn
maligno

%Calculando os dados para o AC
acerto_ac = 0;

for i = 1:m
  if(phi_te(1,i) > L)%caso maligno
    if(yte(1,i) == (1))
      acerto_ac = acerto_ac + 1;
    endif
  endif
  if(phi_te(1,i) < L)%caso benigno
    if(yte(1,i) == (-1))
      acerto_ac = acerto_ac + 1;
    endif
  endif
endfor
ac = acerto_ac / m
acerto_ac
erros = m - acerto_ac
