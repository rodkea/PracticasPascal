program P3E1;

procedure maximo(VAR max:integer; VAR value:integer; VAR count:integer);
    begin
        writeln(value);
        if value > max then
            begin
                max := value;
                count := 0;
            end
        else
            if value = max then
                begin                
                count := count + 1;                                            
                end
    end;

var
    N, i, value, max, count, pos, min_impar : integer;
    input_file : text;
begin
    assign(input_file, 'P3E1.txt');
    reset(input_file);
    read(input_file, N);
    read(input_file, max);
    min_impar := max;
    For i := 2 to N do
        begin
            read(input_file, value);
            maximo(max, value, count);
            writeln(count)
        end;
    writeln('Máximo: ',max);
    writeln('Nro de repeticiones: ', count)

    
end.
