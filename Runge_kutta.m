clc
clear all
#O primeiro passo é resolver o sistema de EDO's pelo método de Runge Kutta de 4 Ordem

h = 0.1; #passo de 0.1
dif1 = 14; #distância inicial até o carro à frente do analisado
dif2 = 4; 
dif3 = 8;
dif4 = 5;
a = 1;
v_max = 50;#velocidade max permitida
s = 42;#Distância de segurança
iter = 0;#Calcula o número e iterações

#-------------------------------LOOP DE ITERAÇÕES-----------------------------------------
for i = 1:5

iter = iter + 1;

#Calculando para o primeiro carro: x(0) = -14 // v(0) = 0
v = (v_max/2)*(tanh((dif1 - s)/20) + tanh(4));#Calcula V(Delta X)

#Agora podemos calcular K1,k2,k3,k4:
x0 = -14;
z0 = 0;
p0 = x0;

z = z0;
p = x0;
k1 = [a*(v - p) ; z]; #(Z,P)

x = x0 + h/2;
z = z0 + k1(1,1)*h/2;
p = p0 + k1(2,1)*h/2;
k2 = [a*(v - p) ; z];

x = x0 + h/2;
z = z0 + k2(1,1)*h/2;
p = p0 + k2(2,1)*h/2;
k3 = [a*(v - p) ; z];

x = x0 + h;
z = z0 + k3(1,1)*h;
p = p0 + k3(2,1)*h;
k4 = [a*(v - p) ; z];

#Calculando a Velocidade e posição no momento seguinte x(i+1) do carro 1
disp("\n");
z_edo1 = z0 + (h/6)*(k1(1,1)+2*k2(1,1)+ 2*k3(1,1) + k4(1,1)) #Z_edo = Velocidade do carro no momento seguinte
p_edo1 = p0 + (h/6)*(k1(2,1)+2*k2(2,1)+ 2*k3(2,1) + k4(2,1)) #P_edo = Posição do carro no momento seguinte

##################################################################################

#Calculando para o segundo carro: x(0) = -18 // v(0) = 0
v = (v_max/2)*(tanh((dif2 - s)/20) + tanh(4));#Calcula V(Delta X)

#Agora podemos calcular K1,k2,k3,k4:
x0 = -18;
z0 = 0;
p0 = x0;

z = z0;
p = x0;
k1 = [a*(v - p) ; z]; #(Z,P)

x = x0 + h/2;
z = z0 + k1(1,1)*h/2;
p = p0 + k1(2,1)*h/2;
k2 = [a*(v - p) ; z];

x = x0 + h/2;
z = z0 + k2(1,1)*h/2;
p = p0 + k2(2,1)*h/2;
k3 = [a*(v - p) ; z];

x = x0 + h;
z = z0 + k3(1,1)*h;
p = p0 + k3(2,1)*h;
k4 = [a*(v - p) ; z];

#Calculando a Velocidade e posição no momento seguinte x(i+1) do carro 2
disp("\n");
z_edo2 = z0 + (h/6)*(k1(1,1)+2*k2(1,1)+ 2*k3(1,1) + k4(1,1)) #Z_edo = Velocidade do carro no momento seguinte
p_edo2 = p0 + (h/6)*(k1(2,1)+2*k2(2,1)+ 2*k3(2,1) + k4(2,1)) #P_edo = Posição do carro no momento seguinte

##################################################################################

#Calculando para o terceiro carro: x(0) = -18 // v(0) = 0
v = (v_max/2)*(tanh((dif3 - s)/20) + tanh(4));#Calcula V(Delta X)

#Agora podemos calcular K1,k2,k3,k4:
x0 = -26;
z0 = 0;
p0 = x0;

z = z0;
p = x0;
k1 = [a*(v - p) ; z]; #(Z,P)

x = x0 + h/2;
z = z0 + k1(1,1)*h/2;
p = p0 + k1(2,1)*h/2;
k2 = [a*(v - p) ; z];

x = x0 + h/2;
z = z0 + k2(1,1)*h/2;
p = p0 + k2(2,1)*h/2;
k3 = [a*(v - p) ; z];

x = x0 + h;
z = z0 + k3(1,1)*h;
p = p0 + k3(2,1)*h;
k4 = [a*(v - p) ; z];

#Calculando a Velocidade e posição no momento seguinte x(i+1) do carro 3
disp("\n");
z_edo3 = z0 + (h/6)*(k1(1,1)+2*k2(1,1)+ 2*k3(1,1) + k4(1,1)) #Z_edo = Velocidade do carro no momento seguinte
p_edo3 = p0 + (h/6)*(k1(2,1)+2*k2(2,1)+ 2*k3(2,1) + k4(2,1)) #P_edo = Posição do carro no momento seguinte

##################################################################################

#Calculando para o terceiro carro: x(0) = -18 // v(0) = 0
v = (v_max/2)*(tanh((dif4 - s)/20) + tanh(4));#Calcula V(Delta X)

#Agora podemos calcular K1,k2,k3,k4:
x0 = -31;
z0 = 0;
p0 = x0;

z = z0;
p = x0;
k1 = [a*(v - p) ; z]; #(Z,P)

x = x0 + h/2;
z = z0 + k1(1,1)*h/2;
p = p0 + k1(2,1)*h/2;
k2 = [a*(v - p) ; z];

x = x0 + h/2;
z = z0 + k2(1,1)*h/2;
p = p0 + k2(2,1)*h/2;
k3 = [a*(v - p) ; z];

x = x0 + h;
z = z0 + k3(1,1)*h;
p = p0 + k3(2,1)*h;
k4 = [a*(v - p) ; z];

#Calculando a Velocidade e posição no momento seguinte x(i+1) do carro 4
disp("\n");
z_edo4 = z0 + (h/6)*(k1(1,1)+2*k2(1,1)+ 2*k3(1,1) + k4(1,1)) #Z_edo = Velocidade do carro no momento seguinte
p_edo4 = p0 + (h/6)*(k1(2,1)+2*k2(2,1)+ 2*k3(2,1) + k4(2,1)) #P_edo = Posição do carro no momento seguinte

#Calculando a posição do onibus:
t = iter * h;#Calcula o tempo decorrido
onibus = 8*t - 90*sin(0.1*t);

#Atualizando os parâmetros difs:
dif1 = onibus - p_edo1; #distância inicial até o carro à frente do analisado
dif2 = p_edo1 - p_edo2; 
dif3 = p_edo2 - p_edo3;
dif4 = p_edo3 - p_edo4;
x0 = x0 + h;


endfor
