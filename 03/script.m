clc;

delta = 5 * 10 ^ (-6)
A1 = [ 2 3 -1; 2 1 -1; -4 2 1]
b1 = [ 0; 2; -9 ]

A2 = [ 1 1 0 3; 2 0 -1 1; 3 -1 -1 2; -1 2 3 -1 ]
b2 = [ 4; 1; -3; 4 ]

A3 = [ 0 3 -5 1; -1 -3 0 -1; -2 1 2 2; 3 4 2 2 ]
b3 = [ 0; -5; 2; 8 ]

A4 = [ 5 -3 0 2; 2 6 -3 0; -1 2 4 -1; -2 -3 2 7 ]
b4 = [ -2; -3; 2; 7 ]

% Hier werden die absoluten Fehler über meine Funktion errechnet

absoluteFault1 = absoluteFault(A1, b1, delta)
absoluteFault2 = absoluteFault(A2, b2, delta)
absoluteFault3 = absoluteFault(A3, b3, delta)
absoluteFault4 = absoluteFault(A4, b4, delta)