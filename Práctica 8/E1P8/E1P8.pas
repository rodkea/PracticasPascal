program E1P8;

  function Potencia(X, n : integer):real;
  
    begin
      if n = 0 then
        Begin
          Potencia := 1;  
        End
        
      else
        Begin
          if (n > 0) then
            Begin
              Potencia := Potencia(X, n -1) * X;
            End
          else
            Begin
              Potencia := Potencia(X, n + 1) / X;
            End;
        End;
    end;

  Begin
    writeln(Potencia(2,-0):4:2);
  End.