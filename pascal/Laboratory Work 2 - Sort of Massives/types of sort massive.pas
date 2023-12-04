program TypeOfSort;
uses crt;
var
  mas:array of integer;                 //Обьявление 4 массивов с вещественным типом данных.
  rez:array of integer;
  count:array[-999..999] of integer;
  scount:array[-999..999] of integer;
  a: array of integer := (10,100,1000,2000,5000,10000,20000,40000,50000,100000,500000,1000000,10000000,100000000);           //Обьявление массива для 5 задания с определенным набором значений.
  n,i:integer;              //Обьявление двух переменных-счетчиков.
  
function verification:boolean;         //Интеграция функции проверки
  var
    i:integer;
  begin
    for i:= -999 to 999 do             //Приравнивание всех значений массива к 0.
      scount[i]:=0;
    for i:= 0 to Length(mas)-1 do
      scount[mas[i]]:=scount[mas[i]]+1;
    for i:= -999 to 999 do 
      if count[i] <> scount[i] then            //Сравнивание значений массивов count и scount.
        begin
          verification:=false;
          exit;
        end;
    for i:=0 to Length(mas)-2 do
      if mas[i]>mas[i+1] then 
        begin
          verification:=false;
          exit;
        end;
    verification:=true;         //Допуск к следующей части алгоритма в случае, если все условия соблюдены.
  end;

procedure fill(var q:array of integer);              //Процедура flll
  var 
    i,j:integer;
  begin
    Randomize(1);
    for i:= -999 to 999 do
      count[i]:=0;
    for i:=0 to Length(q)-1 do                      //Заполняет определенное количество (Count) непрерывных байт определенным значением (типа Byte или Char).
    begin
      j:=Random(1999)-999;
      q[i]:=j;
      count[j]:=count[j]+1;
    end;
  end;                                               //После выполнения этой процедуры, массив q будет заполнен случайными числами из диапазона от -999 до 999,
                                                     //и массив count будет содержать информацию о том, сколько раз каждое из чисел из этого диапазона встречается в q.

procedure Simplesort(var q:array of integer);             //Процедура сортировки методом пузырька, процедура Simplesort выполняет сортировку массива q методом пузырьковой сортировки, при этом на каждом проходе наибольший элемент "всплывает" к концу массива. 
    var                                                   //Сортировка продолжается до тех пор, пока не будет достигнут правильный порядок элементов в массиве.
      i: integer;
    begin
      i:=0;
      while i<n-1 do
      if q[i]<=q[i+1] then 
        i:=i+1
      else 
      begin
        Swap(q[i],q[i+1]);
        //if i>0 then i:=i-1
        i:=0;
      end;     
    end; 

procedure Swapsort(var q:array of integer);                 //Процедура сортировки методом замены.
    var 
      i,j: integer;
    begin
    for i:=0 to n-2 do 
      begin
      j:=i; 
      while (j>=0)and(q[j]>q[j+1]) do                       //процедура Swapsort реализует сортировку вставками, которая поочередно вставляет элементы на их правильные позиции в отсортированной части массива.
        begin                                               //Это продолжается до тех пор, пока весь массив не будет отсортирован.
        Swap(q[j],q[j+1]);
        j:=j-1 
        end;
      end;
    end;
 
Procedure MergeSort(a,c:integer);                        //Процедура сортировки методом сортировки слиянием.
  var 
    x,j,i,n1,n2:integer; 
  begin
    if c<=a then exit else                   //Разбивание массива ещё на две части.
      begin                                  //Постепенная сортировка уже двух отсортированных ранее частей.
      x:=(a+c) div 2;
      MergeSort(a,x);MergeSort(x+1,c);
      n1:=a; n2:=x+1;
      for i:=a to c do 
        begin
        if (n1<x+1)and((n2>c)or(mas[n1]<mas[n2])) then
        begin
          rez[i]:=mas[n1]; inc(n1);
        end else begin
          rez[i]:=mas[n2]; inc(n2);
        end;
        end;
        for i:= a to c do
          mas[i]:=rez[i];
      end;
  end;
  
procedure info(t:string);                //Процедура вывода таблицы времени обработки той или иной процедуры сортировки в ms.
  begin                                  //Процедура info выполняет сортировку массива mas с помощью одного из методов сортировки в зависимости от переданного аргумента t, измеряет время выполнения сортировки и выводит соответствующую информацию в консоль.
    fill(mas);
    Writeln('Используемый метод: ', t);
    Milliseconds;
    case t of
      'Простейшая сортировка': Simplesort(mas);
      'Обменная сортировка': Swapsort(mas);
      'Cортировка Слиянием': MergeSort(0,Length(mas)-1);
    end;
    Writeln('Длинна массива/затраченное время (мс): ',n,'/',MillisecondsDelta);
    Writeln('Корректность сортировки: ', verification);
    Writeln;
  end;

begin                                 //Вывод полученных данных в соответствии с условием "n".
  writeLn('Different types of sort massives - by Andrey Aimurzin [932304]');
  for i:= 0 to Length(a)-1 do
    begin
    n:=a[i];
    Writeln('_______________________________________________________');
    SetLength(mas,n);
    SetLength(rez,n);
    if n <= 2000 then info('Простейшая сортировка');
    if n <= 100000 then info('Обменная сортировка');
    info('Cортировка Слиянием');
    end;
end.