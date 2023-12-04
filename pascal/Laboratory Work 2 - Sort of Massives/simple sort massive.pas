program simplesort;
uses crt;
const
    m = 10;
var
    massive: array[1..m] of integer;
    i,j,k: integer;
begin
    writeLn('Программа простой сортировки массива по возрастанию.');
    delay(1000);
    randomize;
    for i := 1 to m do begin
        massive[i] := random(100);
    end;
  writeln('Исходный массив: ');
  writeln(massive);
  delay(100);
  writeLn('Процесс сортировки...');
  delay(1000);
    for i := 1 to m-1 do
        for j := 1 to m-i do
            if massive[j] > massive[j+1] then begin
                k := massive[j];
                massive[j] := massive[j+1];
                massive[j+1] := k
            end;
    writeln ('Отсортированный массив: ');
        writeln(massive); 
end.