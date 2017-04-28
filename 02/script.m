clc

% Addition, Subtraktion, Multiplikation einer Matrix mit Skalar, Det., Rang

A = [2 3 -1; 2 1 -1; 4 2 -1]
B = [7 3 -2; -5 1 8; 4 -5 3]

s1 = A( : , 1 );
z3 = B( 3 , : );

[m, n] = size(A);
A1 = [ A; [2 7 1]];
[m, n] = size(A1);

A1( 4, : ) = [];
E = eye(size(A));

A23 = A(2:3, 1:2);
B12 = B(1:2, 2:3);

C = 3*A - 4*B + E
A == B;

a = det(A);
b = det(B);
c = det(C);

ra = rank(A);
rb = rank(B);
rc = rank(C);

konda = cond(A, "fro");
kondb = cond(B, "fro");
kondc = cond(C, "fro");

% Matrixmultiplikation, Matrixdivision

Prod1 = A * B

A1 = [ A  ; [2 7 1]]
B1 = [ B' ; [1 -3 5]]'

Prod2 = A1 * B1

