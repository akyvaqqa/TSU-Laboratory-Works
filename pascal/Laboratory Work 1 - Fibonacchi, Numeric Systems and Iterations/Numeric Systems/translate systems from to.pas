program translate;
uses crt;
var
p, q, numDigits, i, number, remainder, newBaseNumber: integer;
digits: array of integer;
validInput: boolean;
begin
writeln('Перевод систем счисления в Паскаль без смс и регистрации.');
delay(1000);
writeln('Введите основание исходной системы счисления (Возможный диапазон от 2 до 10000 включительно): ');
readln(p);

if (p < 2) or (p > 10000) then
begin
writeln('Основание исходной системы счисления не должно превышать заданный диапазон.');
readln();
exit;
end;

// Ввод количества цифр в числе и проверка
repeat
write('Введите размерность числа: ');
readln(numDigits);
until numDigits > 0;

// Ввод последовательности цифр и сохранение их в массив
SetLength(digits, numDigits);
for i := 0 to numDigits - 1 do
begin
repeat
write('Цифра ', i + 1, ': ');
readln(digits[i]);
validInput := (digits[i] >= 0) and (digits[i] < p); // Проверка на соответствие системе счисления p
if not validInput then
writeln('Недопустимая цифра для данной системы счисления. Повторите ввод.');
until validInput;
end;

writeln('Введите новое основание системы счисления (Возможный диапазон от 2 до 10000 включительно): ');
readln(q);

if (q < 2) or (q > 10000) then
begin
writeln('Новое основание системы счисления не должно превышать заданный диапазон.');
readln();
exit;
end;

// Перевод числа в десятичную систему счисления
number := 0;
for i := 0 to numDigits - 1 do
begin
number := number * p + digits[i];
end;

// Перевод числа из десятичной системы счисления в новую
SetLength(digits, 0);
while number > 0 do
begin
remainder := number mod q;
SetLength(digits, Length(digits) + 1);
digits[Length(digits) - 1] := remainder;
number := number div q;
end;

// Вывод результата
writeln('Число в новой системе счисления:');
for i := Length(digits) - 1 downto 0 do
begin
write(digits[i], ' ');
end;
writeln;
readln();
writeln('Перевод успешен.');
end.