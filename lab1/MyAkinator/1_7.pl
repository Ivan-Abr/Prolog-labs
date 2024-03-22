/*По расе*/
race(thorkell,1).
race(askhelad,1).
race(baldur,1).
race(heila,1).
race(legolas,3).
race(robin,1).
race(lars,1).
race(michael,1).
race(arthas,1).
race(jorin,3).
race(archemides,1).
race(heizenberg,1).
race(gazmanov,3).
race(thaul,2).
race(zulabar,4).
race(morn,2).
race(radagon,2).
race(thog,2).
race(grok,2).
race(crack,4).
race(barn,2).
race(djubei,4).
race(stichs,4).
race(bjorn,2).
race(kabal,2).

/*По классу*/
profession(thorkell,1).
profession(askhelad,1).
profession(baldur,1).
profession(heila,2).
profession(legolas,2).
profession(robin,2).
profession(lars,4).
profession(michael,4).
profession(arthas,3).
profession(jorin,3).
profession(archemides,5).
profession(heizenberg,5).
profession(gazmanov,5).
profession(thaul,5).
profession(zulabar,5).
profession(morn,3).
profession(radagon,3).
profession(thog,1).
profession(grok,1).
profession(crack,1).
profession(barn,2).
profession(djubei,2).
profession(stichs,2).
profession(bjorn,4).
profession(kabal,4).

/*По званию*/
rank(thorkell,2).
rank(askhelad,4).
rank(baldur,3).
rank(heila,2).
rank(legolas,3).
rank(robin,1).
rank(lars,2).
rank(michael,3).
rank(arthas,3).
rank(jorin,2).
rank(archemides,3).
rank(heizenberg,2).
rank(gazmanov,4).
rank(thaul,3).
rank(zulabar,4).
rank(morn,2).
rank(radagon,4).
rank(thog,3).
rank(grok,2).
rank(crack,1).
rank(barn,2).
rank(djubei,3).
rank(stichs,1).
rank(bjorn,2).
rank(kabal,3).


question1(X1):- write("What race is the character?"), nl,
    write("1. Human"),nl,
    write("2. Ork"),nl,
    write("3. Elf"),nl,
    write("4. Goblin"),nl,
    read(X1).

question2(X2):- write("What profession is the character?"), nl,
     write("1. Warrior"),nl,
      write("2. Archer"),nl,
       write("3. Paladin"),nl,
        write("4. Cavalry"),nl,
         write("5. Mage"),nl,
         read(X2).

question3(X3):- write("What rank has the character?"), nl,
     write("1. Soldier"),nl,
      write("2. Sergeant"),nl,
       write("3. Captain"),nl,
        write("4. General"),nl,
        read(X3).


to_boolean(Result, Boolean):-
((Result = (=); Result = (>)) -> Boolean = true; Boolean = false).

length_predicate(Count, Predicate):- 
				findall(X, call(Predicate), List),
				length(List, Count).


count_of_solutions(Result, Predicate, Value):-
	length_predicate(Count, call(Predicate)),
	compare(Compare_result, Count, Value),
	to_boolean(Compare_result, Result).



smart_test(X):-
	question1(X1),
	count_of_solutions(
		First_result,
		race(X,X1),
		2
	),
	(First_result -> (
		question2(X2),
		count_of_solutions(
			Second_result,
			(race(X,X1), profession(X,X2)),
			2
		),
		write(Second_result),
		(Second_result -> (
			question3(X3),
			race(X,X1),
			profession(X,X2),
			rank(X,X3)
		);(
			race(X,X1),
			profession(X,X2)
		))
	);(
		race(X,X1)
	)).

start_test:- smart_test(X),nl,print(X),nl,fail.