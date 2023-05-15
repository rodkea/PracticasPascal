program E1P6;

  const
    MAX_SIZE = 10;
  type
    TMat = array[1..MAX_SIZE,1..MAX_SIZE] of integer;
    TV = array[1..MAX_SIZE] of integer;
  var 
    N,M, X : byte;
    Mat : TMat;
    VMaximos, VImpares : TV;


procedure LeerMatriz(var Mat : TMat; var N, M : byte);

  var
    i, j : byte;
    archivo : text;

  begin
    assign(archivo, 'E1P6.txt');
    reset(archivo);
    readln(archivo, N, M);
    for i := 1 to N do 
      for j := 1 to M do 
        read(archivo, Mat[i, j]);
    close(archivo);
  end;

  procedure VectorMaximos(Mat: TMat; N, M : byte; var VMaximos : TV );

    var 
      i, j : byte;

    begin
      for i := 1 to N do
        for j := 1 to M do
          if (j = 1) then
            Begin
              VMaximos[i] := Mat[i,j];
            End
          else
            Begin
              if (VMaximos[i]< Mat[i,j]) then
                VMaximos[i] := Mat[i,j];
            End;    
    end;

  procedure VectorImpares(Mat : TMat; N, M : byte; var VImpares : TV);

    var
      i, j, k : byte;
      suma : integer;

    Begin
      k := 0;
      for j := 1 to M do
        Begin
        suma := 0;        
        for i :=1 to N do
          if (Mat[i, j] mod 2) <> 0 then
            begin
              // writeln(Mat[i, j]);
              suma := suma + Mat[i, j]
            end;
        if suma <> 0 then
          Begin
            k := k+1;
            VImpares[k] := suma;
          End;
        End;
    End;

  function PromedioColumna(Mat : TMat; N, X : byte):real;
    
    var
      i : byte;
    
    begin
      for i := 1 to N do
        PromedioColumna := PromedioColumna + Mat[i, X];
      PromedioColumna := PromedioColumna / N;      
    end;
  

Begin
  LeerMatriz(Mat, N, M);
  writeln('Tamano de matriz: ',N, 'x', M);
  VectorMaximos(Mat, N, M, VMaximos);
  VectorImpares(Mat, N, M, VImpares);
  writeln('Ingrese el numero de columna a la que quiere calcular el promedio: ');
  readln(X);
  writeln('Promedio de la columna X es: ', PromedioColumna(Mat, N, X):4:2);
  
End.