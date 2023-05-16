program E5P8;

  type
    TVInt = array[1..4] of integer;

  var 
    Vect : TVInt =  (2,2,3,5);
    N : byte;

  function Suma(Vect : TVInt; indice : byte):integer;
    begin
      if indice = 1 then
        Begin
          Suma := Vect[1];
        End
      else
        Suma := Vect[indice] + Suma(Vect, indice - 1);
    end;
  
  procedure MostrarInvertido(Vect : TVInt; indice : byte);
    begin
      if indice = 1 then
        writeln(Vect[1])
      else
        Begin
          writeln(Vect[indice]);
          Mostrar(Vect, indice - 1);
        End;
    end;

  procedure Mostrar(Vect : TVInt; indice : byte);
    begin
      if indice = 0 then
        writeln(Vect[N])
      else
        Begin
          writeln(Vect[indice ]);
          Mostrar(Vect, indice - 1);
        End;
    end;

  Begin
    // writeln(Suma(Vect, 4));
    N := 4;
    Mostrar(Vect, N);

  End.