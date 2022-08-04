e(Pred_id,Level,Predicate_number,Vars3,End_result,Functions,Vars2,Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2
	) :-
%trace,

/*	member([[function,Pred_id],Function],Globals1),
	member([[arguments1,Pred_id],Arguments1],Globals1),

	member([[skip,Pred_id],Skip],Globals1),

(debug_fail(Skip,[Function,Arguments1])->true;true),
*/

((not(Level=0))->(
	
	%trace,
	Level2 is Level-1,
	
	(Level2 = 0 ->
	
	(	%(Pred_id=3->writeln(here2);true),
	
	% pred_id in following is _ (and _ for pred_id in ssi1 calls in e.pl because they are -3 line calls, and shouldn't pass previous pred ids to be added to pred id chain)
	
	ssi1([_,0,_Predicate_number,-3,"predicate",_Query_a,
	Vars3,_All_predicate_numbers], _Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2));

	(
	
	%Choice_point_trail1=Choice_point_trail11,

	%reverse(Choice_point_trail1,Choice_point_trail11),

%writeln([choice_point_trail11,Choice_point_trail11]),
((%trace,
%writeln(here1),
/*writeln1(get_last_p_before_n(Choice_point_trail1,
	[_Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],
	[Cp_a,Cb_b,_Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],_)),
	*/
	
	%writeln([choice_point_trail1,Choice_point_trail1]),

	 Query2=[_|_],
	%trace,
%writeln("*1"),
	get_last_cp_before_n(Choice_point_trail1,
	[Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],
	 [Cp_a,Cb_b,Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],_,
	 CP_Vars1,CP_Vars21)	,
	 
	member([[function,Pred_id],Function],Globals1),
	member([[arguments1,Pred_id],Arguments1],Globals1),

	member([[skip,Pred_id],Skip],Globals1),

(debug_fail(Skip,[Function,Arguments1])->true;true)


%Query2=[AB1|AB2],not(var(AB1)),not(var(AB2)),	 %trace,
	/*
writeln1(get_last_p_before_n(Choice_point_trail1,
	[Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],
	[Cp_a,Cb_b,Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],_)),
	*/
	
%member([_Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail11),
%(((Pred_or_line="predicate",not(All_predicate_numbers2=[]))->true;(Pred_or_line="line",%writeln1(All_predicate_numbers2),All_predicate_numbers2=[_,_,_,_,_,_,Vars2c],not(Vars2c=[]))))
	
	%[[n,member2],[[1,2,3],empty],_204342,_204348,[[[[[v,a],[1,2,3]],[[v,b],2]],[[1,2,3],2]],[[[[v,a],[1,2,3]],[[v,b],3]],[[1,2,3],3]]]]

%writeln1(delete(Choice_point_trail1,[Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail12)),

/*writeln1(delete_cp(Choice_point_trail1,[Cp_a,Cb_b,_Pred_id,Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail12)),
*/


/*
writeln1(delete_cp(Choice_point_trail1,[Cp_a,Cb_b,_Pred_id,Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail12))
*/
)
->


	(Pred_or_line="predicate"->
	
	%(All_predicate_numbers2=[]->
	%(
	delete_cp(Choice_point_trail1,[Cp_a,Cb_b,Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail12,CP_Vars21,CP_Vars3,_),

%***
	
	%);
	
	(
	All_predicate_numbers2=[All_predicate_numbers3|All_predicate_numbers4],
	
	All_predicate_numbers3=[All_predicate_numbers31,"prev_pred_id",Prev_pred_id],
	%trace,
	
	
		delete_cp_value(Choice_point_trail12,[All_predicate_numbers31,"prev_pred_id",Prev_pred_id],Choice_point_trail13,CP_Vars3,CP_Vars31),


	member([[level,Pred_id],L],Globals1),
	%Level3 is Level+1,
	%Level3 is Level,

	%(Pred_id=3->writeln(here3);true),
	
	% pred id in the following was _
	(Line_number2b = ["returns to", _, "pred_id", _] -> (Line_number2b1 = -1,trace) ; Line_number2b1 = Line_number2b),
	
ssi1([["prev_pred_id",Prev_pred_id],L,All_predicate_numbers31,Line_number2b1,"predicate",Query2,
	Vars4,All_predicate_numbers4], End_result,Functions,Vars2,
	Result1, Result2,%2, 
	Globals1,Globals2,
	Choice_point_trail13,
	Choice_point_trail3,
	CP_Vars31,CP_Vars2)

);

(Pred_or_line="line" ->
	
(
%trace,
delete_until_last_cp(Choice_point_trail1,Choice_point_trail6,D1,AC,CP_Vars21,CP_Vars4),
%writeln1(delete_until_last_cp(Choice_point_trail1,Choice_point_trail6,D1,AC,CP_Vars21,CP_Vars4)),

	(
	D1=[_,_,Pred_id2,Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11],
	
	%writeln1([d1,D1]),
	
	ssi1([Pred_id2,Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11], _, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail6,
	Choice_point_trail3,["appearance of command",AC],
	CP_Vars4,CP_Vars2)
	))));

%****
	(
	/*
	%reverse(Globals1,Globals3),
	member([[firstargs,Pred_id],FirstArgs],Globals1), %*delete, where was pred called from? - prev level in cps
	delete(Globals1,[[firstargs,Pred_id],FirstArgs],Globals41),
	member([[function,Pred_id],Function],Globals41),
	delete(Globals41,[[function,Pred_id],Function],Globals51),
	member([[arguments1,Pred_id],Arguments1],Globals51),
	delete(Globals51,[[arguments1,Pred_id],Arguments1],Globals61),
	member([[skip,Pred_id],Skip],Globals61),
	delete(Globals61,[[skip,Pred_id],Skip],Globals71),
	member([[level,Pred_id],Level],Globals71),
	delete(Globals71,[[level,Pred_id],Level],Globals222),
	
	%reverse(Globals21,Globals222),
*/

%(debug_fail(Skip,[Function,Arguments1])->true;true),


ssi1([Pred_id,Level,Predicate_number,-3,"predicate",-,
	[],_All_predicate_numbers2], End_result,Functions,Vars2,
	Result1, Result2,%2, 
	Globals1,Globals2, % *** Globals1->Globals222
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2))
))))).