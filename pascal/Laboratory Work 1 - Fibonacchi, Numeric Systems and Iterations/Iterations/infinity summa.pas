program summa;
uses crt;
function fuc(a: int64): real;
var f:real; i:int64;
begin
    f:=1;  
    for i := 1 to a do
    f := f * i;
    fuc:=f;
end;
function deg(a:real; b:int64): real;
var 
  i:int64; 
  h:real;
begin
    h:=a;
    if b = 0 then deg:=1
    else
      begin
        for i := 1 to b-1 do
          begin
            h:= h * a;
          end;
        deg:=h;
      end;
end;

function bf(a:real; b:int64): real;
begin
  bf:=(deg(a,b)/fuc(b));
end;
 
var
  m1,m2,sum,h,eps: real;
  i,n,j,k:int64;
begin
writeLn('Введите ограничения интервала:');
Read(m1, m2);
Writeln('№ точки:':10,'Значение аргумента:':20,' Точность расчёта':20,'Значение функции':20,'Количество итераций':25);
h:=(m2-m1)/9;
for i:=0 to 9 do
  begin
  eps:=0.1;
  for k:=1 to 6 do
    begin 
    sum:=0;
    j:=0;
    eps:=eps/10;
    while Abs(bf(m1+h*i,j)) > eps do 
      begin
      sum:=sum+bf(m1+h*i,j);
      j:=j+1;
      end;  
      Writeln(i+1:7,m1+h*i:15:1,10*eps:28:k,sum:17:k,j:21);
    end;
    Writeln;
  end;   
end.