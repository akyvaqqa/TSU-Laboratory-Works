program test3;
var x, y, radius, hipo: real;
begin
  WriteLn('Введите координаты точки по x оси:');
  readLn(x);
  WriteLn('Введите координаты точки по y оси:');
  readLn(y);
  WriteLn('Введите radius:');
  readLn(radius);
  hipo:=sqrt(x*x + y*y);
  if hipo<=radius then writeLn('Точка принадлежит кругу.') else writeLn('Точка не принадлежит кругу.');
end.