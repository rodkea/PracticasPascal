program P1E5;

Uses math;

Function CalcularSuperficieTotal( ancho_embaldosado, largo_embaldosado : real) : real;
    
    Const 
        SUPERFICIE_TERRENO = 10 * 30;
    begin
        CalcularSuperficieTotal := (ancho_embaldosado * largo_embaldosado) / SUPERFICIE_TERRENO;    
    end;

Function CalcularBaldosas( ancho_a_embaldosar, largo_a_embaldosar : real ) : integer;

    Const 
        MEDIDA_BALDOSA = 0.25;

    begin
        CalcularBaldosas := Ceil(ancho_a_embaldosar / MEDIDA_BALDOSA) * Ceil( largo_a_embaldosar / MEDIDA_BALDOSA);
    end;




var
    largo_a_embaldosar , ancho_a_embaldosar : real;
    f : text;


begin

    assign(f, 'E5.txt');
    reset(f);
    while not eof(f) do
        begin
            readLn(f, largo_a_embaldosar, ancho_a_embaldosar);
            writeln('Largo a embaldoras: ', largo_a_embaldosar:8:2, ' metros.');
            writeln('Ancho a embaldoras: ', ancho_a_embaldosar:8:2, ' metros.');
            writeln('Superficie a embaldosar: ', CalcularSuperficieTotal( ancho_a_embaldosar, largo_a_embaldosar ) * 100:3:2, ' %' );
            writeln('Numero de baldosas necesarios: ', CalcularBaldosas( ancho_a_embaldosar, largo_a_embaldosar ));
            writeln();
            
        end;
    close(f);
    
end.