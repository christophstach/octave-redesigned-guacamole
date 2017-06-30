clc;
clear;

function y = mySum(v)
  s = 0;

  for i = v
    s += i;  
  endfor
  
  y = s;
endfunction

% Aufgabe 1
disp("Aufgabe 1")
function y = f2(x)
  y = (9 - x) .^ 2;
endfunction

% PDF: Dichtefunktion
global c;
c = 1 / quad("f2", 0, 9)

function y = f(x)
  global c;
  y = c .* (9 .- x) .^ 2;  
endfunction

function y = f3(x)
  y = x .* f(x);
endfunction

function y = f4(x)
  global mue;
  y = ((x - mue) .^ 2) .* f(x);
endfunction

x = [ 0:9 ];
y = f(x);
Y = [ 
  quad("f", 0, 0)
  quad("f", 0, 1)
  quad("f", 0, 2)
  quad("f", 0, 3)
  quad("f", 0, 4)
  quad("f", 0, 5)
  quad("f", 0, 6)
  quad("f", 0, 7)
  quad("f", 0, 8)
  quad("f", 0, 9)
]';

% PDF: Dichtefunktion, CDF: Verteilungsfunktion
figure(1),plot(x, y, '-', x, Y, '-'),grid;

global mue = quad("f3", 0, 9) % Mittelwert
mue
sigmaQuadrat = quad("f4", 0, 9) % Varianz
sigma = sqrt(sigmaQuadrat) % Standardabweichung

disp("Erwartungswert Rechnungsbetrag: "),disp(mue * 80 + 30)
disp("Standardabweichung Rechnungsbetrag: "),disp(sigma * 80)
disp("")

% Aufgabe 2
% Possion
function y = X(x)
  y = (7 ./ x); % Einsätze pro Woche
endfunction

x = [ 1:8 ];
y = X(x)
 
y2 = poisspdf(x, y)

figure(1),bar(x, y2)



% Aufgabe 3
x = [ 10 8 9 10 11 11 9 12 8 12 ]; % Stichproben
xQuer = mean(x); % Mittelwert der Stichproben
sigmaQuadrat = 4; % Varianz
sigma = sqrt(sigmaQuadrat); % Standardabweichung
n = columns(x); % Anzahl Stichproben
gamma = 0.95;
disp("Aufgabe 3:")

c = norminv(
  (gamma + 1)
  /
  2
)
interval = [ 
  (
    xQuer -
    (
      (c * sigma)
      / 
      sqrt(n)
    )
  ) (
    xQuer +
    (
      (c * sigma)
      / 
      sqrt(n)
    )
  )
]


% Aufgabe 4
% Gausverteilung
sigma = 800 % Standardabweichung
sigmaQuadrat = sigma .^ 2 % Varianz


% Aufgabe 5
% Gausverteilung

