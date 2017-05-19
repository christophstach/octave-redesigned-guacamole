% Lösung der Pflichtaufgabe 5 von Christoph Stach ( s0555912 ) und Marvin Krüger ( s0556109 )

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
  y = sin(x) + 2 .* sqrt(x) - 1;
endfunction

% x * e ^ (x)
function y = c(x)
  y = x .* exp(x) - 1;
endfunction

% 1 + cos x * cosh x = 0
function y = d(x)
  y = 1 + cos(x) .* cosh(x);
endfunction

% Rumprobieren mit Intervallen
xA = -10:0.1:10;
xB = 0:0.1:50;
xC = -1:0.1:1;
xD = 14:0.1:15;


% Zuerst per Plotten einen gescheiten eingabe Interval bestimmen.
figure(1),plot(xA, a(xA), 'b'),grid
figure(2),plot(xB, b(xB), 'b'),grid
figure(3),plot(xC, c(xC), 'b'),grid
figure(4),plot(xD, d(xD), 'b'),grid


resA = fzero(@a, [-10 10]) % Diese Funktion hat nur eine Nullstelle da Sie stetig steigt.
resB = fzero(@b, [0 50])   % Bei dieser Funktion liegt die Nullstelle sehr nah an 0.
resC = fzero(@c, [-1 1])   % Durch das Plotten haben wir herausgefunden, das die Nullstelle in der Nähe von 0.5 liegt.

% Diese Funktion hat unendliche Viele Nullstellen. Was man durch das Rumspielen mit dem Interval leicht herausfinden kann.
% Deswegen hier nur ein paar Bespiel Nullen. 
% Der Betrag der Nullstellen ist im Positiven, so wie im Negativen gleich.
resD1 = fzero(@d, [-6, -4]) 
resD2 = fzero(@d, [4, 6]) 

resD3 = fzero(@d, [0, 2]) 
resD4 = fzero(@d, [7, 10]) 
resD5 = fzero(@d, [8, 12]) 
resD6 = fzero(@d, [12, 15]) 

% So ein Zufall: Zwischen den Nullstellen liegt PI
% Haben wir durch rumprobieren rausgefunden
pi = resD6 - resD5
