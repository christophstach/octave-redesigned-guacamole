clc
warning("off")

% Ich definiere ein paar Testfunktionen zum testen.

function y = f(x) 
  y = 0;
endfunction

function y = g(x) 
  y = 1;
endfunction

function y = h(x)
  y = cos(x) - exp(x);
endfunction

function y = i(x)
  y = exp(x) + 2 * exp(-x) - 9;
endfunction

% Lösung der Gleichungssysteme

printf("\nLösung f(x)\n")
x = fzero(@f, 0)
x = fsolve(@f, 0)

printf("\nLösung g(x)\n")

x = fsolve(@g, 0)

printf("\nLösung h(x)\n")
x = fzero(@h, 0)
x = fsolve(@h, 0)

printf("\nLösung i(x)\n")
x = fzero(@i, 0)
x = fsolve(@i, 0)