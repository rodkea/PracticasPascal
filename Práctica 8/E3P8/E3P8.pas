program E3P8;

  function confuso(a,b:integer):integer;
  begin
    if (b = 0) then
    confuso := 0
    else
    if (b mod 2 = 0) then
    confuso := confuso(a+a, b div 2)
    else
    confuso := confuso(a+a, b div 2) + a;
  end;

  Begin
    // Es a * b 
    writeln(confuso(2,7));
    writeln(confuso(4,25));
    writeln(confuso(3,4));
  End.