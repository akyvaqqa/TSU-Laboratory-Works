program FibonacciSum;
uses crt;
var
  n, i, fibPrev, fibCurrent, fibNext, sum: Integer;

begin
  // Запрос числа n
  Write('Введите число n: ');
  Readln(n);

  // Инициализируем начальные значения
  fibPrev := 0;
  fibCurrent := 1;
  sum := 1;  // Начальная сумма (1 – это первый элемент Фибоначчи)

  // Вычисляем n-й член и сумму до n
  for i := 3 to n do
  begin
    fibNext := fibPrev + fibCurrent;
    sum := sum + fibNext;
    fibPrev := fibCurrent;
    fibCurrent := fibNext;
  end;

  // Выводим результат
  Writeln('n-й член Фибоначчи: ', fibCurrent);
  Writeln('Сумма всех элементов до ', n, ': ', sum);

end.
