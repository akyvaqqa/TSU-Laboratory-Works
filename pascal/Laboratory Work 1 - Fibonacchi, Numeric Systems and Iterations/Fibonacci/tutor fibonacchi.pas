﻿Var
    a, b, c, i, n: integer;
begin
    write('n = ');          // Ввод переменной n для вычисления max количества чисел в последовательности
    readln(n);
    a := 0;                  // Приравнивание a к нулю, как первому члену последовательности
    write(a,' ');           // Вывод a
    b := 1;                  // Вывод b к 1, как второму члену последовательности
    write(b,' ');           // Вывод b
for i := 3 to n do begin // Начало цикла, где счетчик равен 3, т.е первые два элемента a и b равны 0 и 1 соответственно
        write(a + b, ' ');       // Сложение предыдущих элементов последовательности для вычисления следующего
        c := b;
        b := a + b;
        a := c;            // Обмен значениями
    end;
    writeln;
end.
