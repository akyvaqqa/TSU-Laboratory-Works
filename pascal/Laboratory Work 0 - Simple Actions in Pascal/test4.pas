program test4;
var
  dividend, divisor, quotient, remainder: integer;
begin
  writeln('4. Без деления найдите целую часть частного и остаток от деления двух целых чисел.');
  // Ввод делимого
  write('Введите делимое целое число: ');
  readln(dividend);
  // Ввод делителя
  write('Введите делитель целое число: ');
  readln(divisor);
  // Инициализация частного и остатка
  quotient := 0;
  remainder := dividend;
  // Вычисление частного и остатка
  while remainder >= divisor do
  begin
    remainder := remainder - divisor;
    quotient := quotient + 1;
  end;
  // Вывод частного и остатка
  writeln('Целая часть частного: ', quotient);
  writeln('Остаток от деления: ', remainder);
end.