% test(2,Q,F,R),lucianpl(off,Q,F,R2).


/*
numbers(193,1,[],N),findall(N1,(member(N1,N),test(N1,Q,F,R),catch(call_with_time_limit(3,lucianpl(off,Q,F,R)),_,false),writeln(N1)),N2),sort(N2,N3),writeln(N3),length(N3,L),subtract(N,N3,U),writeln(U).

turn leash on in lpi, ssi

turn_save_debug(on),numbers(13,13,[],N),findall(N1,(member(N1,N),test(N1,Q,F,R1),do_saved_debug([]),interpret(on,Q,F,R2),writeln(""),saved_debug(S1),do_saved_debug([]),catch(call_with_time_limit(3,lucianpl(on,Q,F,R3)),_,false),writeln(""),saved_debug(S2),S1=S2,do_saved_debug([]),writeln(N1)),N2),sort(N2,N3),writeln(N3),length(N3,L),subtract(N,N3,U),writeln(U).

NOT:
turn_save_debug(on),numbers(13,13,[],N),findall(N1,(member(N1,N),test(N1,Q,F,R1),do_saved_debug([]),interpret(on,Q,F,R2),saved_debug(S1),writeln1([s,S1]),writeln(""),do_saved_debug([]),catch(call_with_time_limit(3,lucianpl(on,Q,F,R3)),_,false),saved_debug(S2),writeln([s,S2]),S1=S2,do_saved_debug([]),writeln(N1),writeln("")),N2),sort(N2,N3),writeln(N3),length(N3,L),subtract(N,N3,U),writeln(U).

*/

lucianpl(Debug,Query,Functions1,Result) :-
	international_lucianpl([lang,"en"],
	Debug,Query,Functions1,Result).

international_lucianpl([lang,Lang],Debug,Query,Functions1,Result) :-
	 retractall(lang(_)),
 	assertz(lang(Lang)),
	lucianpl_1(Debug,Query,Functions1,Result).
	
international_lucianpl([lang,Lang],Debug,Query,TypeStatements,ModeStatements,Functions1,Result) :-
	retractall(lang(_)),
 	assertz(lang(Lang)),
	lucianpl_1(Debug,Query,TypeStatements,ModeStatements,Functions1,Result).


lucianpl_1(Debug,Query,Functions1,Result) :-
	retractall(types(_)),
 	assertz(types(off)),
lucianpl11(Debug,Query,Functions1,Result),!.

lucianpl_1(Debug,Query,TypeStatements,ModeStatements,Functions1,Result) :-
	retractall(types(_)),
 	assertz(types(on)),
	retractall(typestatements(_)),
 	assertz(typestatements(TypeStatements)),
	retractall(modestatements(_)),
 	assertz(modestatements(ModeStatements)),
lucianpl11(Debug,Query,Functions1,Result).

lucianpl11(Debug,Query,Functions,Result) :-
	((not(lang(_Lang1))
	%var(Lang1)
	)->
	(retractall(lang(_)),
 	assertz(lang("en")));
	true),
	load_lang_db,
	query_box(Query,Query1,Functions,Functions1),

	%writeln1(query_box(Query,Query1,Functions,Functions1)),
%%writeln1([i1]),
	%%writeln1(convert_to_grammar_part1(Functions1,[],Functions2,_)),
	convert_to_grammar_part1(Functions1,[],Functions2,_),

	%writeln1(convert_to_grammar_part1(Functions1,[],Functions2,_)),	%trace,
	%writeln1(Functions2),
	%%pp3(Functions2),
	%%writeln1(lucianpl1(Debug,Query,Functions2,Functions2,Result)),
	%findall(Result1,
	
	%trace,
	add_line_numbers_to_algorithm1(Functions2,Functions2a),
	
	%writeln1(add_line_numbers_to_algorithm1(Functions2,Functions2a)),
	%writeln1(Functions2a),
	
	find_pred_sm(Reserved_words),%,"en"),
find_pred_numbers(Functions2a,Reserved_words,Pred_numbers),

	retractall(pred_numbers(_)),
 	assertz(pred_numbers(Pred_numbers)),
%trace,
	find_state_machine1(Functions2a,Functions3,Pred_numbers),
	
%writeln1(find_state_machine1(Functions2a,Functions3,Pred_numbers)),
	% find first predicate
%trace,
	prep_predicate_call(Query1,Functions3,
		All_predicate_numbers),
		
			lucianpl1(Debug),

	% ssi1([Level, % Trace level
	% All_predicate_numbers1 % List of instances of this predicate left to call
	% Predicate_or_line_number, % predicate nor line number in predicate
	% Destination, % "predicate" or "line"
	% Query, % Query when Destination="predicate"
	% Vars, % Input Vars
	% All_predicate_numbers], % predicates remaining to try at current level - saved in cp trail
	% End_result, % Result of predicate
	% Functions, % functions in algorithm
	% Vars2, % output vars
	% Result1, Result2, % Initial and cumulative lists of non-deterministic results
	% Globals1, Globals2, % Initial and cumulative lists of assertz globals
	% Choice_point_trail1, % Initial and cumulative lists of choice points
	% Choice_point_trail2, Cpv1, Cpv2)
	%trace,
	%trace,
	findall([All_predicate_numbers0,"prev_pred_id",0],member(All_predicate_numbers0,All_predicate_numbers),All_predicate_numbers01),
	All_predicate_numbers01=[[All_predicate_numbers1,"prev_pred_id",Prev_pred_id]|All_predicate_numbers2],
	%trace,
	ssi1([["prev_pred_id",Prev_pred_id],1,All_predicate_numbers1,-1,"predicate",Query1,[],
		All_predicate_numbers2],_End_result,Functions3,_Vars2,[],Result1,
		[],_Globals2,
		[], _Choice_point_trail2,
		[[curr_cp,0],[curr_cp_index,0]],_),
		Result=Result1.
		
lucianpl1(Debug) :- 

	retractall(debug(_)),
 	assertz(debug(Debug)),
   retractall(cut(_)),
   assertz(cut(off)),
	retractall(leash1(_)),
   assertz(leash1(off)), %% Should normally be off
  	retractall(sys(_)),
 	assertz(sys(1)),
	retractall(pred_id(_)),
 	assertz(pred_id(0)),
 	
	  	retractall(debug2(_)),
	  	retractall(debug3(_)),
	  	retractall(debug4(_)),
	  	
 	assertz(debug2(off)), % on - displays ssi debug info
 	assertz(debug3(off)), % on - displays level
 	assertz(debug4(off)), % on - displays append cp etc. trace
 
	(not(save_debug(_))->(retractall(save_debug(_)),assertz(save_debug(off)));true),

(not(equals4(_Equals4))->(retractall(equals4(_)),assertz(equals4(on)));true).

ssi1([_,0,_Predicate_number,Line_number,"predicate",_Query_a,
	Vars,_All_predicate_numbers], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2) :-
	
	Level=_,
	%/*
	(debug2(on)->
	writeln1(ssi1([_,0,_Predicate_number,Line_number,"predicate",_Query_a,
	Vars,_All_predicate_numbers], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2));true),
	%*/
	
	%trace,
	(Line_number = -2 ->		
	(%trace,
	
	%*****


(

%****
	((var(Vars)->[Result1]=Result2;
	append(Result1,[Vars],Result2))%,
	,CP_Vars1=CP_Vars2,

Choice_point_trail1=Choice_point_trail3	
	)
	));
	
	(Line_number = -3 ->
	
		(%trace,
	
	%*****
	
		

((
%writeln(here2),

get_last_cp_after_n(Choice_point_trail1,
	[Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],
	[Cp_a,Cb_b,Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],_,
	CP_Vars1,CP_Vars3),

(((Pred_or_line="predicate",not(All_predicate_numbers2=[]))->true;
(Pred_or_line="line",
All_predicate_numbers2=[_,_,_,_,_,
	_,Vars2c],not(Vars2c=[]))))



	)
->

	(Pred_or_line="predicate"->
	
	(
	
		delete_cp(Choice_point_trail1,[Cp_a,Cb_b,Pred_id,Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail12,
	CP_Vars3,CP_Vars4,_),

All_predicate_numbers2=[All_predicate_numbers3|All_predicate_numbers4],
	
		All_predicate_numbers3=[All_predicate_numbers31,"prev_pred_id",Prev_pred_id],

	
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
	))));

%****
	(Result2=Result1,
	CP_Vars1=CP_Vars2,
	Globals1=Globals2,
	Choice_point_trail1=Choice_point_trail3)
	

	)))),!.


ssi1([Pred_id_a1,Level,Predicate_number,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2) :-
	
	%writeln([all_predicate_numbers,All_predicate_numbers]),
	
	(Pred_id_a1=["prev_pred_id",Pred_id1]->true;Pred_id_a1=Pred_id1),

	(debug2(on)->
writeln1(
ssi1([Pred_id_a1,Level,Predicate_number,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2));true),
	%*/
	((not(Line_number= -2), not(Line_number= -3))->
	(Query_a=[Function,Arguments1]->Query_a=Query;
	((Query_a=[Function],Query=[Function,[]],Arguments1=[])->true;
	(Query_a=(-),Query=Query_a)));
	true),
	
	(Line_number = -1 % just started
	->
	(%trace,
	
	((
	member([Predicate_number,Function,Arguments2,":-",_Body],Functions), 
	length(Arguments1,Length),
	length(Arguments2,Length),

(((
checktypes_inputs(Function,Arguments1),
        
        %%writeln1(checkarguments(Arguments1,Arguments2,[],Vars1,[],FirstArgs)),
        %trace,
        checkarguments(Arguments1,Arguments2,[],Vars3,[],FirstArgs),
        %notrace,

%writeln1([checkarguments,"Arguments1",Arguments1,"Arguments2",Arguments2,"Vars1",Vars1,"FirstArgs",FirstArgs]),
	(debug3(on)->
write(["L",Level]);true),
%trace,
debug_call(Skip,[Function,Arguments1])
%,notrace
)


),

find_pred_id(Pred_id),

%trace,
%writeln1([pred_id_chain,Pred_id1,Pred_id]),
append(Globals1,
[[[firstargs,Pred_id],FirstArgs],
[[function,Pred_id],Function],
[[arguments1,Pred_id],Arguments1],
[[skip,Pred_id],Skip],
[[level,Pred_id],Level],
[[pred_num,Pred_id],Predicate_number]
],Globals333),

(var(Pred_id1)->Globals333=Globals3;
append(Globals333,[[pred_id_chain,Pred_id1,Pred_id]],
Globals3)),

%trace,
append_cp(Choice_point_trail1,[[Pred_id,Level,Predicate_number,-1,"predicate",Query,
	Vars3,
	All_predicate_numbers]],Choice_point_trail11,
	CP_Vars1,CP_Vars3),
	%writeln1(Choice_point_trail11),
	
	ssi1([Pred_id,Level,Predicate_number,0,"line",-,
	Vars3,
	All_predicate_numbers], _, Functions,Vars2, % first Vars1 to Vars, 2nd Vars1 to Vars2
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail11,
	Choice_point_trail3,
	CP_Vars3,CP_Vars2)
	
	)->true;
	
	(%Line_number = -1,
	
	(debug3(on)->
write(["L",Level]);true),
%trace,
debug_call(Skip1,[Function,Arguments1]),

	(debug_fail(Skip1,[Function,Arguments1])->true;true), % below instead
	
	All_predicate_numbers=[Predicate_number_a|All_predicate_numbers2],
	
	Predicate_number_a=[Predicate_number_a1,"prev_pred_id",Prev_pred_id],
	

	%trace,
	
	
	
	%trace,

	%Pred_id1=["prev_pred_id",Pred_id],
		%(Pred_id=3->writeln(here4);true),
	
ssi1([["prev_pred_id",Prev_pred_id],Level,Predicate_number_a1,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers2], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2)
	))->true;
	
	(%trace,
	Level2 is Level-1,
	%member([pred_id_chain,PID1,Pred_id1],Globals1),
	%member([[pred_num,PID1],Predicate_number_c],Globals1),

pred_minus_one_fail2([Pred_id1,Level2,Predicate_number,-3,"predicate",-, % (-) as pred id
	[],_All_predicate_numbers], Result21,Functions,Vars2,
	Result1, Result2,%2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2))
	)
	
	
	);
	
	(Line_number = -2
	% true exit from pred
	->(
	(
	
	member([[firstargs,Pred_id1],FirstArgs],Globals1),
	
	member([[arguments1,Pred_id1],Arguments1],Globals1),

	member([[skip,Pred_id1],Skip],Globals1),

	member([[level,Pred_id1],Level_a],Globals1),

	Globals1=Globals3,

	(debug3(on)->
write(["L",Level_a]);true),
	
	debug_fail_fail(Skip),
%trace,
	updatevars(FirstArgs,Vars,[],Result),
	unique1(Result,[],Vars3),
	
	Pred_id1=Pred_id4,
	
	get_last_cp_after_n(Choice_point_trail1,[%_,_,
	Pred_id4,_Level,_Predicate_number4,-1,"predicate",[Function,Arguments1], %**
	_Vars,_All_predicate_numbers4],
	[_,_,Pred_id4,_Level,_Predicate_number4,-1,"predicate",[Function,Arguments1], %**
	_Vars,_All_predicate_numbers4],_%Choice_point_trail5
	,
	CP_Vars1,CP_Vars3),
	
	/*
	trace,writeln1(["here1:",%_,_,
	Pred_id4,_Level,_Predicate_number4,-1,"predicate",[Function,Arguments1], %**
	_Vars,_All_predicate_numbers4]),
	*/
%trace,
	findresult3(Arguments1,Vars3,[],Result22),
	
	(debug3(on)->
write(["L",Level_a]);true),
   debug_exit(Skip,[Function,Result22]), % return result21
   checktypes(Function,Result22),

	((not(Level_a=0))->(
	Level2 is Level-1,
	
	(Level2 = 0 ->
	
	%trace,
	(

ssi1([_,0,_Predicate_number,-2,"predicate",_Query_a,
	Vars3,_All_predicate_numbers], _Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars3,CP_Vars2));

	(%trace,

%writeln1([globals3,Globals3]),
member([pred_id_chain,PID1,Pred_id1],Globals3),
%trace,
		get_last_cp_after_n(Choice_point_trail1,
	[PID1,_Level2,Predicate_number2,Line_number2b,"predicate",_Query2,Vars4,All_predicate_numbers2],
	[_Cp_a,_Cb_b,PID1,_Level2,Predicate_number2,Line_number2b,"predicate",_Query2,Vars4,All_predicate_numbers2],_,
	CP_Vars3,CP_Vars4),

		
	(Line_number2b=["returns to",
	Line_number3,"pred_id",Pred_id3]
	->
	(
member([[pred_num,Pred_id3],Predicate_number2],Globals3),

member([Predicate_number2,_F|Rest],Functions),
(Rest=[_Args,":-",Lines]->true;
(Rest=[_Args]->Lines=[[[n,true]]];
(Rest=[":-",Lines];
(Rest=[],Lines=[[[n,true]]])))),



	member([Line_number3,["on true",A],["go after",_B],["on false",_C],["go to predicates",_D]|_Line],Lines),
A=Line_number2a,
%trace,
	reverse(Globals1,Globals33), 

	member([[firstargs_uv2,Pred_id3],FirstArgs1],Globals33),
%trace,
%writeln1([globals33,Globals33]),
	Globals33=Globals43,

	member([[vars1,Pred_id3],Vars11],Globals43),

	Globals43=Globals212,

reverse(Globals212,_Globals22),

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
)
;

(Line_number2a=Line_number2b
%,
%,Level_x=Level2
%Vars44=Vars3

)), % Line_number2 to 2b

	%trace,
	ssi1([PID1,Level2,Predicate_number2,Line_number2a,"line",-,
	Vars44,All_predicate_numbers2], _, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars4,CP_Vars2)
	
	)))))
->true;
	(false

	)
)
	%));
	;
	(Line_number = -3
	% fail exit from pred
	->(
		


pred_minus_three([Pred_id_a1,Level,Predicate_number,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2)
	
	)))),!.



ssi1([Pred_id,Level,Predicate_number,Line_number_a,"line",Query,
	Vars1,All_predicate_numbers], _, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,
	CP_Vars1,CP_Vars2) :-

ssi1([Pred_id,Level,Predicate_number,Line_number_a,"line",Query,
	Vars1,All_predicate_numbers], _, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,["appearance of command",-],
	CP_Vars1,CP_Vars2).

ssi1([Pred_id,Level,Predicate_number,Line_number_a,"line",Query,
	Vars1,All_predicate_numbers], _, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,["appearance of command",AC],
	CP_Vars1,CP_Vars2) :-
	%/*
	
	%writeln([all_predicate_numbers,All_predicate_numbers]),
		(debug2(on)->
writeln1(
	ssi1([Pred_id,Level,Predicate_number,Line_number_a,"line",Query,
	Vars1,All_predicate_numbers], _, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,["appearance of command",AC],
	CP_Vars1,CP_Vars2));true),
	
	
member([Predicate_number,_F|Rest],Functions),
(Rest=[_Args,":-",Lines]->true;
(Rest=[_Args]->Lines=[[[n,true]]];
(Rest=[":-",Lines];
(Rest=[],Lines=[[[n,true]]])))),

(%trace,
return_to_last_non_end_function(Line_number_a,Lines,Line_number_b,["on true",A],["go after",_B],["on false",C],["go to predicates",D],Line,Globals1,Pred_id,Line_number_a)

),


((%trace,((
not(Line_number_b= -2),not(Line_number_b= -3),
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,

Line=[[Dbw_n,Dbw_findall],[S1,S2]])->

(%trace,
%trace,
%writeln([here_ln,Line_number_a,Line_number_b]),
append_cp(Choice_point_trail1,[[Pred_id,Level,Predicate_number,Line_number_b,"findall",-,
	[old_vars,Vars1],[findall_vars,[]],[format_vars,S1],
	[result_var,S2]]],Choice_point_trail1e,
	CP_Vars1,CP_Vars3)
	
	
);
(Choice_point_trail1=Choice_point_trail1e,
CP_Vars1=CP_Vars3)
),



append(Globals1,[[[vars1,Pred_id],Vars1]],Globals3),

	((Line_number_b=[findall_exit_function,Findall_end_line]
	%,trace
	%writeln(here0)
	)->
	
	((	
	
%trace,

cp_since_findall_start(Choice_point_trail1e,Level,_D10,E1,D1,CP_Vars3,CP_Vars31)
	%writeln1(cp_since_findall_start(Choice_point_trail1e,Level,D1,E1,CP_Vars3,CP_Vars31))
	)->
	(
%trace,
	process_cp(Findall_end_line,D1,E1,

_,

Vars1,
	 _End_result, Functions,Vars2, %% CPVs here?**** CPV0,CPV to CPV1,CPV2
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3,
	CP_Vars31,CP_Vars2)
	);

	(
	%trace,
	
	
	end_nested_findall(Choice_point_trail1e,Choice_point_trail11,Vars1,Vars2,CP_Vars3,CP_Vars6,Result3),

%trace,	%Choice_point_trail1e=Choice_point_trail4,
%flush_after_last_findall(Choice_point_trail1e,Choice_point_trail1e1,CP_Vars3,CP_Vars31),
%trace,	
	/*get_last_cp_after_n(Choice_point_trail1e,[_,_Level,_Predicate_number,_Line_number_a,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars],[format_vars,Format_vars],[result_var,Result_var]],
	[Cp_b1,Cb_b2,_,_Level,_Predicate_number,_Line_number_a,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars],[format_vars,Format_vars],[result_var,Result_var]],_,CP_Vars3,CP_Vars4),
	D1=[Cp_b1,Cb_b2,_,_Level,_Predicate_number,_Line_number_a,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars],[format_vars,Format_vars],[result_var,Result_var]],

	get_lang_word("v",Dbw_v),
		
	 remember_and_turn_off_debug(Debug),

find_sys(Sys_name),
        interpretpart(match4,Format_vars,[Dbw_v,Sys_name],Vars1,Vars2fa,_),

	getvalue([Dbw_v,Sys_name],Value3,Vars2fa),
	
	append(Findall_vars,[Value3],Findall_vars2),
	 
	 turn_back_debug(Debug),

	delete_cp(Choice_point_trail1e,D1,Choice_point_trail1a,CP_Vars4,CP_Vars5,_), 
	
	interpretpart(match4,Result_var,Findall_vars2,Vars1,Vars2fb,_),
	
	getvalue(Result_var,Value4,Vars2fb),
	
	
	subtract(Old_vars,[Result_var,_],Vars2fd),
	
	append(Vars2fd,[[Result_var,Value4]],Vars2fc),

	%Predicate_number=[Predicate_number11,"prev_pred_id",Prev_pred_id],

%trace,

%delete_cp(Choice_point_trail1a,[Cp_b1,Cb_b2,_,_Level,_Predicate_number,_Line_number_a,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars],[format_vars,Format_vars],[result_var,Result_var]],Choice_point_trail1a2,CP_Vars5,CP_Vars5a,_),
Choice_point_trail1a=Choice_point_trail1a2,
CP_Vars5=CP_Vars5a,

((%reverse(Choice_point_trail1a2,Choice_point_trail1a1),
%trace,

%member([A1c,A2c,Ac, Bc, Cc, Dc, "findall", -,[old_vars,Ec],[findall_vars,Fc],[format_vars,Gc],[result_var,Hc]],Choice_point_trail1a1),
%trace,

cp_since_findall_start(Choice_point_trail1a2,Level,_D10,E1,[%A1c,A2c,
Ac, Bc, Cc, Dc, "findall", -,
[old_vars,Ec],[findall_vars,Fc],[format_vars,Gc],[result_var,Hc]],CP_Vars5a,CP_Vars5a1),

E1=[B_Pred_id2,B_Level3,B_Predicate_number2,B_Line_number_a2,B_Pred_or_line%"line"
	,B_Query_a2,B_CPV0,B_CPV3],

append(Fc,[[Result_var,Value4]],Jc),

%trace,
	replace_cp(Choice_point_trail1a2,A1c,A2c,
	[Ac, Bc, Cc, Dc, "findall", -,
[old_vars,Ec],[findall_vars,Fc],[format_vars,Gc],[result_var,Hc]],
	[Ac, Bc, Cc, Dc, "findall", -,
[old_vars,Ec],[findall_vars,Jc],[format_vars,Gc],[result_var,Hc]],Choice_point_trail1a3,CP_Vars5a1,CP_Vars51)



)->

(


(

%trace,
Choice_point_trail1a2=Choice_point_trail1a31,
CP_Vars5a=CP_Vars512,	
	
	(Findall_end_line=0 ->
	(
	
	ssi1([Pred_id,Level, 
	Predicate_number,-2,"predicate",_Query,
	Vars2fc,All_predicate_numbers], _End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1a31,
	Choice_point_trail3,
	CP_Vars512,CP_Vars2)
);

(	append_cp(Choice_point_trail1a31,[[Pred_id,Level,Predicate_number,[findall_exit_function,Findall_end_line],"line",Query,
	Vars2fb,All_predicate_numbers]],Choice_point_trail11,
	CP_Vars512,CP_Vars6), % Pred_id n?


%trace,

D13=[%A1c,A2c,
Ac, Bc, Cc, Dc, "findall", -,
[old_vars,Ec],[findall_vars,Fc],[format_vars,Gc],[result_var,Hc]],

process_cp(D13,E1,

_,

Ec,
	 _End_result, Functions,Vars2, %% CPVs here?**** CPV0,CPV to CPV1,CPV2
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail11,
	Choice_point_trail3,
	CP_Vars6,CP_Vars2) 

%(B_Line_number_a2=[])

	
	
	))
	
	)


	);
	
	%trace,
	(%trace,
Choice_point_trail1a2=Choice_point_trail1a31,
CP_Vars5a=CP_Vars513,	
	
	(Findall_end_line=0 ->
	(
	
	ssi1([Pred_id,Level, 
	Predicate_number,-2,"predicate",_Query,
	Vars2fc,All_predicate_numbers], _End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1a31,
	Choice_point_trail3,
	CP_Vars513,CP_Vars2)
);

(


%writeln([old_vars,Old_vars,findall_vars,Findall_vars,format_vars,Format_vars,result_var,Result_var,value3,Value3,findall_vars2,Findall_vars2,value4,Value4,vars2fb,Vars2fb,vars2fd,Vars2fd,vars2fc,Vars2fc,vars1,Vars1,choice_point_trail1a31,Choice_point_trail1a31]),

reverse(Choice_point_trail1a31,Choice_point_trail1a311),

member([_,_,_,_,_,[findall_exit_function,_],"line",-,Vars11|_],Choice_point_trail1a311),


member([A1c,A2c,
Ac, Bc, Cc, Dc, "findall", -,
[old_vars,Ec],[findall_vars,Fc],[format_vars,Gc],[result_var,Hc]],Choice_point_trail1a311),

	%trace,
writeln([Hc]),
	 remember_and_turn_off_debug(Debug3),

find_sys(Sys_name3),
        interpretpart(match4,Result_var,[Dbw_v,Sys_name3],Vars11,Vars2fa1,_),

	getvalue([Dbw_v,Sys_name3],Value31,Vars2fa1),
	

	%(Findall_vars2=[empty]-> Findall_vars4=[];Findall_vars4=Findall_vars2),
	
%append(Findall_vars,[Value31],Findall_vars41),
Findall_vars41=[Value31],

append([Value31],[Value4],Value41),

append(Ec,[[Hc,Value41]],Result42),

	 turn_back_debug(Debug3),


%E1=[B_Pred_id2,B_Level3,B_Predicate_number2,B_Line_number_a2,B_Pred_or_line%"line"
%	,B_Query_a2,B_CPV0,B_CPV3],

% old vars?
%append(Fc,[[Hc,%Result_var,
%Value4]],Jc),


append_cp(Choice_point_trail1a31,[[Pred_id,Level,Predicate_number,[findall_exit_function,Findall_end_line],"line",Query,
	Vars2fb,All_predicate_numbers]],Choice_point_trail11,
	CP_Vars513,CP_Vars6), % Pred_id n?

*/
%trace,
/*
member([Predicate_number,_F2|Rest2],Functions),
(Rest2=[_Args2,":-",Lines2]->true;
(Rest2=[_Args2]->Lines2=[[[n,true]]];
(Rest2=[":-",Lines2];
(Rest2=[],Lines2=[[[n,true]]])))),
*/
%writeln([Line_number_a,Line_number_b]),
%trace,

exit_findall_line(Predicate_number,Line_number_b,Functions,Line_number_c),

%member([0,["on true",_],["go after",Findall_end_line2]|_],Lines2),

	ssi1([Pred_id,Level,Predicate_number,Line_number_c%Line_number_c
	,"line",Query,
	Result3,%Jc,%Old_vars,
	All_predicate_numbers], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail11, % Choice_point_trail11 to Choice_point_trail1a
	Choice_point_trail3,
	CP_Vars6,CP_Vars2)));
%reverse()
%Level32 is Level-1,
	((Line_number_b= -1 -> true;(Line_number_b= -2 ->true;Line_number_b= -3))->
	%trace,
	
	((Line_number_b= -3)->
	
	e(Pred_id,Level,Predicate_number,Vars1,End_result,Functions,Vars2,Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3,
	CP_Vars3,CP_Vars2
	);

	ssi1([Pred_id,Level, %*
	Predicate_number,Line_number_b,"predicate",Query,
	Vars1,All_predicate_numbers], _End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3,
	CP_Vars3,CP_Vars2));


	(not(D='-') ->

(d(Pred_id,D,Level,Predicate_number,Line_number_b,Query,Vars1,Vars2,All_predicate_numbers,Line,Choice_point_trail1e,Globals3,Functions,Result1, Result2,Globals2,Choice_point_trail3,CP_Vars3,CP_Vars2));
	((%trace,
	(AC=(-) ->
	
	(%writeln1(interpretstatement2(ssi,Functions,Functions,Line,Vars1,Vars3,_Result21,_Cut,Vars2c)),
	interpretstatement2(ssi,Functions,Functions,Line,Vars1,Vars3,_Result21,_Cut,Vars2c,Skip));
	(%trace,
	interpretstatement2(ssi,Functions,Functions,Line,Vars1,Vars3,_Result21,_Cut,Vars2c,AC,Skip)))
	)
	% choose certain commands from lpi for ssi, rest customised
	
	->
	
	% if triggers end_function (meaning the end of an if-then clause), writes trace display and goes to "go after" line at start of function

	% end_function is given with line number to signal the end of the if-then statement etc.
	% -2 line number for end of predicate, -3 for failed predicate - earlier

	% n.b. findall, maplist (x not in new shell, with different end_function) need other code expansion in sm - with call, new shell
	% also type check in new shell, separate from alg
	% iso commands need to be done like c
	
 % - do bagof, setof later
 (

 (var(Skip)->Globals3=Globals4;
 append(Globals3,[[[skip,Pred_id,Line_number_b],Skip]],Globals4)),
 
 (%trace,
 Vars2c=[]->(Choice_point_trail1e=Choice_point_trail11,
 CP_Vars3=CP_Vars4);
  append_cp(Choice_point_trail1e,[[Pred_id,Level,Predicate_number,Line_number_a,"line",-,
	Vars3,Vars2c]],Choice_point_trail11,CP_Vars3,CP_Vars4)),

	ssi1([Pred_id,Level,Predicate_number,A,"line",Query,
	Vars3,All_predicate_numbers], _End_result3, Functions,Vars2,
	Result1, Result2, 
	Globals4,Globals2,
	Choice_point_trail11,
	Choice_point_trail3,
	CP_Vars4,CP_Vars2)
	)
	
	;
	(%trace,

	ssi1([Pred_id,Level,Predicate_number,C,"line",Query,
	Vars1,All_predicate_numbers], _End_result4, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3,
	CP_Vars3,CP_Vars2)))))),!.

	

% t or f
% return true or false result from pred


interpretstatement2(ssi,Functions,Functions,Line,Vars2,Vars3,Result21,_Cut,_,Skip) :-
	%false.
	interpretstatement3(ssi,Functions,Functions,Line,Vars2,Vars3,Result21,_Cut,_,Skip).

interpretstatement2(ssi,Functions,Functions,Line,Vars2,Vars3,Result21,_Cut1,Vars2c,_Skip) :-
	%writeln1(interpretstatement2(Functions,Functions,Line,Vars2,Vars3,Result21,_Cut1)),
	%false.%
	interpretstatement1(ssi,Functions,Functions,Line,Vars2,Vars3,Result21,_Cut,Vars2c).

interpretstatement2(ssi,Functions,Functions,_Line,Vars2,Vars3,Result21,_Cut,_,AC,_Skip) :-
%trace,
	interpretstatement4(ssi,Functions,Functions,_Line,Vars2,Vars3,Result21,_Cut,_,AC).


delete_until_last_cp(Choice_point_trail1,Choice_point_trail2,D1,AC
%,Vars3
,CP_Vars1,CP_Vars2) :-
(delete_until_last_cp0(Choice_point_trail1,Choice_point_trail2,D1,AC
%,Vars3
,CP_Vars1,CP_Vars2)->true
%writeln1(delete_until_last_cp0(Choice_point_trail1,Choice_point_trail2,D1,AC
%,Vars3,CP_Vars1,CP_Vars2))
;
(writeln1(delete_until_last_cp0(Choice_point_trail1,Choice_point_trail2,D1,AC
%,Vars3
,CP_Vars1,CP_Vars2)),abort)),!.

delete_until_last_cp0(Choice_point_trail1,Choice_point_trail2,D1,AC
%,Vars3
,CP_Vars1,CP_Vars2) :-
%trace,
%writeln(here4),

	get_last_cp_after_n(Choice_point_trail1,
	[Pred_id,Level,Predicate_number,Line_number_a,"line",-,
	_Vars3,Vars2c],
	D2,D,CP_Vars1,CP_Vars3),
	
	D=[Pred_id,Level,Predicate_number,Line_number_a,"line",-,
	_Vars3,Vars2c],
	%trace,
	D2=[Cp_a,Cp_b|D],

	%(Vars2c=[]->fail;
	Vars2c=Vars2e,
	Vars2e=[[Dbw_n,Dbw_member],[Value1,Value2],_,_,_,_%[Value1a,Value2a]
	,Vars2e1],
	(Vars2e1=[]->fail;
	(Vars2e1=[Vars2e2|Vars2e3],
	%(findall(Vars2f1,(member([Vars2f1,_],Vars2e2)),Vars2f),
	findall(AC1,(member(AC1,Vars2e2)),AC2), % *** x ac2=Vars2e2
	%trace,
	Vars2e2=[Value4,_],
	%findall(AC3,(member([_,AC3],Vars2e2)),AC4),
	Vars2e2=[_,Value5a],%,Value2a
	%|_],
	
	AC=[[Dbw_n,Dbw_member],[Value1,Value2],Value5a,Value4,Vars2e3], % Vars2e3->Vars2e1

	
		D10=[Pred_id,Level,Predicate_number,Line_number_a,"line",-,
	AC2,%Vars2f,
	AC],
	
		D1=[Cp_a,Cp_b|D10]


	)),
	
	%get_later_cps_than_cp(Choice_point_trail1,D2,C1),
	%subtract(C1,D2,C2),
	delete_cp(Choice_point_trail1,D2,Choice_point_trail3,CP_Vars3,CP_Vars4,_),
	append_cp(Choice_point_trail3,[D10],Choice_point_trail2,CP_Vars4,CP_Vars2),
	%set(curr_cp,Cp_a), %% * try without this
	%reverse(C1,Choice_point_trail2),
	%trace,writeln([D1,AC]),
	!.
	
% get earlier arg2=[cba,cpb|_]
% D1= no cpa cpb
% B=list cpa cpb of cps

% cp since arg2= no cpa cpb
% arg3= cpa cpb_
% E1= no cpa cpb

cp_since_findall_start(Choice_point_trail1,Level,D1,E1,D11,CP_Vars1,CP_Vars2) :-
%trace,
	CP_Vars1=CP_Vars2,
	%trace,

reverse(Choice_point_trail1,Choice_point_trail14),
	member_cut1([_A1,_A2,A_Pred_id,A_Level,A_Predicate_number,A_Line_number_a,"findall",A3|A4],Choice_point_trail14),
	D11=[A_Pred_id,A_Level,A_Predicate_number,A_Line_number_a,"findall",A3|A4],
	%writeln1(cp_since_findall_start(Choice_point_trail1,Level,D1,E1)),
	get_later_cps_than_cp11(Choice_point_trail1,
	[_A1,_A2,A_Pred_id,A_Level,A_Predicate_number,A_Line_number_a,"findall",A3|A4],
	D1,B),
	
	reverse(B,B1),
	
	%D1=[_Pred_id,Level,_Predicate_number,_Line_number_a,"findall",-|_],
	%member([_,_|D1],Choice_point_trail1),
	
	member([A,B2,C,D_Level
	%2
	,E_Predicate_number2,F_Line_number_a2,Pred_or_line,H,I,All_predicate_numbers2],B1),
	
	E1=[C,D_Level
	%2
	,E_Predicate_number2,F_Line_number_a2,Pred_or_line,H,I,All_predicate_numbers2],
	
	/*cp_since_findall_start2(
	%get_last_cp_after_n(
	B,
	[_,Level
	%2
	,_Predicate_number2,_Line_number_a2,Pred_or_line,_,_,All_predicate_numbers2],_,E1,CP_Vars1,CP_Vars2),
	*/
	
	
	(Pred_or_line="line"->
	(All_predicate_numbers2=[_,_,_,_,_,
	_,Vars2c],not(Vars2c=[]));
	Pred_or_line="predicate"->
	not(All_predicate_numbers2=[]))%)	
	
	.
		member_cut1([_A1,_A2,A_Pred_id,A_Level,A_Predicate_number,A_Line_number_a,A5,A3|A4],Choice_point_trail14) :-
	member([_A1,_A2,A_Pred_id,A_Level,A_Predicate_number,A_Line_number_a,A5,A3|A4],Choice_point_trail14),!.


% return until last non end function, go to line after
% return until last non end function, go to line for false

% return line of last non end function
% returns go to predicates

% bc

return_to_last_non_end_function(E1,Lines,End_line4,["on true",A1],["go after",B1],["on false",C1],["go to predicates",D1],Line1,Globals,_,_) :-

	% if -2 or -3, fill A-Line
	((E1= -1->true;(E1= -2->true; E1= -3))->
	(End_line4=E1,A1=(-),B1=(-),C1=(-),D1=(-),Line1=(-));
	((E1=[exit_function,_]->true;E1=[fail_function,_])->
	fail;
	(E1=[findall_exit_function,_]->
	(End_line4=E1,A1=(-),B1=(-),C1=(-),D1=(-),Line1=(-));
	(find_line_number(E1,E),End_line4=E,
	member([E,["on true",A1],["go after",B1],["on false",C1],["go to predicates",D1]|Line1],Lines))))).
	
return_to_last_non_end_function(E1,Lines,End_line4,["on true",A1],["go after",B1],["on false",C1],["go to predicates",D1],Line1,Globals,Pred_id,Line_number_a) :-
%trace,
%writeln1([lines,Lines]),
%writeln1(return_to_last_non_end_function(E1,Lines,End_line4,["on true",A1],["go after",B1],["on false",C1],["go to predicates",D1],Line1)),
%trace,
%writeln(E1),
	find_line_number(E1,E),
	%trace,
	%writeln1([globals,Globals]),
	find_line_number(Line_number_a,Line_number_a1),
	member([[skip,Pred_id,Line_number_a1],Skip],Globals),
	
	get_lang_word("n",Dbw_n),
	get_lang_word("not",Dbw_not),
	member([E,["on true",_A],["go after",B],["on false",C],["go to predicates",_D]|Line],Lines),
	(E1=[exit_function,_]->
	(F=B,(Line=[[Dbw_n,Dbw_not]]-> 
	(debug_fail(Skip,Line)->true;true);debug_exit(Skip,Line)));
	(E1=[fail_function,_]->
	(F=C,(Line=[[Dbw_n,Dbw_not]]->
	debug_exit(Skip,Line);(debug_fail(Skip,Line)->true;true))))),
	
	return_to_last_non_end_function(F,Lines,End_line4,["on true",A1],["go after",B1],["on false",C1],["go to predicates",D1],Line1,Globals,Pred_id,Line_number_a).
	
	
find_line_number(Line_number1,Line_number2) :-
	((Line_number1=[exit_function,Line_number3]->true;
	Line_number1=[fail_function,Line_number3])->
	Line_number2=Line_number3; Line_number2=Line_number1),!
	.

find_pred_id(N2) :-
	pred_id(N1),
	N2 is N1+1,
	retractall(pred_id(_)),
 	assertz(pred_id(N2)).


append_cp(List1,CP,List5a,CP_Vars1,CP_Vars2) :-
	%trace,
	%(writeln("y to trace"),(get_char(y)->trace;true)),
	%trace,
	get(curr_cp,Curr_cp,CP_Vars1),%writeln([curr_cp,Curr_cp]),
	(debug4(on)->writeln1(append_cp(List1,CP,List5a,CP_Vars1,CP_Vars2));true),
	(append_cp1(List1,CP,List5a,CP_Vars1,CP_Vars2)->true;(writeln([append_cp,abort]),abort)),
	%writeln1(append_cp(List1,CP,List5a)),
	get(curr_cp,Curr_cp1,CP_Vars2),%writeln([curr_cp,Curr_cp1]),
	(debug4(on)->writeln([append_cp,curr_cp,Curr_cp,Curr_cp1,List5a,CP_Vars1,CP_Vars2]);true).
	%notrace.

append_cp1(List1,CP,List5a,CP_Vars1,CP_Vars2a) :-
	CP=[CP2],

	get(curr_cp,N,CP_Vars1),
	get(curr_cp_index,Curr_cp_index1,CP_Vars1),
	Curr_cp_index2 is Curr_cp_index1+1,
	
	(
	((List1=[],
	%curr_cp_index3 is curr_cp_index2+1,
	List5=[[1,2|CP2]]),
	set(curr_cp,2,CP_Vars1,CP_Vars3),
	set(curr_cp_index,2,CP_Vars3,CP_Vars4),
	set(min_cp,1,CP_Vars4,CP_Vars5),
	set(max_cp,2,CP_Vars5,CP_Vars2)
%curr_cp_index2=curr_cp_index3
	)->true;
	
	((member([N,_A|_CP21],List1),not(member([_F,N|_],List1)),
	append([[Curr_cp_index2,N|CP2]],List1,List5),
	set(curr_cp,N,CP_Vars1,CP_Vars3),
	set(curr_cp_index,Curr_cp_index2,CP_Vars3,CP_Vars4),
	set(min_cp,Curr_cp_index2,CP_Vars4,CP_Vars2)
	)->true;
	
	((member([_A,N|_CP21],List1),not(member([N,_F|_],List1)),
	%curr_cp_index3 is curr_cp_index2+1,
	append(List1,[[N,Curr_cp_index2|CP2]],List5),
	set(curr_cp,Curr_cp_index2,CP_Vars1,CP_Vars3),
	set(curr_cp_index,Curr_cp_index2,CP_Vars3,CP_Vars4),
	set(max_cp,Curr_cp_index2,CP_Vars4,CP_Vars2)
	%,(curr_cp_index2=24->writeln([curr_cp_index2,curr_cp_index2]);true)
	)->true;
	
	(
	%curr_cp_index3 is curr_cp_index2+1,
	member([D,N|CP4],List1),
	member([N,_B|_CP21],List1),
	delete(List1,[D,N|CP4],List4),
	append(List4,[[D,Curr_cp_index2|CP4]],List2),
	append(List2,[[Curr_cp_index2,N|CP2]],List5),
	
	set(curr_cp,N,CP_Vars1,CP_Vars3),
	set(curr_cp_index,Curr_cp_index2,CP_Vars3,CP_Vars2)	
		
	)))),

	renumber_cps(List5,List5a,CP_Vars2,CP_Vars2a,_),
	%sort(List5,List5a),

	!.

renumber_cps(List1,List2,CP_Vars1,CP_Vars2,Swaps) :-
	get(min_cp,Min_cp,CP_Vars1),
	get(max_cp,Max_cp,CP_Vars1), % max_cp x curr_cp_index
	get(curr_cp,Curr_cp31,CP_Vars1),
renumber_cps1(List1,Min_cp,Max_cp,[],List2,1,Max_cp2,Curr_cp31,Curr_cp3,[],Swaps),
	set(min_cp,1,CP_Vars1,CP_Vars3),
	set(max_cp,Max_cp2,CP_Vars3,CP_Vars4),
	set(curr_cp,Curr_cp3,CP_Vars4,CP_Vars5),
	set(curr_cp_index,Max_cp2,CP_Vars5,CP_Vars2).


renumber_cps1([[A,B|C]],A,B,List1,List2,Curr_cp,Curr_cp2,Curr_cp31,Curr_cp3,Swaps1,Swaps2) :-
	Curr_cp2 is Curr_cp+1,
	append(List1,[[Curr_cp,Curr_cp2|C]],List2),
	append(Swaps1,[[[A,B|C],[Curr_cp,Curr_cp2|C]]],Swaps2),
	(A=Curr_cp31-> Curr_cp3=Curr_cp;true),
	(B=Curr_cp31-> Curr_cp3=Curr_cp2;true)	,!.
renumber_cps1(List1,Min_cp,Max_cp,List1a,List2,Curr_cp,Max_cp2,Curr_cp31,Curr_cp3,Swaps1,Swaps2) :-
	member([Min_cp,B|C],List1),
	delete(List1,[Min_cp,B|C],List3),
	Curr_cp2 is Curr_cp+1,
	append(List1a,[[Curr_cp,Curr_cp2|C]],List4),
	append(Swaps1,[[[Min_cp,B|C],[Curr_cp,Curr_cp2|C]]],Swaps3),
	(Min_cp=Curr_cp31-> Curr_cp3=Curr_cp;true),
	(B=Curr_cp31-> Curr_cp3=Curr_cp2;true),	renumber_cps1(List3,B,Max_cp,List4,List2,
		Curr_cp2,Max_cp2,Curr_cp31,Curr_cp3,Swaps3,Swaps2),!.



get_cp(List1,N,Cp) :-
	(member([N,B|Cp1],List1)->true;(writeln("get_cp failed"),abort)),
	Cp=[N,B|Cp1].
	
	
get_last_cp_after_n(List1,Cp1,Cp2,Cp3,CP_Vars1,CP_Vars1) :-
	%writeln1("y for trace:"),(get_char(y)->trace;true),
	get(curr_cp,Curr_cp,CP_Vars1),%writeln([curr_cp,Curr_cp]),
	(debug4(on)->writeln1(get_last_cp_after_n2(List1,Cp1,Cp2,Cp3,CP_Vars1,CP_Vars1));true),
	(get_last_cp_after_n2(List1,Cp1,Cp2,Cp3,CP_Vars1,CP_Vars1)->true;false%(writeln([get_last_cp_after_n2,abort]),abort)),
	%writeln1(get_last_cp_after_n2(List1,Cp1,Cp2,Cp3)
	),
	get(curr_cp,Curr_cp1,CP_Vars1),%writeln([curr_cp,Curr_cp1]),
	(debug4(on)->writeln([get_last_cp_after_n,curr_cp,Curr_cp,Curr_cp1,Cp2,CP_Vars1,CP_Vars1]);true).
	%notrace.

get_last_cp_after_n2(List1,Cp1,Cp2,Cp3,CP_Vars1,CP_Vars1) :-
%trace,
%writeln1([list1,List1]),
%trace,
	get(curr_cp,N,CP_Vars1),
	get_last_cp_after_n1(List1,Cp1,N,Cp2),
	Cp2=[_,_|Cp3].

get_last_cp_after_n1(List1,_Cp1,N,_Cp2) :-
	(not(member([N,_|_],List1)),fail).
get_last_cp_after_n1(List1,Cp1,N,Cp2) :-
	member([B,N|Cp1],List1),
	%((Cp1=[_,_,_,["returns to",_]|_])->
	%get_last_cp_after_n1(List1,Cp1,B,Cp2);
	Cp2=[B,N|Cp1].
get_last_cp_after_n1(List1,Cp1,N,Cp2) :-
%trace,writeln1(List1),
	member([N,B|Cp1],List1),
	%((Cp1=[_,_,_,["returns to",_]|_])->
	%fail%get_last_cp_after_n1(List1,Cp1,B,Cp2)
	%;
	Cp2=[N,B|Cp1],!.
get_last_cp_after_n1(List1,Cp1,N,Cp2) :-
	member([B,N|Cp3],List1),
	not(Cp1=Cp3),
	get_last_cp_after_n1(List1,Cp1,B,Cp2).

/*

[debug]  ?- get_later_cps_than_cp([[1,2,a],[2,3,b],[3,4,c]],[2,3,b],C).                           C = [[2, 3, b], [1, 2, a]].

[debug]  ?- get_later_cps_than_cp([[1,2,a],[2,3,b],[3,4,c]],[1,2,a],C).
C = [[1, 2, a]].

[debug]  ?- get_later_cps_than_cp([[1,2,a],[2,3,b],[3,4,c]],[3,4,c],C).
C = [[3, 4, c], [2, 3, b], [1, 2, a]].

*/

get_later_cps_than_cp(List1,Cp1,Cps) :-
	%curr_cp(N),
	Cp1=[_Cp_b,Cp_a|_Cp],
	get_later_cps_than_cp(List1,Cp_a,[],Cps1),
	sort(Cps1,Cps).
	%Cp2=[_,_|Cp3].

get_later_cps_than_cp(List1,Cp_a,Cps,Cps) :-
	not(member([Cp_a,_|_],List1)),!.
get_later_cps_than_cp(List1,Cp_a,Cps1,Cps2) :-
	member([Cp_a,Cp_b|Cp3],List1),
	append(Cps1,[[Cp_a,Cp_b|Cp3]],Cps3),
	get_later_cps_than_cp(List1,Cp_b,Cps3,Cps2),!.

set(A,B,CP_Vars1,CP_Vars2) :-
	delete(CP_Vars1,[A,_],CP_Vars3),
	append(CP_Vars3,[[A,B]],CP_Vars2),!.
	
get(A,B,CP_Vars1) :-
	member([A,B],CP_Vars1),!.

/*

[debug]  ?- trace,                                                              delete_cp([[1,2,a],[2,3,b],[3,4,c]],[1,2,a],A,                                  [[curr_cp_index,4],[min_cp,1],[max_cp,4],[curr_cp,3]],V).
A = [[1, 2, b], [2, 3, c]],
V = [[min_cp, 1], [max_cp, 3], [curr_cp, 1], [curr_cp_index, 3]].


[debug]  ?- trace,                                                              delete_cp([[1,2,a],[2,3,b],[3,4,c]],[2,3,b],A,                                  [[curr_cp_index,4],[min_cp,1],[max_cp,4],[curr_cp,3]],V).
A = [[1, 2, a], [2, 3, c]],
V = [[min_cp, 1], [max_cp, 3], [curr_cp, 2], [curr_cp_index, 3]].


[trace]  ?- trace,                                                              delete_cp([[1,2,a],[2,3,b],[3,4,c]],[3,4,c],A,                                  [[curr_cp_index,4],[min_cp,1],[max_cp,4],[curr_cp,3]],V).
A = [[1, 2, a], [2, 3, b]],
V = [[min_cp, 1], [max_cp, 3], [curr_cp, 3], [curr_cp_index, 3]].

*/

delete_cp(List1,CP,List5,CP_Vars1,CP_Vars2,Swaps) :-
	%writeln1(delete_cp1(List1,CP,List5)),
	%trace,
	get(curr_cp,Curr_cp,CP_Vars1),%writeln([curr_cp,Curr_cp]),	
		%trace,
		(debug4(on)->writeln([delete_cp,curr_cp,Curr_cp,CP,List1,List5,CP_Vars1,CP_Vars2,Swaps]);true),

(delete_cp1(List1,CP,List5,CP_Vars1,CP_Vars2,Swaps)->true;(writeln([delete_cp1,abort]),abort)),
	%writeln1(delete_cp1(List1,CP,List5)),
	get(curr_cp,Curr_cp1,CP_Vars1),%writeln([curr_cp,Curr_cp1]),
	(debug4(on)->writeln([delete_cp,curr_cp,Curr_cp,Curr_cp1,CP,List1,List5,CP_Vars1,CP_Vars2,Swaps]);true).
	%notrace.
	
delete_cp1(List1,CP,List5a,CP_Vars1,CP_Vars2a,Swaps) :-
	CP=[A,B|CP2],
	
	%writeln1([delete_cp1,[A,B|CP2]]),
	(
	(List1=[])->true;
	
	(List1=[[A,B|CP2]],
	List5=[],
	set(curr_cp,0,CP_Vars1,CP_Vars3),
	set(curr_cp_index,0,CP_Vars3,CP_Vars4),
	set(min_cp,0,CP_Vars4,CP_Vars5),
	set(max_cp,0,CP_Vars5,CP_Vars2)
	)->true;
	
	(member([A,B|CP2],List1),
	not(member([_F,A|_],List1)),
	delete(List1,[A,B|CP2],List5),
	member([B,C|_CP3],List5),
	%(B=23->(trace,writeln(here1));true),
	%(curr_cp(A)->set(curr_cp,B);true)
	set(curr_cp,C,CP_Vars1,CP_Vars3),
	set(min_cp,B,CP_Vars3,CP_Vars2)
	)->true;
	
	(%trace,
	member([A,B|CP2],List1),
	not(member([B,_F|_],List1)),
	delete(List1,[A,B|CP2],List5),
	%member([C,A|_CP3],List5),
	%(A=23->(trace
	%,writeln(here2));true),
	%(curr_cp(B)->set(curr_cp,A);true)
	set(curr_cp,A,CP_Vars1,CP_Vars3),
	set(max_cp,A,CP_Vars3,CP_Vars2)
	%,notrace
	)->true;

	(
	member([D,A|CP4],List1),
	delete(List1,[D,A|CP4],List2),
	member([B,_C|_CP3],List2),
	member([A,B|CP2],List2),
	delete(List2,[A,B|CP2],List4),
	append(List4,[[D,B|CP4]],List5),
	
	%(B=23->(trace,writeln(here3));true),

	%(curr_cp(A)->set(curr_cp,B);true)
	set(curr_cp,B,CP_Vars1,CP_Vars2)
		
	)),
	
	%trace,
	get(max_cp,Max_cp,CP_Vars2),%writeln([curr_cp,Curr_cp]),	
	set(curr_cp,Max_cp,CP_Vars2,CP_Vars2b),
	renumber_cps(List5,List5a,CP_Vars2b,CP_Vars2a,Swaps)
	,!.


replace_cp(Choice_point_trail1e,Cp_a1,Cp_a2,D1,D2,Choice_point_trail1b,CP_Vars1,CP_Vars2) :-

%trace,	
(member([Cp_a1,Cp_a2|D1],Choice_point_trail1e)->true;
(writeln("replace_cp abort"),abort)),
	delete(Choice_point_trail1e,[Cp_a1,Cp_a2|D1],Choice_point_trail1f),
	append(Choice_point_trail1f,[[Cp_a1,Cp_a2|D2]],Choice_point_trail1g),
	
	set(curr_cp,Cp_a1,CP_Vars1,CP_Vars2),
	sort(Choice_point_trail1g,Choice_point_trail1b).	
	
exit_findall_line(Predicate_number,Line_number_b,Functions,Line_number_c) :-
%trace,
	member([Predicate_number,_F|Rest],Functions),
(Rest=[_Args,":-",Lines]->true;
(Rest=[_Args]->Lines=[[[n,true]]];
(Rest=[":-",Lines];
(Rest=[],Lines=[[[n,true]]])))),

((Line_number_b=[findall_exit_function,C]->true;
Line_number_b=[exit_function,C])->
(member([C,["on true",_A],["go after",B]|_],Lines),
exit_findall_line(Predicate_number,B,Functions,Line_number_c));

(Line_number_c=Line_number_b%trace,member([Line_number_b,["on true",_A],["go after",Line_number_c]|_],Lines)
)).