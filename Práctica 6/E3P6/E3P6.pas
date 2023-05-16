program E3P6;

  const 
    MAX_SIZE = 10;
  type 
    TMat = array[1..MAX_SIZE,1..MAX_SIZE] of integer;
  var
    N, M : byte;
    Mat : TMat;
    
  procedure LeerMatriz(var Mat : TMat; var N, M : byte);
    
    type
      TVInt = array[1..MAX_SIZE] of integer;

    var
      archivo : text;      
      fila : TVInt;
      i : byte;
      end_of_line : char;

    begin
    assign(archivo, 'E3P6.txt');
    reset(archivo);
    N := 0;
    while not eof(archivo) do
      Begin
        Begin
          i := 0;
          while not eoln(archivo) do
            Begin
              i := i +1;
              read(archivo, fila[i]);              
            End;
            M := i;            
            if ( (fila[M] mod fila[1]) = 0) then
              Begin
                N := N + 1;
                for i := 1 to M do 
                  Mat[N,i] := fila[i];
              End;
            read(archivo, end_of_line);
        End;
      End;
    close(archivo);
      
    end;
  
  procedure MostrarMatriz(Mat : TMat; N, M : byte);

    var 
      i, j : byte;

    begin
      for i := 1 to N do
        Begin
        for j := 1 to M do
          write(Mat[i,j],' ');
        writeln();
        End;
    end;

  Begin
    LeerMatriz(Mat, N, M);    
    MostrarMatriz(Mat, N, M);

  End.