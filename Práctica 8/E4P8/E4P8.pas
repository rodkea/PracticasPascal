program E4P8;

function InvertirCadenaRecursivo(cadena: string): string;
begin
  if Length(cadena) <= 1 then
    InvertirCadenaRecursivo := cadena
  else
    InvertirCadenaRecursivo := InvertirCadenaRecursivo(Copy(cadena, 2, Length(cadena) - 1)) + cadena[1];
end;

var
  cadena: string;

begin
  writeln('Ingrese una cadena de caracteres:');
  readln(cadena);
  writeln('Cadena invertida: ', InvertirCadenaRecursivo(cadena));
end.