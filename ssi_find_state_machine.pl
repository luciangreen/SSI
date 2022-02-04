%% finds line number to go to in predicate if true or false
%% record predicate number

/**

x: load lpi first
['ssi2.pl'].
['ssi_find_state_machine.pl'].
['../../../GitHub/listprologinterpreter/lpiverify4.pl'].
['../../../GitHub/listprologinterpreter/la_strings.pl'].

test(33,_,A,_),add_line_numbers_to_algorithm1(A,A2),writeln1(A2).            [[0,[n,downpipe],[[v,a],[v,a],[v,b]]],[1,[n,downpipe],[[v,a],[v,b],[v,c]],":-",[[0,[n,member2],[[v,c],[v,c1]]],[1,[n,equals1],[[v,c1]]],[2,[n,equals1],[[v,c12]]],[3,[n,"->"],[[4,[n,>],[[v,a],[v,c121]]],[5,[n,downpipe],[[v,c121],[v,b],[v,c]]],[6,[n,"->"],[[7,[n,>],[[v,a],[v,c122]]],[8,[n,downpipe],[[v,c122],[v,b],[v,c]]],[9,[n,fail]]]]]]]]]


A=[[0,[n,downpipe],[[v,a],[v,a],[v,b]]],[1,[n,downpipe],[[v,a],[v,b],[v,c]],":-",[[0,[n,member2],[[v,c],[v,c1]]],[1,[n,equals1],[[v,c1]]],[2,[n,equals1],[[v,c12]]],[3,[n,"->"],[[4,[n,>],[[v,a],[v,c121]]],[5,[n,downpipe],[[v,c121],[v,b],[v,c]]],[6,[n,"->"],[[7,[n,>],[[v,a],[v,c122]]],[8,[n,downpipe],[[v,c122],[v,b],[v,c]]],[9,[n,fail]]]]]]]]],                                                     find_state_machine1(A,B),writeln1(B).

[[0,[n,downpipe],[[v,a],[v,a],[v,b]]],[1,[n,downpipe],[[v,a],[v,b],[v,c]],":-",[[0,[n,member2],[[v,c],[v,c1]]],[1,[n,equals1],[[v,c1]]],[2,[n,equals1],[[v,c12]]],[3,[n,"->"],[[4,[n,>],[[v,a],[v,c121]]],[5,[n,downpipe],[[v,c121],[v,b],[v,c]]],[6,[n,"->"],[[7,[n,>],[[v,a],[v,c122]]],[8,[n,downpipe],[[v,c122],[v,b],[v,c]]],[9,[n,fail]]]]]]]]]
A = B
x

B=[[0,[n,downpipe],[[v,a],[v,a],[v,b]]],[1,[n,downpipe],[[v,a],[v,b],[v,c]],":-",[[0,1,-,-3,[n,member2],[[v,c],[v,c1]]],[1,2,-,-3,[n,equals1],[[v,c1]]],[2,3,-,-3,[n,equals1],[[v,c12]]],[3,4,-2,-3,[n,"->"],[[4,5,-,6,[n,>],[[v,a],[v,c121]]],[5,[end_function,3],-,-3,[n,downpipe],[[v,c121],[v,b],[v,c]]],[6,7,[end_function,3],-3,[n,"->"],[[7,8,-,9,[n,>],[[v,a],[v,c122]]],[8,[end_function,6],-,-3,[n,downpipe],[[v,c122],[v,b],[v,c]]],[9,[end_function,6],-,-3,[n,fail]]]]]]]]]

***

A=[[0,[n,downpipe],[[v,a],[v,a],[v,b]]],[1,[n,downpipe],[[v,a],[v,b],[v,c]],":-",[[0,[n,member2],[[v,c],[v,c1]]],[1,[n,equals1],[[v,c1]]],[2,[n,equals1],[[v,c12]]],[3,[n,"->"],[[4,[n,>],[[v,a],[v,c121]]],[5,[n,downpipe],[[v,c121],[v,b],[v,c]]],[6,[n,"->"],[[7,[n,>],[[v,a],[v,c122]]],[8,[n,downpipe],[[v,c122],[v,b],[v,c]]],[9,[n,fail]]]]]]]]],                                                     find_state_machine1(A,B,[[[n, downpipe], 3, [0, 1]]]),writeln1(B).

B=
[[0,[n,downpipe],[[v,a],[v,a],[v,b]]],

[1,[n,downpipe],[[v,a],[v,b],[v,c]],":-",
[[0,["on true",1],["go after",-],["on false",-3],["go to predicates",-],[n,member2],[[v,c],[v,c1]]],
[1,["on true",2],["go after",-],["on false",-3],["go to predicates",-],[n,equals1],[[v,c1]]],
[2,["on true",3],["go after",-],["on false",-3],["go to predicates",-],[n,equals1],[[v,c12]]],
[3,["on true",4],["go after",-2],["on false",-3],[n,"->"]],
[4,["on true",5],["go after",-],["on false",6],["go to predicates",-],[n,>],[[v,a],[v,c121]]],
[5,["on true",[end_function,3]],["go after",-],["on false",-3],["go to predicates",[0,1]],[n,downpipe],[[v,c121],[v,b],[v,c]]],
[6,["on true",7],["go after",[end_function,3]],["on false",-3],[n,"->"]],
[7,["on true",8],["go after",-],["on false",9],["go to predicates",-],[n,>],[[v,a],[v,c122]]],
[8,["on true",[end_function,6]],["go after",-],["on false",-3],["go to predicates",[0,1]],[n,downpipe],[[v,c122],[v,b],[v,c]]],
[9,["on true",[end_function,6]],["go after",-],["on false",-3],["go to predicates",-],[n,fail]]]]]

***

A=
[
        [[n,reverse],[[],[v,l],[v,l]]],
        [[n,reverse],[[v,l],[v,m],[v,n]],":-",
        [       [[n,head],[[v,l],[v,h]]],
                [[n,tail],[[v,l],[v,t]]],
                [[n,wrap],[[v,h],[v,h1]]],
                [[n,append],[[v,h1],[v,m],[v,o]]],
                [[n,reverse],[[v,t],[v,o],[v,n]]]
        ]
        ]
],
add_line_numbers_to_algorithm1(A,A2),writeln1(A2).

A2=
[[0,[n,reverse],[[],[v,l],[v,l]]],[1,[n,reverse],[[v,l],[v,m],[v,n]],":-",[[0,[n,head],[[v,l],[v,h]]],[1,[n,tail],[[v,l],[v,t]]],[2,[n,wrap],[[v,h],[v,h1]]],[3,[n,append],[[v,h1],[v,m],[v,o]]],[4,[n,reverse],[[v,t],[v,o],[v,n]]]]]]

['find_pred_sm.pl'].
find_pred_sm(Reserved_words1,_),writeln(Reserved_words1).
[+,-,*,/,abort,any,append,atom,brackets,call,ceiling,code,creep,cut,date,delete,equals1,equals2,equals3,equals4,exit,fail,grammar,head,is,length,letters,list,member,member2,n,not,number,or,predicatename,random,round,skip,string,string_from_file,stringconcat,stringtonumber,sys,findall_sys,t,tail,true,unwrap,v,variable,vgp,wrap,input,output,string_length,sort,intersection,read_string,writeln,atom_string,trace,notrace,sqrt,notrace]

A=            
[[0,[n,reverse],[[],[v,l],[v,l]]],[1,[n,reverse],[[v,l],[v,m],[v,n]],":-",[[0,[n,head],[[v,l],[v,h]]],[1,[n,tail],[[v,l],[v,t]]],[2,[n,wrap],[[v,h],[v,h1]]],[3,[n,append],[[v,h1],[v,m],[v,o]]],[4,[n,reverse],[[v,t],[v,o],[v,n]]]]]],
find_state_machine1(A,B,_,[+,-,*,/,abort,any,append,atom,brackets,call,ceiling,code,creep,cut,date,delete,equals1,equals2,equals3,equals4,exit,fail,grammar,head,is,length,letters,list,member,member2,n,not,number,or,predicatename,random,round,skip,string,string_from_file,stringconcat,stringtonumber,sys,findall_sys,t,tail,true,unwrap,v,variable,vgp,wrap,input,output,string_length,sort,intersection,read_string,writeln,atom_string,trace,notrace,sqrt,notrace]),writeln1(B).

B=
[[0,[n,reverse],[[],[v,l],[v,l]]],[1,[n,reverse],[[v,l],[v,m],[v,n]],":-",[[0,["on true",1],["go after",-],["on false",-3],["go to predicates",-],[n,head],[[v,l],[v,h]]],[1,["on true",2],["go after",-],["on false",-3],["go to predicates",-],[n,tail],[[v,l],[v,t]]],[2,["on true",3],["go after",-],["on false",-3],["go to predicates",-],[n,wrap],[[v,h],[v,h1]]],[3,["on true",4],["go after",-],["on false",-3],["go to predicates",-],[n,append],[[v,h1],[v,m],[v,o]]],[4,["on true",-2],["go after",-],["on false",-3],["go to predicates",-],[n,reverse],[[v,t],[v,o],[v,n]]]]]]



[debug]  ?- test(77,_,C,_),add_line_numbers_to_algorithm1(C,D),writeln1(C),writeln1(D).
C=[[[n,findall1],[[v,a],[v,b]],":-",[[[n,findall],[[v,a1],[[n,member2],[[v,a],[v,a1]]],[v,b]]]]]]
D=[[0,[n,findall1],[[v,a],[v,b]],":-",[[0,[n,findall],[[v,a1],[v,b],[[1,[n,member2],[[v,a],[v,a1]]]]]]]]]

[debug]  ?- find_state_machine1([[0,[n,findall1],[[v,a],[v,b]],":-",[[0,[n,findall],[[v,a1],[v,b],[[1,[n,member2],[[v,a],[v,a1]]]]]]]]],F,["+","-","*","/","abort","any","append","atom","brackets","call","ceiling","code","creep","cut","date","delete","equals1","equals2","equals3","equals4","equals4_on","equals4_off","exit","fail","grammar","head","is","length","letters","list","member","member2","member3","n","not","number","or","predicatename","random","round","skip","string","string_from_file","stringconcat","stringtonumber","sys","findall_sys","t","tail","true","unwrap","v","variable","vgp","wrap","input","output","string_length","sort","intersection","read_string","writeln","atom_string","trace","notrace","sqrt","notrace","get_lang_word"]),writeln1(F).
F=[[0,[n,findall1],[[v,a],[v,b]],":-",[[0,["on true",1],["go after",-2],["on false",-3],[n,findall],[[v,a1],[v,b]]],[1,["on true",[end_function,0]],["go after",-],["on false",-3],["go to predicates",-],[n,member2],[[v,a],[v,a1]]]]]]

**/

find_state_machine1(Algorithm1,Algorithm2,Pred_numbers) :-
	find_state_machine2(Algorithm1,[],Algorithm2,Pred_numbers).
	
find_state_machine2([],Algorithm,Algorithm,_) :- !.
find_state_machine2(Algorithm1,Algorithm2,Algorithm3,Pred_numbers) :-
	Algorithm1=[Function1|Functions],
	((Function1=[Number,Name,Arguments1,Symbol1,Body1],symbol(Symbol1,Symbol2),
	findall(Arguments3,(member(Arguments2,Arguments1),slp2lp_variables(Arguments2,Arguments3)),Arguments4),
	find_state_machine_body2(Body1,Body2,-2,-3,Pred_numbers),
	append(Algorithm2,[[Number,Name,Arguments4,Symbol2,Body2]],Algorithm4))
	/*->true;
	
	((Function1=[Number,Name,Symbol1,Body1],symbol(Symbol1,Symbol2),

	find_state_machine_body2(Body1,Body2,-2,-3,Pred_numbers),
	append(Algorithm2,[[Number,Name,[],Symbol2,Body2]],Algorithm4))->true;
	
	((Function1=[Number,Name,Arguments1],symbol(Symbol1,Symbol2),
	findall(Arguments3,(member(Arguments2,Arguments1),slp2lp_variables(Arguments2,Arguments3)),Arguments4),
	append(Algorithm2,[[Number,Name,Arguments4,Symbol2,[[[n,true]]]]],Algorithm4))->true;

	(Function1=[Number,Name],symbol(Symbol1,Symbol2),
	append(Algorithm2,[[Number,Name,[],Symbol2,[[[n,true]]]]],Algorithm4))))
	*/
	),
	%%writeln1([Number,Name,Arguments4,Symbol2,Body2]),
	%%trace,
	find_state_machine2(Functions,Algorithm4,Algorithm3,Pred_numbers).

	%%%****Delete these duplicate predicates
symbol(Symbol,Symbol) :-!.

%%slp2lp_variables(Name1,[v,Name1]) :- predicate_or_rule_name(Name1),!.
slp2lp_variables(Name,Name) :- !.

/**
find_state_machine_body(Body1,Body2) :-
	findall(*,(member(Statement1,Body1
find_state_machine_body(Body1,[],Body2) :-

**/

%%predicate_or_rule_name([A,B]) :- atom(A),is_list(B),!.

/**
defined in grammar.pl
predicate_or_rule_name([V_or_n,_Name]) :- (V_or_n=v->true;V_or_n=n),!.%%,atom(Name),!.
**/

%% x: predicate_or_rule_name(V_or_n) :- (V_or_n=v->true;V_or_n=n),fail,!.

find_state_machine_body2([],[],_,_,_):-!.%%,Body3


%%find_state_machine_body2([],Body,Body) :- !.
find_state_machine_body2(Body1,Body2%%,Body3
,Return_line_true,Return_line_false,Pred_numbers) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("exit_function",Dbw_exit_function1),Dbw_exit_function1=Dbw_exit_function,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,
get_lang_word("fail_function",Dbw_fail_function1),Dbw_fail_function1=Dbw_fail_function,

        Body1=[[Number,[Dbw_n,"[]"],[Statements1|Statements1a]]|Statements2
        ],
		not(predicate_or_rule_name(Statements1)),
	not(number(Statements1)),
	        find_first_line_number(Statements1,Statements1_number),

		(Statements1a=[]->Statements1a_number=[Dbw_exit_function,Number];
        find_first_line_number(Statements1a,Statements1a_number)),

		(Statements2=[]->Statements2_number=Return_line_true;
        find_first_line_number(Statements2,Statements2_number)),


        %%find_first_line_number(Statements2,Statements2_number),
	find_state_machine_body2([Statements1],Body3,Statements1a_number,[Dbw_fail_function,Number],Pred_numbers), %% 2->1

	find_state_machine_body2([Statements1a],Body4,[Dbw_exit_function,Number],[Dbw_fail_function,Number],Pred_numbers),
        find_state_machine_body2([Statements2],Body5,-2,-3,Pred_numbers),

	     maplist(append,[[Body3,Body4,Body5]],[Body345]),
        
        %% [A,B1,B2,C| - A - Line number, B1 - Line to go to if true, 
		  %% B2 - Line to go to next
		  %% C - Line to go to if false
		  
Body6=[Number,[Dbw_on_true,Statements1_number],[Dbw_go_after,Statements2_number],[Dbw_on_false,Return_line_false],[Dbw_go_to_predicates,-],[Dbw_n,"[]"]%,Body34
        ],
        append([Body6],Body345,Body2),
	!.


%% make predicates into dcgs with bottom case, to give input at any line x doesn't need to go back to any matching line, needs a single line x dcg would allow traversing tree structure x give a return to number as goes
        
%% if fails, back-tracks along track list x goes to return line in nested if thens
%% returns to choice points when finishes predicates
%% -3 if successfully finishes predicate x

%% 

find_state_machine_body2(Body1,Body2,Return_line_true,Return_line_false,Pred_numbers) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
get_lang_word("exit_function",Dbw_exit_function1),Dbw_exit_function1=Dbw_exit_function,
get_lang_word("fail_function",Dbw_fail_function1),Dbw_fail_function1=Dbw_fail_function,

%%trace,
        Body1=[[Number1,[Dbw_n,Dbw_not],Statement]|Statements2
        ],
      %trace,  
      find_first_line_number(Statement,Statement_number),
		(Statements2=[]->Statements2_number=Return_line_true;
        find_first_line_number(Statements2,Statements2_number)),
        %%%% swap args 3,4 ?
        find_state_machine_body2([Statement],Body3,[Dbw_exit_function,Number1],[Dbw_fail_function,Number1],Pred_numbers),
        
        %writeln1(Body3),
        find_state_machine_body2([Statements2],Body4,-2,-3,Pred_numbers),
        %%Number2 is Number1+1,
        %writeln1(Body4),
                %%if_empty_list_then_return(Statements2,Number2,Number3),

		  maplist(append,[[Body3,Body4]],[Body34]),

get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,

		  Body2a=[Number1,[Dbw_on_true,Statement_number],[Dbw_go_after,Return_line_false],
		  [Dbw_on_false,Statements2_number],[Dbw_go_to_predicates,-],
		  [Dbw_n,Dbw_not]],
		  append([Body2a],Body34,Body2),
		  %append([Body5],Body4
      %  ,Body2),

	!.
	
	
%% s1 and s2 may need separate line numbers for nondet for or
%% find first line number in each of s1, s2
%% account for brackets 
%% vars have separate list for nondet, splices existing lists
find_state_machine_body2(Body1,Body2,Return_line_true,Return_line_false,Pred_numbers) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
get_lang_word("exit_function",Dbw_exit_function1),Dbw_exit_function1=Dbw_exit_function,
        Body1=[[Number,[Dbw_n,Dbw_or],[Statements1,Statements2]]|Statements3],

		  find_first_line_number(Statements1,Statements1_number),
		  find_first_line_number(Statements2,Statements2_number),
		(Statements3=[]->Statements3_number=Return_line_true;
        find_first_line_number(Statements3,Statements3_number)),
		  find_state_machine_body2([Statements1],Body3,[Dbw_exit_function,Number],Statements2_number,Pred_numbers),
        find_state_machine_body2([Statements2],Body4,[Dbw_exit_function,Number],-3,Pred_numbers),
        find_state_machine_body2([Statements3],Body5,-2,-3,Pred_numbers),
        %%Number2 is Number1+1,
        %%if_empty_list_then_return(Statements3,Number2,Number3),
        get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,

get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,



        maplist(append,[[Body3,Body4,Body5]],[Body345]),
        Body6=[Number,[Dbw_on_true,Statements1_number],[Dbw_go_after,Statements3_number],[Dbw_on_false,Return_line_false],[Dbw_go_to_predicates,-],[Dbw_n,Dbw_or]],%Body34
        %],
        append([Body6],Body345,Body2),
        !.

%% If true at end of section, return to next line

find_state_machine_body2(Body1,Body2,Return_line_true,Return_line_false,Pred_numbers) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("exit_function",Dbw_exit_function1),Dbw_exit_function1=Dbw_exit_function,

        get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,

        Body1=[[Number,[Dbw_n,"->"],[Statements1,Statements2]]|Statements3],
        
        find_first_line_number(Statements1,Statements1_number),
        find_first_line_number(Statements2,Statements2_number),
		(Statements3=[]->Statements3_number=Return_line_true;
        find_first_line_number(Statements3,Statements3_number)),
find_state_machine_body2([Statements1],Body3,Statements2_number,-3,Pred_numbers), 
    	  find_state_machine_body2([Statements2],Body4,[Dbw_exit_function,Number],-3,Pred_numbers),

        find_state_machine_body2([Statements3],Body5,-2,-3,Pred_numbers),

        maplist(append,[[Body3,Body4,Body5]],[Body345]),
        %append(Body3,Body4,Body34),
        Body6=[Number,[Dbw_on_true,Statements1_number],[Dbw_go_after,Statements3_number],[Dbw_on_false,Return_line_false],[Dbw_go_to_predicates,-],[Dbw_n,"->"]],
        append([Body6],Body345,Body2),
        %append(Body61,Body5,Body2),

        !.




find_state_machine_body2(Body1,Body2,Return_line_true,Return_line_false,Pred_numbers) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("exit_function",Dbw_exit_function1),Dbw_exit_function1=Dbw_exit_function,
        get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,
        Body1=[[Number,[Dbw_n,"->"],[Statements1,Statements2,Statements2a]]|Statements3],
                        %trace,

        find_first_line_number(Statements1,Statements1_number),
        find_first_line_number(Statements2,Statements2_number),
        find_first_line_number(Statements2a,Statements2a_number),
        %%trace,
		(Statements3=[]->Statements3_number=Return_line_true;
        find_first_line_number(Statements3,Statements3_number)),       
        find_state_machine_body2([Statements1],Body3,Statements2_number,Statements2a_number,Pred_numbers),
        find_state_machine_body2([Statements2],Body4,[Dbw_exit_function,Number],-3,Pred_numbers),
               %%trace,
                find_state_machine_body2([Statements2a],Body5,[Dbw_exit_function,Number],-3,Pred_numbers),
        find_state_machine_body2([Statements3],Body6,-2,-3,Pred_numbers),

        maplist(append,[[Body3,Body4,Body5,Body6]],[Body3456]),
        Body7=[Number,[Dbw_on_true,Statements1_number],[Dbw_go_after,Statements3_number],[Dbw_on_false,Return_line_false],[Dbw_go_to_predicates,-],[Dbw_n,"->"]],
        append([Body7],Body3456,Body2),
        %append(Body71,Body6,Body2),

        !.


find_state_machine_body2(Body1,Body2,Return_line_true,Return_line_false,Pred_numbers) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,
get_lang_word("findall_exit_function",Dbw_findall_exit_function1),Dbw_findall_exit_function1=Dbw_findall_exit_function,
        get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,

Body1=[[Number,[Dbw_n,Dbw_findall],[Statements1,Statements2,Statements2a]]|Statements3],
                        %trace,

        %find_first_line_number(Statements1,Statements1_number),
        %find_first_line_number(Statements2,Statements2_number),
        find_first_line_number(Statements2a,Statements2a_number),
        %%trace,
		(Statements3=[]->Statements3_number=Return_line_true;
        find_first_line_number(Statements3,Statements3_number)),       
        %find_state_machine_body2([Statements1],Body3,Statements2_number,Statements2a_number,Pred_numbers),
        %find_state_machine_body2([Statements2],Body4,[end_function,Number],Return_line_false,Pred_numbers),
               %%trace,
                find_state_machine_body2(Statements2a,Body5,[Dbw_findall_exit_function,Number],[Dbw_findall_exit_function,Number]%Return_line_false
                ,Pred_numbers),
        find_state_machine_body2(Statements3,Body6,Return_line_true,Return_line_false,Pred_numbers),

        maplist(append,[[%Body3,Body4,
        Body5,Body6]],[Body56]),
        Body7=[Number,[Dbw_on_true,Statements2a_number],[Dbw_go_after,Statements3_number],[Dbw_on_false,Return_line_false],[Dbw_go_to_predicates,-],[Dbw_n,Dbw_findall],[Statements1,Statements2]],
        append([Body7],Body56,Body2),
        %append(Body71,Body6,Body2),

        !.
     

find_state_machine_body2(Body1,Body2,Return_line_true,Return_line_false,Pred_numbers) :-
	Body1=[]->Body2=[];
	(Body1=[Statement|Statements],
	((
	(get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
	Statement=[N,[Dbw_n,_]|_],number(N))->
	(%not(predicate_or_rule_name(Statement)),
	%not(number(Statement)),
	(Statements=[]->Statements_number=Return_line_true;
        find_first_line_number(Statements,Statements_number)),
	find_state_machine_statement1(Statement,Result1,Statements_number,Return_line_false,Pred_numbers));

find_state_machine_body2(Statement,Body2,Return_line_true,Return_line_false,Pred_numbers))),
	find_state_machine_body2(Statements,Result2,Return_line_true,Return_line_false,Pred_numbers)),
   append_list2([Result1,Result2],Body2),!.


find_state_machine_body2(Body1,Body2,Return_line_true,Return_line_false,Pred_numbers) :-
	Body1=[]->Body2=[];
	(Body1=[Statement|Statements],
	((
	(get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
	Statement=[N,[Dbw_v,_]|_],number(N))->
	(%not(predicate_or_rule_name(Statement)),
	%not(number(Statement)),
	(Statements=[]->Statements_number=Return_line_true;
        find_first_line_number(Statements,Statements_number)),
	find_state_machine_statement1(Statement,Result1,Statements_number,Return_line_false,Pred_numbers));

find_state_machine_body2(Statement,Body2,Return_line_true,Return_line_false,Pred_numbers))),
	find_state_machine_body2(Statements,Result2,Return_line_true,Return_line_false,Pred_numbers)),
   append_list2([Result1,Result2],Body2),!.

     /*   
find_state_machine_body2(Body1,Body2,Return_line_true,Return_line_false,Pred_numbers) :-
        
        Body1=[[Number,[n,maplist],[Statements1,Statements2,Statements2a,Statements2b]]|Statements3],
                        %trace,

        %find_first_line_number(Statements1,Statements1_number),
        %find_first_line_number(Statements2,Statements2_number),
        find_first_line_number(Statements2a,Statements2a_number),
        %%trace,
		(Statements3=[]->Statements3_number=Return_line_true;
        find_first_line_number(Statements3,Statements3_number)),       
        %find_state_machine_body2([Statements1],Body3,Statements2_number,Statements2a_number,Pred_numbers),
        %find_state_machine_body2([Statements2],Body4,[end_function,Number],Return_line_false,Pred_numbers),
               %%trace,
                find_state_machine_body2(Statements2a,Body5,[end_function,Number],Return_line_false,Pred_numbers),
        find_state_machine_body2(Statements3,Body6,Return_line_true,Return_line_false,Pred_numbers),

        append_list2([%Body3,Body4,
        Body5],Body345),
        Body7=[Number,["on true",Statements2a_number],["go after",Statements3_number],["on false",Return_line_false],[n,findall],[Statements1,Statements2]],
        append([Body7],Body345,Body71),
        append(Body71,Body6,Body2),

        !.
        */
        /**
find_state_machine_statement1(Statement,Result1,Return_line_true,Return_line_false,Pred_numbers1) :-
	((Statement=[Number,[n,Name1],[Arguments1,Arguments2,Arguments3]],

	Name1=findall,
%trace,
	length(Arguments,Arity1),
	
		find_state_machine_body2(Arguments3,Result3,Return_line_true,Return_line_false,Pred_numbers1),

	%atom_string(Name1,Name),
	%(member(Name,Reserved_words)->Pred_numbers2=none;(member([[n,Name],Arity1,Pred_numbers2],Pred_numbers1))),
	%(Name1=downpipe->trace;true),
	%(member([[n,Name1],Arity1,Pred_numbers2a],Pred_numbers1)->Pred_numbers2=Pred_numbers2a;Pred_numbers2=(-)),
	
	%Arguments=Result2,
	%findall(Argument,(member(Argument,Arguments),(predicate_or_rule_name(Argument))),Result2),
	Result1=[[Number,["on true",Return_line_true],["go after",-],["on false",Return_line_false],["go to predicates",-],[n,Name1],[Arguments1,Arguments2]]])),
	
	   append_list2([Result1,Result3],Result2),!.
	   **/
	   
find_state_machine_statement1(Statement,Result1,Return_line_true,Return_line_false,Pred_numbers1) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,
	((Statement=[Number,[Dbw_n,Name1],Arguments],

	not(Name1=Dbw_findall),

	length(Arguments,Arity1),
	%atom_string(Name1,Name),
	%(member(Name,Reserved_words)->Pred_numbers2=none;(member([[n,Name],Arity1,Pred_numbers2],Pred_numbers1))),
	%(Name1=downpipe->trace;true),
	(member([[Dbw_n,Name1],Arity1,Pred_numbers2a],Pred_numbers1)->Pred_numbers2=Pred_numbers2a;Pred_numbers2=(-)),
	
	Arguments=Result2,
	%findall(Argument,(member(Argument,Arguments),(predicate_or_rule_name(Argument))),Result2),

	Result1=[[Number,[Dbw_on_true,Return_line_true],[Dbw_go_after,-],[Dbw_on_false,Return_line_false],[Dbw_go_to_predicates,Pred_numbers2],[Dbw_n,Name1],Result2]])->true;
	(%%Statement=[_,[n,Name]],
	%%trace,
	Statement=[Number,[Dbw_n,Name1]],
	length([],Arity1),
		%atom_string(Name1,Name),
%(member(Name,Reserved_words)->Pred_numbers2=none;(member([[n,Name],Arity1,Pred_numbers2],Pred_numbers1))),
(member([[Dbw_n,Name1],Arity1,Pred_numbers2a],Pred_numbers1)->Pred_numbers2=Pred_numbers2a;Pred_numbers2=(-)),


Result1=[[Number,[Dbw_on_true,Return_line_true],[Dbw_go_after,-],[Dbw_on_false,Return_line_false],[Dbw_go_to_predicates,Pred_numbers2],[Dbw_n,Name1]]])).
	
	
	
	find_state_machine_statement1(Statement,Result1,Return_line_true,Return_line_false,_Pred_numbers1) :-
get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,
	((Statement=[Number,[Dbw_v,Name1],Arguments],
	%trace,

	not(Name1=Dbw_findall),

	%length(Arguments,Arity1),
	%atom_string(Name1,Name),
	%(member(Name,Reserved_words)->Pred_numbers2=none;(member([[n,Name],Arity1,Pred_numbers2],Pred_numbers1))),
	%(Name1=downpipe->trace;true),
	%(member([[v,Name1],Arity1,Pred_numbers2a],Pred_numbers1)->Pred_numbers2=Pred_numbers2a;Pred_numbers2=(-)),
	
	Pred_numbers2=(*),
	
	Arguments=Result2,
	%findall(Argument,(member(Argument,Arguments),(predicate_or_rule_name(Argument))),Result2),
	Result1=[[Number,[Dbw_on_true,Return_line_true],[Dbw_go_after,-],[Dbw_on_false,Return_line_false],[Dbw_go_to_predicates,Pred_numbers2],[Dbw_v,Name1],Result2]])->true;
	(%%Statement=[_,[n,Name]],
	%%trace,
	Statement=[Number,[Dbw_v,Name1]],
	%length([],Arity1),
		%atom_string(Name1,Name),
%(member(Name,Reserved_words)->Pred_numbers2=none;(member([[n,Name],Arity1,Pred_numbers2],Pred_numbers1))),
%(member([[v,Name1],Arity1,Pred_numbers2a],Pred_numbers1)->Pred_numbers2=Pred_numbers2a;Pred_numbers2=(-)),
	Pred_numbers2=(*),

Result1=[[Number,[Dbw_on_true,Return_line_true],[Dbw_go_after,-],[Dbw_on_false,Return_line_false],[Dbw_go_to_predicates,Pred_numbers2],[Dbw_v,Name1]]])).
	%%writeln([[Number,Return_line_true,Return_line_false,[n,Name],Result2]]).
	
%%if_empty_list_then_return([],_Number,-3) :- !.
%%if _empty_list_then_return(Statements,Number,Number) :-
%%	not(Statements=[]),!.

find_first_line_number([],-2) :- !.
find_first_line_number(Number,Number) :- number(Number),!.
find_first_line_number([[Number|_]|_],Number) :- number(Number),!.
find_first_line_number([Statement|_],Number) :-
%%trace,
	not((Statement=[Number|_],number(Number))),
	find_first_line_number(Statement,Number),!.
	
/**
	Result1=[[Number,Return_line_true,-,Return_line_false,[n,Name]]])).

	Result1=[[Number,Return_line_true,-,Return_line_false,[n,Name],Result2]])->true;

**/