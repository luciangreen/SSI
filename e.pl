e(Level,Vars3,End_result,Functions,Vars2,Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3
	) :-

((not(Level=0))->(
	
	%trace,
	Level2 is Level-1,
	
	(Level2 = 0 ->
	
	ssi1([0,_Predicate_number,-3,"predicate",_Query_a,
	Vars3,_All_predicate_numbers], _Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3);

	(
		reverse(Choice_point_trail1,Choice_point_trail11),

%writeln([choice_point_trail11,Choice_point_trail11]),
((%trace,
member([_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail11),
(((Pred_or_line="predicate",not(All_predicate_numbers2=[]))->true;
(Pred_or_line="line",%writeln1(All_predicate_numbers2),
All_predicate_numbers2=[_,_,_,_,_,
	_,Vars2c],not(Vars2c=[])))),
	
	%[[n,member2],[[1,2,3],empty],_204342,_204348,[[[[[v,a],[1,2,3]],[[v,b],2]],[[1,2,3],2]],[[[[v,a],[1,2,3]],[[v,b],3]],[[1,2,3],3]]]]

%writeln1(delete(Choice_point_trail1,[Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail12)),
delete(Choice_point_trail1,[Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail12))
->


	(Pred_or_line="predicate"->
	
	%(All_predicate_numbers2=[]->
	%(
	
%***
	
	%);
	
	(
	All_predicate_numbers2=[All_predicate_numbers3|All_predicate_numbers4],
	
	%Level3 is Level+1,
	Level3 is Level,

	ssi1([Level3,All_predicate_numbers3,Line_number2b,"predicate",Query2,
	Vars4,All_predicate_numbers4], End_result,Functions,Vars2,
	Result1, Result2,%2, 
	Globals1,Globals2,
	Choice_point_trail12,
	Choice_point_trail3)

);

(Pred_or_line="line" ->
	
(
%writeln1(delete_until_last_choicepoint(Choice_point_trail1,Choice_point_trail6,D1,AC)),
%trace,
delete_until_last_choicepoint(Choice_point_trail1,Choice_point_trail6,D1,AC),

	(
	D1=[Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11],
	
	ssi1([Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11], _, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail6,
	Choice_point_trail3,["appearance of command",AC])
	))));

%****
	(
	%/*
	reverse(Globals1,Globals3),
	member([[firstargs,Level],FirstArgs],Globals3), %*delete, where was pred called from? - prev level in cps
	delete(Globals3,[[firstargs,Level],FirstArgs],Globals41),
	member([[function,Level],Function],Globals41),
	delete(Globals41,[[function,Level],Function],Globals51),
	member([[arguments1,Level],Arguments1],Globals51),
	delete(Globals51,[[arguments1,Level],Arguments1],Globals61),
	member([[skip,Level],Skip],Globals61),
	delete(Globals61,[[skip,Level],Skip],Globals21),
	
	reverse(Globals21,Globals222),
%*/
%(debug_fail(Skip,[Function,Arguments1])->true;true),


ssi1([Level2,_Predicate_number2,-3,"line",-,
	[],_All_predicate_numbers2], End_result,Functions,Vars2,
	Result1, Result2,%2, 
	Globals222,Globals2, % *** Globals1->Globals222
	Choice_point_trail1,
	Choice_point_trail3))
))))).