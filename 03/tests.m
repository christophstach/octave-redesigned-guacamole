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

kappa  =  cond(A, "fro")
rkappa = rcond(A)

asing  = rkappa + 1.0
%Ergibt 1.0000: 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%