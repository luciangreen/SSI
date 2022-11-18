get_cp_etc(

[Pred_id0,_%Level
,_Predicate_number,Line_number,"predicate",_Query_a,
	Vars,_All_predicate_numbers], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2
	%,More_results
	):-
%trace,
	
	%*****
			%save_local_to_global_cp_trail(Choice_point_trail1,Choice_point_trail1a,CP_Vars1,CP_Vars1a),
Choice_point_trail1=Choice_point_trail1a,
CP_Vars1=CP_Vars1a,



((
%writeln(here2),
	 Query2=[_|_],

%writeln("*2"),

get_last_cp_before_n(Choice_point_trail1a,
	[Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],
	[Cp_a,Cb_b,Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],_,
	CP_Vars1a,CP_Vars3)

%(((Pred_or_line="predicate",not(All_predicate_numbers2=[]))->true;(Pred_or_line="line",All_predicate_numbers2=[_,_,_,_,_,_,Vars2c],not(Vars2c=[]))))



	)
->

	(	%writeln(['*',Cp_a,Cb_b,Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2]),
	
	(%More_results=true->
	semicolon1(Vars)%;true
	)
	,
	(
	Pred_or_line="predicate"->
	
	(
	
		delete_cp(Choice_point_trail1,[Cp_a,Cb_b,Pred_id,Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail12,
	CP_Vars3,CP_Vars4,_),

All_predicate_numbers2=[All_predicate_numbers3|All_predicate_numbers4],
	
		All_predicate_numbers3=[All_predicate_numbers31,"prev_pred_id",Prev_pred_id],

	
	%(Line_number2b = ["returns to", _, "pred_id", _] -> (Line_number2b1 = -1,trace) ; Line_number2b1 = Line_number2b),

	ssi1([Prev_pred_id,Level,All_predicate_numbers31,Line_number2b,"predicate",Query2,
	Vars4,All_predicate_numbers4], End_result,Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail12,
	Choice_point_trail3,
	CP_Vars4,CP_Vars2)

);

(Pred_or_line="line" ->
	
(

delete_until_last_cp(Choice_point_trail1,Choice_point_trail6,D1,AC,CP_Vars3,CP_Vars5),

	(
	D1=[_,_,Pred_id2,Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11],
	
	ssi1([Pred_id2,Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail6,
	Choice_point_trail3,["appearance of command",AC],
	CP_Vars5,CP_Vars2)
	)))));

%****
	(
	


	Result2=Result1,
	CP_Vars1a=CP_Vars2,
	Globals1=Globals2,
	Choice_point_trail1a=Choice_point_trail3,
	Vars=Vars2)
	

	).
	
	
semicolon1(Vars) :-
(semicolon(on)->
	(Vars=[]->(Vars_a="false",writeln1(Vars_a));
	((var(Vars)->Vars_a="true";%[Result1]=Result3;
	%[Result1]=Result3;
	Vars_a=Vars),%append(Result1,[Vars],Result3)),%,
	write1(Vars_a),write(" Press ';' "),
	repeat,get_single_char(Char),[Char]=`;`,
	writeln(";"));true);true).
