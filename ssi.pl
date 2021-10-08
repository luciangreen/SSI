%% ssi.pl
%% State Saving Interpreter
%%
%% Introduces retry in trace

%% convert alg to state machine (sm)
%% it is a nondeterministic (nd) state machine, i.e. it has forks between parts of the sm if there are nd choices left or it has failed a clause, with backtracking to the last choice point on the line - predicates and clauses are signposted in the sm
%% predicates, clauses and individual predicate sms
%%	- predicates and clauses sms are separate because the sm goes from one predicate to next x only clauses not predicates sm x predicates sm as well because they are separate but have back-connection origin values that make temporary parts of (a separate) state machine that correspond to level numbers in the trace x there are sm links from ends of predicates to where the predicate was called from
%% clauses in clauses sms catch fails from previous clauses

%% try without recursion at first

%% x sm not nec, just scope ds with var, (recursive states x) nd states
%%		- can fail predicate that doesn't call another predicate, then try another predicate

%% on if then, goes to other clause if fails, etc.

%% unique number for every line of program

%% line (from command) to rectangle (e.g. predicate)

%% track list for backtracking
%% 1 predicate number, 1,2 line number or bracketed part, etc.
%%		- failed predicates removed from track list
%% doesn't need to split predicates in half to turn algorithms into web services

%% a :- b, c. not a:-a.
%% a(1,1,Result):- Result is 1+1.

/**
crop down pred from top x just goes to next command
- sets up antecedant(s) in if, not, or if, brackets backtracks to it
- x based on states, it continues on from antecedants
**/

%% find called line
%% find next line
%% - go to next numbered line if in brackets, etc.
%% - if last line of brackets
%%  - if antecedent that is true, ..., vv
%% if fails, returns to last choice point
%:-include('listprologinterpreter1listrecursion4.pl'). % enabling these 3 causes a hang on loading
%:-include('listprologinterpreter3preds5.pl').
%:-include('grammar.pl').
%:-include('../../../GitHub/listprologinterpreter/lpiverify4.pl').
%:-include('ssi_find_state_machine.pl').

%ssi_verify(Debug,N) :-
%	test(N,Query,Functions,Result),
%	ssi(Debug,Query,Functions,Result).

:-include('../listprologinterpreter/listprolog.pl').
:-include('find_pred_sm.pl').
:-include('ssi_find_state_machine.pl').
%:-include('find_types_sm.pl').
%:-include('go_forward_or_backtrack.pl').
:-include('ssi3.pl').

/*
ssi(Debug,Query,Functions1,Result) :-
	%load_lang_db, % * check this is done once for whole ssi

	retractall(debug(_)),
 	assertz(debug(Debug)),
	convert_to_grammar_part1(Functions1,[],Functions2,_),
	add_line_numbers_to_algorithm1(Functions2,Functions2a),
	%%writeln1(Functions2a),
	find_pred_sm(Reserved_words1),%,"en"),
find_pred_numbers(Functions2a,Reserved_words,Pred_numbers),
	find_state_machine1(Functions2a,Functions3,Pred_numbers),
	
	%%writeln1(Functions3),
	prep_predicate_call(Query,Functions3,
		All_predicate_numbers),
	ssi1([1,1,"predicate",Query,[],
		All_predicate_numbers],Functions3,[],Result,[],_Choice_point_trail).
	
*/
	
prep_predicate_call(Query,Functions3,All_predicate_numbers) :-
	Query=[Name|Arguments1],
	length(Arguments1,Arguments_length),
	findall(Predicate_number1,
	(member([Predicate_number1,Name|
		[Arguments2|_]],Functions3),
	length(Arguments2,Arguments_length)),
	All_predicate_numbers).
	
add_line_numbers_to_algorithm1(Algorithm1,Algorithm2) :-
	add_line_numbers_to_algorithm2(Algorithm1,[],Algorithm2,0,_).
	
add_line_numbers_to_algorithm2([],Algorithm,Algorithm,N,N) :- !.
add_line_numbers_to_algorithm2(Algorithm1,Algorithm2,Algorithm3,Number1,Number2) :-
	Algorithm1=[Function1|Functions],
	((Function1=[Name,Arguments1,Symbol1,Body1],symbol(Symbol1,Symbol2),
	findall(Arguments3,(member(Arguments2,Arguments1),slp2lp_variables(Arguments2,Arguments3)),Arguments4),
	Number1a is Number1+1,
	add_line_numbers_to_algorithm_body2(Body1,Body2,0,_),
	append(Algorithm2,[[Number1,Name,Arguments4,Symbol2,Body2]],Algorithm4))->true;
	
	(Function1=[Name,Arguments1],
	findall(Arguments3,(member(Arguments2,Arguments1),slp2lp_variables(Arguments2,Arguments3)),Arguments4),
	append(Algorithm2,[[Number1,Name,Arguments4]],Algorithm4))),
	Number1a is Number1+1,
	%%writeln1([Number1,Name,Arguments4,Symbol2,Body2]),
	add_line_numbers_to_algorithm2(Functions,Algorithm4,Algorithm3,Number1a,Number2).

	
symbol(Symbol,Symbol) :-!.

%%slp2lp_variables(Name1,[v,Name1]) :- predicate_or_rule_name(Name1),!.
slp2lp_variables(Name,Name) :- !.

/**
add_line_numbers_to_algorithm_body(Body1,Body2) :-
	findall(*,(member(Statement1,Body1
add_line_numbers_to_algorithm_body(Body1,[],Body2) :-

**/

%%predicate_or_rule_name([A,B]) :- atom(A),is_list(B),!.
predicate_or_rule_name([V_or_n,_Name]) :- (V_or_n=v->true;V_or_n=n),!.%%,atom(Name),!.
%% x: predicate_or_rule_name(V_or_n) :- (V_or_n=v->true;V_or_n=n),fail,!.

add_line_numbers_to_algorithm_body2([],[],N,N):-!.%%,Body3


%%add_line_numbers_to_algorithm_body2([],Body,Body) :- !.
add_line_numbers_to_algorithm_body2(Body1,Body2%%,Body3
,Number1,Number2) :-
        Body1=[[Statements1|Statements1a]|Statements2
        ],
	
		not(predicate_or_rule_name(Statements1)),
			  Number1a is Number1+1,
add_line_numbers_to_algorithm_body2([Statements1],Body3,Number1a,Number3), %% 2->1

	add_line_numbers_to_algorithm_body2(Statements1a,Body4,Number3,Number4),
        add_line_numbers_to_algorithm_body2(Statements2,Body5,Number4,Number2),
    
%%	append([Body3,Body4],Body6),
%%	append([[Body6],Body5],Body2),
	
	     append(Body3,Body4,Body34),
        Body6=[Number1,[n,"[]"],Body34
        ],
        append([Body6],Body5,Body2),

	!.



        
add_line_numbers_to_algorithm_body2(Body1,Body2,Number1,Number2) :-
        Body1=[[[n,not],Statement]|Statements2 %% [] removed from Statement
        ],
		  Number1a is Number1+1,
        add_line_numbers_to_algorithm_body2([Statement],Body3,Number1a,Number3),
        add_line_numbers_to_algorithm_body2(Statements2,Body4,Number3,Number2),
		  append([Number1,%%*,
		  [n,not]],Body3,Body5),
		  append([Body5],Body4
        ,Body2),

	!.
	
	


add_line_numbers_to_algorithm_body2(Body1,Body2,Number1,Number2) :-
        Body1=[[[n,or],[Statements1,Statements2]]|Statements3],
		  Number1a is Number1+1,
        add_line_numbers_to_algorithm_body2([Statements1],Body3,Number1a,Number3),
        add_line_numbers_to_algorithm_body2([Statements2],Body4,Number3,Number4),
        add_line_numbers_to_algorithm_body2(Statements3,Body5,Number4,Number2),
        append(Body3,Body4,Body34),
        Body6=[Number1,[n,or],Body34
        ],
        append([Body6],Body5,Body2),
        !.


add_line_numbers_to_algorithm_body2(Body1,Body2,Number1,Number2) :-
        Body1=[[[n,"->"],[Statements1,Statements2]]|Statements3],
		  Number1a is Number1+1,
        add_line_numbers_to_algorithm_body2([Statements1],Body3,Number1a,Number3), 
    	  add_line_numbers_to_algorithm_body2([Statements2],Body4,Number3,Number4),

        add_line_numbers_to_algorithm_body2(Statements3,Body5,Number4,Number2),
        append(Body3,Body4,Body34),
        Body6=[Number1,[n,"->"],Body34
        ],
        append([Body6],Body5,Body2),

        !.




add_line_numbers_to_algorithm_body2(Body1,Body2,Number1,Number2) :-
        Body1=[[[n,"->"],[Statements1,Statements2,Statements2a]]|Statements3],
		  Number1a is Number1+1,
        add_line_numbers_to_algorithm_body2([Statements1],Body3,Number1a,Number3),
        add_line_numbers_to_algorithm_body2([Statements2],Body4,Number3,Number4),
                %%trace,
                add_line_numbers_to_algorithm_body2([Statements2a],Body5,Number4,Number5),
        add_line_numbers_to_algorithm_body2(Statements3,Body6,Number5,Number2),
        append_list2([Body3,Body4,Body5],Body345),
        Body7=[Number1,[n,"->"],Body345],        
        append([Body7],Body6,Body2),

        !.


add_line_numbers_to_algorithm_body2(Body1,Body2,Number1,Number2) :-
	Body1=[Statement|Statements],
	not(predicate_or_rule_name(Statement)),
	add_line_numbers_to_algorithm_statement1(Statement,Result1,Number1,Number3),
	add_line_numbers_to_algorithm_body2(Statements,Result2,Number3,Number2),
   append_list2([Result1,Result2],Body2),!.

add_line_numbers_to_algorithm_statement1(Statement,Result1,Number1,Number2) :-
	((Statement=[[n,findall],[Arguments1,Arguments2,Arguments3]],
	%Arguments=Result2,
	%trace,
	Number1a is Number1+1,
	add_line_numbers_to_algorithm_body2([Arguments2],Body3,Number1a,Number2),
			  
%findall(Argument,(member(Argument,Arguments),(predicate_or_rule_name(Argument))),Result2),
	Result1=[[Number1,[n,findall],[Arguments1,Arguments3,Body3]]])).
	
	   
add_line_numbers_to_algorithm_statement1(Statement,Result1,Number1,Number2) :-
	((Statement=[[n,Name],Arguments],
	not(Name=findall),
	Arguments=Result2,
	%findall(Argument,(member(Argument,Arguments),(predicate_or_rule_name(Argument))),Result2),
	Result1=[[Number1,[n,Name],Result2]])->true;
	(Statement=[[n,Name]],
	Result1=[[Number1,[n,Name]]])),
	Number2 is Number1+1.

%%*del:Functions2,

%% *** don't worry about sublevels, just level numbers x

%ssi0

% newer than comments in next section:

% go to types, pred or lines pred 
% - whether this pred determines which to go to, or it is already decided x
%  - * sm connects types at start - no call/exit preds, just goes to next item in sm,
%    - types sm creator - checks types (do non types sm first)
%  - * sm of preds (to clauses from calls, allowing backtracking)
% - whether need call and exit preds, or do anyway x

/**
ssi1([Level,Sublevel,"predicate",Query,Predicate_numbers_finished,All_predicate_numbers],Functions1,Result1,Result2,Choice_point_trail1,Choice_point_trail2) :-
 append(Predicate_numbers_finished,Curr_predicate_queue,All_predicate_numbers),
 (Curr_predicate_queue=[]->
 
 (% No other clauses of this predicate to try
 
 % add to cps
 append(Choice_point_trail1,[[Level,Sublevel,"predicate",Query,Predicate_numbers_finished,All_predicate_numbers]],Choice_point_trail3),
 
 
 %call first line
%*
 
 
 % when reach last line:
 	%predicate finished, no more results from it
 
 	% if level 1 end x, call prev cp

 	%- if not level 1 call prev lev - find var state of last line of prev lev - update vars

 % 
 )
 ;(
 % Some clauses of this predicate left to try
 
 % add to cps
 % call first line of pred, 
 % when reach last line, call next clause (dup vars *(one list for old results, one for curr results x label var results with cp, *sublevel at least x, also need ()x-predicate and line numbers*), add to new var list, delete cps back to pred call)
 
 % * var results/cps saved from where began when try each clause, deleted back until and to when trying and failing respectively
 
 )),
 
 % * return from call-header to call first line x check types without being called by pred header (do separately)
 % * check types separately (and call, exit separately) from pred, line (after pred)
 % when call a pred from a line, use lpi_list_rec find_result etc
 % * predicates and lines have separate call and exit/fail preds
% * second sm for types, pred, lines

 % when retries, deletes vars, cps up to and not including that call (*cps have sublevel to delete back until)


call_first_line1() :-
	query_to_vars(),

 Sublevel2 is Sublevel1+1,
 ssi1([Level,Sublevel2,"line",1, % line number
 Query*,Predicate_numbers_finished,All_predicate_numbers],Functions1,Result1,Result2,Choice_point_trail1,Choice_point_trail2),
 
query_to_vars(Query,) :-
	

 
 %****
 
 find_called_lines(Query,Functions1,Predicate_numbers),
 	ssi_call(Query,Functions1,Predicate_numbers,Result1),
 	true.
	  **/
	  /*
find_called_lines(Query,Functions1,Predicate_numbers) :-
	findall(Number1,(Query=[Name|Arguments1],
	length(Arguments1,Arguments_length),
	member([Number1,Name|Arguments2],Functions1),
	(Arguments2=[Arguments3,":-",_Body1]->true;	
	(Arguments2=[":-",_Body2]->Arguments3=[];
	(Arguments2=[Arguments3]->true;
	(Arguments2=[]->Arguments3=[])))),
	length(Arguments3,Arguments_length)),Predicate_numbers).

ssi_call(Query,Functions1,Predicate_numbers,Vars21) :- %% ** added vars21
	findall(Vars2,(member(Predicate_number,Predicate_numbers),
	%% *** findall xx
	member([Predicate_number,_|Arguments2],Functions1),
	
	Query=[Name|Arguments1], % Name,Arguments1 -> Name|Arguments1
	%% checktypes_inputs(Name,Arguments1)

	(Arguments2=[Arguments3,":-",Body]->true;	
	(Arguments2=[":-",Body]->Arguments3=[];
	(Arguments2=[Arguments3]->Body=[];
	(Arguments2=[]->(Arguments3=[],Body=[]))))),

	checkarguments(Arguments1,Arguments3,[],Vars1,[],FirstArgs),
	
	%% debug_call(Skip,[Name,Arguments1]),

%% find first line to run, keeping track list of command numbers gone past
	find_first_line_to_run(Body,Vars1,Vars2)),Vars21),
	%run_line
	true.
%% find called line
%% find next line
%% - go to next numbered line if in brackets, etc.
%% - if last line of brackets
%%  - if antecedent that is true, ..., vv
%% if fails, returns to last choice point

find_first_line_to_run([],Vars,Vars) :- !.
*/
%%find_first_line_to_run(Body,Vars1,Vars2) :-
		
	%% line 0, - easy to find
	%% usually for next line finds structure of pred,
	%% finds next line
	
%% find_next_line_to_run	(Predicate_number,Previous_line_number) :-
%% Predicate_number= ...
%% Previous_line_number = -1 if just called the predicate

%% pass nondeterminism, recursion, variable states
%% exit status of previous line, e.g. fail so backtrack

%% go to line+1 if in body, different if in different body structure, different if in consequent 1 of 2 consequents of statement

%% as goes, record line numbers to go to when reach a line number based on if then, work these out when at start, delete these x
%% predicate line -2 is return from predicate
%% later: check for singleton in branch

%% if goes past choice-point (e.g. member, some function calls) add it on to stack
%% recursion is found as go

/**
Predicate line
0 for first line
-1 if just called the predicate
-2 to return from predicate
-3 if failed the predicate
**/
/*
find_next_line_to_run(Predicate_number,-1) :-
	run(Predicate_number,0),!.
find_next_line_to_run(Predicate_number,Previous_line_number) :-
true.	
*/
