clc;
clear;

function [a, b] = linearFit(x, y)
  n = columns(x);
  
  D = det([
    sum(x .^ 2), sum(x);
    sum(x), n;
  ]);
  
  D1 = det([
    sum(x .* y), sum(x);
    sum(y), n;
  ]);
  D2 = det([  
    sum(x .^ 2), sum(x .* y);
    sum(x), sum(y);
  ]);
  
  a = D1 ./ D;
  b = D2 ./ D;  
endfunction

function [a, b, c] = quadraticFit(x, y)
  n = columns(x);
  
  A = [
    sum(x .^ 4), sum(x .^ 3), sum(x .^ 2);
    sum(x .^ 3), sum(x .^ 2), sum(x);
    sum(x .^ 2), sum(x),      n;
  ];
  
  b = [
    sum((x .^ 2) .* y);
    sum(x .* y);
    sum(y);
  ];
  
  X = A \ b;
  
  a = X(1);
  b = X(2);
  c = X(3);  
endfunction

% Hmmmm das verstehe ich noch nicht!
function [a, b] = expFit(x, y)
  u = x
  v = log(y)
  
  [c, d] = linearFit(u, v);
  
  a = exp(d);
  b = c;
endfunction

% linear fit {10.6, 8.6}, {14, 11.5}, {18.1, 12.4}, {23.2, 15.6}, {25, 15.1}, {26.4, 17.7}, {30.5, 18.9}, {32.5, 18.6}, {36.6, 21.3}, {40.1, 24.3}
% Wolfram Alpha gibt fast das gleiche Ergebnis :-)
% Lediglich kleinere Rundungsfehler hier.
clear;
x = [10.6 14.0 18.1 23.2 25.0 26.4 30.5 32.5 36.6 40.1];
y = [8.6 11.5 12.4 15.6 15.1 17.7 18.9 18.6 21.3 24.3];
[a, b] = linearFit(x, y);
f = @(x) a .* x .+ b;
xm = [0:1:45];
ym = f(xm);


disp("Aufgabe 1 - Lineare Regression")
disp([ 1:columns(x); x; y; ])
printf("f(x) = %dx + %d\n\n\n\n", a, b)
subplot(2, 3, 1),line(xm, ym, "color", "blue"), line(x,y, "linestyle", "none", "marker", "X", "color", "red")

% ##############################################################################

clear;
x = [1.3 2.2 2.9 3.1 4.5 5.7 7.1 8.0 8.7 8.9 9.3 9.9];
y = [1.3 1.0 0.85 0.80 0.33 0 -0.4 -0.7 -0.9 -1.0 -1.1 -1.2];
[a, b] = linearFit(x, y);
f = @(x) a .* x .+ b;
xm = [0:1:10];
ym = f(xm);

disp("Aufgabe 2 - Lineare Regression")
disp([ 1:columns(x); x; y; ])
printf("f(x) = %dx + %d\n\n\n\n", a, b)
subplot(2, 3, 2),line(xm, ym, "color", "blue"), line(x,y, "linestyle", "none", "marker", "X", "color", "red")

% ##############################################################################

clear;
x = [1 2 3 3.5 4.5 5.5 6 7 8 8.5 9.5 10];
y = [11 7.3 4.8 4.1 1.0 0 0.6 2 3.7 4.2 5.6 8];
[a, b, c] = quadraticFit(x, y);
f = @(x) a .* x .^ 2 .+ b .* x .+ c;
xm = [0:0.1:10];
ym = f(xm);

disp("Aufgabe 3 - Quadratische Regression")
disp([ 1:columns(x); x; y; ])
printf("f(x) = %dx^2 + %dx + %d\n\n\n\n", a, b, c)
subplot(2, 3, 3),line(xm, ym, "color", "blue"), line(x,y, "linestyle", "none", "marker", "X", "color", "red")


% ##############################################################################
% Auch hier bestätigt WolfrahmAlpha die Richtigkeit meiner lösung
% quadratic fit {0.04, 2.63}, {0.32, 1.18}, {0.51, 1.16}, {0.73, 1.54}, {1.03, 2.65}, {1.42, 5.41}, {1.60, 7.67}
clear;
x = [0.04 0.32 0.51 0.73 1.03 1.42 1.60];
y = [2.63 1.18 1.16 1.54 2.65 5.41 7.67];
[a, b, c] = quadraticFit(x, y);
f = @(x) a .* x .^ 2 .+ b .* x .+ c;
xm = [0:0.01:2];
ym = f(xm);


disp("Aufgabe 4 - Quadratische Regression")
disp([ 1:columns(x); x; y; ])
printf("f(x) = %dx^2 + %dx + %d\n\n\n\n", a, b, c)
subplot(2, 3, 4),line(xm, ym, "color", "blue"), line(x,y, "linestyle", "none", "marker", "X", "color", "red")

% ##############################################################################
% WolframAlpha
% exp fit{1.8395, 0.6765, 0.2490, 0.0915, 0.0335}
clear;
x = [1 2 3 4 5];
y = [1.8395 0.6765 0.2490 0.0915 0.0335];
[a, b] = expFit(x, y);
f = @(x) exp(a) .^ (b .* x);
xm = [1:0.01:5];
ym = f(xm);

disp("Aufgabe 5 - Nichtlineare Regression")
disp([ 1:columns(x); x; y; ])
printf("f(x) = %de ^ (%dx)\n\n\n\n", a, b)
subplot(2, 3, 5),line(xm, ym, "color", "blue"), line(x,y, "linestyle", "none", "marker", "X", "color", "red")


