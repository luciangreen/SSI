query_box_1(T):- grammar1("[a,a]",T),!.
grammar1(U,T):- compound(U,"",[],T).
compound213("","",T,T).
compound213(U,U,T,T).
compound(Vgp1,Vgp2,T,U):- grammar_part("[",Vgp1,Vgp3),compound21(Vgp3,Vgp4,T,V),grammar_part("]",Vgp4,Vgp5),compound213(Vgp5,Vgp2,V,U).
compound212("","",T,T).
compound212(U,U,T,T).
compound21(Vgp1,Vgp2,T,U):- a(Vgp1,Vgp3),wrap("a",Itemname1),append(T,Itemname1,V),compound212(Vgp3,Vgp2,V,U).
compound21(Vgp1,Vgp2,T,U):- a(Vgp1,Vgp3),grammar_part(",",Vgp3,Vgp4),compound21(Vgp4,Vgp2,[],Compound1name),wrap("a",Itemname1),append(T,Itemname1,V),append(V,Compound1name,U).
compound212(A,A,T,T).
a("","").
a(Vgp1,Vgp2):- grammar_part("a",Vgp1,Vgp2).
a(A,A).

grammar_part(A,B,C):- string_concat(A,C,B).
wrap(A,[A]).