program P2E2;

var
    f: text;
    n: integer;

Function CalcularSucesion( n : integer) : integer;

    Const
        A1 = 1;
    begin
        CalcularSucesion := A1 + 3 * ( n - 1 );
    end;
        


begin
    assign( f, 'E2.txt');
    reset( f );
    while not eof( f ) do
        begin
            readLn(f, n);
            WriteLn('El valor de la sucesion para n = ', n, ' es: ', CalcularSucesion(n) );
            WriteLn('La diferencia entre el valor de la sucesion para n = ', n + 1, 
                          ' y  el valor de la sucion para n = ', n, 
                          ' es: ', CalcularSucesion( n+1 ) - CalcularSucesion(n) );
            
        end;
    close(f);
    
end.