clear all
clc
load DadosProjeto1_TurmaM.mat


p = zeros(98,98); %matriz de probabilidade
q = zeros(98,1); %Matriz coluna para guardar a quantidade de pessoas conhecidas
alfa = 0.1; %fator de amortecimento

%O primeiro passo é determinar a quantidade de pessoas conhecidas

for j = 98
 for k = 98
 
  if (A(j,k) == 1)
    q(j,1) = q(j,1) + 1 %salva o numero de conhecidos
  endif
 
 endfor
endfor

q
%Agora
%for i = 98
 % 
  %for j = 98
    
    
  %end for
  
%endfor
