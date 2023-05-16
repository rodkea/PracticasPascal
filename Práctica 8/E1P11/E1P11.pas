program E1P11;

  procedure MostrarPiramide( n : integer );

    var
      i : byte;

    procedure MostrarFila( n : integer);
      begin
        if n = 1 then
          writeln(1)
        else
          begin
            write(n);
            MostrarFila(n - 1);          
          end;
      end;
    Begin
      for i :=1 to N do 
      MostrarFila(i);      
    End;

  Begin
    MostrarPiramide(5)
  End.