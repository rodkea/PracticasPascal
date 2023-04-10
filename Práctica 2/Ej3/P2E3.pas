Program P2E2;

    Uses Crt;

    Var 
        f : text;
        temperatura : real;



    begin
        ClrScr;
        assign(f, 'P2E3.txt');
        reset(f);
        while not eof(f) do
            begin
            readLn(f, temperatura);
            writeLn('Temperatura: ', temperatura:5:2);
            if ( temperatura < 0) then
                begin
                    writeln('No salgo de casa....');
                end
            else
                begin
                    if ( temperatura < 20) then
                        begin
                            writeLn('Hace frio');    
                        end
                    else
                        if ( temperatura < 25) then 
                            begin
                            writeLn('Barbaro');
                            end
                        else
                            begin
                                writeLn('Hace Calor!!')
                            end;
                        
                    
                end;
        end;
        close(f);
    end.