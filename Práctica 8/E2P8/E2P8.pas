Program E2P8;

  function funcRec(i : integer):integer;

    begin
      if (i = 0) then
        Begin
          funcRec := 1;
        End
      else
        Begin
          if ( (i mod 2) = 0)  then
            Begin
              funcRec := 1 + funcRec(i - 1);
            End
          else
            Begin
              funcRec := funcRec(i - 1);
            End;
        End;  
    end;

  Begin
    writeln(funcRec(2));
  End.