max(X,Y,X):-X>Y.
max(X,Y,Y):-!.

%Максимум из 3х чисел%
max(X, Y, Z, T):-
	max(X,Y,R1),max(R1,Z,T),!.
	

%Факториал, рекурсия вверх%
fact(0,1).
fact(N,X):- 
	N>0,
	N1 is N - 1,
	fact(N1, X1),
	X is N * X1.

%Факториал, рекурсия вниз%
fact_down(N, X) :- fact_down(N, 1, X).
fact_down(0, Acc, Acc).
fact_down(N, Acc, X) :- 
	N > 0,
	N1 is N - 1,
	Acc1 is Acc * N,
	fact_down(N1, Acc1, X).
	
	
%Сумма цифр, рекурсия вверх%
sum_digits_up(N, Sum) :- sum_digits_up(N, 0, Sum).

sum_digits_up(0, Acc, Acc).
sum_digits_up(N, Acc, Sum) :-
    N > 0,
    Digit is N mod 10,
    N1 is N // 10,
    Acc1 is Acc + Digit,
    sum_digits_up(N1, Acc1, Sum).

	
%Сумма цифр, рекурсия вниз%
sum_digits_down(N, Sum) :- sum_digits_down(N, 0, Sum).

sum_digits_down(0, Acc, Acc).
sum_digits_down(N, Acc, Sum) :-
    N > 0,
    Digit is N mod 10,
    N1 is N // 10,
    Acc1 is Acc + Digit,
    sum_digits_down(N1, Acc1, Sum).


	


