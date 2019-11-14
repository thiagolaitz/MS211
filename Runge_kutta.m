clc
clear all
#O primeiro passo é resolver o sistema de EDO's pelo método de Runge Kutta de 4 Ordem

h = 0.1; #passo de 0.1
dif1 = 14; #distância inicial até o carro à frente do analisado
dif2 = 4; 
dif3 = 8;
dif4 = 5;
a = 1;
v_max = (50/3.6);#velocidade max permitida
s = 42;#Distância de segurança
iter = 0;#Calcula o número e iterações

batida = [0,0,0,0]#flag para indicar uma batida
aux1 = 0;#variavel auxiliar para encontrar a primeira batida

v_max1 = 0;
v_max2 = 0;#Variáveis para guardar a velocidade máxima de cada carro
v_max3 = 0;
v_max4 = 0;

#-------------------------------LOOP DE ITERAÇÕES-----------------------------------------
x01 = 0;
z01 = 0;
p01 = -14;

x02 = 0;
z02 = 0;
p02 = -18;

x03 = 0;
z03 = 0;
p03 = -26;

x04 = 0;
z04 = 0;
p04 = -31;

while p04 < 1700

  iter = iter + 1;

  #Calculando para o primeiro carro: x(0) = -14 // v(0) = 0
  v = (v_max/2)*(tanh((dif1 - s)/20) + tanh(4));#Calcula V(Delta X)

  #Agora podemos calcular K1,k2,k3,k4:

  z = z01;
  p = x01;
  k1 = [a*(v - z) ; z]; #(Z,P)

  x = x01 + h/2;
  z = z01 + k1(1,1)*h/2;
  p = p01 + k1(2,1)*h/2;
  k2 = [a*(v - z) ; z];

  x = x01 + h/2;
  z = z01 + k2(1,1)*h/2;
  p = p01 + k2(2,1)*h/2;
  k3 = [a*(v - z) ; z];

  x = x01 + h;
  z = z01 + k3(1,1)*h;
  p = p01 + k3(2,1)*h;
  k4 = [a*(v - z) ; z];

  #Calculando a Velocidade e posição no momento seguinte x(i+1) do carro 1
  disp("\n");
  z_edo1 = z01+ (h/6)*(k1(1,1)+2*k2(1,1)+ 2*k3(1,1) + k4(1,1)) #Z_edo = Velocidade do carro no momento seguinte
  p_edo1 = p01 + (h/6)*(k1(2,1)+2*k2(2,1)+ 2*k3(2,1) + k4(2,1)) #P_edo = Posição do carro no momento seguinte

  x01 = x01 + h;
  p01 = p_edo1;
  z01 = z_edo1;

  ##################################################################################

  #Calculando para o segundo carro: x(0) = -18 // v(0) = 0
  v = (v_max/2)*(tanh((dif2 - s)/20) + tanh(4));#Calcula V(Delta X)

  #Agora podemos calcular K1,k2,k3,k4:

  z = z02;
  p = x02;
  k1 = [a*(v - z) ; z]; #(Z,P)

  x = x02 + h/2;
  z = z02 + k1(1,1)*h/2;
  p = p02 + k1(2,1)*h/2;
  k2 = [a*(v - z) ; z];

  x = x02 + h/2;
  z = z02 + k2(1,1)*h/2;
  p = p02 + k2(2,1)*h/2;
  k3 = [a*(v - z) ; z];

  x = x02 + h;
  z = z02 + k3(1,1)*h;
  p = p02 + k3(2,1)*h;
  k4 = [a*(v - z) ; z];

  #Calculando a Velocidade e posição no momento seguinte x(i+1) do carro 2
  disp("\n");
  z_edo2 = z02 + (h/6)*(k1(1,1)+2*k2(1,1)+ 2*k3(1,1) + k4(1,1)) #Z_edo = Velocidade do carro no momento seguinte
  p_edo2 = p02 + (h/6)*(k1(2,1)+2*k2(2,1)+ 2*k3(2,1) + k4(2,1)) #P_edo = Posição do carro no momento seguinte

  x02 = x02 + h;
  p02 = p_edo2;
  z02 = z_edo2;

  ##################################################################################

  #Calculando para o terceiro carro: x(0) = -18 // v(0) = 0
  v = (v_max/2)*(tanh((dif3 - s)/20) + tanh(4));#Calcula V(Delta X)

  #Agora podemos calcular K1,k2,k3,k4:

  z = z03;
  p = x03;
  k1 = [a*(v - z) ; z]; #(Z,P)

  x = x03 + h/2;
  z = z03 + k1(1,1)*h/2;
  p = p03 + k1(2,1)*h/2;
  k2 = [a*(v - z) ; z];

  x = x03 + h/2;
  z = z03 + k2(1,1)*h/2;
  p = p03 + k2(2,1)*h/2;
  k3 = [a*(v - z) ; z];

  x = x03 + h;
  z = z03 + k3(1,1)*h;
  p = p03 + k3(2,1)*h;
  k4 = [a*(v - z) ; z];

  #Calculando a Velocidade e posição no momento seguinte x(i+1) do carro 3
  disp("\n");
  z_edo3 = z03 + (h/6)*(k1(1,1)+2*k2(1,1)+ 2*k3(1,1) + k4(1,1)) #Z_edo = Velocidade do carro no momento seguinte
  p_edo3 = p03 + (h/6)*(k1(2,1)+2*k2(2,1)+ 2*k3(2,1) + k4(2,1)) #P_edo = Posição do carro no momento seguinte

  x03 = x03 + h;
  p03 = p_edo3;
  z03 = z_edo3;

  ##################################################################################

  #Calculando para o quarto carro: x(0) = -18 // v(0) = 0
  v = (v_max/2)*(tanh((dif4 - s)/20) + tanh(4));#Calcula V(Delta X)

  #Agora podemos calcular K1,k2,k3,k4:

  z = z04;
  p = x04;
  k1 = [a*(v - z) ; z]; #(Z,P)

  x = x04 + h/2;
  z = z04 + k1(1,1)*h/2;
  p = p04 + k1(2,1)*h/2;
  k2 = [a*(v - z) ; z];

  x = x04 + h/2;
  z = z04 + k2(1,1)*h/2;
  p = p04 + k2(2,1)*h/2;
  k3 = [a*(v - z) ; z];

  x = x04 + h;
  z = z04 + k3(1,1)*h;
  p = p04 + k3(2,1)*h;
  k4 = [a*(v - z) ; z];

  #Calculando a Velocidade e posição no momento seguinte x(i+1) do carro 4
  disp("\n");
  z_edo4 = z04 + (h/6)*(k1(1,1)+2*k2(1,1)+ 2*k3(1,1) + k4(1,1)) #Z_edo = Velocidade do carro no momento seguinte
  p_edo4 = p04 + (h/6)*(k1(2,1)+2*k2(2,1)+ 2*k3(2,1) + k4(2,1)) #P_edo = Posição do carro no momento seguinte

  #Calculando a posição do onibus:
  t = iter * h;#Calcula o tempo decorrido
  disp("\n");
  onibus = 8*t - 90*sin(0.1*t)

  #Atualizando os parâmetros difs:
  dif1 = onibus - p_edo1;
  dif2 = p_edo1 - p_edo2; 
  dif3 = p_edo2 - p_edo3;
  dif4 = p_edo3 - p_edo4;

  #Verificando se acontece algum acidente:
  if ((dif1 <= 0) && (aux1 == 0))
      aux1 = 1
      batida(1,1) = 1#indica q ocorreu a primeira batida
      tempo = iter*h#indica quando ocorreu a primeira batida
      aux = dif1#indica o valor de dif1
  endif

  if (dif2 <= 0)
    batida(1,2) = 1
  endif

  if (dif3 <= 0)
    batida(1,3) = 1
  endif

  if (dif4 <= 0)
    batida(1,4) = 1
  endif

  x04 = x04 + h;
  p04 = p_edo4;
  z04 = z_edo4;
  
  #Verificando a velocidade média de cada carro:
  
  if(z01 > v_max1) 
    v_max1 = z01;
  endif
  
  if(z02 > v_max2) 
    v_max2 = z02;
  endif
  
  if(z03 > v_max3) 
    v_max3 = z03;
  endif
  
  if(z04 > v_max4) 
    v_max4 = z04;
  endif

  
 #Armazenado as distancia percorridas por cada carro em vetores

G1(iter+1)= p01+14;
G2(iter+1)= p02+18;
G3(iter+1)= p03+26;
G4(iter+1)= p04+31;

#Armazenado as vlocidades instantaneas por cada carro em vetores

H1(iter+1)= z01;
H2(iter+1)= z02;
H3(iter+1)= z03;
H4(iter+1)= z04;
endwhile

disp("\nTempo decorrido = ")
iter * h

batida
#tempo
#aux

disp("\n");
v_max1
v_max2
v_max3
v_max4

#Calculando as velocidades médias:
disp("\n");
v_m1 = ((p01 + 14) / (iter*h))*3.6
v_m2 = ((p02 + 18) / (iter*h))*3.6
v_m3 = ((p03 + 26) / (iter*h))*3.6
v_m4 = ((p04 + 31) / (iter*h))*3.6

#Gráfico tempo X distancia percorrida 

t=0:0.1:237.3;
G1;
G2;
G3;
G4;
plot(t,G1,t,G2,t,G3,t,G4)
title("Gráfico - Tempo X Distância percorrida ")
xlabel("Tempo(s)")
ylabel("Distância(m)")
figure
hold on
#Gráfico tempo X velocidades instantaneas

H1;
H2;
H3;
H4;
plot(t,H1,t,H2,t,H3,t,H4)
title("Gráfico - Tempo X Velocidade Instantânea")
xlabel("Tempo(s)")
ylabel("Velocidade isntantanea (m/s)")


