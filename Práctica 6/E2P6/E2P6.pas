program E2P6;

  const 
    MAX_SIZE = 10;
    MAX_NAME_SIZE = 5;
  type 
    st20 = string[MAX_NAME_SIZE];
    TMat = array[1..MAX_SIZE,1..MAX_SIZE] of real;
    TVNbre = array[1..MAX_SIZE] of st20 ;
    
  var 
    Notas : TMat;
    Nbre : TVNbre;
    N, M : byte;
    c : char;
  procedure LeerNotas(var Notas : TMat; var Nbre : TVNbre;  var N, M : byte);

    var
      archivo : text;      
    begin     
      
      assign(archivo, 'E2P6.txt');
      reset(archivo);      
      While not eof(archivo) do
        Begin
          N := N + 1;
          M := 0;
          read(archivo, Nbre[N]);
          while not eoln(archivo) do 
          Begin
            M := M +1;
            read(archivo, Notas[N, M]);            
          End;   
          read(archivo,c);            
          
        End;
        close(archivo);  
      

    end;

  procedure MostrarAprobados(Nbre : TVNbre; Notas : TMat; N, M : byte);

    var 
      i, j : byte;
      aprobo : boolean;
    Begin
      for i := 1 to N do 
        Begin
          aprobo := True;
          for j := 1 to M  do 
            Begin
              aprobo := aprobo and ( Notas[i, j] >= 7);
            End;
          if aprobo then
            writeln(Nbre[i])
        End;
          
    End;

  Begin
    N := 0;
    M := 0;
    LeerNotas(Notas, Nbre, N, M);
    MostrarAprobados(Nbre, Notas, N, M);
  End.