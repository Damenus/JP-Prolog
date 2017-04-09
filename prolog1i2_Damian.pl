%%%%%%%%%%%%%%%%%%%%%%%%% 
czy_posortowane( [_], ODP = 'T').
czy_posortowane( [H1|[H2|Tail]], ODP) :- H1 < H2, ODP = 'T', czy_posortowane( [H2|Tail], ODP ); ODP = 'N'.

%%%%%%%%%%%%%%%%%%%%%%%%

wstaw(X,[Y|T],[Y|NT]) :- X<Y, wstaw(X,T,NT).
wstaw(X,[Y|T],[X,Y|T]) :- X>=Y.
wstaw(X,[],[X]).

sortuj([], []).

sortuj(X, Y) :-
        X = [H|T],
        sortuj(T, Y2),
        wstaw(H, Y2, Y),
        !.
%%%%

rowneZero([]).
rowneZero([H|T]):-H=0,rowneZero(T).

zmniejsz([H|T],O):-odejmij(T,O,H).

odejmij(I,I,0).
odejmij([HI|TI],[HO|TO],I):-HI>0,HO is HI-1,NI is I-1,odejmij(TI,TO,NI).


czy_graficzny([],ODP).
czy_graficzny(LISTA,ODP):-sortuj(LISTA,SORTED),zmniejsz(SORTED,ZMNIEJSZONE),czy_graficzny(ZMNIEJSZONE,ODP),ODP='TAK';ODP='NIE'.



/*
%minus(L, L, 0).
%minus([H|T],[HN|TN], Licznik):- Licznik > 0. 		
		
odejmij([H|T], Nowa):- minus(T,Nowa,H).		
%%%%

%graficzny(Lista):-
		%odejmij(Lista, Lista2.


%%%%
		
czy_graficzny(Lista, ODP ):- 
			sortuj(Lista, Posortowana),
			graficzny(Posortowana) 
			-> ODP = 'Tak'; ODP = 'Nie'.

*/
