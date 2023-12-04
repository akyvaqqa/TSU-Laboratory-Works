program test1;
var a, b, c: integer;
begin
  Writeln('Произведение чисел.');
  c:=0;
  WriteLn('Введите число a:');
  readLn(a);
  WriteLn('Введите число b:');
  readLn(b);
  c:=a*b;
  WriteLn('Произведение чисел a и b равно:', c);
end.