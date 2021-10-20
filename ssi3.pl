% test(2,Q,F,R),lucianpl(off,Q,F,R2).

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
lucianpl11(Debug,Query,Functions1,Result).

lucianpl_1(Debug,Query,TypeStatements,ModeStatements,Functions1,Result) :-
	retractall(types(_)),
 	assertz(types(on)),
	retractall(typestatements(_)),
 	assertz(typestatements(TypeStatements)),
	retractall(modestatements(_)),
 	assertz(modestatements(ModeStatements)),
lucianpl11(Debug,Query,Functions1,Result).

lucianpl11(Debug,Query,Functions1,Result) :-
	((not(lang(_Lang1))
	%var(Lang1)
	)->
	(retractall(lang(_)),
 	assertz(lang("en")));
	true),
	load_lang_db,

%%writeln1([i1]),
	%%writeln1(convert_to_grammar_part1(Functions1,[],Functions2,_)),
	convert_to_grammar_part1(Functions1,[],Functions2,_),
	%trace,
	%writeln1(Functions2),
	%%pp3(Functions2),
	%%writeln1(lucianpl1(Debug,Query,Functions2,Functions2,Result)),
	%findall(Result1,
	
	
	add_line_numbers_to_algorithm1(Functions2,Functions2a),
	
	writeln1(Functions2a),
	
	find_pred_sm(Reserved_words1),%,"en"),
find_pred_numbers(Functions2a,Reserved_words,Pred_numbers),
	find_state_machine1(Functions2a,Functions3,Pred_numbers),
	
	writeln1(Functions3),

	% find first predicate
%trace,
	prep_predicate_call(Query,Functions3,
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
	trace,
	ssi1([1,All_predicate_numbers1,-1,"predicate",Query,[],
		All_predicate_numbers2],End_result,Functions3,Vars2,[],Result,
		[],Globals2,
		[], _Choice_point_trail2).
	
	
	
	%lucianpl2(Query,First_predicate,0, % first line - 0 is the header
	%Functions1*).
	% end when finds final result
	
	%,Query,Functions2,Functions2,%Result1),
	%Result1).
lucianpl1(Debug) :- %,Query,Functions1,Functions2,Result) 

% **** QUERY BOX, update vars etc inside antecedant

%%writeln1([i11]),
	retractall(debug(_)),
 	assertz(debug(Debug)),
   retractall(cut(_)),
   assertz(cut(off)),
	retractall(leash1(_)),
   assertz(leash1(off)), %% Should normally be off
  	retractall(sys(_)),
 	assertz(sys(1)),
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

ssi1([Level,Predicate_number,Line_number,"predicate",Query,
	Vars,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3) :-
%trace,
	(Line_number = -1 % just started
	->
	(
	Query=[Function,Arguments1],
	member([Predicate_number,Function,Arguments2,":-",Body],Functions), %*** predicates without arguments
	length(Arguments1,Length),
	length(Arguments2,Length),

checktypes_inputs(Function,Arguments1),
        
        %%writeln1(checkarguments(Arguments1,Arguments2,[],Vars1,[],FirstArgs)),
        %trace,
        checkarguments(Arguments1,Arguments2,[],Vars1,[],FirstArgs),
        %notrace,
        %%->ca2 
%writeln1([checkarguments,"Arguments1",Arguments1,"Arguments2",Arguments2,"Vars1",Vars1,"FirstArgs",FirstArgs]),
debug_call(Skip,[Function,Arguments1]),

append(Globals1,
[[[firstargs,Level],FirstArgs],
[[arguments1,Level],Arguments1],
[[skip,Level],Skip]],Globals3),

append(Choice_point_trail1,[[Level,Predicate_number,-1,"predicate",Query,
	Vars2,[]]],Choice_point_trail11),
	
	ssi1([Level,Predicate_number,0,"line",-,
	Vars1,All_predicate_numbers], _, Functions,Vars1,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail11,
	Choice_point_trail4)
	);
	
	(Line_number = -2
	% true exit from pred
	->(
	reverse(Globals1,Globals3),
	member([[firstargs,Level],FirstArgs],Globals3), %*delete, where was pred called from? - prev level in cps
	delete(Globals1,[[firstargs,Level],FirstArgs],Globals4),
	
	%writeln1(member([[arguments1,Level],Arguments1],Globals3)),
	
	member([[arguments1,Level],Arguments1],Globals3),
	delete(Globals4,[[arguments1,Level],Arguments1],Globals51),
	member([[skip,Level],Skip],Globals3),
	delete(Globals51,[[skip,Level],Skip],Globals5),
	
	debug_fail_fail(Skip),

	updatevars(FirstArgs,Vars2,[],Result),
	unique1(Result,[],Vars3),
%trace,
	reverse(Choice_point_trail1,Choice_point_trail5),

%trace,	
writeln1(member([Level,_Predicate_number,-1,"predicate",[Function,Arguments1],
	_Vars,_All_predicate_numbers],Choice_point_trail5)),
	member([Level,_Predicate_number,-1,"predicate",[Function,Arguments1],
	_Vars,_All_predicate_numbers],Choice_point_trail5),

	findresult3(Arguments1,Vars3,[],Result2),
	
   debug_exit(Skip,[Function,Result21]), % return result21
   checktypes(Function,Result21),
%trace,
		((Level=1,no_more_choicepoints(Choice_point_trail1)->
		(		append(Choice_point_trail1,[[1,Predicate_number,Line_number,"predicate",Query,
	Vars,[]]],Choice_point_trail4));

	((Level=1,not(no_more_choicepoints(Choice_point_trail1)))->
	
	(	%member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers],Choice_point_trail5),
	All_predicate_numbers=[All_predicate_numbers1|All_predicate_numbers2],

	ssi1([Level,All_predicate_numbers1,-1,"predicate",Query,
	Vars1,All_predicate_numbers2], Result21, Functions,Vars2,
	Result1, Result3, 
	Globals3,Globals2,
	Choice_point_trail5,
	Choice_point_trail3),
	
	append(Result3,[Result21],
	%[Choice_point_trail5],
	Result2)
	
	);
	((not(Level=1),no_more_choicepoints(Choice_point_trail1))->(
	Level2 is Level1-1,
	
		member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers2],Choice_point_trail5),

	ssi1([Level2,Predicate_number2,Line_number2,"line",-,
	Vars4,All_predicate_numbers2], _, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail5,
	Choice_point_trail3)
	
	);
	((not(Level=1),not(no_more_choicepoints(Choice_point_trail1)))->
	
	(	%member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers],Choice_point_trail5),
	All_predicate_numbers=[All_predicate_numbers1|All_predicate_numbers2],

	ssi1([Level,All_predicate_numbers1,-1,"predicate",Query,
	Vars1,All_predicate_numbers2], End_result, Functions,Vars2,
	Result1, Result3, 
	Globals3,Globals2,
	Choice_point_trail5,
	Choice_point_trail3),
	
	append(Result3,[End_result],
	%[Choice_point_trail5],
	Result2)
	
)

	)
	)))));
	(Line_number = -3
	% fail exit from pred
	->(
		
	reverse(Globals1,Globals3),
	member([[firstargs,Level],FirstArgs],Globals3), %*delete, where was pred called from? - prev level in cps
	delete(Globals1,[[firstargs,Level],FirstArgs],Globals4),
	member([[arguments1,Level],Arguments1],Globals3),
	delete(Globals4,[[arguments1,Level],Arguments1],Globals51),
	member([[skip,Level],Skip],Globals3),
	delete(Globals51,[[skip,Level],Skip],Globals5),
	
	debug_fail(Skip,[Function,Arguments1]),

	((Level=1,no_more_choicepoints(Choice_point_trail1))->
		(		append(Choice_point_trail1,[[1,Predicate_number,Line_number,"predicate",Query,
	Vars1,[]]],Choice_point_trail4));

	((Level=1,not(no_more_choicepoints(Choice_point_trail1)))->
	
	(	%member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers],Choice_point_trail5),
	All_predicate_numbers=[All_predicate_numbers1|All_predicate_numbers2],

	ssi1([Level,All_predicate_numbers1,-1,"predicate",Query,
	Vars1,All_predicate_numbers2], End_result, Functions,Vars2,
	Result1, Result3, 
	Globals3,Globals2,
	Choice_point_trail5,
	Choice_point_trail3),
	
	%Result3=Result2
	append(Result3,[End_result],Result2)
	);
	
	((not(Level=1),no_more_choicepoints(Choice_point_trail1))->(
	Level2 is Level1-1,
	
		member([Level2,Predicate_number2,_Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers2],Choice_point_trail5),

	ssi1([Level2,Predicate_number2,-3,"predicate",-,
	Vars4,All_predicate_numbers2], End_result,Functions,Vars2,
	Result1, Result3,%2, 
	Globals3,Globals2,
	Choice_point_trail5,
	Choice_point_trail3),
	
		append(Result3,[End_result],Result2)

	)
	;
	
		((not(Level=1),not(no_more_choicepoints(Choice_point_trail1)))->
	
	(	%member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers],Choice_point_trail5),
	All_predicate_numbers=[All_predicate_numbers1|All_predicate_numbers2],

	ssi1([Level,All_predicate_numbers1,-1,"predicate",Query,
	Vars1,All_predicate_numbers2], End_result, Functions,Vars2,
	Result1, Result3, 
	Globals3,Globals2,
	Choice_point_trail5,
	Choice_point_trail3),
	
	%append(Result3,[Choice_point_trail5],Result2)
	append(Result3,[End_result],Result2)

))
)

	)))))),!.
	
% run command

% e.g. [6,["on true",7],["go after",[end_function,3]],["on false",-3],[n,"->"]]

ssi1([Level,Predicate_number,Line_number,"line",Query,
	Vars1,All_predicate_numbers], _, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3) :-

member([Predicate_number,_F|Rest],Functions),
(Rest=[_Args,":-",Lines]->true;(Rest=[":-",Lines];
(Rest=[],Lines=[[[n,true]]]))),

%writeln1([member([Predicate_number,_F|Rest],Functions),
%(Rest=[_Args,":-",Lines]->true;(Rest=[":-",Lines];
%(Rest=[],Lines=[[[n,true]]])))]),
%trace,

	((Line_number= -2 ->true;Line_number= -3)->
	%trace,
	ssi1([Level, %*
	Predicate_number,Line_number,"predicate",Query,
	Vars1,All_predicate_numbers], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3);
(
member([Line_number,["on true",A],["go after",B],["on false",C],["go to predicates",D]|Line],Lines),

% * in find sm - are sm's hierarchical or linear? - linear

	(not(D)='-' ->
	(All_predicate_numbers=
	[All_predicate_numbers1|All_predicate_numbers2],
	
	Level2 is Level+1,

	%% **
	ssi1([Level2,All_predicate_numbers1,-1,"predicate",Query,
	Vars1,All_predicate_numbers2], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3)
	
	
% 		append(Result3,[End_result],Result2)
 );
	(interpretstatement2(Functions,Functions,Line,Vars2,Vars3,Result21,_Cut)
	% choose certain commands from lpi for ssi, rest customised
	
	->
	
	% if triggers end_function (meaning the end of an if-then clause), writes trace display and goes to "go after" line at start of function

	% end_function is given with line number to signal the end of the if-then statement etc.
	% -2 line number for end of predicate, -3 for failed predicate - earlier

	% n.b. findall, maplist (x not in new shell, with different end_function) need other code expansion in sm - with call, new shell
	% also type check in new shell, separate from alg
	% iso commands need to be done like c
	
 % - do bagof, setof later
 
	ssi1([Level,Predicate_number,A,"line",Query,
	Vars1,All_predicate_numbers], End_result, Functions,Vars3,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3)
	
	
	;
	
	ssi1([Level,Predicate_number,C,"line",Query,
	Vars1,All_predicate_numbers], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3))))).

	

% t or f
% return true or false result from pred

%last_line_of_algorithm(_Predicate_number,0,"predicate",_Functions) :- !.
/*
last_line_of_algorithm(Predicate_number,Line_number,"line",Functions) :- member([Predicate_number|Rest],Functions),
(Rest=[_Args,":-"|Lines]->true;Rest=[":-"|Lines]),
not(member([Line_number|_],Lines)),!.
*/

%interpretstatement2(Functions,Functions,Line,Vars2,Vars3,Result21,_Cut) :-
	%interpretstatement3(ssi,Functions,Functions,Line,Vars2,Vars3,Result21,_Cut).
interpretstatement2(Functions,Functions,Line,Vars2,Vars3,Result21,_Cut) :-
	interpretstatement1(ssi,Functions,Functions,Line,Vars2,Vars3,Result21,_Cut).

no_more_choicepoints(Choice_point_trail) :-
	forall(member([_Level,_Predicate_number,
	_Line_number,_Destination,_Query,
	All_predicate_numbers],
	Choice_point_trail),All_predicate_numbers=[]),!.

