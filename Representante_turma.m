clear all
clc
load DadosProjeto1_TurmaM.mat

p = zeros(98,98); %matriz de probabilidade
q = zeros(98,1); %Matriz coluna para guardar a quantidade de pessoas conhecidas
alfa = 0.1; %fator de amortecimento

%O primeiro passo é determinar a quantidade de pessoas conhecidas:
for j = 1:98
 for k = 1:98
   
  if (A(j,k) == 1)
    q(j,1) = q(j,1) .+ 1; %salva o numero de conhecidos
  endif 
  
 endfor
endfor

%Agora devemos calcular as probabilidades:
for i = 1:98
  for j = 1:98
    
    if (q(i,1) != 0)
      p(i,j) = A(j,i)/q(i,1);
    else
      p(i,j) = 1/98;
    endif
    
  endfor
endfor

%Resolvendo o sistema Linear:
