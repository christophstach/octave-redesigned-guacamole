clc;
clear;
format short g;

% Aufgabe 1
disp("------------------Aufgabe 1------------------")
function y = HyperGeometrischeVerteilung(K, k, N, n)
  y = (
    ( nchoosek(K, k) .* nchoosek(N - K, n - k) )
    ./
    ( nchoosek(N, n) )
  );
endfunction

N = 20       % Anzahl Geräte
K = 5        % Anzahl kaputte Geräte

n = 5        % Entnahmen ohne zurücklegens 
k = 0:1:5    % Warscheinlichkeit für k kaputte Geräte
sum = 0;      % Summe der Warscheinlichkeiten



for i = k  
  pV(i + 1) = HyperGeometrischeVerteilung(K, i, N, n);
  sum += pV(i + 1);
endfor

hygepdf(k, N, n, K) % Oder man nimmst einfach die fertige Funktion :D
pV           % Vektor der verschiedenen Warscheinlichkeiten
sum          % Summe der Warscheinlichkeiten

figure(1),bar(k, pV),grid
disp("---------------------------------------------")
disp("")

% Aufgabe 2
disp("------------------Aufgabe 2------------------")
function y = PosibilitiesToCounts(posibilities, c)
  counts = zeros(1, c);
  for i = posibilities
    i = i';
    s = sum(i);
    counts(s) = counts(s) + 1;  
  endfor
  y = counts;  
endfunction

function y = mySum(v)
  s = 0;

  for i = v
    s += i;  
  endfor
  
  y = s;
endfunction

cube = [ 1:6 ]

% Für 1 Würfel
[A] = ndgrid(cube);
posibilities = [ A(:) ]';
counts = PosibilitiesToCounts(posibilities, 6);
figure(2),bar(1:6, counts),grid

% Für 2 Würfel
[A, B] = ndgrid(cube, cube);
posibilities = [ A(:) B(:) ]';
counts = PosibilitiesToCounts(posibilities, 12);
figure(3),bar(1:12, counts),grid

% Für 3 Würfel
[A, B, C] = ndgrid(cube, cube, cube);
posibilities = [ A(:) B(:) C(:) ]';
counts = PosibilitiesToCounts(posibilities, 18);
figure(4),bar(1:18, counts),grid

% Für 4 Würfel
[A, B, C, D] = ndgrid(cube, cube, cube, cube);
posibilities = [ A(:) B(:) C(:) D(:) ]';
counts = PosibilitiesToCounts(posibilities, 24);
figure(5),bar(1:24, counts),grid

% Für 5 Würfel
[A, B, C, D, E] = ndgrid(cube, cube, cube, cube, cube);
posibilities = [ A(:) B(:) C(:) D(:) E(:) ]';
counts = PosibilitiesToCounts(posibilities, 30);
figure(6),bar(1:30, counts),grid

% Für 6 Würfel
[A, B, C, D, E, F] = ndgrid(cube, cube, cube, cube, cube, cube);
posibilities = [ A(:) B(:) C(:) D(:) E(:) F(:) ]';
counts = PosibilitiesToCounts(posibilities, 36);
p = counts ./ ( 6 ^ 6 );
X = [1:36];
pz = X .* p;
EX = mySum(pz) % Erwartungswert
%%%% Hier müssen wir echt mal schauen wie es weitergeht ... das echt psycho!
vari = mySum(p .* (X - EX)) ^ 2
display(sqrt(vari)); 
figure(7),bar(X, counts),grid


disp("---------------------------------------------")
disp("")


% Aufgabe 3
disp("------------------Aufgabe 3------------------")
n = [ 250 500 1000 2000 ]     % Anzahl der hergestellten Schrauben
p = 0.02   % Warscheinlichkeit für Herstellung einer kaputten Schraube
E = n .* p % Erwartungswert
sigma = sqrt(n .* p .* (1 - p))    % Standardabweichung

disp("---------------------------------------------")
disp("")


% Aufgabe 4
disp("------------------Aufgabe 4------------------")
p = 1 / 3 % Warscheinlich des Treffens der Zielscheibe
n = 5     % Anzahl Versuche
k = [ 0:n ]   % Anzahl der Treffer

pdf = binopdf(k, n, p)
figure(10),bar(k, pdf),grid

disp("---------------------------------------------")
disp("")