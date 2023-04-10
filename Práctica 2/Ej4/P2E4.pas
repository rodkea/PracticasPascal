Program P2E4;

    Uses Crt;

    type
        fecha = record
            anio : integer;
            mes : shortInt;
            dia: shortInt;
    end;

    var
        f : text;
        fecha1 , fecha2, fecha_resultado : fecha;

    function FechaMasAntigua( fecha1, fecha2 :  fecha): fecha;
        
        

        begin
            if ( fecha1.anio > fecha2.anio) then
                begin
                    FechaMasAntigua := fecha1;
                end
            else
                begin
                    if ( fecha2.anio > fecha1.anio ) then
                        begin
                            FechaMasAntigua := fecha2;
                        end
                    else
                        begin
                            if ( fecha1.mes > fecha2 .mes ) then
                                begin
                                FechaMasAntigua := fecha1;
                                end
                            else
                                begin
                                    if ( fecha2.mes > fecha1.mes  ) then 
                                        begin
                                           FechaMasAntigua := fecha2; 
                                        end
                                    else
                                        begin
                                            if ( fecha1.dia > fecha2.dia ) then
                                                begin
                                                   FechaMasAntigua := fecha1; 
                                                end
                                            else
                                                begin
                                                    FechaMasAntigua := fecha2;
                                                end;
                                        end;
                                end;
                        end;                    
                end;
        end;

    begin
        ClrScr;
        assign(f, 'P2E4.txt');
        reset(f);
        while not eof(f) do
            begin
                readLn(f, fecha1.dia, fecha1.mes, fecha1.anio, fecha2.dia, fecha2.mes, fecha2.anio);  
                fecha_resultado := FechaMasAntigua( fecha1, fecha2 );
                writeLn('Fecha mas antigua: ', fecha_resultado.dia,'/',fecha_resultado.mes,'/', fecha_resultado.anio);

            end;            
        close(f);
    end.