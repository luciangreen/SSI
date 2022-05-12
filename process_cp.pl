process_cp(Findall_end_line,FA,D1,E1,

Query_a2,

Vars1,
	_End_result, Functions,Vars2, %% CPVs here?**** CPV0,CPV to CPV1,CPV2
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3,
	CP_Vars31,CP_Vars2
	%*/
	) :-
%trace,
%trace,writeln(here1),
	D1=[Pred_id3,Level4
	%1
	,Predicate_number14,Line_number_a14,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars],[format_vars,Format_vars],[result_var,Result_var]],
	
	
	%writeln([d1,D1]),
	E1=[Pred_id2,Level3,Predicate_number2,Line_number_a2,Pred_or_line%"line"
	,Query_a2,_CPV0,CPV3],
	%trace,
	(Pred_or_line="line"->
	(CPV3=[CPV_A1,CPV_A2,_CPV_A3,_CPV_A4,_CPV_A5,
	_CPV_A6,CPV],
	
	%CPV=[CPV1|CPV2],
	CPV=[[CPV11,CPV12]|CPV2],

	get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
		
	remember_and_turn_off_debug(Debug),

	find_sys(Sys_name),
 	interpretpart(match4,Format_vars,[Dbw_v,Sys_name],Vars1,Vars2fa,_),

	(not(FA=fail)->getvalue([Dbw_v,Sys_name],Value3,Vars2fa);
	Value3=empty),
	
(Value3=empty->Findall_vars=Findall_vars2;	append(Findall_vars,[Value3],Findall_vars2)),
	
	turn_back_debug(Debug),

	get_last_p_before_n(Choice_point_trail1e,D1,[Cp_a1,Cp_a2|D1],_,CP_Vars31,CP_Vars4),
	delete_cp(Choice_point_trail1e,[Cp_a1,Cp_a2|D1],Choice_point_trail1a,CP_Vars4,CP_Vars5,_),
	
	D2=[Pred_id3,Level4
	%1
	,Predicate_number14,Line_number_a14,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars2],[format_vars,Format_vars],[result_var,Result_var]],

	append_cp(Choice_point_trail1a,[D2],Choice_point_trail1b,CP_Vars5,CP_Vars6),
	
	delete_cp(Choice_point_trail1b,[_,_|E1],Choice_point_trail1c,CP_Vars6,CP_Vars7,_),
	
		%CPV22=CPV2,
		CPV22=[CPV_A1,CPV_A2,CPV12,CPV11],
		
		CPV23=[CPV_A1,CPV_A2,_CPV_A3,_CPV_A4,_CPV_A5,
	_CPV_A6,CPV2],
	
append_cp(Choice_point_trail1c,[[Pred_id2,Level3,Predicate_number2,Line_number_a2,Pred_or_line,_,_,CPV23]],Choice_point_trail1d,CP_Vars7,CP_Vars8),

%writeln1(["*1",append_cp(Choice_point_trail1c,[[Pred_id2,Level3,Predicate_number2,Line_number_a2,Pred_or_line,_,_,CPV23]],Choice_point_trail1d,CP_Vars7,CP_Vars8)]),

get_lang_word("findall_exit_function",Dbw_findall_exit_function1),Dbw_findall_exit_function1=Dbw_findall_exit_function,

append_cp(Choice_point_trail1d,[[Pred_id2,Level3,Predicate_number2,[Dbw_findall_exit_function,Findall_end_line],"line",_,
	Vars2fa,_]],Choice_point_trail1d1,
	CP_Vars8,CP_Vars81), % Pred_id n?

%CPV1=[CPV10, "prev_pred_id", Prev_pred_id],

	ssi1([Pred_id2,Level3, %*
	Predicate_number2,Line_number_a2,"line",Query_a2,
	Old_vars,CPV23], _End_result, Functions,Vars2, %% CPVs here?**** CPV0,CPV to CPV1,CPV2
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1d1,
	Choice_point_trail3,["appearance of command",CPV22],
	CP_Vars81,CP_Vars2)


		
	
	);
	(Pred_or_line="predicate"->
	(CPV3=CPV,

	CPV=[CPV1|CPV2],
	
	get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
		
	remember_and_turn_off_debug(Debug),

	find_sys(Sys_name),
 
 interpretpart(match4,Format_vars,[Dbw_v,Sys_name],Vars1,Vars2fa,_),

	(not(FA=fail)->getvalue([Dbw_v,Sys_name],Value3,Vars2fa);
	Value3=empty),
	
(Value3=empty->Findall_vars=Findall_vars2;	append(Findall_vars,[Value3],Findall_vars2)),
	
	turn_back_debug(Debug),

%trace,
	get_last_p_before_n(Choice_point_trail1e,D1,[Cp_a1,Cp_a2|D1],_,CP_Vars31,CP_Vars4),
	delete_cp(Choice_point_trail1e,[Cp_a1,Cp_a2|D1],Choice_point_trail1a,CP_Vars4,CP_Vars5,_),
	
	D2=[Pred_id3,Level4
	%1
	,Predicate_number14,Line_number_a14,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars2],[format_vars,Format_vars],[result_var,Result_var]],

	append_cp(Choice_point_trail1a,[D2],Choice_point_trail1b,CP_Vars5,CP_Vars6),
	
	delete_cp(Choice_point_trail1b,[_,_|E1],Choice_point_trail1c,CP_Vars6,CP_Vars7,_),
	
	%(Pred_or_line="line"->
	%(CPV22=[CPV_A1,CPV_A2,CPV_A3,CPV_A4,CPV_A5,
	%CPV_A6,CPV2]
	
	%);
	%(Pred_or_line="predicate"->
	CPV22=CPV2,

append_cp(Choice_point_trail1c,[[Pred_id2,Level3,CPV1,Line_number_a2,Pred_or_line,_,_,CPV22]],Choice_point_trail1d,CP_Vars7,CP_Vars8),

%writeln1(["*2",append_cp(Choice_point_trail1c,[[Pred_id2,Level3,Predicate_number2,Line_number_a2,Pred_or_line,_,_,CPV23]],Choice_point_trail1d,CP_Vars7,CP_Vars8)]),

get_lang_word("findall_exit_function",Dbw_findall_exit_function1),Dbw_findall_exit_function1=Dbw_findall_exit_function,

(FA=fail->FA1=Dbw_findall_fail_function;FA1=Dbw_findall_exit_function),

append_cp(Choice_point_trail1d,[[Pred_id2,Level3,CPV1,[FA1,Findall_end_line],"line",_,
	Vars2fa,_]],Choice_point_trail1d1,
	CP_Vars8,CP_Vars81), % Pred_id n?

%trace,

(
CPV1=[CPV10, "prev_pred_id", Prev_pred_id]->true;
(%writeln("Error here"),
fail)),%->

ssi1([Prev_pred_id,Level3, %*
	CPV10,Line_number_a2,"line",Query_a2,
	_,CPV2], _End_result, Functions,Vars2, %% CPVs here?**** CPV0,CPV to CPV1,CPV2
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1d1,
	Choice_point_trail3,
	CP_Vars81,CP_Vars2)
	/*
	;
(Line_number_a2=["returns to", CPV10, "pred_id", Prev_pred_id]),
%[CPV10, "prev_pred_id", Prev_pred_id]),

	ssi1([Prev_pred_id,Level3, %*
	CPV10,Line_number_a2,"line",Query_a2,
	_,CPV2], _End_result, Functions,Vars2, %% CPVs here?**** CPV0,CPV to CPV1,CPV2
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1d1,
	Choice_point_trail3,
	CP_Vars81,CP_Vars2)
	).
	))).
*/
	))).