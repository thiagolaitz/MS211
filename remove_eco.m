[y,fs] = audioread('AudioEco.wav'); %Carrega o sinal digital

clc

'''
N = length(y);
plot([0:N-1]/fs,y);
axis([0 15 -1 1]);
grid
'''

%X(i) = y(i) - y(i-1)

A = zeros(120000,1);%matriz com os valores de X

for i = 1:120000
  
  if ((i > 8000) && (i < 16000))
    A(i,1) = y((i-8000),1);
  endif
  
  if (i < 8000)
    A(i,1) = y(i,1);
  endif
  
  if (i > 16000)
    A(i,1) = y((i-8000),1) - y((i-16000),1);
  endif 
  
endfor

N = length(A);
plot([0:N-1]/fs,A);
axis([0 15 -1 1]);
grid

[A,fs] = sound(A,fs);
