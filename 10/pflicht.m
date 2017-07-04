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
disp("####################################################")
disp("")

% Aufgabe 2
% Poisson
disp("Aufgabe 2")

x = [ 0:1:8 ];
meanEinsaetze = 3.5; 
 
y = poisspdf(x, meanEinsaetze)
%figure(1),bar(x, y)

%Mehr als 2 Einsätze pro Woche
p = 1-poisscdf(2, meanEinsaetze); 


disp("Mindestens 2x pro Woche: "),disp(p)


%C --> Mittelwert 2 Tage zwischen jedem Einsatz 
%Verteilungsfunktion & Dichtefunktion je als Barplot
%Für die Zeit zwischen den Einsätzen 

meanZeitZwEinsaetzen = 2; 
figure(2),bar(0:10, poisspdf(0:10, 2)); 
figure(3),bar(0:10, poisscdf(0:10, 2)); 

%D --> Wahrscheinlichtkeit das die Feuerwehr innerhalb von zwei Tagen nach letzten Einsatz 
%Wieder ausrücken muss
p = poisscdf(2, meanZeitZwEinsaetzen); 
disp("D:"),p

%E --> Wahrscheinlichtkeit das min. 5 Tage nach letztem Einsatz kein neuer Einsatz stattfindet
p = 1 - poisscdf(4, meanZeitZwEinsaetzen);
disp("E:"),p



disp("####################################################")
disp("")

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

disp("####################################################")
disp("")

% Aufgabe 4
% Gausverteilung
mue = 10000; 
sigma = 800 % Standardabweichung
sigmaQuadrat = sigma .^ 2 % Varianz


%A, weniger als 9000 Std 
p = normcdf(8999, mue, sigma); 
disp("A: Wahrscheinlichlicht für max 8999 Stunden"),p

%B, Lebensdauer zwischen 9000 und 105000 Std
p1 = normcdf(9000, mue, sigma); 
p2 = normcdf(10500, mue, sigma); 

p = p2 - p1; 

disp("B, Lebensdauer zwischen 9000 und 105000"), p

%C, 80% der Lampen überschreiten folgende Lebensdauer NICHT

x = norminv(0.8, mue, sigma); 
disp("Lebensdauer die 80% der Lampen nicht überschreiten"), x

%D, 10% der Lampen überschreiten die folgende Lebensdauer NICHT --> 90% noch heil!
x = norminv(0.1, mue, sigma); 
disp("Lebensdauer die von 90% der Lampen überschritten wird"), x

%E, Wahrscheinlichkeit das Lampe nach 10500 Stunden noch leuchtet, 
%unter Bed. das sie schon 9000 Stunden geleuchtet hat

p9000 = 1- normcdf(9000, mue, sigma); 
p10500 = 1 - normcdf(10500, mue, sigma); 

p10500UnterBed9000 = p10500 / p9000; 

disp("Bed. Wahrscheinlichkeit"), p10500UnterBed9000

disp("####################################################")


% Aufgabe 5
% Gausverteilung

mue = 40000; 
sigma = 4310; 

%A, wahrscheinlichkeit, das der Reifen BEI GENAU 37500 km gewechselt werden muss
%TODO: All fine here? 

p = normpdf(37500, mue, sigma);
disp("Wechsel bereits nach 37500"),  p


%B Reifen übersteht 45000 km 
p = 1 - normcdf(45000, mue, sigma);
disp("Reifen übersteht 45000 km"), p


%C Wahrscheinlichkeit das 4 Reifen mindestens 42000 aushalten
p = 0;  
p = 1 - normcdf(41999, mue, sigma);

p4 = binopdf(4, 4, p);  
disp("4 Reifen halten min. 42.000 km aus mit Wahrscheinlichkeit von: "), p4

%D Wahrscheinlichkeit das 1 von 4 Reifen nach max 38000 gewechselt werden muss

p = normcdf(38000, mue, sigma); 

p1von4kaputt = binopdf(1, 4, p); 
disp("Einer von 4 Reifen geht nach max. 38000 km kaputt: "), p1von4kaputt


%E KM Anzahl bei der 80% der Reifen noch heil sind bzw. 20% kaputt

kmAnz = norminv(0.2, mue, sigma); 

disp("80% der Reifen sind noch heil nach: "), kmAnz




