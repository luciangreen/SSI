pred_minus_one_fail2([Pred_id1,Level,Predicate_number,_Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2) :-
	%trace,
	member([[firstargs,Pred_id1],_FirstArgs],Globals1),

	member([[function,Pred_id1],Function],Globals1),
	
	member([[arguments1,Pred_id1],Arguments1],Globals1),

	member([[skip,Pred_id1],Skip],Globals1),

	member([[level,Pred_id1],Level_a],Globals1),

	%delete(Globals1,[[function,Pred_id1],Function],Globals3),

	Globals1=Globals3,

/*(trace,
	(debug3(on)->
write(["L",Level_a]);true),
	
	(debug_fail(Skip,[Function,Arguments1])->true;true),
*/
%trace,
	%updatevars(FirstArgs,Vars,[],Result),
	%unique1(Result,[],Vars3),
	
	/*
	Pred_id1=Pred_id4,
	
	get_last_p_before_n(Choice_point_trail1,[%_,_,
	Pred_id4,_Level,_Predicate_number4,-1,"predicate",[Function,Arguments1], %**
	_Vars,_All_predicate_numbers4],
	[_,_,Pred_id4,_Level,_Predicate_number4,-1,"predicate",[Function,Arguments1], %**
	_Vars,_All_predicate_numbers4],_%Choice_point_trail5
	,
	CP_Vars1,CP_Vars3),
	*/
	
	/*
	trace,writeln1(["here1:",%_,_,
	Pred_id4,_Level,_Predicate_number4,-1,"predicate",[Function,Arguments1], %**
	_Vars,_All_predicate_numbers4]),
	*/
%trace,
	%findresult3(Arguments1,Vars3,[],Result22),
	/*
	(debug3(on)->
write(["L",Level_a]);true),
   debug_exit(Skip,[Function,Result22]), % return result21
   checktypes(Function,Result22),
*/
	((not(Level_a=0))->(
	Level2 is Level-1,
	
	(Level2 = 0 ->
	
	%trace,
	(
	%trace,
	(debug3(on)->
write0(["L",Level_a]);true),
	
	(debug_fail(Skip,[Function,Arguments1])->true;true),


ssi1([_,0,Predicate_number,-3,"predicate",Query_a,
	Vars,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2));

	(%trace,

%writeln1([globals3,Globals3]),
%member([pred_id_chain,PID1,Pred_id1],Globals3),
%trace,
	PID1=Pred_id1,
	
	get_last_p_before_n(Choice_point_trail1,
	[PID1,Level3,Predicate_number3,["returns to",Line_number3,"pred_id",Pred_id3]
	,"predicate",Query2,Vars4,All_predicate_numbers3],
	[_Cp_a,_Cb_b,PID1,Level3,Predicate_number3,["returns to",Line_number3,"pred_id",Pred_id3]
	,"predicate",Query2,Vars4,All_predicate_numbers3],_,
	CP_Vars1,CP_Vars41),
	
	get_last_p_before_n(Choice_point_trail1,
	[PID1,Level21,Predicate_number2,-1%Line_number2b
	,"predicate",Query21,Vars9,All_predicate_numbers2],
	[_Cp_a1,_Cb_b1,PID1,Level21,Predicate_number2,-1%Line_number2b
	,"predicate",Query21,Vars9,All_predicate_numbers2],_,
	CP_Vars41,CP_Vars4),

/*writeln1(get_last_p_before_n(Choice_point_trail1,
	[PID1,Level3,Predicate_number2,-1%Line_number2b
	,"predicate",Query2,Vars4,All_predicate_numbers2],
	[_Cp_a,_Cb_b,PID1,Level3,Predicate_number2,Line_number2b,"predicate",Query2,Vars4,All_predicate_numbers2],_,
	CP_Vars1,CP_Vars4)),
	*/
		
		%member([[vars1,PID1],Vars5],Globals3),
		
	(%Line_number2b=["returns to",
	%Line_number3,"pred_id",Pred_id3]

	true % *** this may lower test results
	->
	(
%member([[pred_num,Pred_id3],Predicate_number2],Globals3),
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("true",Dbw_true1),Dbw_true1=Dbw_true,

member([Predicate_number2,_F|Rest],Functions),
(Rest=[_Args,":-",Lines]->true;
(Rest=[_Args]->Lines=[[[Dbw_n,Dbw_true]]];
(Rest=[":-",Lines];
(Rest=[],Lines=[[[Dbw_n,Dbw_true]]])))),



get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,

	member([Line_number3,[Dbw_on_true,_A],[Dbw_go_after,_B],[Dbw_on_false,C],[Dbw_go_to_predicates,_D]|_Line],Lines),
C=Line_number2a
%trace,
/*
	reverse(Globals1,Globals33), 

	member([[firstargs_uv2,Pred_id3],FirstArgs1],Globals33),
%trace,
%writeln1([globals33,Globals33]),
	Globals33=Globals43,

	member([[vars1,Pred_id3],Vars11],Globals43),

	Globals43=Globals212,

reverse(Globals212,Globals22),

	updatevars2(FirstArgs1,Vars3,[],Vars5),
	updatevars3(Vars11,Vars5,Vars6),
	reverse(Vars6,[],Vars7),
	((not(Vars7=[])->
	(
	unique1(Vars7,[],Vars8)
	)
);(
	Vars8=[])),
	
	Vars8=Vars44 %% 4 not 2? ***
	*/
)
;

(Line_number2a=Line_number3%Line_number2b
%,
%,Level_x=Level2
%Vars44=Vars3

)), % Line_number2 to 2b

	member([[level,PID1],Level_b],Globals3),

	%trace,
	ssi1([PID1,Level_b,Predicate_number2,Line_number2a,"line",-,
	Vars4,All_predicate_numbers2], _, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars4,CP_Vars2)
	
	)))).