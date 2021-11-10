ssi1([0,Predicate_number,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3) :-
	
	%/*
	writeln1(ssi1([0,Predicate_number,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3)),
	%*/
	
	(Line_number = -3 ->
	
		%trace,
		(delete_until_last_choicepoint(Choice_point_trail1,Choice_point_trail6,D1,AC)->
	
	(append(Result1,[Vars],Result3),
	
	D1=[Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11],
	
	ssi1([Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11], _, Functions,Vars2,
	Result3, Result2, 
	Globals3,Globals22,
	Choice_point_trail6,
	Choice_point_trail3,["appearance of command",AC]),
	
	writeln1(	ssi1([Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11], _, Functions,Vars2,
	Result3, Result2, 
	Globals3,Globals22,
	Choice_point_trail6,
	Choice_point_trail3,["appearance of command",AC])
	)))).
	


delete_until_last_choicepoint(Choice_point_trail1,Choice_point_trail2,D1,AC
%,Vars3
) :-
	reverse(Choice_point_trail1,Choice_point_trail3),
	append(_B,C,Choice_point_trail3),append([D],E,C),
	D=[Level,Predicate_number,Line_number_a,"line",-,
	_Vars3,Vars2c],
	(Vars2c=[]->fail;(Vars2c=Vars2e,%[[[Dbw_n,Dbw_member],[Value1,Value2],Value3]|[Vars2e1]],%[[Vars2d,Vars2d1]|Vars2e], % *** needs image of commmand with answer Vars2d1
	writeln1([vars2e,Vars2e]),
	[[[[v,a],[1,2,3]],[[v,b],2]],[[[v,a],[1,2,3]],[[v,b],3]]]
	Vars2e=[[[Dbw_n,Dbw_member],[Value1,Value2],Value3],[Vars2e1]],
	findall(AC1,(member([AC1,_],Vars2e)),AC2),
	AC2=[[Value1a,Value2a]|_],
	findall(Vars2f1,(member([_,Vars2f1],Vars2e)),Vars2f),
	D1=[Level,Predicate_number,Line_number_a,"line",-,
	Vars2f,Vars2e],
	AC=[[Dbw_n,Dbw_member],[Value1,Value2],[Value1a,Value2a]],
	append([D1],E,C1))),
	reverse(C1,Choice_point_trail2),
	!.
		
		writeln1(A):-term_to_atom(A,B),writeln(B).