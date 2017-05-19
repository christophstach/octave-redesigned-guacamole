clc
warning("off")

% Defienrung der Gleichungssysteme für die Pflichtaufgaben
% Die Funktionen sind so benannt wie die aufgaben: a), b), c), d)

% cos x = x
function y = a(x)
  y = cos(x) - x;
endfunction

% sin x + 2 * x ^ (1/2) = 1
function y = b(x)
  y = sin(x) + 2 * x ^ (1 / 2) - 1;
endfunction

% x * e ^ (x)
function y = c(x)
  y = exp(x) - 1;
endfunction

% 1 + cos x * cosh x = 0
function y = d(x)
  y = 1 + cos(x) * cosh(x);
endfunction


x = fsolve(@a, 0)
x = fsolve(@b, 0)
x = fsolve(@c, 0)
x = fsolve(@d, 0)