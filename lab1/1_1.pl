man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

/*Вывод всех мужчин*/
men():- man(X), print(X), nl, fail.

/*Вывод всех женщин*/
women():- woman(X), print(X), nl, fail.

/*Вывод всех детей родителя X*/
children(X):- parent(X,Y), print(Y), nl, fail.

/*Проверка на мать(X - мать Y)*/
mother(X,Y):- woman(X), parent(X,Y).
/*Вывод всех матерей*/
mother(X):- mother(Y,X), print(Y), nl, fail.

/*проверка на брата(X - брат Y)*/
brother(X,Y):- man(X), mother(Z,X), mother(Z,Y), X \= Y.
/*вывод всех братьев X*/
brothers(X):- brother(Y,X), print(Y), nl,fail.

/*проверка на сиблинга(X - сиблинг Y)*/
b_s(X,Y):- mother(Z,X), mother(Z,Y), X \= Y.
/*вывод всех сиблингов X*/
b_s(X):- b_s(Y,X), print(Y), nl,fail.
