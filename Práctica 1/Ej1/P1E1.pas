program P1E1;


Var    
    tipo_pintura : char;
    litros_disponibles, litros_necesarios: real;

Function CalcularLitros(tipo_pintura: char; litros: real ): real;
    // Calcula y devuelve en base a la asuncion que se tiene  una pintura BLANCA o NEGRA en una cantidad (litros)
    // la cantidad de litros de la faltante para fabricar el color gris mara.
    Const
    RATIO = 9.5 / 4.5;
    begin
        case   tipo_pintura of
            'N' : CalcularLitros := RATIO * litros;
            'B' : CalcularLitros := litros / RATIO;
            else
                CalcularLitros := -1;
            end;            
    end;

Function ObtenerTipo(): char;

    var tipo_pintura : char;

    begin
        repeat
            writeln('Ingrese el color de pintura a calcular: ');
            writeln('   B - Blanco');
            writeln('   N - Negro');
            readln(tipo_pintura);
            tipo_pintura := UpCase( tipo_pintura );
        until ( ( tipo_pintura = 'B' ) or ( tipo_pintura = 'N' ));
        ObtenerTipo := tipo_pintura;
    end;

Function ObtenerCantidadLitrosDisponibles(tipo_a_calcular : char) : real;
    begin
        if( tipo_a_calcular = 'N') then
            begin
                writeln('Ingrese la cantidad de litros de pintura BLANCA disponibles: ');
                readln(ObtenerCantidadLitrosDisponibles);            
            end
        else
            begin
                writeln('Ingrese la cantidad de litros de pintura NEGRA disponibles: ');
                readln(ObtenerCantidadLitrosDisponibles);                          
            end;
            
        
    end;



begin
        assig( file, 'E1.txt');
        reset( file );      
        while not eof( file ) do
            begin
                tipo_pintura := ObtenerTipo();
                litros_disponibles := ObtenerCantidadLitrosDisponibles( tipo_pintura );
                litros_necesarios := CalcularLitros( tipo_pintura, litros_disponibles);
                writeln('Litros necesarios de pintura: ',litros_necesarios:8:2)                
            end;        
        close(file);
        
end.