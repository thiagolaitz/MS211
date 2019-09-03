clear all
clc
load DadosProjeto1_TurmaM.mat

d = zeros(98,98); %Matriz dos coeficientes do sistema linear
b = zeros(98,1); %matriz coluna do sistema linear AX = B
p = zeros(98,98); %matriz de probabilidade
q = zeros(98,1); %Matriz coluna para guardar a quantidade de pessoas conhecidas
alfa = 0.85; %fator de amortecimento

%O primeiro passo é determinar a quantidade de pessoas conhecidas:
for j = 1:98
 for k = 1:98
   
  if (A(j,k) == 1)
    q(j,1) = q(j,1) .+ 1; %salva o numero de conhecidos de j
  endif 
  
 endfor
endfor

%Agora devemos calcular as probabilidades:
for i = 1:98
  for j = 1:98
    
    if (q(j,1) != 0) %Sendo q(j,1) o numero de pessoas que j conhece
      p(i,j) = (A(j,i)/q(j,1));
    else
      p(i,j) = 1/98;
    endif
    
  endfor
endfor

%Ajustando a matriz do sistema Linear:

%Ajustando a matriz B:
for q = 1:98
  b(q,1) = (1-alfa)*(1/98);
endfor

%Calculando a matriz dos coeficientes D:
for i = 1:98
  for j = 1:98
    
    if (i == j)
      d(i,j) = p(i,j)*alfa - 1;
    else
      d(i,j) = p(i,j)*alfa;
    endif
    
  endfor
endfor
b
d
