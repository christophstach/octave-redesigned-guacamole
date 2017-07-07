clear;
clc;

% Aufgabe 1 a-e

function r = rl1(x) % Remove last 1 element
  r = x;
  r(length(x)) = [];
endfunction

function r = rl2(x) % Remove last 2 element
  r = rl1(rl1(x));
endfunction

function r = derive(x, y)
  r = zeros(1, columns(x));
  r = diff(y) ./ diff(x);
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

subplot(2, 3, 1);
plot(
  % rl2(x), f(rl2(x)), % Funktion
  rl2(x), derive(rl1(x), f(rl1(x))), % 1. Ableitung
  rl2(x), derive(rl1(x), derive(x, f(x))) % 2. Ableitung
),grid,axis auto

x = -10:0.1:10;
subplot(2, 3, 2);
plot(
  % rl2(x), f(rl2(x)), % Funktion
  rl2(x), derive(rl1(x), g(rl1(x))), % 1. Ableitung
  rl2(x), derive(rl1(x), derive(x, g(x))) % 2. Ableitung
),grid,axis auto

x = -10:0.1:10;
subplot(2, 3, 3);
plot(
  % rl2(x), f(rl2(x)), % Funktion
  rl2(x), derive(rl1(x), h(rl1(x))), % 1. Ableitung
  rl2(x), derive(rl1(x), derive(x, h(x))) % 2. Ableitung
),grid,axis auto

x = -10:0.1:10;
subplot(2, 3, 4);
plot(
  % rl2(x), f(rl2(x)), % Funktion
  rl2(x), derive(rl1(x), k(rl1(x))), % 1. Ableitung
  rl2(x), derive(rl1(x), derive(x, k(x))) % 2. Ableitung
),grid,axis auto

x = 0.1:0.1:5.1;
subplot(2, 3, 5);
plot(
  % rl2(x), f(rl2(x)), % Funktion
  rl2(x), derive(rl1(x), l(rl1(x))), % 1. Ableitung
  rl2(x), derive(rl1(x), derive(x, l(x))) % 2. Ableitung
),grid,axis auto


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
