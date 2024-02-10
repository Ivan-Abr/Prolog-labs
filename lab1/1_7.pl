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
class(thorkell,1).
class(askhelad,1).
class(baldur,1).
class(heila,2).
class(legolas,2).
class(robin,2).
class(lars,4).
class(michael,4).
class(arthas,3).
class(jorin,3).
class(archemides,5).
class(heizenberg,5).
class(gazmanov,5).
class(thaul,5).
class(zulabar,5).
class(morn,3).
class(radagon,3).
class(thog,1).
class(grok,1).
class(crack,1).
class(barn,2).
class(djubei,2).
class(stichs,2).
class(bjorn,4).
class(kabal,4).

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

question2(X2):- write("What class is the character?"), nl,
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


length_list(Count, Predicate):-
	findall(X, call(Predicate), List),
	length(List, Count).

boolean(Result, Boolean):-
	((Result = (=); Result = (>)) -> Boolean = true; Boolean = false).

count_of_solutions(Result, Predicate, Value):-
	length_list(Count, call(Predicate)),
	compare(Compare_result, Count, Value),
	boolean(Compare_result, Result).

start_opt(X):-
	question1(X1),
	count_of_solutions(First_result, (type(X, X1)))

start:- question1(X1),question2(X2),question3(X3),
    race(X,X1), class(X,X2), rank(X,X3), write(X).
