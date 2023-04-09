Program P1E6;

uses Crt;

Var
    f : text;
    numero: LongInt;
Function QuitarTresCifras( numero : LongInt ) : LongInt;

    begin
        QuitarTresCifras :=  Trunc( numero / 1000 );
    end;
Function BuscarNumeroCentena( numero : LongInt ) : LongInt;

    Var 
        n : real;

    begin
        n := ( numero / 100 );        
        n := Trunc( n );        
        n := ( n / 10 );        
        n := Frac( n );        
        n := n * 10;        
        BuscarNumeroCentena := Round( n );
    end;

    begin
        ClrScr;
        assign( f, 'E6.txt' );    
        reset(f);        
        while not eof(f) do
            begin
                readLn( f, numero );
                writeLn( 'Numero original: ', numero );                
                writeLn( 'Numero sin las ultimas 3 cifras: ', QuitarTresCifras( numero ));
                writeLn( 'El numero en la pocision de las centenas es: ', BuscarNumeroCentena( numero ));
                writeLn();
            end;
    end.
    


    

