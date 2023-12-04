program test2;
var a, b, c: integer;
begin
  Writeln('Введите число a:');
  readLn(a);
  Writeln('Введите число b:');
  readLn(b);
  Writeln('Введите число c:');
  readLn(c);
  if (a > b) and (a > c) and (b > c) Then
   Write(c, ' ', b, ' ', a)
  else if (a > b) and (a > c) and (b < c) Then
   Write(b, ' ', c, ' ', a)
  else if (a > b) and (a < c) Then
   Write(b, ' ', a, ' ', c)
  else if (a > c) Then
   Write(c, ' ', a, ' ', b)
  else if (b > c) then
   Write(a, ' ', c, ' ', b)
  else
   Write(a, ' ', b, ' ', c)
end.
