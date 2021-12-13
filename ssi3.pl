% test(2,Q,F,R),lucianpl(off,Q,F,R2).


/*
numbers(191,1,[],N),findall(N1,(member(N1,N),test(N1,Q,F,R),catch(call_with_time_limit(3,lucianpl(off,Q,F,R)),_,false),writeln(N1)),N2),sort(N2,N3),writeln(N3),length(N3,L),subtract(N,N3,U),writeln(U).

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
	% Choice_point_trail2)
	%trace,
	All_predicate_numbers=[All_predicate_numbers1|All_predicate_numbers2],
	%trace,
	ssi1([-,1,All_predicate_numbers1,-1,"predicate",Query1,[],
		All_predicate_numbers2],_End_result,Functions3,_Vars2,[],Result1,
		[],_Globals2,
		[], _Choice_point_trail2),
		Result=Result1.%VR.
	
	
	
	%lucianpl2(Query,First_predicate,0, % first line - 0 is the header
	%Functions1*).
	% end when finds final result
	
	%,Query,Functions2,Functions2,%Result1),
	%Result1).
lucianpl1(Debug) :- %,Query,Functions1,Functions2,Result) 

% **** QUERY BOX, update vars etc inside antecedant

%%writeln1([i11]),pred_id
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
 	
 	retractall(curr_cp(_)),
 	assertz(curr_cp(0)),
	
	retractall(n_cps(_)),
 	assertz(n_cps(0)),
	
	  	retractall(debug2(_)),
	  	retractall(debug3(_)),
	  	
 	assertz(debug2(on)), % on - displays ssi debug info
 	assertz(debug3(off)), % on - displays level
 
 %/*
	  	retractall(a(_)),
	  	retractall(b(_)),
	  	retractall(c(_)),
 	
 	 	assertz(a(0)),
 	 	assertz(b(0)),
 	 	assertz(c(0)),
%*/
	(not(save_debug(_))->(retractall(save_debug(_)),assertz(save_debug(off)));true),

(not(equals4(_Equals4))->(retractall(equals4(_)),assertz(equals4(on)));true).%equals4(Equals4)),
	%%writeln1(member1(Query,Functions1,Functions2,Result)),
	%member1(Query,Functions1,Functions2,Result).
	
% can save state and retry/produce web service

/*
ssi1([1,Predicate_number,-2,Destination,Query,
	Vars,[]], Functions,Vars2,
	Result, Result, 
	Globals1,Globals2,
	Choice_point_trail1, 
	Choice_point_trail3) :-
	
		%last_line_of_algorithm(Predicate_number,Line_number,Destination,Functions),
		no_more_choicepoints(Choice_point_trail1),
		append(Choice_point_trail1,[[1,Predicate_or_line_number,Destination,Query,
	Vars,[]]],Choice_point_trail3),!.
*/


% start pred, finish pred (don't need additional base case)
% try next choicepoint

% if fails, doesn't append non-deterministic results on, otherwise does
% if backtracking, creates copy of data

% assertz saved to a variable xx alg x, not assertz (not affected by true, fail, backtracking), with first args

% cut deletes further choicepoints in predicate

% repeat choicepoint is never deleted

ssi1([-,0,_Predicate_number,Line_number,"predicate",_Query_a,
	Vars,_All_predicate_numbers], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals222,Globals2,
	Choice_point_trail1,
	Choice_point_trail3) :-
	
	Level=_,
	%/*
	(debug2(on)->
	writeln1(ssi1([-,0,Predicate_number,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3));true),
	%*/
	
	%trace,
	(Line_number = -2 ->		
	(%trace,
	
	%*****

	% don't need to change this because unused
		%reverse(Choice_point_trail1,Choice_point_trail11),

(false
/*(member([Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail11),
(((Pred_or_line="predicate",not(All_predicate_numbers2=[]))->true;
(Pred_or_line="line",All_predicate_numbers2=[_,_,_,_,_,
	_,Vars2c],not(Vars2c=[])))),
	delete(Choice_point_trail1,[Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail12))
)	*/
->

(delete(Choice_point_trail1,[Pred_id,Level,_Predicate_number2,Line_number2b,Pred_or_line,_Query2,Vars4,All_predicate_numbers2],Choice_point_trail12),

	(Pred_or_line="predicate"->
	
	%(All_predicate_numbers2=[]->
	%(
	
%***
	
	%);
	
	(
	All_predicate_numbers2=[All_predicate_numbers3|All_predicate_numbers4],
	append(Result1,[Vars],Result3),
	
	ssi1([-,Level,All_predicate_numbers3,Line_number2b,"predicate",_Query2,
	Vars4,All_predicate_numbers4], End_result,Functions,Vars2,
	Result3, Result2,%2, 
	Globals222,Globals2,
	Choice_point_trail12,
	Choice_point_trail3)
%**AAA**
);

(Pred_or_line="line" ->
	
(

delete_until_last_choicepoint(Choice_point_trail11,Choice_point_trail6,D1,AC),

	(
	D1=[Pred_id,Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11],
	
	ssi1([Pred_id,Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals222,Globals2,
	Choice_point_trail6,
	Choice_point_trail3,["appearance of command",AC])
	)))));

%****
	(var(Vars)->[Result1]=Result2;
	append(Result1,[Vars],Result2))

	%Vars3=VR)
	));
	
	(Line_number = -3 ->
	
		(%trace,
	
	%*****
	
		
		%reverse(Choice_point_trail1,Choice_point_trail11),

((

get_last_cp_before_n(Choice_point_trail1,
	[Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],
	[Cp_a,Cb_b,Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],_),

%trace,
%member([Pred_id,_Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail11),
(((Pred_or_line="predicate",not(All_predicate_numbers2=[]))->true;
(Pred_or_line="line",%writeln1(All_predicate_numbers2),
All_predicate_numbers2=[_,_,_,_,_,
	_,Vars2c],not(Vars2c=[])))),
	%delete(Choice_point_trail1,[Pred_id,Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail12)
	delete_cp(Choice_point_trail1,[Cp_a,Cb_b,Pred_id,Level,Predicate_number2,Line_number2b,Pred_or_line,Query2,Vars4,All_predicate_numbers2],Choice_point_trail12)


	)
->

	(Pred_or_line="predicate"->
	
	(
	All_predicate_numbers2=[All_predicate_numbers3|All_predicate_numbers4],
	
	ssi1([-,Level,All_predicate_numbers3,Line_number2b,"predicate",Query2,
	Vars4,All_predicate_numbers4], End_result,Functions,Vars2,
	Result1, Result2,%2, 
	Globals222,Globals2,
	Choice_point_trail12,
	Choice_point_trail3)

);

(Pred_or_line="line" ->
	
(

delete_until_last_choicepoint(Choice_point_trail12,Choice_point_trail6,D1,AC),

	(
	D1=[_,_,Pred_id,Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11],
	
	ssi1([Pred_id,Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals222,Globals2,
	Choice_point_trail6,
	Choice_point_trail3,["appearance of command",AC])
	))));

%****
	Result2=Result1
	
	%append(Result1,[Vars3])
	%Vars3=VR)
	%VR=[]
	)))),!.
	
ssi1([-,Level,Predicate_number,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3) :-
%trace,
%(Query='-'->trace;true),
%/*
	(debug2(on)->
writeln1(%vars2,Vars2,
ssi1([-,Level,Predicate_number,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3));true),
	%*/
	((not(Line_number= -2), not(Line_number= -3))->
	(Query_a=[Function,Arguments1]->Query_a=Query;
	(Query_a=[Function],Query=[Function,[]],Arguments1=[]));
	true),
	
	(Line_number = -1 % just started
	->
	(%trace,
	
	(((((
	member([Predicate_number,Function,Arguments2,":-",_Body],Functions), %*** predicates without arguments
	length(Arguments1,Length),
	length(Arguments2,Length),

checktypes_inputs(Function,Arguments1),
        
        %%writeln1(checkarguments(Arguments1,Arguments2,[],Vars1,[],FirstArgs)),
        %trace,
        checkarguments(Arguments1,Arguments2,[],Vars3,[],FirstArgs),
        %notrace,
        %%->ca2 
%writeln1([checkarguments,"Arguments1",Arguments1,"Arguments2",Arguments2,"Vars1",Vars1,"FirstArgs",FirstArgs]),
	(debug3(on)->
write(["L",Level]);true),
%trace,
debug_call(Skip,[Function,Arguments1])
%,notrace
)
/*
->true;

(
	Query=[Function],
	member([Predicate_number,Function,":-",_Body],Functions), %*** predicates without arguments
	%length(Arguments1,Length),
	%length(Arguments2,Length),

%checktypes_inputs(Function,Arguments1),
        
        %%writeln1(checkarguments(Arguments1,Arguments2,[],Vars1,[],FirstArgs)),
        %trace,
        %checkarguments(Arguments1,Arguments2,[],Vars3,[],FirstArgs),
        %notrace,
        %%->ca2 
%writeln1([checkarguments,"Arguments1",Arguments1,"Arguments2",Arguments2,"Vars1",Vars1,"FirstArgs",FirstArgs]),
Arguments1=[],
FirstArgs=[],
debug_call(Skip,[Function])
)
*/
),

find_pred_id(Pred_id),

append(Globals1,
[[[firstargs,Level],FirstArgs],
[[function,Level],Function],
[[arguments1,Level],Arguments1],
[[skip,Level],Skip],
[[pred_id,Level],Pred_id]],Globals3),
%trace,
append_cp(Choice_point_trail1,[[Pred_id,Level,Predicate_number,-1,"predicate",Query,
	Vars3,
	All_predicate_numbers]],Choice_point_trail11),
	%writeln1(Choice_point_trail11),
	
	ssi1([Pred_id,Level,Predicate_number,0,"line",-,
	Vars3,
	All_predicate_numbers], _, Functions,Vars2, % first Vars1 to Vars, 2nd Vars1 to Vars2
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail11,
	Choice_point_trail3)
	
	)->true;
	
	(%Line_number = -1,
	
	%trace,
	All_predicate_numbers=[Predicate_number_a|All_predicate_numbers2],
	
	
	/*
	writeln1(	
	ssi1([Level,Predicate_number_a,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers2], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3)),
	%*/
	
	%trace,
	(false%a(1) 
	% unused
	-> append(Choice_point_trail1,[[Level,Predicate_number,-1,"predicate",Query,
	Vars3,
	All_predicate_numbers]],Choice_point_trail11z);Choice_point_trail1=Choice_point_trail11z),

ssi1([-,Level,Predicate_number_a,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers2], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail11z,
	Choice_point_trail3)
	))->true;
	
	(Level2 is Level-1,
	ssi1([_,Level2,_Predicate_number2,-3,"line",-, % (-) as pred id
	[],_All_predicate_numbers], Result21,Functions,Vars2,
	Result1, Result2,%2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3))
	)
	/*->true;
	
	(((
	
	

	Query=[Function,Arguments1],
	member([Predicate_number,Function,Arguments2],Functions), %*** predicates without arguments
	length(Arguments1,Length),
	length(Arguments2,Length),
(((
checktypes_inputs(Function,Arguments1),
        
        %%writeln1(checkarguments(Arguments1,Arguments2,[],Vars1,[],FirstArgs)),
        %trace,
        checkarguments(Arguments1,Arguments2,[],Vars3,[],FirstArgs),
        %notrace,
        %%->ca2 
%writeln1([checkarguments,"Arguments1",Arguments1,"Arguments2",Arguments2,"Vars1",Vars1,"FirstArgs",FirstArgs]),
debug_call(Skip,[Function,Arguments1]),

append(Globals1,
[[[firstargs,Level],FirstArgs],
[[function,Level],Function],
[[arguments1,Level],Arguments1],
[[skip,Level],Skip]],Globals3),

append(Choice_point_trail1,[[Level,Predicate_number,-1,"predicate",Query,
	Vars3,[]]],Choice_point_trail11)
	)->Line_number_b= -2; Line_number_b= -3),

	ssi1([Level, %*
	Predicate_number,Line_number_b,"predicate",Query,
	Vars3,All_predicate_numbers], _End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail11,
	Choice_point_trail3)

)))->true;

((
	
	

	Query=[Function],
	member([Predicate_number,Function],Functions), %*** predicates without arguments
	%length(Arguments1,Length),
	%length(Arguments2,Length),
(
%checktypes_inputs(Function,Arguments1),
        
        %%writeln1(checkarguments(Arguments1,Arguments2,[],Vars1,[],FirstArgs)),
        %trace,
        %checkarguments(Arguments1,Arguments2,[],Vars3,[],FirstArgs),
        %notrace,
        %%->ca2 
%writeln1([checkarguments,"Arguments1",Arguments1,"Arguments2",Arguments2,"Vars1",Vars1,"FirstArgs",FirstArgs]),
debug_call(Skip,[Function]),

FirstArgs=[],
Arguments1=[],

append(Globals1,
[[[firstargs,Level],FirstArgs],
[[function,Level],Function],
[[arguments1,Level],Arguments1],
[[skip,Level],Skip]],Globals3),

append(Choice_point_trail1,[[Level,Predicate_number,-1,"predicate",Query,
	Vars3, % []->vars3***
	[]]],Choice_point_trail11)
	)->Line_number_b= -2; Line_number_b= -3),

	ssi1([Level, %*
	Predicate_number,Line_number_b,"predicate",Query,
	Vars3,All_predicate_numbers], _End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail11,
	Choice_point_trail3)

))
*/
	);
	
	(Line_number = -2
	% true exit from pred
	->(
	(
	
	%trace,
	reverse(Globals1,Globals31),
	%Globals1=Globals31,
	member([[firstargs,Level],FirstArgs],Globals31), %*delete, where was pred called from? - prev level in cps
	%delete(Globals3,[[firstargs,Level],FirstArgs],Globals4),
	Globals31=Globals4,
	%writeln1(member([[arguments1,Level],Arguments1],Globals3)),
	
	member([[arguments1,Level],Arguments1],Globals4),
	%delete(Globals4,[[arguments1,Level],Arguments1],Globals51),
	Globals4=Globals51,
	member([[skip,Level],Skip],Globals51),
	%delete(Globals51,[[skip,Level],Skip],Globals21),
	Globals21=Globals51,

	member([[pred_id,Level],Pred_id4],Globals21),
	%trace,
	reverse(Globals21,Globals3),
	%Globals21=Globals3,

	(debug3(on)->
write(["L",Level]);true),
	
	debug_fail_fail(Skip),
%trace,
	updatevars(FirstArgs,Vars,[],Result),
	unique1(Result,[],Vars3),
%trace,
	reverse(Choice_point_trail1,Choice_point_trail5),

%trace,	
%writeln1(member([Level,_Predicate_number,-1,"predicate",[Function,Arguments1],
%	_Vars,_All_predicate_numbers],Choice_point_trail5)),
	%****
%trace,
%writeln1(	member([Level,_Predicate_number,-1,"predicate",[Function,Arguments1],
%	_Vars,_All_predicate_numbers],Choice_point_trail5)),
	%trace,
	%writeln1([choice_point_trail5,Choice_point_trail5]),
	
	member([_,_,Pred_id4,Level,_Predicate_number4,-1,"predicate",[Function,Arguments1], %**
	_Vars,_All_predicate_numbers4],Choice_point_trail5),
%trace,
	findresult3(Arguments1,Vars3,[],Result22),

/*
writeln(ssi1([Level,Predicate_number,Line_number,"predicate",Query,
	Vars3,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3)), %% ** keep
	*/
	
	
	%Result22=Vars2,
	(debug3(on)->
write(["L",Level]);true),
   debug_exit(Skip,[Function,Result22]), % return result21
   checktypes(Function,Result22),
%trace,

%not_last_line()
		/*((Level=0 ->
		(				
	(delete_until_last_choicepoint(Choice_point_trail5,Choice_point_trail6,D1)->
	
	(append(Result1,[Vars3],Result3),
	
	D1=[Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11],
	
	ssi1([Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11], _, Functions,Vars2,
	Result3, Result2, 
	Globals3,Globals22,
	Choice_point_trail6,
	Choice_point_trail3)
	);
	
	append(Result1,[Vars3],Result2)
	%Vars3=VR)
	));
	*/
	%append(Choice_point_trail1,[[1,Predicate_number,Line_number,"predicate",Query,
	%Vars3,[]]],Choice_point_trail3)
	
	/*
	Level2 is Level-1,
	ssi1([Level2,_Predicate_number2,_Line_number2a,"predicate",-,
	Vars3,_All_predicate_numbers2], _, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals22,
	Choice_point_trail5,
	Choice_point_trail3)

	);*/

	((not(Level=0))->(
	Level2 is Level-1,
	
	(Level2 = 0 ->
	
	%trace,
	((false%b(1)
	-> append(Choice_point_trail1,[[Level,Predicate_number,-1,"predicate",Query_a,
	Vars,
	All_predicate_numbers]],Choice_point_trail11z);
	Choice_point_trail1=Choice_point_trail11z),

ssi1([-,0,_Predicate_number,-2,"predicate",_Query_a,
	Vars3,_All_predicate_numbers], _Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail11z,
	Choice_point_trail3));

	(
	%trace,
	
	%(Level2=0->(%trace,
	%writeln(here),
	
	%);
	%true,
	%(
		reverse(Choice_point_trail1,Choice_point_trail11),
		%trace,
		%Level2 is Level-1,
		
		%writeln1([choice_point_trail11,Choice_point_trail11]),
		
		member([Pred_id2,Level2,Predicate_number2,Line_number2b,"predicate",_Query2,Vars4,All_predicate_numbers2],Choice_point_trail11),%->notrace;(notrace,fail)),
	%(	Line_number2= ["returns to", 0]->trace;true),
		
	(Line_number2b=["returns to",%[Level_x,
	Line_number3]%]
	->
	(
member([Predicate_number2,_F|Rest],Functions),
(Rest=[_Args,":-",Lines]->true;
(Rest=[_Args]->Lines=[[[n,true]]];
(Rest=[":-",Lines];
(Rest=[],Lines=[[[n,true]]])))),



	member([Line_number3,["on true",A],["go after",_B],["on false",_C],["go to predicates",_D]|_Line],Lines),
A=Line_number2a,
%trace,
	reverse(Globals1,Globals33), % I reversed this
	%Globals1=Globals33,
	%writeln1(Globals3),
	%trace,
	member([[firstargs_uv2,Level2],FirstArgs1],Globals33),

	%trace,
	%writeln1(Globals33),
%writeln1([level,Level,level2,Level2]),
%writeln1(member([[firstargs_uv2,Level],FirstArgs1],Globals33)),
	Globals33=Globals43,
	%delete(Globals3,[[firstargs,Level2],FirstArgs],Globals4),
	member([[vars1,Level2],Vars11],Globals43),
	%delete(Globals4,[[vars1,Level2],Vars1],Globals21),
	Globals43=Globals212,

reverse(Globals212,Globals22),
	%Result1=Vars3,
	%trace,
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
	(false%c(1)
	-> append(Choice_point_trail1,[[Level,Predicate_number,-1,"predicate",Query_a,
	Vars,
	All_predicate_numbers]],Choice_point_trail11z);
	Choice_point_trail1=Choice_point_trail11z),
	ssi1([Pred_id2,Level2,Predicate_number2,Line_number2a,"line",-,
	Vars44,All_predicate_numbers2], _, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals22,
	Choice_point_trail11z,
	Choice_point_trail3)
	
	)))))
->true;
	(false
	/*
	Level2 is Level-1,
	ssi1([Level2,_Predicate_number2,-3,"line",-,
	[],_All_predicate_numbers], Result21,Functions,Vars2,
	Result1, Result2,%2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3)*/
	)
)
	%));
	;
	(Line_number = -3
	% fail exit from pred
	->(
		
	%trace,
	(debug3(on)->
write(["L",Level]);true),

%	reverse(Globals1,Globals3),
%	member([[firstargs,Level],FirstArgs],Globals3), %*delete, where was pred called from? - prev level in cps
%	delete(Globals3,[[firstargs,Level],FirstArgs],Globals41),
	member([[function,Level],Function],Globals1), % Globals41
%	delete(Globals41,[[function,Level],Function],Globals51),
	member([[arguments1,Level],Arguments1],Globals1), %Globals51
	%delete(Globals51,[[arguments1,Level],Arguments1],Globals61),
	member([[skip,Level],Skip],Globals1), % Globals61
	%delete(Globals61,[[skip,Level],Skip],Globals21),
	
	%reverse(Globals21,Globals222),

	%member([[pred_id,Level],Pred_id],Globals1), % Globals61


	(debug_fail(Skip,[Function,Arguments1])->true;true), % below instead

/*
	((Level=0)->
		(		
	(delete_until_last_choicepoint(Choice_point_trail5,Choice_point_trail6,D1)->
	
	(append(Result1,[Vars3],Result3),
	
	D1=[Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11],
	
	ssi1([Level11,Predicate_number11,Line_number_a11,"line",-,
	Vars2d11,Vars2e11], _, Functions,Vars2,
	Result3, Result2, 
	Globals3,Globals22,
	Choice_point_trail6,
	Choice_point_trail3)
	);
	
	%append(Result1,[Vars3])
	%Vars3=VR)
	%VR=[]
	Result2=[]
	));
	*/
	%append(Choice_point_trail1,[[1,Predicate_number,Line_number,"predicate",Query,
	%Vars3,[]]],Choice_point_trail3)
	/*
	Level2 is Level-1,
	ssi1([Level2,_Predicate_number2,_Line_number2a,"predicate",-,
	Vars3,_All_predicate_numbers2], _, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals22,
	Choice_point_trail5,
	Choice_point_trail3)

	);
	*/
	e(_Pred_id,Level,Vars3,End_result,Functions,Vars2,Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3
	)
	
	)))),!.
	%*******	%member([Level2,Predicate_number2,Line_number2b,"predicate",_Query2,Vars4,All_predicate_numbers2],Choice_point_trail11),%->notrace;(notrace,fail)),
	%(	Line_number2= ["returns to", 0]->trace;true),
	
	/*	
	(Line_number2b=["returns to",Line_number3]->
	(
member([Predicate_number2,_F|Rest],Functions),
(Rest=[_Args,":-",Lines]->true;
(Rest=[_Args]->Lines=[[[n,true]]];
(Rest=[":-",Lines];
(Rest=[],Lines=[[[n,true]]])))),
*/

/*
	member([Line_number2b,["on true",A],["go after",_B],["on false",_C],["go to predicates",_D]|_Line],Lines),
A=Line_number2a,

	ssi1([Level2,Predicate_number2,-3,"predicate",-,
	Vars4,All_predicate_numbers2], End_result,Functions,Vars2,
	Result1, Result3,%2, 
	Globals222,Globals2,
	Choice_point_trail1,
	Choice_point_trail3),
	
		append(Result3,[End_result],Result2)
*/

	
% run command

% e.g. [6,["on true",7],["go after",[end_function,3]],["on false",-3],[n,"->"]]

ssi1([Pred_id,Level,Predicate_number,Line_number_a,"line",Query,
	Vars1,All_predicate_numbers], _, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3) :-

ssi1([Pred_id,Level,Predicate_number,Line_number_a,"line",Query,
	Vars1,All_predicate_numbers], _, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,["appearance of command",-]).

ssi1([Pred_id,Level,Predicate_number,Line_number_a,"line",Query,
	Vars1,All_predicate_numbers], _, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,["appearance of command",AC]) :-
	%/*
		(debug2(on)->
writeln1(%vars2,Vars2,
	ssi1([Pred_id,Level,Predicate_number,Line_number_a,"line",Query,
	Vars1,All_predicate_numbers], _, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,["appearance of command",AC]));true),
	%*/
	%trace,
	%((Level=0,Predicate_number=0,Line_number_a=-1)->trace;true),

member([Predicate_number,_F|Rest],Functions),
(Rest=[_Args,":-",Lines]->true;
(Rest=[_Args]->Lines=[[[n,true]]];
(Rest=[":-",Lines];
(Rest=[],Lines=[[[n,true]]])))),

/*
((Line_number_a=[end_function,End_line]->true;
Line_number_a=[findall_end_function,End_line]) ->
Line_number=End_line; Line_number=Line_number_a),

%(Line_number= -2 ->trace;true),
((Line_number= -2 -> true; Line_number= -3)->
true;
(member([Line_number,["on true",A],["go after",B],["on false",C],["go to predicates",D]|Line],Lines))),

((B=[end_function,End_line_B]->true;
B=[findall_end_function,End_line_B]) ->
B_A=End_line_B; B_A=B),
*/
%trace,
%(
%((Line_number_a= -2 -> true; Line_number_a= -3)->
(%trace,
return_to_last_non_end_function(Line_number_a,Lines,Line_number_b,["on true",A],["go after",_B],["on false",C],["go to predicates",D],Line)

%,writeln1(return_to_last_non_end_function(Line_number_a,Lines,Line_number_b,["on true",A],["go after",_B],["on false",C],["go to predicates",D],Line))

),%;,%;
%notrace,
		%member([Line_number_b,["on true",A],["go after",B],["on false",C],["go to predicates",D]|Line],Lines),
%Line_number_b=Line_number_a),

/*
((Line_number_a=[end_function,End_line] -> true;
Line_number_a=[findall_end_function,End_line]) ->
(%trace,
(member([B_A,["on true",A1_A],["go after",B1_A],["on false",C1_A],["go to predicates",D1_A]|Line_A],Lines)),
((B=[end_function,End_line_A] -> true;
B1_A=[findall_end_function,End_line_A])->
Line_number_b=B1_A;
Line_number_b=B))
;Line_number_b=Line_number),
*/

%->(notrace,true);
%(notrace,false)),
%writeln1([member([Predicate_number,_F|Rest],Functions),
%(Rest=[_Args,":-",Lines]->true;(Rest=[":-",Lines];
%(Rest=[],Lines=[[[n,true]]])))]),
%trace,
%trace,

((%trace,((
not(Line_number_b= -2),not(Line_number_b= -3),%)->notrace,(notrace,fail)),
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,

Line=[[Dbw_n,Dbw_findall],[S1,S2]])->

(%trace,
append_cp(Choice_point_trail1,[[Pred_id,Level,Predicate_number,-1,"findall",-,
	[old_vars,Vars1],[findall_vars,[]],[format_vars,S1],
	[result_var,S2]]],Choice_point_trail1e)
	%,trace
	/*
	,writeln(append(Choice_point_trail1,[[Level,Predicate_number,-1,"findall",-,
	[old_vars,Vars1],[findall_vars,[]],[format_vars,S1],
	[result_var,S2]]],Choice_point_trail1e))
	*/
);
(Choice_point_trail1=Choice_point_trail1e)
),



append(Globals1,[[[vars1,Level],Vars1]],Globals3),

	((Line_number_b=[findall_exit_function,Findall_end_line]
	%,trace
	%writeln(here0)
	)->
	
	((	
	
	%writeln1(cp_since_findall_start(Choice_point_trail1e,Level,D1,E1)),

cp_since_findall_start(Choice_point_trail1e,Level,D1,E1)
	%writeln1(cp_since_findall_start(Choice_point_trail1e,Level,D1,E1))
	)->
	(%trace,writeln(here1),
	D1=[Pred_id3,Level4
	%1
	,Predicate_number14,Line_number_a14,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars],[format_vars,Format_vars],[result_var,Result_var]],
	%writeln(D1),
	E1=[Pred_id2,Level3,_Predicate_number2,Line_number_a2,Pred_or_line%"line"
	,Query_a2,_CPV0,CPV3],
	
	(Pred_or_line="line"->
	CPV3=[CPV_A1,CPV_A2,CPV_A3,CPV_A4,CPV_A5,
	CPV_A6,CPV];
	(Pred_or_line="predicate"->
	CPV3=CPV)),

	CPV=[CPV1|CPV2],
	
	get_lang_word("v",Dbw_v),

	%findall(Value3,(
	
	%interpretbody(Functions0,Functions,Vars1,Vars3,[Body],_Result2),
		
	remember_and_turn_off_debug(Debug),

	find_sys(Sys_name),
 
 interpretpart(match4,Format_vars,[Dbw_v,Sys_name],Vars1,Vars2fa,_),

	getvalue([Dbw_v,Sys_name],Value3,Vars2fa),
	
	append(Findall_vars,[Value3],Findall_vars2),
	
	turn_back_debug(Debug),

	member(D1,Choice_point_trail1e),
	delete(Choice_point_trail1e,D1,Choice_point_trail1a),
	
	D2=[Pred_id3,Level4
	%1
	,Predicate_number14,Line_number_a14,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars2],[format_vars,Format_vars],[result_var,Result_var]],
	
	%trace,writeln([d2,D2]),
	
	append_cp(Choice_point_trail1a,[D2],Choice_point_trail1b),
	
	delete(Choice_point_trail1b,E1,Choice_point_trail1c),
	
	(Pred_or_line="line"->
	CPV22=[CPV_A1,CPV_A2,CPV_A3,CPV_A4,CPV_A5,
	CPV_A6,CPV2];
	(Pred_or_line="predicate"->
	CPV22=CPV2)),

append_cp(Choice_point_trail1c,[[Pred_id2,Level3,CPV1,Line_number_a2,Pred_or_line,_,_,CPV22]],Choice_point_trail1d),

	%),Value3a),
	%notrace,
	
	%trace,writeln1([choice_point_trail1d,Choice_point_trail1d]),

	ssi1([Pred_id,Level3, %*
	CPV1,Line_number_a2,"line",Query_a2,
	_,CPV2], End_result, Functions,Vars2, %% CPVs here?**** CPV0,CPV to CPV1,CPV2
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1d,
	Choice_point_trail3)
	);

	(%trace,
	%writeln(here2),
	reverse(Choice_point_trail1e,Choice_point_trail4),   
	%writeln1([choice_point_trail4,Choice_point_trail4]),
	%% ***Choice_point_trail1 to Choice_point_trail1e
	%Choice_point_trail1e=Choice_point_trail4,
	append(_BA,CA,Choice_point_trail4),append([D1],_E,CA),
	D1=[_,_Level,_Predicate_number,_Line_number_a,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars],[format_vars,Format_vars],[result_var,Result_var]],

%trace,writeln1([d1,D1]),
	get_lang_word("v",Dbw_v),

	%findall(Value3,(
	
	%interpretbody(Functions0,Functions,Vars1,Vars3,[Body],_Result2),
		
	 remember_and_turn_off_debug(Debug),

find_sys(Sys_name),
        interpretpart(match4,Format_vars,[Dbw_v,Sys_name],Vars1,Vars2fa,_),

	getvalue([Dbw_v,Sys_name],Value3,Vars2fa),
	
	append(Findall_vars,[Value3],Findall_vars2),
	 
	 turn_back_debug(Debug),

	delete(Choice_point_trail1e,D1,Choice_point_trail1a), %%*** Choice_point_trail1 to Choice_point_trail1e
	%D2=[Level,_Predicate_number,_Line_number_a,"findall",-,[old_vars,Old_vars],[findall_vars,Findall_vars2],[format_vars,Format_vars],[result_var,Result_var]],
	
	%append(Choice_point_trail1a,[D2],Choice_point_trail1b),
	
	interpretpart(match4,Result_var,Findall_vars2,Vars1,Vars2fb,_),
	
	getvalue(Result_var,Value4,Vars2fb),
	
	%trace,
	%findall([V2,Va2],(member([V2,empty],Old_vars),member([V2,Va2],Vars2fb)),Old_vars2),
	
	%Result_var=[V2,_],
	
	subtract(Old_vars,[Result_var,_],Vars2fd),
	
	append(Vars2fd,[[Result_var,Value4]],Vars2fc),

	%append(Old_vars,[[Result_var,Value3]],Old_vars2),
	%[A,B]=[C,D]

	(Findall_end_line=0 ->
	(%trace,
	%writeln(here4),
	%Level32 is Level-1,
	ssi1([-,Level, %*
	Predicate_number,-2,"predicate",_Query,
	Vars2fc,All_predicate_numbers], _End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1a,
	Choice_point_trail3)

	);
	
	%trace,
	(%trace,
	append_cp(Choice_point_trail1,[[Pred_id,Level,Predicate_number,[findall_exit_function,Findall_end_line],"predicate",Query,
	Vars2fb,All_predicate_numbers]],Choice_point_trail11), % Pred_id n?

	ssi1([Pred_id,Level,Predicate_number,Findall_end_line,"line",Query,
	Vars2fb,All_predicate_numbers], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1a, % Choice_point_trail11 to Choice_point_trail1a
	Choice_point_trail3))
	%putvalue(Result_var,Findall_vars,Vars1,Vars2fa)
	)));
%reverse()
%Level32 is Level-1,
	((Line_number_b= -1 -> true;(Line_number_b= -2 ->true;Line_number_b= -3))->
	%trace,
	
	((Line_number_b= -3)->
	
	e(_Pred_id,Level,Vars1,End_result,Functions,Vars2,Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3
	);
	
	ssi1([-,Level, %*
	Predicate_number,Line_number_b,"predicate",Query,
	Vars1,All_predicate_numbers], _End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3));
%(

% * in find sm - are sm's hierarchical or linear? - linear
%trace,

/*

((Line_number_b=[exit_function,End_line]->true;
Line_number_b=[fail_function,End_line]) ->

	(End_line=0 ->
	(%trace,
	%writeln(here4),
	%Level2 is Level-1,
		ssi1([Level, %*
	Predicate_number,-2,"predicate",Query,
	Vars1,All_predicate_numbers], _End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1,%***
	Choice_point_trail3)

	);
	
	
	%trace,
	(%trace,
	append(Choice_point_trail1,[[Level,Predicate_number,[exit_function,End_line],"predicate",Query,
	Vars2,All_predicate_numbers]],Choice_point_trail11),

	ssi1([Level,Predicate_number,End_line,"line",Query,
	Vars1,All_predicate_numbers], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail11,
	Choice_point_trail3))
);
*/
	
	(not(D='-') ->

(d(Pred_id,D,Level,Predicate_number,Line_number_b,Query,Vars1,Vars2,All_predicate_numbers,Line,Choice_point_trail1,Globals3,Functions,Result1, Result2,Globals2,Choice_point_trail3));
	((%trace,
	(AC=(-) ->
	
	(%writeln1(interpretstatement2(ssi,Functions,Functions,Line,Vars1,Vars3,_Result21,_Cut,Vars2c)),
	interpretstatement2(ssi,Functions,Functions,Line,Vars1,Vars3,_Result21,_Cut,Vars2c));
	interpretstatement2(ssi,Functions,Functions,Line,Vars1,Vars3,_Result21,_Cut,Vars2c,AC))
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
 ((%trace,
 Vars2c=[]->Choice_point_trail1e=Choice_point_trail11;
  append_cp(Choice_point_trail1e,[[Pred_id,Level,Predicate_number,Line_number_a,"line",-,
	Vars3,Vars2c]],Choice_point_trail11)),

	ssi1([Pred_id,Level,Predicate_number,A,"line",Query,
	Vars3,All_predicate_numbers], _End_result3, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail11,
	Choice_point_trail3)
	)
	
	;
	(%trace,
	/*
	writeln1(ssi1([Level,Predicate_number,C,"line",Query,
	Vars1,All_predicate_numbers], _End_result4, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3)),
	*/
		ssi1([Pred_id,Level,Predicate_number,C,"line",Query,
	Vars1,All_predicate_numbers], _End_result4, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3)))))),!.

	

% t or f
% return true or false result from pred

%last_line_of_algorithm(_Predicate_number,0,"predicate",_Functions) :- !.
/*
last_line_of_algorithm(Predicate_number,Line_number,"line",Functions) :- member([Predicate_number|Rest],Functions),
(Rest=[_Args,":-"|Lines]->true;Rest=[":-"|Lines]),
not(member([Line_number|_],Lines)),!.
*/

interpretstatement2(ssi,Functions,Functions,Line,Vars2,Vars3,Result21,_Cut,_) :-
	%false.
	interpretstatement3(ssi,Functions,Functions,Line,Vars2,Vars3,Result21,_Cut,_).

interpretstatement2(ssi,Functions,Functions,Line,Vars2,Vars3,Result21,_Cut1,Vars2c) :-
	%writeln1(interpretstatement2(Functions,Functions,Line,Vars2,Vars3,Result21,_Cut1)),
	%false.%
	interpretstatement1(ssi,Functions,Functions,Line,Vars2,Vars3,Result21,_Cut,Vars2c).

interpretstatement2(ssi,Functions,Functions,_Line,Vars2,Vars3,Result21,_Cut,_,AC) :-
%trace,
	interpretstatement4(ssi,Functions,Functions,_Line,Vars2,Vars3,Result21,_Cut,_,AC).


delete_until_last_choicepoint(Choice_point_trail1,Choice_point_trail2,D1,AC
%,Vars3
) :-
%trace,

	get_last_cp_before_n(Choice_point_trail1,
	[Pred_id,Level,Predicate_number,Line_number_a,"line",-,
	_Vars3,Vars2c],
	D2,D),
	
	/*
	reverse(Choice_point_trail1,Choice_point_trail3),
	append(_B,C,Choice_point_trail3),append([D],E,C),
	*/
	D=[Pred_id,Level,Predicate_number,Line_number_a,"line",-,
	_Vars3,Vars2c],
	%trace,
	D2=[Cp_a,Cp_b|D],

	%(Vars2c=[]->fail;
	Vars2c=Vars2e,%[[[Dbw_n,Dbw_member],[Value1,Value2],Value3]|[Vars2e1]],%[[Vars2d,Vars2d1]|Vars2e], % *** needs image of command with answer Vars2d1
		%writeln1([vars2e,Vars2e]),
%vars2e=[[[n,member2],[[1,2,3],empty],[[1,2,3],1]],[[[v,a],[1,2,3*1?]],[[v,b],3]],[[[[[v,a],[1,2,3]],[[v,b],2]],[[1,2,3],2]],[[[[v,a],[1,2,3]],[[v,b],3]],[[1,2,3],3]]]]
	%trace,
	%writeln([vars2e,Vars2e]),
	%trace,
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

	D1=[Cp_a,Cp_b,Pred_id,Level,Predicate_number,Line_number_a,"line",-,
	AC2,%Vars2f,
	AC]
	%Vars2e3=[[[Dbw_n,Dbw_member],[Value1,Value2]]%[Value1a,Value2a]
	%,Vars2e2],
	%append([D1],E,C1)
	)),
	
	%get_earlier_cps_before_cp(Choice_point_trail1,D2,C1),
	%subtract(C1,D2,C2),
	delete(Choice_point_trail1,D2,Choice_point_trail3),
	append([D1],Choice_point_trail3,Choice_point_trail2),
	set(curr_cp,Cp_a),
	%reverse(C1,Choice_point_trail2),
	%trace,writeln([D1,AC]),
	!.
	
	
cp_since_findall_start(Choice_point_trail1,Level,D1,E1) :-
%trace,
	%writeln1(cp_since_findall_start(Choice_point_trail1,Level,D1,E1)),
	
	reverse(Choice_point_trail1,Choice_point_trail3),
	%Choice_point_trail1=Choice_point_trail3,
	append(B,C,Choice_point_trail3),append([D1],_E,C),
	D1=[_Pred_id,Level,_Predicate_number,_Line_number_a,"findall",-|_],
	%D1=findall,
	%reverse(B,B2),
	B2=B,
	append(_B1,C1,B2),
	%writeln1(append(_B1,C1,B2)),
	%trace,
	%reverse(C11,C1),
	C11=C1,
	
	append([E1],_E2,C11),
	%writeln([c1,C1]),
	%trace,
	(E1=[_,_Level
	%2
	,_Predicate_number2,_Line_number_a2,Pred_or_line,_,_,All_predicate_numbers2],
	(Pred_or_line="line"->
	(All_predicate_numbers2=[_,_,_,_,_,
	_,Vars2c],not(Vars2c=[]));
	Pred_or_line="predicate"->
	not(All_predicate_numbers2=[])))	
	.

% return until last non end function, go to line after
% return until last non end function, go to line for false

% return line of last non end function
% returns go to predicates

% bc

return_to_last_non_end_function(E1,Lines,End_line4,["on true",A1],["go after",B1],["on false",C1],["go to predicates",D1],Line1) :-

	% if -2 or -3, fill A-Line
	((E1= -1->true;(E1= -2->true; E1= -3))->
	(End_line4=E1,A1=(-),B1=(-),C1=(-),D1=(-),Line1=(-));
	((E1=[exit_function,_]->true;E1=[fail_function,_])->
	fail;
	(E1=[findall_exit_function,_]->
	(End_line4=E1,A1=(-),B1=(-),C1=(-),D1=(-),Line1=(-));
	(find_line_number(E1,E),End_line4=E,
	member([E,["on true",A1],["go after",B1],["on false",C1],["go to predicates",D1]|Line1],Lines))))).
	
return_to_last_non_end_function(E1,Lines,End_line4,["on true",A1],["go after",B1],["on false",C1],["go to predicates",D1],Line1) :-
%writeln1(return_to_last_non_end_function(E1,Lines,End_line4,["on true",A1],["go after",B1],["on false",C1],["go to predicates",D1],Line1)),
%trace,
%writeln(E1),
	find_line_number(E1,E),
	member([E,["on true",_A],["go after",B],["on false",C],["go to predicates",_D]|_Line],Lines),
	(E1=[exit_function,_]->
	F=B;
	(E1=[fail_function,_]->
	F=C)),
	return_to_last_non_end_function(F,Lines,End_line4,["on true",A1],["go after",B1],["on false",C1],["go to predicates",D1],Line1).
	
/*
% return until last non end function, go to line for false
return_to_last_non_end_function([fail_function,E],Lines,Line_number,End_line,Line1) :-
		member([Line_number,["on true",A],["go after",B],["on false",C],["go to predicates",D]|Line],Lines),
	((C=[end_function,End_line1] -> true;
C=[findall_end_function,End_line1]) ->
return_to_last_non_end_function([fail_function,E],Lines,End_line1,End_line,Line1);
(End_line=C,Line=Line1)).
*/

/* 
return_to_last_non_end_function(L,_Lines,L,["on true",_A],["go after",_B],["on false",_C],["go to predicates",_D],Line) :-
	(L= -2->true;L= -3),!.

return_to_last_non_end_function(L,Lines,L,["on true",A],["go after",B],["on false",C],["go to predicates",D],Line) :-
	not(L= [exit_function,E]),not(L= [fail_function,E]),
	%not(L= [findall_exit_function,E]),not(L= [findall_fail_function,E]),
	find_line_number(L,Line_number),
		member([Line_number,["on true",A],["go after",B],["on false",C],["go to predicates",D]|Line],Lines).
*/
	
find_line_number(Line_number1,Line_number2) :-
	((Line_number1=[exit_function,Line_number3]->true;
	Line_number1=[fail_function,Line_number3])->
	Line_number2=Line_number3; Line_number2=Line_number1),!
	.

find_pred_id(N2) :-
	pred_id(N1),
	%concat_list(["sys",N1],Name1),
	%get_lang_word(Name1,Name2),
	%atom_string(Name2,Name1),
	N2 is N1+1,
	retractall(pred_id(_)),
 	assertz(pred_id(N2)).

/*

set(curr_cp,3),curr_cp(C),set(n_cps,3),n_cps(D),append_cp([[1,2,a],[2,3,b]],[[c]],A),curr_cp(E),n_cps(F).

C = D, D = 3,
A = [[1, 2, a], [2, 3, b], [3, 4, c]],
E = F, F = 4.

set(curr_cp,2),curr_cp(C),set(n_cps,3),n_cps(D),append_cp([[1,2,a],[2,3,b]],[[c]],A),curr_cp(E),n_cps(F).

C = 2,
D = 3,
A = [[2, 3, b], [1, 4, a], [4, 2, c]],
E = F, F = 4.

set(curr_cp,1),curr_cp(C),set(n_cps,3),n_cps(D),append_cp([[1,2,a],[2,3,b]],[[c]],A),curr_cp(E),n_cps(F).

C = 1,
D = 3,
A = [[1, 2, a], [2, 3, b], [4, 1, c]],
E = F, F = 4.

set(curr_cp,2),curr_cp(C),set(n_cps,2),n_cps(D),append_cp([[1,2,a]],[[c]],A),curr_cp(E),n_cps(F).

C = D, D = 2,
A = [[1, 2, a], [2, 3, c]],
E = F, F = 3.

set(curr_cp,1),curr_cp(C),set(n_cps,2),n_cps(D),append_cp([[1,2,a]],[[c]],A),curr_cp(E),n_cps(F).

C = 1,
D = 2,
A = [[1, 2, a], [3, 1, c]],
E = F, F = 3.

set(curr_cp,0),curr_cp(C),set(n_cps,0),n_cps(D),append_cp([],[[c]],A),curr_cp(E),n_cps(F).

?- append_cp([],[c],A).
A = [[2, 8, c]].

*/


append_cp(List1,CP,List5) :-
	CP=[CP2],

	curr_cp(N),
	n_cps(N_cps1),
	N_cps2 is N_cps1+1,
	
	(
	(List1=[],
	N_cps3 is N_cps2+1,
	List5=[[N_cps2,N_cps3|CP2]]),
	set(curr_cp,N_cps3)%N_cps2=N_cps3
	)->true;
	
	(member([N,A|CP21],List1),not(member([F,N|_],List1)),
	append(List1,[[N_cps2,N|CP2]],List5),
	set(curr_cp,N_cps2),N_cps2=N_cps3
	)->true;
	
	(member([A,N|CP21],List1),not(member([N,F|_],List1)),
	%N_cps3 is N_cps2+1,
	append(List1,[[N,N_cps2|CP2]],List5),
	set(curr_cp,N_cps2),N_cps2=N_cps3
	)->true;

	(
	%N_cps3 is N_cps2+1,
	member([D,N|CP4],List1),
	member([N,_B|_CP21],List1),
	delete(List1,[D,N|CP4],List4),
	append(List4,[[D,N_cps2|CP4]],List2),
	append(List2,[[N_cps2,N|CP2]],List5),
	N_cps2=N_cps3,
	
	set(curr_cp,N_cps3)
		
	)),

	
	set(n_cps,N_cps3),

	!.

/*
append_cp(A,B1,C) :-
writeln1(append_cp(A,B1,C)),
trace,
	append_cp1(A,B1,C),notrace.
append_cp1(A,B1,C) :-
	B1=[B],
	curr_cp(N),
	n_cps(N_cps1),
	N_cps2 is N_cps1+1,
	retractall(n_cps(_)),
	assertz(n_cps(N_cps2)),
	(member([E,N|Cp1],A)->
	(delete(A,[E,N|Cp1],A10),
	append(A10,[[E,N_cps2|Cp1]],A1));A=A1),
	(member([N,_D|_Cp2],A1)->
	(append(A1,[[N_cps2,N|B]],C));
	(N_cps3 is N_cps2+1,
	retractall(n_cps(_)),
	assertz(n_cps(N_cps3)),	
	append(A1,[[N,N_cps2|B]],C))),
	retractall(curr_cp(_)),
	assertz(curr_cp(N_cps2)),!.
*/

get_cp(List1,N,Cp) :-
	member([N,B|Cp1],List1),
	Cp=[N,B|Cp1].
	
get_last_cp_before_n(List1,Cp1,Cp2,Cp3) :-
%trace,
%writeln1([list1,List1]),
	curr_cp(N),
	get_last_cp_before_n1(List1,Cp1,N,Cp2),
	Cp2=[_,_|Cp3].

get_last_cp_before_n1(List1,_Cp1,N,_Cp2) :-
	(not(member([N,_|_],List1)),fail),!.
get_last_cp_before_n1(List1,Cp1,N,Cp2) :-
	member([N,B|Cp1],List1),
	Cp2=[N,B|Cp1],!.
get_last_cp_before_n1(List1,Cp1,N,Cp2) :-
	member([B,N|Cp1],List1),
	Cp2=[B,N|Cp1],!.
get_last_cp_before_n1(List1,Cp1,N,Cp2) :-
	member([B,N|Cp3],List1),
	not(Cp1=Cp3),
	get_last_cp_before_n1(List1,Cp1,B,Cp2),!.

/*

[debug]  ?- get_earlier_cps_before_cp([[1,2,a],[2,3,b],[3,4,c]],[2,3,b],C).                           C = [[2, 3, b], [1, 2, a]].

[debug]  ?- get_earlier_cps_before_cp([[1,2,a],[2,3,b],[3,4,c]],[1,2,a],C).
C = [[1, 2, a]].

[debug]  ?- get_earlier_cps_before_cp([[1,2,a],[2,3,b],[3,4,c]],[3,4,c],C).
C = [[3, 4, c], [2, 3, b], [1, 2, a]].

*/

get_earlier_cps_before_cp(List1,Cp1,Cps) :-
	%curr_cp(N),
	Cp1=[_Cp_b,Cp_a|_Cp],
	get_earlier_cps_before_cp(List1,Cp_a,[],Cps).
	%Cp2=[_,_|Cp3].

get_earlier_cps_before_cp(List1,Cp_a,Cps,Cps) :-
	not(member([_,Cp_a|_],List1)),!.
get_earlier_cps_before_cp(List1,Cp_a,Cps1,Cps2) :-
	member([Cp_b,Cp_a|Cp3],List1),
	append(Cps1,[[Cp_b,Cp_a|Cp3]],Cps3),
	get_earlier_cps_before_cp(List1,Cp_b,Cps3,Cps2),!.



set(A,B) :-
	functor(C,A,1),D=C,arg(1,D,_),
	retractall(D),
	arg(1,C,B),
	assertz(C),!.
	
/*

set(curr_cp,1),curr_cp(C),delete_cp([[1,2,a],[2,3,b],[3,4,c]],[1,2,a],A),curr_cp(B).
C = 1,
A = [[2, 3, b], [3, 4, c]],
B = 2.

set(curr_cp,2),curr_cp(C),                                                                               delete_cp([[1,2,a],[2,3,b],[3,4,c]],[2,3,b],A),curr_cp(B).
C = 2,
A = [[3, 4, c], [1, 3, a]],
B = 3.

set(curr_cp,3),curr_cp(C),                                                                               delete_cp([[1,2,a],[2,3,b],[3,4,c]],[3,4,c],A),curr_cp(B).
C = 4,
A = [[1, 2, a], [2, 3, b]],
B = 3.

*/

delete_cp(List1,CP,List5) :-
	CP=[A,B|CP2],
	
	(
	((member([A,B|CP2],List1),not(member([F,A|_],List1)))->
	(delete(List1,[A,B|CP2],List5),
	(curr_cp(A)->set(curr_cp,B);true)
	))->true;
	
	(((member([A,B|CP2],List1),not(member([B,F|_],List1)))->
	delete(List1,[A,B|CP2],List5),
	(curr_cp(B)->set(curr_cp,A);true)
	)->true;

	(
	member([D,A|CP4],List1),
	delete(List1,[D,A|CP4],List2),
	member([B,_C|_CP3],List2),
	member([A,B|CP2],List2),
	delete(List2,[A,B|CP2],List4),
	append(List4,[[D,B|CP4]],List5),
	
	(curr_cp(A)->set(curr_cp,B);true)
	
	))),!.
