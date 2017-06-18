clc;
clear;

% Aufgabe 1

zp = [4 0 0 0 -4];
np1 = [1 -2];
np2 = [1 2];
np = conv(np1, np2);
r = roots(zp);

[qp, rp] = deconv(zp, np);
[z xP g] = residue(rp, np);

printf("Nennerpolynom: "), polyout(np, "x")
printf("Nullstellen  Zählerpolynom: "), r
printf("Zerlegung zp/np in gebrochenrationale Funktion: "), polyout(qp, "x")
printf("Restanteil Zähler: "), rp
printf("Restanteil Nenner: "), np
printf("Zähler der Partialbrüche: "), z
printf("Polstellen der Partialbrüche: "), xP

% Aufgabe 2

% Aufgabe A-C können nur durch Partinalbrüche gelöst werden, da Nennerpolynom kleiner als Zählerpolynom
% Aufgabe D Hier ist das Nennerpolynoms höheren gerade. Die Partinalbrüche werden wieder ausgerechnet und g gibt das ergebnis der Polynomdivision an

zpA = [2];
npA = [1 0 -1];

[z xP g] = residue(zpA, npA)

zpB = [2 3];
npB = [1 3 2];

[z xP g] = residue(zpB, npB)

zpC = [1 1 1 2];
npC = [1 0 3 0 2];

[z xP g] = residue(zpC, npC)

zpD = [2 -14 14 30];
npD = [2 0 -4];

[z xP g] = residue(zpD, npD)
printf("Ergebnis Polynomdivision: "), polyout(g, "x")

% Aufgabe 3

pA = [1 0 0 0 0 0 -1 0];
rA = roots(pA);
figure(1), compass(rA)

pB = [1 1 1 1 1 1];
rB = roots(pB);
figure(2), compass(rB)

pC = [1 0 0 -i]
rC = roots(pC);
figure(3), compass(rC)