% used by call command

lucianpl1(Debug,Query,Functions1,Result) :-
	lang(Lang1),
	international_lucianpl1([lang,Lang1],
	Debug,Query,Functions1,Result).

international_lucianpl1([lang,Lang],Debug,Query,Functions1,Result) :-
	 retractall(lang(_)),
 	assertz(lang(Lang)),
	lucianpl1_1(Debug,Query,Functions1,Result).
	
international_lucianpl1([lang,Lang],Debug,Query,TypeStatements,ModeStatements,Functions1,Result) :-
	retractall(lang(_)),
 	assertz(lang(Lang)),
	lucianpl1_1(Debug,Query,TypeStatements,ModeStatements,Functions1,Result).


lucianpl1_1(Debug,Query,Functions1,Result) :-
	retractall(types(_)),
 	assertz(types(off)),
lucianpl111(Debug,Query,Functions1,Result),!.

lucianpl1_1(Debug,Query,TypeStatements,ModeStatements,Functions1,Result) :-
	retractall(types(_)),
 	assertz(types(on)),
	retractall(typestatements(_)),
 		findall([A,C],(member([A,B],TypeStatements),expand_types(B,[],C)),TypeStatements1),

assertz(typestatements(TypeStatements1)),
	retractall(modestatements(_)),
 	assertz(modestatements(ModeStatements)),
lucianpl111(Debug,Query,Functions1,Result).

lucianpl111(Debug,Query,Functions,Result) :-
	/*
	((not(lang(_Lang1))
	%var(Lang1)
	)->
	(retractall(lang(_)),
 	assertz(lang("en")));
	true),
	load_lang_db,
	*/
%trace,
	query_box(Query,Query1,[],Functions1),

%get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,

delete(Functions,[0|_],Functions1a), % delete query box

	%writeln1(query_box(Query,Query1,Functions,Functions1)),
%%writeln1([i1]),
	%%writeln1(convert_to_grammar_part1(Functions1,[],Functions2,_)),
	convert_to_grammar_part1(Functions1,[],Functions2,_),
	%insert_cuts(Functions2a,Functions2),
%Functions1=Functions2,
	%writeln1(convert_to_grammar_part1(Functions1,[],Functions2,_)),	%trace,
	%writeln1(Functions2),
	%%pp3(Functions2),
	%%writeln1(lucianpl11(Debug,Query,Functions2,Functions2,Result)),
	%findall(Result1,
	
	%trace,
	add_line_numbers_to_algorithm1(Functions2,Functions2a),
%Functions2=Functions2a,	
	%writeln1(add_line_numbers_to_algorithm1(Functions2,Functions2a)),
	%writeln1(Functions2a),
append(Functions2a,Functions1a,Functions2b),
	
	%find_pred_sm(Reserved_words),%,"en"),
find_pred_numbers(Functions2b,[]%Reserved_words
,Pred_numbers),

%pred_numbers(Pred_numbers0),
%writeln([pred_numbers0,Pred_numbers0]),
	retractall(pred_numbers(_)),
 	assertz(pred_numbers(Pred_numbers)),
%trace,
%writeln([pred_numbers1,Pred_numbers]),

	find_state_machine1(Functions2a,Functions3a,Pred_numbers),
	append(Functions3a,Functions1a,Functions3b),

%Functions2a=Functions3,	
%writeln1(find_state_machine1(Functions2a,Functions3,Pred_numbers)),
	% find first predicate
%trace,
	%writeln1([functions3a,Functions3a]),
	prep_predicate_call(Query1,Functions3b,
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
		All_predicate_numbers2],_End_result,Functions3b,_Vars2,[],Result1,
		[],_Globals2,
		[], _Choice_point_trail2,
		[[curr_cp,0],[curr_cp_index,0]],_),
		Result=Result1.