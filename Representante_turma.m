clear all
clc
load DadosProjeto1_TurmaM.mat

d = zeros(98,98); %Matriz dos coeficientes do sistema linear
b = zeros(98,1); %matriz coluna do sistema linear DX = B
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
      d(i,j) = 1 - alfa*p(i,j);
    else
      d(i,j) = (-1)*p(i,j)*alfa;
    endif
    
  endfor
endfor

%Resolvendo o sistema linear pelo metodo de Gauss - Seidel

[n,n] = size(d); %n = tamanho da matriz D nxn
L = tril(d); % L = matriz triangular inferior de A
U = eye(n); %
iter = 0;
x0 = zeros(98,1);
r = b - d * x0;
r0 = norm(r);
erro = norm (r);
x = x0;

while erro > 0.0001 & iter < 50
  iter = iter + 1;
  z = L\r;
  z = U\z;
  x = x + z;
  r = b - d*x;
  erro = norm (r) / r0;
endwhile

x;
aux = 0;
numero = 0;
aux2 = 0;
numero2 = 0;

%Encontrando os RAs com maior representação:
for i = 1:98
  if aux <= x(i,1)
    aux = x(i,1);
    numero = i;
  endif
endfor

for i = 1:98
  if i != numero
    if aux2 < x(i,1)
      aux2 = x(i,1);
      numero2 = i;
    endif
  endif
endfor

disp("\n\nItem A)\n")
disp("Representante da turma:") 
RA{numero}
disp("Vice representante da turma:")
RA{numero2}


disp("\n\nItem B)\n")

%Ajustando o valor de Vi:
%Thiago Soares Laitz - 224898 - RA{64}
%Henrique Weber Soeiro - 236655 - RA{63}

v = zeros(98,1);

for i = 1:98
  if i == 64
    v(i,1) = 30/156;
    b(i,1) = (1-alfa)*v(i,1);
  elseif i == 63
    v(i,1) = 30/156;
    b(i,1) = (1-alfa)*v(i,1);
  else    
    v(i,1) = 1/156; %156 = 96*1 + 30*2 = peso total
    b(i,1) = (1-alfa)*v(i,1);
  endif
endfor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%resolvendo o novo sistema linear dx = b:

[n,n] = size(d); %n = tamanho da matriz D nxn
L = tril(d); % L = matriz triangular inferior de A
U = eye(n); %
iter = 0;
x0 = zeros(98,1);
r = b - d * x0;
r0 = norm(r);
erro = norm (r);
x = x0;

while erro > 0.0001 && iter < 50
  iter = iter + 1;
  z = L\r;
  z = U\z;
  x = x + z;
  r = b - d*x;
  erro = norm (r) / r0;
endwhile

aux = 0;
numero = 0;
aux2 = 0;
numero2 = 0;

%Encontrando os RAs com maior representação:
for i = 1:98
  if aux <= x(i,1)
    aux = x(i,1);
    numero = i;
  endif
endfor

for i = 1:98
  if i != numero
    if aux2 < x(i,1)
      aux2 = x(i,1);
      numero2 = i;
    endif
  endif
endfor

disp("Representante da turma:") 
RA{numero}
disp("Vice representante da turma:")
RA{numero2}

%Analisando a qualidade da solução 

%--> Cáculo do Residuo Absuluto

K = b-d*x;

Ra = norm(K)

%--> Calculo do Residuo Realtivo

w=norm(b);

Rr= Ra/w

%--> Condicionamneto do sistema 

condici = cond(d);

condici
