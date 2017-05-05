function aFault = absoluteFault (A, b, delta)
  % Gestörten Matrix berechnen & Vektor
  Adelta = A * delta;
  bdelta = b * delta;

  % Kappa => Entscheidung bzgl. Vereinfachter Ungleichung bzw. normaler Ungleichung
  k = norm(Adelta, "fro") * norm(inv(A), "fro");

  % Gestörten Ergeniss-Vektor berechnen
  xdelta = Adelta \ bdelta;

  % Relativen Fehler über normale Ungleichung berechnen, da ich Sie sowieso nur einmal eintippen muss
  % und diese mit allen Kappas funktioniert
  rFault = (
    ( norm(A, "fro") * norm(inv(A), "fro") )
    / 
    ( 1 - k )
  ) * ( 
    ( norm(Adelta, "fro") / norm(A, "fro") )
    + 
    ( norm(bdelta, "fro") / norm(b, "fro") )
  );

  % Absolulten Fehler errechnen indem man den relativen Fehler mit dem gestörten
  % Ergeniss-Vektor multipliziert
  aFault = rFault * xdelta;
endfunction
