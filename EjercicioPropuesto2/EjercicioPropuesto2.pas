Program EjercicioPropuesto2;

  Uses Crt;
    
  Const
    MAX_LENGTH = 10;

  Type
    TVEnteros = array[1..MAX_LENGTH] of integer;
		TVReal = array[1..MAX_LENGTH] of real;

  Var
		N, i : byte;
    Vcant, VMasl : TVEnteros;
		VCosto : TVReal;
    input_file : text;

  Procedure LeerArchivo(var N : byte; var Vcant, VMasl : TVEnteros; var VCosto : TVReal; var input_file : text);

		Var
			typography : char;
			word_size : byte;
			typography_size : byte;
			letter : char;

    Begin
			N := 0;
			While not eof(input_file) do
				Begin			
					N := N +1;		
					Vcant[N] := 0; VCosto[N] := 0; VMasl[N] := 0;
					read(input_file, typography, typography_size, letter);					
					while letter <> '.' do
						Begin
							read(input_file, letter);														
							if  ((letter <> ' ') or (letter <> '.') ) then	{ ENCONTRE UNA PALABRA }							
								Vcant[N] := Vcant[N] + 1;																										
									word_size := 0;
									repeat { CUENTO LETRAS }										
										word_size := word_size + 1;
										read(input_file, letter);																				
									until ( (letter = ' ') or (letter = '.') );									
									if (word_size > VMasl[N]) then  
										VMasl[N] := word_size; 											
						End;
					VCosto[N] := Vcant[N] * 1; 
					if (typography_size > 1) then
							VCosto[N] := VCosto[N] * 1.5;
					case typography of
						'A' : VCosto[N] := VCosto[N] * 2;
						'B' : VCosto[N] := VCosto[N] * 3;
						'C' : VCosto[N] := VCosto[N] * 5;
						
					end;
					
					read(input_file, letter);
				End;
				
				
		End;
  

	Begin
		assign(input_file, 'EjercicioPropuesto2.txt');
		reset(input_file);
		LeerArchivo(N, Vcant, VMasl, VCosto, input_file);
		for i := 1 to N do
			writeln(Vcant[i],' ', VMasl[i], ' ', VCosto[i]:4:2);
			
		close(input_file);
	End.

