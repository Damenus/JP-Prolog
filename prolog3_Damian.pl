/*
krokB(2,0,0). 
krokB(0,2,0).
krokB(0,0,2).
krokB(1,0,1).
krokB(1,0,0).
krokB(0,3,0).
krokB(0,1,2). 
krokB(0,2,1).
krokB(0,0,3).
*/


krokB(A,B,C):- 	\+ (A >= 2, \+ (A1 is A - 2, krokA(A1,B,C))),
				\+ (B >= 2, \+ (B1 is B - 2, krokA(A,B1,C))),
				\+ (C >= 2, \+ (C1 is C - 2, krokA(A,B,C1))),
				\+ (A >= 2, \+ (A2 is A - 2, B2 is B + 1, krokA(A2,B2,C))), /*A-1 B+1 A-1 */
				\+ (A >= 1, \+ (A2 is A - 1, krokA(A2,B,C))), /*A-1, B+1, B-1*/
				\+ (A >= 1, \+ (C >= 1, A2 is A -1, B2 is B + 1, C2 is C - 1, krokA(A2,B2,C2))), /*A-1 B+1 C-1  */
				\+ (A = 0, B = 0, C = 0),
				\+ (A = 0, B = 1, C = 0),
				\+ (A = 0, B = 0, C = 1).
				
krokA(0,0,0).
krokA(0,1,0).
krokA(0,0,1).
krokA(0,1,1).


krokA(A,B,C):- 	(A >= 2, A1 is A - 2, krokB(A1,B,C));
				(B >= 2, B1 is B - 2, krokB(A,B1,C));
				(C >= 2, C1 is C - 2, krokB(A,B,C1)); 
				(A >= 2, A2 is A - 2, B2 is B + 1, krokB(A2,B2,C)); /*A-1 B+1 A-1 */
				(A >= 1, A2 is A - 1, krokB(A2,B,C)); /*A-1, B+1, B-1*/
				(A >= 1, C >= 1, A2 is A -1, B2 is B + 1, C2 is C - 1, krokB(A2,B2,C2)).