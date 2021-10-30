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
lucianpl11(Debug,Query,Functions1,Result),!.

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
	
	%trace,
	add_line_numbers_to_algorithm1(Functions2,Functions2a),
	
	%writeln1(Functions2a),
	
	find_pred_sm(Reserved_words),%,"en"),
find_pred_numbers(Functions2a,Reserved_words,Pred_numbers),
	find_state_machine1(Functions2a,Functions3,Pred_numbers),
	
	%writeln1(Functions3),

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
	%trace,
	ssi1([1,All_predicate_numbers1,-1,"predicate",Query,[],
		All_predicate_numbers2],_End_result,Functions3,_Vars2,[],Result1,
		[],_Globals2,
		[], _Choice_point_trail2,VR),
		%(var(VR)->Result=[];Result=[VR]).
	Result1=Result.
	
	
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
	Choice_point_trail3,VR) :-
	
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

ssi1([Level,Predicate_number,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR) :-
%trace,
%(Query='-'->trace;true),
%/*
writeln1([%vars2,Vars2,
ssi1([Level,Predicate_number,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR)]),
	%*/
	((not(Line_number= -2), not(Line_number= -3))->
	(Query_a=[Function,Arguments1]->Query_a=Query;
	(Query_a=[Function],Query=[Function,[]],Arguments1=[]));
	true),
	
	(Line_number = -1 % just started
	->
	(%trace,
	
	((((
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
debug_call(Skip,[Function,Arguments1])
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


append(Globals1,
[[[firstargs,Level],FirstArgs],
[[function,Level],Function],
[[arguments1,Level],Arguments1],
[[skip,Level],Skip]],Globals3),

Globals3=Globals31,
%reverse(Globals3,Globals31),

append(Choice_point_trail1,[[Level,Predicate_number,-1,"predicate",Query,
	Vars3,
	[]]],Choice_point_trail11),
	
	ssi1([Level,Predicate_number,0,"line",-,
	Vars3,
	All_predicate_numbers], _, Functions,Vars2, % first Vars1 to Vars, 2nd Vars1 to Vars2
	Result1, Result2, 
	Globals31,Globals2,
	Choice_point_trail11,
	Choice_point_trail3,VR)
	
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
	Choice_point_trail3,VR)),
	*/
	
	ssi1([Level,Predicate_number_a,Line_number,"predicate",Query_a,
	Vars,All_predicate_numbers2], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR)
	))
	/*->true;
	
	
	(((
	
	

	Query=[Function,Arguments1],
	member([Predicate_number,Function,Arguments2],Functions), *** predicates without arguments
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

	ssi1([Level, %
	Predicate_number,Line_number_b,"predicate",Query,
	Vars3,All_predicate_numbers], _End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail11,
	Choice_point_trail3,VR)

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

	ssi1([Level, %
	Predicate_number,Line_number_b,"predicate",Query,
	Vars3,All_predicate_numbers], _End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail11,
	Choice_point_trail3,VR)

))
*/
	);
	
	(Line_number = -2
	% true exit from pred
	->(
	%trace,
	reverse(Globals1,Globals31),
	%Globals1=Globals31,
	member([[firstargs,Level],FirstArgs],Globals31), %*delete, where was pred called from? - prev level in cps
	delete(Globals31,[[firstargs,Level],FirstArgs],Globals41),
	%Globals31=Globals4,
	%writeln1(member([[arguments1,Level],Arguments1],Globals3)),
	
	member([[function,Level],Function],Globals41),
	delete(Globals41,[[function,Level],Function],Globals411),
	
	member([[arguments1,Level],Arguments1],Globals411),
	delete(Globals411,[[arguments1,Level],Arguments1],Globals51),
	%Globals4=Globals51,
	member([[skip,Level],Skip],Globals51),
	delete(Globals51,[[skip,Level],Skip],Globals21),
	%Globals21=Globals51,
	%trace,
	reverse(Globals21,Globals3),
	%Globals21=Globals3,
	
	(debug_fail_fail(Skip)->true;true),
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
	member([Level,_Predicate_number,-1,"predicate",[Function,Arguments1], %**
	_Vars,_All_predicate_numbers],Choice_point_trail5),
%trace,
	findresult3(Arguments1,Vars3,[],Result22),

/*
writeln(ssi1([Level,Predicate_number,Line_number,"predicate",Query,
	Vars3,All_predicate_numbers], Result21, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR)), %% ** keep
	*/
	
	
	%Result22=Vars2,
   debug_exit(Skip,[Function,Result22]), % return result21
   checktypes(Function,Result22),
%trace,

%not_last_line()
		((Level=0,
		no_more_choicepoints(Choice_point_trail1,_,fail)->
		(		append(Choice_point_trail1,[[1,Predicate_number,Line_number,"predicate",Query,
	Vars3,[]]],Choice_point_trail3),

	Result1 = Result3
	
	);

	((Level=0,no_more_choicepoints(Choice_point_trail1,CPs,true))->
	
	(
reverse(CPs,CPs1),
	member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers0],CPs1),
	All_predicate_numbers0=[All_predicate_numbers1|All_predicate_numbers2],

delete(CPs1,[Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers0],CPs2),

append(CPs2,[[Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers2]],CPs3),

reverse(CPs3,CPs4),

append(Result1,[Vars3],Vars5),

% delete all pred nums at end of []
	ssi1([Level2,All_predicate_numbers1,-1,"predicate",_Query3,
	Vars4,All_predicate_numbers2], Result21, Functions,Vars2,
	Vars5, Result3, 
	Globals3,Globals2,
	CPs4,
	Choice_point_trail3,VR)
	
	%append(Result3,[Result21],
	%[Choice_point_trail5],
	%Result2)
	
	);
	((not(Level=0)%,no_more_choicepoints(Choice_point_trail1,_,fail)
	)->(
	Level2 is Level-1,
	%trace,
	
	(Level2=0->(%trace,
	%writeln(here),
	Vars3=VR,
	%Result1=Result2
	append(Result1,[Vars3],Result2)
	);
	%true,
	(
		reverse(Choice_point_trail1,Choice_point_trail11),
		%trace,
		Level2 is Level-1,
		member([Level2,Predicate_number2,Line_number2b,"predicate",_Query2,Vars4,All_predicate_numbers2],Choice_point_trail11),%->notrace;(notrace,fail)),
	%(	Line_number2= ["returns to", 0]->trace;true),
		
	(Line_number2b=["returns to",Line_number3]->
	(
member([Predicate_number2,_F|Rest],Functions),
(Rest=[_Args,":-",Lines]->true;
(Rest=[_Args]->Lines=[[[n,true]]];
(Rest=[":-",Lines];
(Rest=[],Lines=[[[n,true]]])))),



	member([Line_number3,["on true",A],["go after",_B],["on false",_C],["go to predicates",_D]|_Line],Lines),
A=Line_number2a,
%trace,
	reverse(Globals1,Globals33),
	%writeln1(Globals3),
	%trace,
	member([[firstargs_uv2,Level2],FirstArgs1],Globals33),
	Globals33=Globals43,
	%delete(Globals3,[[firstargs,Level2],FirstArgs],Globals4),
	member([[vars1,Level2],Vars11],Globals43),
	%delete(Globals4,[[vars1,Level2],Vars1],Globals21),
	Globals43=Globals23,

reverse(Globals23,Globals22),
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

(Line_number2a=Line_number2b,
%trace,
Vars3=Vars44
)), % Line_number2 to 2b

	ssi1([Level2,Predicate_number2,Line_number2a,"line",-,
	Vars44,All_predicate_numbers2], _, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals22,
	Choice_point_trail1,
	Choice_point_trail3,VR)
	
	)))
	/*
	((not(Level=0)%,no_more_choicepoints(Choice_point_trail1,CPs,true)
	)->
	
	(	%member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers],Choice_point_trail5),
	*
	reverse(CPs,CPs1),
	member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers0],CPs1),
	All_predicate_numbers0=[All_predicate_numbers1|All_predicate_numbers2],

delete(CPs1,[Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers0],CPs2),

append(CPs2,[[Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers2]],CPs3),

reverse(CPs3,CPs4),

append(Result1,[Vars3],
Vars5),

% delete all pred nums at end of []
	ssi1([Level2,All_predicate_numbers1,-1,"predicate",_Query3,
	Vars4,All_predicate_numbers2], Result21, Functions,Vars2,
	Vars5, Result3, 
	Globals3,Globals2,
	CPs4,
	Choice_point_trail3,VR)
	
	*
	*
	All_predicate_numbers=[All_predicate_numbers1|All_predicate_numbers2],

	ssi1([Level,All_predicate_numbers1,-1,"predicate",Query,
	Vars3,All_predicate_numbers2], End_result, Functions,Vars2,
	Result1, Result3, 
	Globals3,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR),
	
	append(Result3,[End_result],
	%[Choice_point_trail5],
	Result2)
	*
)*/

	)
	))));
	(Line_number = -3
	% fail exit from pred
	->(%trace,
		
	(Level=0->true;
	(reverse(Globals1,Globals3),
	%Globals1=Globals3,

	writeln([globals3,Globals3]),

	member([[firstargs,Level],FirstArgs],Globals3), %*delete, where was pred called from? - prev level in cps
	delete(Globals3,[[firstargs,Level],FirstArgs],Globals41),
	member([[function,Level],Function],Globals41),
	delete(Globals41,[[function,Level],Function],Globals51),
	member([[arguments1,Level],Arguments1],Globals51),
	delete(Globals51,[[arguments1,Level],Arguments1],Globals61),
	member([[skip,Level],Skip],Globals61),
	delete(Globals61,[[skip,Level],Skip],Globals21),
	
	reverse(Globals21,Globals222),
	
	(debug_fail(Skip,[Function,Arguments1])->true;true)
	
	)),

	((Level=0,no_more_choicepoints(Choice_point_trail1,_,fail))->
		(		append(Choice_point_trail1,[[1,Predicate_number,Line_number,"predicate",Query,
	Vars3,[]]],Choice_point_trail3));

	((Level=0,no_more_choicepoints(Choice_point_trail1,CPs,true))->
	
	(	%member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers],Choice_point_trail5),
	
		
	reverse(CPs,CPs1),
	member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers0],CPs1),
	All_predicate_numbers0=[All_predicate_numbers1|All_predicate_numbers2],

delete(CPs1,[Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers0],CPs2),

append(CPs2,[[Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers2]],CPs3),

reverse(CPs3,CPs4),

append(Result1,[],%[Vars3],
Vars5),

% delete all pred nums at end of []
	ssi1([Level2,All_predicate_numbers1,-1,"predicate",_Query3,
	Vars3,All_predicate_numbers2], Result21, Functions,Vars2,
	Vars5, Result3, 
	Globals222,Globals2,
	CPs4,
	Choice_point_trail3,VR)
	
	
	/*All_predicate_numbers=[All_predicate_numbers1|All_predicate_numbers2],

	ssi1([Level,All_predicate_numbers1,-1,"predicate",Query,
	Vars3,All_predicate_numbers2], End_result, Functions,Vars2,
	Result1, Result3, 
	Globals222,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR),
	
	%Result3=Result2
	append(Result3,[End_result],Result2)*/
	);
	
	
/*	((not(Level=0),no_more_choicepoints(Choice_point_trail1,_,fail))->(
	Level2 is Level-1,
	
	reverse(Choice_point_trail1,Choice_point_trail11),
		
	(Level2=0->(Predicate_number2=0,All_predicate_numbers2=[],
	Vars4=[]);	member([Level2,Predicate_number2,_Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers2],Choice_point_trail11)),

	ssi1([Level2,Predicate_number2,-3,"predicate",-,
	Vars4,All_predicate_numbers2], _End_result,Functions,Vars2,
	Result1, Result3,%2, 
	Globals3,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR)%,
	
		%append(Result3,[End_result],Result2)

	)
	;
	
		*/
		
		% if at lev 1, 
		
		((Level=1%,no_more_choicepoints(Choice_point_trail1,CPs,true)
		)->
	
	(	%member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers],Choice_point_trail5),
	
		/*
	reverse(CPs,CPs1),
	member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers0],CPs1),
	All_predicate_numbers0=[All_predicate_numbers1|All_predicate_numbers2],

delete(CPs1,[Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers0],CPs2),

append(CPs2,[[Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers2]],CPs3),

reverse(CPs3,CPs4),

append(Result1,[],%[Vars3],
Vars5),

% delete all pred nums at end of []
	ssi1([Level2,All_predicate_numbers1,-1,"predicate",_Query3,
	Vars4,All_predicate_numbers2], Result21, Functions,Vars2,
	Vars5, Result3, 
	Globals3,Globals2,
	CPs4,
	Choice_point_trail3,VR)
	*/
	
	%/*
	
	((	
	reverse(Choice_point_trail1,Choice_point_trail5),
	writeln1(Choice_point_trail5),
	
	member([Level,_Predicate_number24,_Line_number24,"predicate",_Query24,Vars445,All_predicate_numbers4],Choice_point_trail5),

	
	(All_predicate_numbers4=[]->
	
	(Level2 is Level-1,
	%trace,
	
	%reverse(Choice_point_trail1,Choice_point_trail5),
	%writeln1(Choice_point_trail5),
	
	member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers],Choice_point_trail5),


	ssi1([Level2,Predicate_number2,-3,"predicate",_Query3,
	Vars4,[]], Result21, Functions,Vars2,
	Result1, Result3, 
	Globals3,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR)
/*

ssi1([Level,All_predicate_numbers,-3,"predicate",Query,
	Vars3,[]], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR)
*/
)
;	

(
	All_predicate_numbers4=[All_predicate_numbers1|All_predicate_numbers2],

	ssi1([Level,All_predicate_numbers1,-1,"predicate",Query,
	Vars3,All_predicate_numbers2], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR)
	
	%append(Result3,[Choice_point_trail5],Result2)
	%append(Result3,[End_result],Result2)
%*/
))
)

	))
	
	
	)->true;
	
	(not(Level=0)%,no_more_choicepoints(Choice_point_trail1,CPs,true)
		)->
	
	(	%member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers],Choice_point_trail5),
	
		/*
	reverse(CPs,CPs1),
	member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers0],CPs1),
	All_predicate_numbers0=[All_predicate_numbers1|All_predicate_numbers2],

delete(CPs1,[Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers0],CPs2),

append(CPs2,[[Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers2]],CPs3),

reverse(CPs3,CPs4),

append(Result1,[],%[Vars3],
Vars5),

% delete all pred nums at end of []
	ssi1([Level2,All_predicate_numbers1,-1,"predicate",_Query3,
	Vars4,All_predicate_numbers2], Result21, Functions,Vars2,
	Vars5, Result3, 
	Globals3,Globals2,
	CPs4,
	Choice_point_trail3,VR)
	*/
	
	%/*
	
	((	
	reverse(Choice_point_trail1,Choice_point_trail5),
	writeln1(Choice_point_trail5),
	
	member([Level,_Predicate_number24,_Line_number24,"predicate",_Query24,Vars445,All_predicate_numbers4],Choice_point_trail5),

	
	(All_predicate_numbers4=[]->
	
	(Level2 is Level-1,
	%trace,
	
	%reverse(Choice_point_trail1,Choice_point_trail5),
	%writeln1(Choice_point_trail5),
	
	member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers],Choice_point_trail5),


	ssi1([Level2,Predicate_number2,-3,"predicate",_Query3,
	Vars4,[]], Result21, Functions,Vars2,
	Result1, Result3, 
	Globals3,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR)
/*

ssi1([Level,All_predicate_numbers,-3,"predicate",Query,
	Vars3,[]], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR)
*/
)
;	

(
	All_predicate_numbers4=[All_predicate_numbers1|All_predicate_numbers2],

	ssi1([Level,All_predicate_numbers1,-1,"predicate",Query,
	Vars445,All_predicate_numbers2], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR)
	
	%append(Result3,[Choice_point_trail5],Result2)
	%append(Result3,[End_result],Result2)
%*/
))
)

	))
	
	)))))),!.
	
% run command

% e.g. [6,["on true",7],["go after",[end_function,3]],["on false",-3],[n,"->"]]

ssi1([Level,Predicate_number,Line_number_a,"line",Query,
	Vars1,All_predicate_numbers], _, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR) :-
	%/*
	writeln1([%vars2,Vars2,
	ssi1([Level,Predicate_number,Line_number_a,"line",Query,
	Vars1,All_predicate_numbers], _, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR)]),
	%*/
	%trace,
	%((Level=0,Predicate_number=0,Line_number_a=-1)->trace;true),

member([Predicate_number,_F|Rest],Functions),
(Rest=[_Args,":-",Lines]->true;
(Rest=[_Args]->Lines=[[[n,true]]];
(Rest=[":-",Lines];
(Rest=[],Lines=[[[n,true]]])))),

(Line_number_a=[end_function,End_line] ->
Line_number=End_line;Line_number=Line_number_a),

%(Line_number= -2 ->trace;true),
((Line_number= -2 ->true;Line_number= -3)->
true;
(member([Line_number,["on true",A],["go after",B],["on false",C],["go to predicates",D]|Line],Lines))),

(Line_number=[end_function,_End_line] ->
Line_number_b=B;Line_number_b=Line_number),

%writeln1([member([Predicate_number,_F|Rest],Functions),
%(Rest=[_Args,":-",Lines]->true;(Rest=[":-",Lines];
%(Rest=[],Lines=[[[n,true]]])))]),
%trace,
%trace,
append(Globals1,[[[vars1,Level],Vars1]],Globals3),

%reverse()
%Level2 is Level-1,
	((Line_number_b= -2 ->true;Line_number_b= -3)->
	%trace,
	ssi1([Level, %*
	Predicate_number,Line_number_b,"predicate",Query,
	Vars1,All_predicate_numbers], _End_result, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR);
%(

% * in find sm - are sm's hierarchical or linear? - linear
%trace,

/*
(Line_number=[end_function,End_line] ->

	(
	append(Choice_point_trail1,[[Level,Predicate_number,[end_function,End_line],"predicate",Query,
	Vars2,All_predicate_numbers]],Choice_point_trail11),

	ssi1([Level,Predicate_number,End_line,"line",Query,
	Vars1,All_predicate_numbers], End_result, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail11,
	Choice_point_trail3,VR))
);
*/

	
	(not(D='-') ->

(%append(D,All_predicate_numbers,All_predicate_numbers3),
	%All_predicate_numbers3=
	D=
	[All_predicate_numbers1|All_predicate_numbers2],
	
	Level2 is Level+1,

reverse(Choice_point_trail1,Choice_point_trail111),
append(Choice_point_trail111,[[Level,Predicate_number,["returns to",Line_number_b],"predicate",Query,
	Vars2,All_predicate_numbers]],Choice_point_trail1111),
reverse(Choice_point_trail1111,Choice_point_trail11),

%Line=[Function,Arguments],



get_lang_word("v",Dbw_v),
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("call",Dbw_call1),Dbw_call1=Dbw_call,

%find_pred_sm(Reserved_words1),
Line=Query1,
        ((Query1=[[Dbw_n,Dbw_call],[Function,Arguments]]
        )->true;
(Query1=[Function,Arguments]
)
),

        (Function=[Dbw_v,_]->
        (append([Function],Arguments,Arguments1),
        substitutevarsA1(Arguments1,Vars1,[],Vars3,[],FirstArgs),
        
        append(Globals3,[[[firstargs_uv2,Level],FirstArgs]],Globals31),
        append(Globals31,[[[vars1,Level],Vars1]],Globals32),

        Vars3=[Function1|Vars31],
        Query2=[Function1,Vars31]);
        (
        substitutevarsA1(Arguments,Vars1,[],Vars3,[],FirstArgs),
        
        append(Globals3,[[[firstargs_uv2,Level],FirstArgs]],Globals32),

        Query2=[Function,Vars3])),
        %interpret2(Query2,Functions0,Functions0,Result1), 

/*
	updatevars2(FirstArgs,Result1,[],Vars5),
	updatevars3(Vars1,Vars5,Vars6),

*/

	%% **
	ssi1([Level2,All_predicate_numbers1,-1,"predicate",Query2,
	Vars1,All_predicate_numbers2],
	 _End_result2, %don't need
	 Functions,Vars2,
	Result1, Result2,  % don't need
	Globals32,Globals2,
	Choice_point_trail11,
	Choice_point_trail3,VR)
	
	
% 		append(Result3,[End_result],Result2)
 );
	(%trace,
	interpretstatement2(Functions,Functions,Line,Vars1,Vars3,_Result21,_Cut)
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
	Vars3,All_predicate_numbers], _End_result3, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR)
	
	
	;
	(%trace,
	ssi1([Level,Predicate_number,C,"line",Query,
	Vars1,All_predicate_numbers], _End_result4, Functions,Vars2,
	Result1, Result2, 
	Globals1,Globals2,
	Choice_point_trail1,
	Choice_point_trail3,VR))))).

	

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
interpretstatement2(Functions,Functions,Line,Vars2,Vars3,Result21,_Cut1) :-
	%writeln1(interpretstatement2(Functions,Functions,Line,Vars2,Vars3,Result21,_Cut1)),
	interpretstatement1(ssi,Functions,Functions,Line,Vars2,Vars3,Result21,_Cut).

no_more_choicepoints(Choice_point_trail,A,B) :-
	%(Choice_point_trail=[[1,0,-1|_]|_]->trace;true),
	writeln1([choice_point_trail,Choice_point_trail]),
	findall(C,(member(C,
	Choice_point_trail),C=[_,_,_,_,_,_,All_predicate_numbers],
	not(All_predicate_numbers=[])),A),(length(A,0)->B=fail;B=true),!.

/*not_last_line(Choice_point_trail1) :-
		reverse(Choice_point_trail1,Choice_point_trail11),
		member([Level2,Predicate_number2,Line_number2,"predicate",_Query2,Vars4,All_predicate_numbers2],Choice_point_trail11),%->notrace;(notrace,fail)),
	%(	Line_number2= ["returns to", 0]->trace;true),
		
	(Line_number2=["returns to",Line_number3]->
	(
member([Predicate_number2,_F|Rest],Functions),
(Rest=[_Args,":-",Lines]->true;(Rest=[":-",Lines];
(Rest=[],Lines=[[[n,true]]]))),

	member([Line_number3,["on true",A],["go after",_B],["on false",_C],["go to predicates",_D]|_Line],Lines));
	A=Line_number2),
not(Line_number2= -2),not(Line_number2= -3).
*/

