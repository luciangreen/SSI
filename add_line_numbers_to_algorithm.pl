add_line_numbers_to_algorithm1(Algorithm1,Algorithm2) :-
	add_line_numbers_to_algorithm2(Algorithm1,[],Algorithm2,0,_).
	
add_line_numbers_to_algorithm2([],Algorithm,Algorithm,N,N) :- !.
add_line_numbers_to_algorithm2(Algorithm1,Algorithm2,Algorithm3,Number1,Number2) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("true",Dbw_true1),Dbw_true1=Dbw_true,
	Algorithm1=[Function1|Functions],
	((Function1=[Name,Arguments1,Symbol1,Body1],symbol(Symbol1,Symbol2),
	findall(Arguments3,(member(Arguments2,Arguments1),slp2lp_variables(Arguments2,Arguments3)),Arguments4),
	%Number1a is Number1+1,
	add_line_numbers_to_algorithm_body2(Body1,Body2,0,_),
	append(Algorithm2,[[Number1,Name,Arguments4,Symbol2,Body2]],Algorithm4))->true;
	
		((Function1=[Name,Symbol1,Body1],symbol(Symbol1,Symbol2),

	%Number1a is Number1+1,
	add_line_numbers_to_algorithm_body2(Body1,Body2,0,_),
	append(Algorithm2,[[Number1,Name,[],Symbol2,Body2]],Algorithm4))->true;

	((Function1=[Name,Arguments1],symbol(":-",Symbol2),
	findall(Arguments3,(member(Arguments2,Arguments1),slp2lp_variables(Arguments2,Arguments3)),Arguments4),
	
		add_line_numbers_to_algorithm_body2([[[Dbw_n,Dbw_true]]],Body2,0,_),

append(Algorithm2,[[Number1,Name,Arguments4,Symbol2,Body2]],Algorithm4))->true;

	
	(Function1=[Name],symbol(":-",Symbol2),
		add_line_numbers_to_algorithm_body2([[[Dbw_n,Dbw_true]]],Body2,0,_),

	append(Algorithm2,[[Number1,Name,[],Symbol2,Body2]],Algorithm4))))),

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
predicate_or_rule_name([V_or_n,_Name]) :- get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
(V_or_n=Dbw_v->true;V_or_n=Dbw_n),!.%%,atom(Name),!.
%% x: predicate_or_rule_name(V_or_n) :- (V_or_n=v->true;V_or_n=n),fail,!.

add_line_numbers_to_algorithm_body2([],[],N,N):-!.%%,Body3


%%add_line_numbers_to_algorithm_body2([],Body,Body) :- !.
add_line_numbers_to_algorithm_body2(Body1,Body2%%,Body3
,Number1,Number2) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
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
        Body6=[Number1,[Dbw_n,"[]"],Body34
        ],
        append([Body6],Body5,Body2),

	!.



        
add_line_numbers_to_algorithm_body2(Body1,Body2,Number1,Number2) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
        Body1=[[[Dbw_n,Dbw_not],Statement]|Statements2 %% [] removed from Statement
        ],
		  Number1a is Number1+1,
        add_line_numbers_to_algorithm_body2(Statement,Body3,Number1a,Number3),
        add_line_numbers_to_algorithm_body2(Statements2,Body4,Number3,Number2),
        %trace,
		  append([Number1,%%*,
		  [Dbw_n,Dbw_not]],Body3,Body5),
		  append([Body5],Body4
        ,Body2),

	!.
	
	


add_line_numbers_to_algorithm_body2(Body1,Body2,Number1,Number2) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,

        Body1=[[[Dbw_n,Dbw_or],[Statements1,Statements2]]|Statements3],
		  Number1a is Number1+1,
        add_line_numbers_to_algorithm_body2([Statements1],Body3,Number1a,Number3),
        add_line_numbers_to_algorithm_body2([Statements2],Body4,Number3,Number4),
        add_line_numbers_to_algorithm_body2(Statements3,Body5,Number4,Number2),
        append(Body3,Body4,Body34),
        Body6=[Number1,[Dbw_n,Dbw_or],Body34
        ],
        append([Body6],Body5,Body2),
        !.


add_line_numbers_to_algorithm_body2(Body1,Body2,Number1,Number2) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
        Body1=[[[Dbw_n,"->"],[Statements1,Statements2]]|Statements3],
		  Number1a is Number1+1,
        add_line_numbers_to_algorithm_body2([Statements1],Body3,Number1a,Number3), 
    	  add_line_numbers_to_algorithm_body2([Statements2],Body4,Number3,Number4),

        add_line_numbers_to_algorithm_body2(Statements3,Body5,Number4,Number2),
        append(Body3,Body4,Body34),
        Body6=[Number1,[Dbw_n,"->"],Body34
        ],
        append([Body6],Body5,Body2),

        !.




add_line_numbers_to_algorithm_body2(Body1,Body2,Number1,Number2) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
        Body1=[[[Dbw_n,"->"],[Statements1,Statements2,Statements2a]]|Statements3],
		  Number1a is Number1+1,
        add_line_numbers_to_algorithm_body2([Statements1],Body3,Number1a,Number3),
        add_line_numbers_to_algorithm_body2([Statements2],Body4,Number3,Number4),
                %%trace,
                add_line_numbers_to_algorithm_body2([Statements2a],Body5,Number4,Number5),
        add_line_numbers_to_algorithm_body2(Statements3,Body6,Number5,Number2),
        append_list2([Body3,Body4,Body5],Body345),
        Body7=[Number1,[Dbw_n,"->"],Body345],        
        append([Body7],Body6,Body2),

        !.


add_line_numbers_to_algorithm_body2(Body1,Body2,Number1,Number2) :-
	Body1=[Statement|Statements],
	not(predicate_or_rule_name(Statement)),
	add_line_numbers_to_algorithm_statement1(Statement,Result1,Number1,Number3),
	add_line_numbers_to_algorithm_body2(Statements,Result2,Number3,Number2),
   append_list2([Result1,Result2],Body2),!.

add_line_numbers_to_algorithm_statement1(Statement,Result1,Number1,Number2) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,
	((Statement=[[Dbw_n,Dbw_findall],[Arguments1,Arguments2,Arguments3]],
	%Arguments=Result2,
	%trace,
	Number1a is Number1+1,
	add_line_numbers_to_algorithm_body2([Arguments2],Body3,Number1a,Number2),
	%%*** [Arguments2] to Arguments2
			  
%findall(Argument,(member(Argument,Arguments),(predicate_or_rule_name(Argument))),Result2),
	Result1=[[Number1,[Dbw_n,Dbw_findall],[Arguments1,Arguments3,Body3]]])).

/*
add_line_numbers_to_algorithm_statement1(Statement,Result1,Number1,Number2) :-
	((Statement=[[n,maplist],[Arguments1,Arguments2,Arguments3,Arguments4]],
	%Arguments=Result2,
	%trace,
	Number1a is Number1+1,
	add_line_numbers_to_algorithm_body2([Arguments1],Body3,Number1a,Number2),
			  
%findall(Argument,(member(Argument,Arguments),(predicate_or_rule_name(Argument))),Result2),
	Result1=[[Number1,[n,maplist],[Arguments2,Arguments3,Arguments4,Body3]]])).
	*/
	   
add_line_numbers_to_algorithm_statement1(Statement,Result1,Number1,Number2) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,
	%(Statement=[[n,cut]]->trace;true),

	((Statement=[[Dbw_n,Name],Arguments],
	not(Name=Dbw_findall),

	Arguments=Result2,
	%findall(Argument,(member(Argument,Arguments),(predicate_or_rule_name(Argument))),Result2),
	Result1=[[Number1,[Dbw_n,Name],Result2]])->true;
	(Statement=[[Dbw_n,Name]],
	Result1=[[Number1,[Dbw_n,Name],[]]])),
	Number2 is Number1+1.

add_line_numbers_to_algorithm_statement1(Statement,Result1,Number1,Number2) :-
get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
	((Statement=[[Dbw_v,Name],Arguments],
	%not(Name=findall),
	Arguments=Result2,
	%findall(Argument,(member(Argument,Arguments),(predicate_or_rule_name(Argument))),Result2),
	Result1=[[Number1,[Dbw_v,Name],Result2]])->true;
	(Statement=[[Dbw_v,Name]],
	Result1=[[Number1,[Dbw_v,Name],[]]])),
	Number2 is Number1+1.
