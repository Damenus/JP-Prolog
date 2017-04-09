%2
:-lib(lists).

%sortowanie%
merge_sort([],[]).     
merge_sort([X],[X]).  
merge_sort(List,Sorted):-List=[_,_|_],divide(List,L1,L2),merge_sort(L1,Sorted1),merge_sort(L2,Sorted2), smerge(Sorted1,Sorted2,Sorted).                  

smerge([],L,L).
smerge(L,[],L):-L\=[].
smerge([X|T1],[Y|T2],[X|T]):-X>Y,smerge(T1,[Y|T2],T).
smerge([X|T1],[Y|T2],[Y|T]):-X=<Y,smerge([X|T1],T2,T).
divide(L,L1,L2):-halve(L,L1,L2).

rowneZero([]).
rowneZero([H|T]):-H=0,rowneZero(T).

zmniejsz([H|T],O):-odejmij(T,O,H).

odejmij(I,I,0).
odejmij([HI|TI],[HO|TO],I):-HI>0,HO is HI-1,NI is I-1,odejmij(TI,TO,NI).


czy_graficzny([],ODP).
czy_graficzny(LISTA,ODP):-merge_sort(LISTA,SORTED),zmniejsz(SORTED,ZMNIEJSZONE),czy_graficzny(ZMNIEJSZONE,ODP),ODP='TAK';ODP='NIE'.


%3

czy_wygrywa(0,0,0).
czy_wygrywa(1,0,0).
czy_wygrywa(0,1,0).
czy_wygrywa(0,0,1).
czy_wygrywa(0,1,1).
% stany końca gry

czy_wygrywa(A,B,C) :- 
(X is A - 2, X >= 0, not(czy_wygrywa(X,B,C))); 
(X is B - 2, X >= 0, not(czy_wygrywa(A,X,C))); 
(X is C - 2, X >= 0, not(czy_wygrywa(A,B,X))); 
(X is A - 2, Y is B + 1, X >= 0, Y >= 0, not(czy_wygrywa(X,Y,C))); 
(X is A - 1, X >= 0, not(czy_wygrywa(X,B,C))); 
(X is A - 1, Y is B + 1, Z is C - 1, X >= 0, Y >= 0, Z >=0, not(czy_wygrywa(X,Y,Z))).

%1
czy_posortowana( [],ODP ).
czy_posortowana( [_],ODP ).
czy_posortowana([H1|[H2|T]], ODP) :- H<H2, czy_posortowana([H2|T], ODP),ODP='T'; ODP='N'.




