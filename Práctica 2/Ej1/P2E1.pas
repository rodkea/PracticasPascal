Program P2E1;

    Uses Crt;

    Var 
        f:  text;
        caracter: char;

    function EsMayuscula( caracter: char): Boolean;
        begin
            EsMayuscula :=  ('@' < caracter) and ( caracter < 'a' );
        end;
    function EsMinuscula( caracter: char): Boolean;
        begin
            EsMinuscula :=  ('`' < caracter) and ( caracter < '{' );
        end;
    

    begin
        ClrScr;
        assign(f, 'P2E1.txt');
        reset(f);
        while not eof(f) do
            begin
                readLn(f, caracter);    
                if EsMayuscula( caracter ) then
                    begin
                        writeLn('El caracter " ', caracter, ' " es una letra mayuscula');    
                    end
                else
                    begin
                    if EsMinuscula( caracter ) then
                        begin
                            writeLn('El caracter " ', caracter, ' " es una letra minuscula');    
                        end
                    else
                        begin
                            writeLn('El caracter " ', caracter, ' " no es una letra');    
                        end;
                end;                    
                
                
                    
            end;
            


    end.