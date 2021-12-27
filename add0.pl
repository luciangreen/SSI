% add0([1,2],B).

add2(A,B) :- A=[],B=[].
add3(A,B) :- tail(A,B).
add0(A,B) :- one(A,C),=(C,B).
one(A,B) :- add2(A,C),=(C,B).
one(A,B) :- add3(A,C),one(C,D),D=B.

tail(A,B) :- A=[_|B].