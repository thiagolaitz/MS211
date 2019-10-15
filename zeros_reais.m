#Zeros reais de uma função, utilizando o método da secante

x0 = 6.5; #aproximação inicial para X0 / x(k-1)
x1 = 6.4; #aproximação inicial para X1 / x(k)
erro = 0.00001; #Critério de condição de parada

yk = ((((30*x1)/((x1^2+64))^0.5)^4)+(-400-2*x1+(x1^2)+64)*(((30*x1)/((x1^2+64)^0.5))^2)+800*x1-(400*x1^2)); #calcula a funcao em x(k)
yk1 = ((((30*x0)/((x0^2+64))^0.5)^4)+(-400-2*x0+(x0^2)+64)*(((30*x0)/((x0^2+64)^0.5))^2)+800*x0-(400*x0^2)); #calcula a função em x(k-1)

x_atual = ((x0*yk) - (x1*yk1)) / (yk - yk1); #primeira iteração do método

k = 0;

x_novo = x_atual + 1;
x_ant = x0;

fplot("((((30*x)/((x^2+64))^0.5)^4)+(-400-2*x+(x^2)+64)*(((30*x)/((x^2+64)^0.5))^2)+800*x-(400*x^2))", [0, 20])


while ((x_novo - x_atual) > erro)
  
  yk = ((((30*x_atual)/((x_atual^2+64))^0.5)^4)+(-400-2*x_atual+(x_atual^2)+64)*(((30*x_atual)/((x_atual^2+64)^0.5))^2)+800*x_atual-(400*x_atual^2)); #calcula a funcao em x(k)
  yk1 = ((((30*x_ant)/((x_ant^2+64))^0.5)^4)+(-400-2*x_ant+(x_ant^2)+64)*(((30*x_ant)/((x_ant^2+64)^0.5))^2)+800*x_ant-(400*x_ant^2)); #calcula a função em x(k-1)
  
  x_novo = ((x_ant*yk) - (x_atual*yk1)) / (yk - yk1);#iteração para x(k+1)
  
  x_ant = x_atual; #atualizo o x(k-1)
  x_atual = x_novo; #atualizo o x(k)
  
  k = k + 1;
  
endwhile

x_atual
