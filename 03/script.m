clc;

format long

% Matrizen definieren

A = [ 0.780 0.563; 0.913 0.659 ]
b = [ 0.217; 0.254 ]

x = A \ b


Ad = [ 0.780002 0.563003; 0.913001 0.658997 ]
bd = [ 0.217004; 0.253995 ]

xd = Ad \ bd

% Und wie man bei der Berechnung sieht weichen x und xd stark von einander ab.
% Das liegt an der hohen anzahl der Nachkomma stellen. Bei der Division durch Gaus
% entstehen hohe einzel Ergebnisse

kappa  =  cond(A)
rkappa = rcond(A)

asing  = rkappa + 1.0
%Ergibt 1.0000: 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A1 = [ 2 3 -1; 2 1 -1; -4 2 1]
b1 = [ 0; 2; -9 ]

A2 = [ 1 1 0 3; 2 0 -1 1; 3 -1 -1 2; -1 2 3 -1 ]
b2 = [ 4; 1; -3; 4 ]

A3 = [ 0 3 -5 1; -1 -3 0 -1; -2 1 2 2; 3 4 2 2 ]
b3 = [ 0; -5; 2; 8 ]

A4 = [ 5 -3 0 2; 2 6 -3 0; -1 2 4 -1; -2 -3 2 7 ]
b4 = [ -2; -3; 2; 7 ]