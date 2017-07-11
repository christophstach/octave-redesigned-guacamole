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
  rl2(x), f(rl2(x)), % Funktion
  rl2(x), derive(rl1(x), f(rl1(x))), % 1. Ableitung
  rl2(x), derive(rl1(x), derive(x, f(x))) % 2. Ableitung
),grid,axis auto

x = -10:0.1:10;
subplot(2, 3, 2);
plot(
  rl2(x), f(rl2(x)), % Funktion
  rl2(x), derive(rl1(x), g(rl1(x))), % 1. Ableitung
  rl2(x), derive(rl1(x), derive(x, g(x))) % 2. Ableitung
),grid,axis auto

x = -10:0.1:10;
subplot(2, 3, 3);
plot(
  rl2(x), f(rl2(x)), % Funktion
  rl2(x), derive(rl1(x), h(rl1(x))), % 1. Ableitung
  rl2(x), derive(rl1(x), derive(x, h(x))) % 2. Ableitung
),grid,axis auto

x = -10:0.1:10;
subplot(2, 3, 4);
plot(
  rl2(x), f(rl2(x)), % Funktion
  rl2(x), derive(rl1(x), k(rl1(x))), % 1. Ableitung
  rl2(x), derive(rl1(x), derive(x, k(x))) % 2. Ableitung
),grid,axis auto

x = 0.1:0.1:5.1;
subplot(2, 3, 5);
plot(
  rl2(x), f(rl2(x)), % Funktion
  rl2(x), derive(rl1(x), l(rl1(x))), % 1. Ableitung
  rl2(x), derive(rl1(x), derive(x, l(x))) % 2. Ableitung
),grid,axis auto


################################################################################
#Aufgabe 2 & 4
disp("Aufgabe 2 und 4")


function y = fa(x)
  y = sin(x);    
endfunction

function y = fb(x)
  y = cos(x);    
endfunction

function y = fc(x)
  y = sqrt(1 .+ exp(0.5 .* x .^ 2));    
endfunction

function y = fd(x)
  y = tan(x);    
endfunction

function y = fe(x)
  y = (1 .- exp(-x))./x;    
endfunction

function y = ff(x)
  y = sqrt(1 .+ 2 .* x .^ 4);    
endfunction

function y = fg(x)
  y = x .^ 3 ./ (exp(x).- 1);    
endfunction

function y = fh(x)
  y = exp(x) ./ x .^ 2;    
endfunction

#Ein paar Funktion integrieren 
disp("1")
disp("Trapezregel: ")
x = 0:0.1:3.14; 
area = trapz(x, fa(x))
disp("Simpson-Regel: ")
area = quad('fa', 0, 3.14)
disp("Monte-Carlo: ")
area = mcintgr("fa", 0, 3.14, 10000)

disp("2")
disp("Trapezregel: ")
x = 0:0.1:3.14/2; 
area = trapz(x, fb(x))
disp("Simpson-Regel: ")
area = quad('fb', 0, 3.14/2)
disp("Monte-Carlo: ")
area = mcintgr("fb", 0, 3.14/2, 10000)

disp("3")
disp("Trapezregel: ")
x = 1:0.1:2.6; 
area = trapz(x, fc(x))
disp("Simpson-Regel: ")
area = quad('fc', 1, 2.6)
disp("Monte-Carlo: ")
area = mcintgr("fc", 1, 2.6, 10000)

disp("4")
disp("Trapezregel: ")
x = -1:0.1:0; 
area = trapz(x, fd(x))
disp("Simpson-Regel: ")
area = quad('fd', -1,0)
%%Monte Carlos läuft nicht, weil y Werte kleiner 0 sind
%disp("Monte-Carlo: ")
%area = mcintgr("fd", -1, 0, 10000)

disp("5")
disp("Trapezregel: ")
x = 1:0.1:2; 
area = trapz(x, fe(x))
disp("Simpson-Regel: ")
area = quad('fe', 1,2)
disp("Monte-Carlo: ")
area = mcintgr("fe", 1, 2, 10000)

disp("6")
disp("Trapezregel: ")
x = 1:0.1:4; 
area = trapz(x, ff(x))
disp("Simpson-Regel: ")
area = quad('ff', 1,4)
disp("Monte-Carlo: ")
area = mcintgr("ff", 1, 4, 10000)

disp("7")
disp("Trapezregel: ")
x = 0.5:0.1:1; 
area = trapz(x, fg(x))
disp("Simpson-Regel: ")
area = quad('fg', 0.5,1)
disp("Monte-Carlo: ")
area = mcintgr("fg", 0.5, 1, 10000)

disp("8")
disp("Trapezregel: ")
x = 1:0.1:3; 
area = trapz(x, fh(x))
disp("Simpson-Regel: ")
area = quad('fh', 1,3)
disp("Monte-Carlo: ")
area = mcintgr("fh", 1, 3, 10000)
