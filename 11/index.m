clear;
clc;

% Aufgabe 1 a-e

function r = derive(y, x)
  r = diff(fn(x)) ./ diff(x);
endfunction

function y = integrateQuad(fn, x)
  key = 1;
  y = zeros(1, columns(x));
 
  for val = x
    y(key) = quad(fn, 0, val);
    key = key + 1;
  endfor
end

################################################################################

function y = f(x)
  y = cos(x);    
endfunction

function y = g(x)
  y = x ./ ( 1 + x .* x );
endfunction

function y = h(x)  
  y = tanh(x);
endfunction

function y = k(x)
  y = x .* exp(x); 
endfunction

function y = l(x)
  y = x .* log(x);  
endfunction

x = -pi():0.1:pi();

x
f(x)
derive(x, f(x))

subplot(2, 3, 1);
plot(
  x, f(x), % Funktion
  x, integrateQuad("f", x) % Integral
),grid,axis auto

x = -10:0.1:10;
subplot(2, 3, 2);
plot(
  x, g(x), % Funktion
  x, integrateQuad("g", x) % Integral
),grid,axis auto

x = -10:0.1:10;
subplot(2, 3, 3);
plot(
  x, h(x), % Funktion
  x, integrateQuad("h", x) % Integral
),grid,axis auto

x = -10:0.1:10;
subplot(2, 3, 4);
plot(
   x, k(x), % Funktion
   x, integrateQuad("k", x) % Integral
),grid,axis auto

x = 0.1:0.1:5.1;
subplot(2, 3, 5);
plot(
  x, l(x), % Funktion
  x, integrateQuad("l", x) % Integral
),grid,axis auto


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
