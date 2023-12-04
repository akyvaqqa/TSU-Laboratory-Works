program DifferentSorts;
uses crt;

var
  numbers: array of integer;
  sortedNumbers: array of integer;
  frequencyCount: array[-999..999] of integer;
  tempFrequencyCount: array[-999..999] of integer;
  sizes: array of integer := (10, 100, 1000, 2000, 5000, 10000, 20000, 40000, 50000, 100000, 500000, 1000000, 10000000, 100000000);
  size, i: integer;

function IsSorted: boolean;
var
  j: integer;
begin
  for j := -999 to 999 do
    tempFrequencyCount[j] := 0;

  for j := 0 to Length(numbers) - 1 do
    tempFrequencyCount[numbers[j]] := tempFrequencyCount[numbers[j]] + 1;

  for j := -999 to 999 do
    if frequencyCount[j] <> tempFrequencyCount[j] then
    begin
      IsSorted := false;
      exit;
    end;

  for j := 0 to Length(numbers) - 2 do
    if numbers[j] > numbers[j + 1] then
    begin
      IsSorted := false;
      exit;
    end;

  IsSorted := true;
end;

procedure FillArray(var arr: array of integer);
var
  j, k: integer;
begin
  Randomize(1);

  for j := -999 to 999 do
    frequencyCount[j] := 0;

  for j := 0 to Length(arr) - 1 do
  begin
    k := Random(1999) - 999;
    arr[j] := k;
    frequencyCount[k] := frequencyCount[k] + 1;
  end;
end;

procedure BubbleSort(var arr: array of integer);
var
  j: integer;
begin
  j := 0;
  while j < size - 1 do
  begin
    if arr[j] <= arr[j + 1] then
      j := j + 1
    else
    begin
      arr[j] := arr[j] + arr[j + 1];
      arr[j + 1] := arr[j] - arr[j + 1];
      arr[j] := arr[j] - arr[j + 1];
      j := 0;
    end;
  end;
end;

procedure InsertionSort(var arr: array of integer);
var
  j, k: integer;
begin
  for j := 0 to size - 2 do
  begin
    k := j;
    while (k >= 0) and (arr[k] > arr[k + 1]) do
    begin
      arr[k] := arr[k] + arr[k + 1];
      arr[k + 1] := arr[k] - arr[k + 1];
      arr[k] := arr[k] - arr[k + 1];
      k := k - 1;
    end;
  end;
end;

procedure MergeSort(arr: array of integer; a, c: integer);
var
  x, j, i, n1, n2: integer;
begin
  if c <= a then
    exit
  else
  begin
    x := (a + c) div 2;
    MergeSort(arr, a, x);
    MergeSort(arr, x + 1, c);
    n1 := a;
    n2 := x + 1;
    for i := a to c do
    begin
      if (n1 < x + 1) and ((n2 > c) or (arr[n1] < arr[n2])) then
      begin
        sortedNumbers[i] := arr[n1];
        n1 := n1 + 1;
      end
      else
      begin
        sortedNumbers[i] := arr[n2];
        n2 := n2 + 1;
      end;
    end;
    for i := a to c do
      arr[i] := sortedNumbers[i];
  end;
end;

procedure DisplaySortingInfo(methodName: string);
begin
  FillArray(numbers);
  WriteLn('Sorting Method Used: ', methodName);
  Milliseconds;
  case methodName of
    'Bubble Sort': BubbleSort(numbers);
    'Insertion Sort': InsertionSort(numbers);
    'Merge Sort': MergeSort(numbers, 0, Length(numbers) - 1);
  end;
  WriteLn('Array Length / Time Taken (ms): ', size, '/', MillisecondsDelta);
  WriteLn('Sorting Correctness: ', IsSorted);
  WriteLn;
end;

begin
  writeLn('Different types of sort massives - by Andrey Aimurzin [932304]');
  for i := 0 to Length(sizes) - 1 do
  begin
    size := sizes[i];
    WriteLn('_______________________________________________________');
    SetLength(numbers, size);
    SetLength(sortedNumbers, size);
    if size <= 2000 then
      DisplaySortingInfo('Bubble Sort');
    if size <= 100000 then
      DisplaySortingInfo('Insertion Sort');
    DisplaySortingInfo('Merge Sort');
  end;
end.
