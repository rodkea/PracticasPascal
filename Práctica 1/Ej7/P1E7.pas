Program P1E7;

    Uses Crt;

    type

        carta = record
            palo: char;
            color: char;
            numero: shortInt;
    end;

    Var 
        carta1 , carta2 : carta;

    Function AsCopaCualquierMazo( carta : carta ) : Boolean;

        begin
            AsCopaCualquierMazo :=  ( carta.numero = 1 ) and ( carta.palo = 'C');
        end;

    Function CartaFiguraMazoRojoCualquierPalo( carta : carta ): Boolean;

    begin
        CartaFiguraMazoRojoCualquierPalo := (carta.numero > 9) and ( carta.color = 'R' );       
    end;

    Function DosCartasIgualesDiferentesMazos( carta1, carta2 : carta ) : Boolean;

        begin
            DosCartasIgualesDiferentesMazos := ( carta1.color <> carta2.color ) and ( carta1.palo = carta2.palo ) and ( carta1.numero = carta2.numero );
        end;
    
    Function DosCartasConsecutivasDelMismoPaloCualquierMazo( carta1, carta2 : carta) : Boolean;

        begin
            DosCartasConsecutivasDelMismoPaloCualquierMazo := ( Abs( carta1.numero - carta2.numero) = 1 ) and ( carta1.palo = carta2.palo );
        end;

    Function DosCartasSumanDoceDistintoPaloDistintoMazo( carta1, carta2 : carta ) : Boolean;

        begin
            DosCartasSumanDoceDistintoPaloDistintoMazo := ( (carta1.numero + carta2.numero) = 12) and ( carta1.palo <> carta2.palo ) and ( carta1.color <> carta2.color );
        end;

    Function DosCartasIgualNumeroDistintoMazoOIgualPalo( carta1, carta2 : carta ) : Boolean;

        begin
            DosCartasIgualNumeroDistintoMazoOIgualPalo := ( carta1.numero = carta2.numero ) and ( (carta1.color = carta2.color) or ( carta1.palo = carta2.palo ));
        end;

    Function DosCartasDistintoNumeroIgualMazoIgualPalo( carta1, carta2 : carta) : Boolean;

        begin
            DosCartasDistintoNumeroIgualMazoIgualPalo := ( carta1.numero <> carta2.numero ) and ( carta1.color = carta2.color ) and ( carta1.palo = carta2.palo ); 
        end;

    Function PrimeraCartaMayorSegunda( carta1, carta2 : carta ) : Boolean;

        Function ColorRank( color : char ) : shortInt;
            begin
                case color of
                    'R' : ColorRank := 1;
                    'A' : ColorRank := 0;
                end;
            end;

        Function PaloRank( palo : char ): shortInt;
            begin
                case palo of
                    'O': PaloRank := 3;
                    'C': PaloRank := 2;
                    'E': PaloRank := 1;
                    'B': PaloRank := 0;
                end;
            end;

        begin
            if (  ColorRank( carta1.color) > ColorRank( carta2.color ) ) then
                // CARTA 1 ES ROJA Y CARTA DOS AZUL => CARTA 1 > CARTA 2
                begin
                    PrimeraCartaMayorSegunda := True;
                end
            else
                begin
                    // CARTA 1 es AZUL y CARTA DOS ES ROJA => CARTA 2 > CARTA 1
                    if (  ColorRank( carta1.color) < ColorRank( carta2.color ) ) then
                        begin
                            PrimeraCartaMayorSegunda := False;
                        end
                    else
                        // CARTA 1 Y CARTA 2 MISMO COLOR DE MAZO
                        begin
                            if ( PaloRank( carta1.palo ) > PaloRank( carta2.palo )) then
                                // PALO DE CARTA 1 > PALO CARTA 2 => CARTA 1 > CARTA 2
                                begin
                                    PrimeraCartaMayorSegunda := True;
                                end
                            else
                                begin
                                    if ( PaloRank( carta1.palo ) < PaloRank( carta2.palo )) then
                                        // PALO DE CARTA 2 > PALO CARTA 1 => CARTA 2 > CARTA 1
                                        begin
                                            PrimeraCartaMayorSegunda := False;
                                        end
                                    else
                                        // PALO DE CARTA 1 = PALO CARTA 2 
                                        begin
                                            // COMPARA LOS NUMEROS
                                            PrimeraCartaMayorSegunda := ( carta1.numero > carta2.numero );
                                        end;
                                    
                                end;
                            
                        end;
                end;
                
            
        end;


    Procedure MostrarCarta( carta : carta);

    var color, palo : string;

    begin

        case carta.color of
            'R' : color := 'Rojo';
            'A' : color := 'Azul';
        end;
        case carta.palo of
            'C': palo := 'Copa';
            'B': palo := 'Basto';
            'O': palo := 'Oro';
            'E': palo := 'Espada';
        end;
        writeLn(carta.numero, ' de ', palo, ' de un mazo de color ', color);
        
        
    end;
    

    begin
        ClrScr;
        // Lectura Carta 1
        writeLn('Ingrese color del Mazo de la carta 1: ');
        readLn(carta1.color);
        writeLn('Ingrese el palo de la carta 1: ');
        readLn(carta1.palo);
        writeLn('Ingrese el numero de la carta 1: ');
        readLn(carta1.numero);
        // Lectura Carta 2
        writeLn('Ingrese color del Mazo de la carta 2: ');
        readLn(carta2.color);
        writeLn('Ingrese el palo de la carta 2: ');
        readLn(carta2.palo);
        writeLn('Ingrese el numero de la carta 2: ');
        readLn(carta2.numero);
        ClrScr;
        // Muestra de Cartas
        writeLn('Carta 1');
        MostrarCarta( carta1);
        writeLn();
        writeLn('Carta 2');
        MostrarCarta( carta2);
        writeLn();
        // 
        writeLn('AS de copa de cualquier mazo?  (Carta 1) ', AsCopaCualquierMazo( carta1 ));
        writeLn('Carta figura del mazo rojo de cualquier palo? (Carta 1) ', CartaFiguraMazoRojoCualquierPalo( carta1));
        writeLn('AS de copa de cualquier mazo?  (Carta 2) ', AsCopaCualquierMazo( carta2 ));
        writeLn('Carta figura del mazo rojo de cualquier palo? (Carta 2) ', CartaFiguraMazoRojoCualquierPalo( carta2));
        writeLn('Cartas iguales de diferentes mazos? ', DosCartasIgualesDiferentesMazos(carta1, carta2));
        writeLn('Cartas consecutivas del mismo palo sin importar mazo? ',  DosCartasConsecutivasDelMismoPaloCualquierMazo(carta1, carta2));
        writeLn('Dos cartas que suman 12 de distinto palo y mazo? ',  DosCartasSumanDoceDistintoPaloDistintoMazo(carta1, carta2));
        writeLn('Dos cartas de igual numero en el mismo mazo o del mismo palo? ',  DosCartasIgualNumeroDistintoMazoOIgualPalo(carta1, carta2));
        writeLn('Dos cartas de distinto numero en el mismo mazo y del mismo palo? ',  DosCartasDistintoNumeroIgualMazoIgualPalo(carta1, carta2));
        writeLn('Es la primera carta mayor que la segunda? ',  PrimeraCartaMayorSegunda(carta1, carta2));
    end.

    