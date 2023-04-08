program P1E3;

Var
    f : text;
    horas_trabajadas: real;

Function CalcularSueldoBruto( horas_trabajadas : real ) : real;
    Const
        SALARIO_X_HORA = 200;        
    begin
        CalcularSueldoBruto := SALARIO_X_HORA * horas_trabajadas;        
    end;
Function CalcularSueldoNeto( sueldo_bruto : real ) : real;
    Const
        DESCUENTO_OBRA_SOCIAL = 0.11;
        DESCUENTO_PREVISIONAL = 0.05;
    begin
        CalcularSueldoNeto := sueldo_bruto * ( 1 - DESCUENTO_OBRA_SOCIAL - DESCUENTO_PREVISIONAL );    
    end;

begin
    assign( f, 'E3.txt' );
    reset(f);
    while not eof(f) do
        begin
            readLn( f, horas_trabajadas );            
            writeLn( 'Horas trabajadas: ', horas_trabajadas:8:1 );
            writeLn('   Sueldo Bruto: $', CalcularSueldoBruto(horas_trabajadas):8:2);    
            writeLn('   Sueldo Neto: $', CalcularSueldoNeto( CalcularSueldoBruto(horas_trabajadas)):8:2 );
        end;
    close(f);
    
    
end.