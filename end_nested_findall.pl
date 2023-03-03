end_nested_findall(FA,Pred_id,Level,Predicate_number,Line_number_b,Choice_point_trail1,Choice_point_trail2,Vars1,Vars2,CP_Vars1,CP_Vars2,Functions,Globals1,Globals2,Result1, Result2,End_line42) :-
	% if there are no more choice points after the current findall, then pass back results.
	
	% [1,2,1,1,0,-1,"predicate",[[n,query_box_1],[[v,b]]],[[[v,b],empty]],[]],[2,3,1,1,0,["returns to",0,"pred_id",1],"predicate",-,[[[v,b],empty]],[]],[3,4,2,2,1,-1,"predicate",[[n,findall1],[[[1,2],[3,4]],[v,b]]],[[[v,a],[[1,2],[3,4]]],[[v,b],empty]],[]],[4,5,2,2,1,0,"findall",-,[old_vars,[[[v,a],[[1,2],[3,4]]],[[v,b],empty]]],[findall_vars,[empty]],[format_vars,[v,b1]],[result_var,[v,b]]],[5,6,2,2,1,2,"line",_536118,_536124,[[n,member2],[[[1,2],[3,4]],empty],_462556,_462562,_462568,_462574,[]]],[6,7,2,2,1,3,"findall",-,[old_vars,[[[v,a],[[1,2],[3,4]]],[[v,b],empty],[[v,a1],[3,4]]]],[findall_vars,[8]],[format_vars,[v,a3]],[result_var,[v,b1]]],[7,8,2,2,1,5,"line",_577278,_577284,[[n,member2],[[3,4],empty],_557636,_557642,_557648,_557654,[]]],[8,9,2,2,1,[findall_exit_function,3],"predicate",-,[[[v,a],[[1,2],[3,4]]],[[v,b],empty],[[v,a1],[1,2]],[[v,a2],2],[[v,a3],7],[[v,b1],[6,7]]],[[n,member2],[[1,2],empty],_482002,_482008,_482014,_482020,[]]],[9,10,2,2,1,5,"line",_499516,_499522,[[n,member2],[[1,2],empty],_482002,_482008,_482014,_482020,[]]]

/*

[4,5,2,2,1,0,"findall",-,[old_vars,[[[v,a],[[1,2],[3,4]]],[[v,b],empty]]],[findall_vars,[empty]],[format_vars,[v,b1]],[result_var,[v,b]]]

[6,7,2,2,1,3,"findall",-,[old_vars,[[[v,a],[[1,2],[3,4]]],[[v,b],empty],[[v,a1],[3,4]]]],[findall_vars,[8]],[format_vars,[v,a3]],[result_var,[v,b1]]],
	[8,9,2,2,1,[findall_exit_function,3],"predicate",-,[[[v,a],[[1,2],[3,4]]],[[v,b],empty],[[v,a1],[1,2]],[[v,a2],2],[[v,a3],7],[[v,b1],[6,7]]],[[n,member2],[[1,2],empty],_482002,_482008,_482014,_482020,[]]]
	
x
	
	
[[4,5,2,2,1,0,"findall",-,[old_vars,[[[v,a],[[[1,2,3,4]]]],[[v,b],empty]]],[findall_vars,[]],[format_vars,[v,b1]],[result_var,[v,b]]],

[6,7,2,2,1,3,"findall",-,[old_vars,[[[v,a],[[[1,2,3,4]]]],[[v,b],empty],[[v,a1],[[1,2,3,4]]]]],[findall_vars,[]],[format_vars,[v,b2]],[result_var,[v,b1]]],

[8,9,2,2,1,6,"findall",-,[old_vars,[[[v,a],[[[1,2,3,4]]]],[[v,b],empty],[[v,a1],[[1,2,3,4]]],[[v,a2],[1,2,3,4]]]],[findall_vars,[5,6,7]],[format_vars,[v,a4]],[result_var,[v,b2]]]]

*/
	
%(cp_since_findall_start(Choice_point_trail1,_Level,_D10,E1,[%A1c,A2c,
%Ac, Bc, Cc, Dc, "findall", -,
%[old_vars,Ec],[findall_vars,Fc],[format_vars,Gc],[result_var,Hc]],CP_Vars5a,
%CP_Vars5a1)->

% put end_nested_findall at end of process cp x
% checks for fa/cp -> process cp ; end_nested_findall, which goes to ssi when cp

%ssi;
%(

%trace,

get_last_p_before_n(Choice_point_trail1,[_,_Level,_Predicate_number,Line_number_a,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars],[format_vars,Format_vars],[result_var,Result_var]],
	[Cp_b1,Cb_b2,_,_Level,_Predicate_number,Line_number_a,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars],[format_vars,Format_vars],[result_var,Result_var]],_,CP_Vars1,CP_Vars4),
	D1=[Cp_b1,Cb_b2,_,_Level,_Predicate_number,_Line_number_a,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars],[format_vars,Format_vars],[result_var,Result_var]],

	get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
		
	 remember_and_turn_off_debug(Debug),

find_sys(Sys_name),
        
        %trace,
        interpretpart(match4,Format_vars,[Dbw_v,Sys_name],Vars1,Vars2fa,_),

%trace,
%writeln([*,FA]),
	(not(FA=fail)->getvalue([Dbw_v,Sys_name],Value3,Vars2fa);
	is_empty(Value3)),
	

(is_empty(Value3)-> Findall_vars=Findall_vars2;	append(Findall_vars,[Value3],Findall_vars2)),
	 

	%delete_cp(Choice_point_trail1,D1,Choice_point_trail3,CP_Vars4,CP_Vars3,_), 
	Choice_point_trail1=Choice_point_trail3,
	CP_Vars4=CP_Vars3,
	
	interpretpart(match4,Result_var,Findall_vars2,[]%Vars1
	,Vars2fb,_),
	
	 turn_back_debug(Debug),
	
	getvalue(Result_var,Value4,Vars2fb),
	
	%trace,
	subtract(Old_vars,[[Result_var,_]],Vars2fd),
	
	append(Vars2fd,[[Result_var,Value4]],Vars2fc),%Vars2fc1),

%trace,

%findall([Var_x,Val_x],(member([Var_x,Val_x],Vars2fc1),not(member([Var_x,_],Format_vars))),Vars2fc),

%trace,

reverse(Choice_point_trail3,Choice_point_trail4),

get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,

%trace,
(Line_number_b=[_,Line_number_b2]->Line_number_b2=_Line_number_b1;
Line_number_b2=Line_number_b),

%writeln(hered),

/*
writeln1([member,[skip,Pred_id,Line_number_b2],Skip%,Globals10
]),

	member([[skip,Pred_id,Line_number_b2],Skip],Globals1),
	%Globals10=Globals1,

	%delete(Globals10,[[skip,Pred_id,Line_number_b2],Skip],Globals1),
%trace,
debug_exit(Skip,[[Dbw_n,Dbw_findall]]),
*/

%trace,
((get_lang_word("findall_exit_function",Dbw_findall_exit_function1),Dbw_findall_exit_function1=Dbw_findall_exit_function,
%trace,
(member_cut1([_Ad,_Bd,_Cf,_Ef,_Ff,[Dbw_findall_exit_function,_Gf],"line",-,_Vars11|_],Choice_point_trail4)->true;true),

%writeln1(member_cut1([_Ad,_Bd,Cf,Ef,Ff,[findall_exit_function,Gf],"line",-,Vars11|_],Choice_point_trail4)),

member_cut1([_A1c,_A2c,
_Ac, _Bc, _Cc, _Dc, "findall", -,
[old_vars,Ec],[findall_vars,_Fc],[format_vars,_Gc],[result_var,Hc]],
Choice_point_trail4),

%trace,

/*
	 remember_and_turn_off_debug(Debug3),
find_sys(Sys_name3),
        interpretpart(match4,Hc,[Dbw_v,Sys_name3],Vars11,Vars2fa1,_),

	getvalue([Dbw_v,Sys_name3],Value31,Vars2fa1),
	*/
	%(Findall_vars2=[empty]-> Findall_vars4=[];Findall_vars4=Findall_vars2),
	
%append(Findall_vars,[Value31],Findall_vars41),
%Findall_vars41=[Value31],
Findall_vars41=Value4,

%append([Value31],[Value4],Value41),

append(Ec,[[Hc,Findall_vars41]],Result42),

	 %turn_back_debug(Debug3),




% run end_nested_findall when about to end findall
% copy end findall in ssi3
% delete the rest of nested findall in ssi3
% exits end_nested_findall when 1 findall left

not(cp_since_findall_start(Choice_point_trail3,_,_,_,_,CP_Vars3,_)),

flush_after_last_findall(Choice_point_trail3,Choice_point_trail51,CP_Vars3,CP_Vars311),
%trace,
delete_cp(Choice_point_trail51,D1,Choice_point_trail5,CP_Vars311,CP_Vars411,_),

%((
%trace,
reverse(Choice_point_trail5,Choice_point_trail52),
%trace,
member_cut1([_,_,_,_,_,_,"findall",-|_],Choice_point_trail52)
)

%cp_since_findall_start(Choice_point_trail5,_Level,_D10,E1,_D1,CP_Vars41,CP_Vars4)
-> 
(%writeln(here1),writeln([line_number_a,_Line_number_a]),
%trace,
%writeln(herea),

%writeln1([member,[skip,Pred_id,Line_number_a],Skip%,Globals10
%]),

	member([[skip,Pred_id,Line_number_a],Skip],Globals1),
	%Globals10=Globals1,

	%delete(Globals10,[[skip,Pred_id,Line_number_b2],Skip],Globals1),
%trace,
debug_exit(Skip,[[Dbw_n,Dbw_findall],[Format_vars,"...",Value4]]),


end_nested_findall(exit,Pred_id,Level,Predicate_number,Line_number_b,Choice_point_trail5,Choice_point_trail2,Result42,Vars2,CP_Vars411,CP_Vars2,Functions,Globals1,Globals2,Result1, Result2,End_line42));
(%trace,
(%writeln(hereb),

cp_since_findall_start(Choice_point_trail3,Level,_,E100,D100,CP_Vars3,CP_Vars3111)->

(
/*
ssi1([Pred_id,Level,Predicate_number,Line_number_c%Line_number_c
	,"line",Query,
	Vars1,%Jc,%Old_vars,
	All_predicate_numbers], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail3, % Choice_point_trail11 to Choice_point_trail1a
	Choice_point_trail2,
	CP_Vars3,CP_Vars2)
	*/
		
		%trace,
		E100=[_C_Pred_id2,_C_Level3,_C_Predicate_number2,C_Line_number_a2,_C_Pred_or_line%"line"
	,_C_Query_a2,_CCPV0,_CCPV3],

%trace,
%writeln([choice_point_trail3,Choice_point_trail3]),
	
	process_cp(C_Line_number_a2,%exit%
	FA
	,D100,E100,

_,

Vars1,
	_End_result, Functions,Vars2, %% CPVs here?**** CPV0,CPV to CPV1,CPV2
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail3,
	Choice_point_trail2,
	CP_Vars3111,CP_Vars2
	%*/
	)

	);

(%writeln(herec),
%/*
%writeln1([member,[skip,Pred_id,Line_number_a],Skip%,Globals10
%]),

	member([[skip,Pred_id,Line_number_a],Skip],Globals1),
	%Globals10=Globals1,

	%delete(Globals10,[[skip,Pred_id,Line_number_b2],Skip],Globals1),
%trace,
debug_exit(Skip,[[Dbw_n,Dbw_findall],[Format_vars,"...",Value4]]),
%*/
%trace,
((%var(Line_number_b),
number(End_line42))->Line_number_b3=End_line42;Line_number_b3=Line_number_b),
%notrace,
exit_findall_line(Pred_id,Globals1,Predicate_number,Line_number_b3,Functions,Line_number_c),


flush_after_last_findall(Choice_point_trail3,Choice_point_trail51,CP_Vars1,CP_Vars311),


%trace,
get_last_p_before_n(Choice_point_trail51,[_,_Level_f,_Predicate_number_f,_Line_number_a_f,"findall",-|Rest_f],
	[Cp_b1_f,Cb_b2_f,_,_Level_f,_Predicate_number_f,_Line_number_a_f,"findall",-|Rest_f],_,CP_Vars1,CP_Vars4),
	D1_f=[Cp_b1_f,Cb_b2_f,_,_Level_f,_Predicate_number_f,_Line_number_a_f,"findall",-|Rest_f],

delete_cp(Choice_point_trail51,D1_f,Choice_point_trail52,CP_Vars311,CP_Vars411,_),


%member([0,["on true",_],["go after",Findall_end_line2]|_],Lines2),

	ssi1([Pred_id,Level,Predicate_number,Line_number_c%Line_number_c
	,"line",_Query,
	Vars2fc,%Jc,%Old_vars,
	_All_predicate_numbers], _End_result, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail52, % Choice_point_trail11 to Choice_point_trail1a
	Choice_point_trail2,
	CP_Vars411,CP_Vars2)
	
	/*
Choice_point_trail3=Choice_point_trail2,
Vars1=Vars2,
CP_Vars3=CP_Vars2,
Cd=Ce,Ed=Ee,Fd=Fe,Gd=Ge,
Globals1=Globals2
*/
))))
.	

% * put in findall exit with vars in process CP

% *** test whether cps before process cps or end nested findall, call this pred at end of end nested findall
% x just p cp ; e n fa, call ssi after e n fa