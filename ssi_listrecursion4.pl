/*
interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_member],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("member",Dbw_member1),Dbw_member1=Dbw_member,
%%writeln1(8),
        ssi_interpretpart(member,Variable1,Variable2,Vars1,Vars2).
*/





interpretstatement1(ssi,_Functions0,_Functions,Query1,Vars1,Vars8,true,nocut,_) :-
%writeln1([*,_Functions0,_Functions]),
get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("call",Dbw_call1),Dbw_call1=Dbw_call,

%%writeln1("h1/10"),
%trace,
%find_pred_sm(Reserved_words1),
        ((Query1=[[Dbw_n,Dbw_call],[[lang,Lang1],Debug1,[Function,Arguments],Functions%,Result
        ]],Tm=off%,
        %not(member(Dbw_call,Reserved_words1))
        )->true;
        (Query1=[[Dbw_n,Dbw_call],[[lang,Lang1],Debug1,[Function,Arguments],Types,Modes,Functions%,Result
        ]],Tm=on)),        
        
        %trace,
        
        lang(Lang2a),
        types(Types2a),
		  (Types2a=on->(typestatements(TypeStatements2a),
		  modestatements(ModeStatements2a));true),
		  
        (Lang1=same->lang(Lang2);Lang2=Lang1),
        (Debug1=same->debug(Debug2);Debug2=Debug1),
        
        %%not(Function=[n,grammar]->true;Function=[n,grammar_part]), ****
%%writeln1(["Arguments",Arguments,"Vars1",Vars1]),
        %%***writeln1(substitutevarsA1(Arguments,Vars1,[],Vars3,[],FirstArgs)),
        (Function=[Dbw_v,_]->
        (append([Function],Arguments,Arguments1),
        substitutevarsA1(Arguments1,Vars1,[],Vars3,[],FirstArgs),
        Vars3=[Function1|Vars31],
        Query2=[Function1,Vars31]);
        (substitutevarsA1(Arguments,Vars1,[],Vars3,[],FirstArgs),
        %simplify(Vars32,Vars3), %%% var to value, after updatevars:  more vars to values, and select argument vars from latest vars
%%writeln1([substitutevarsA1,arguments,Arguments,vars1,Vars1,vars3,Vars3,firstargs,FirstArgs]),
        Query2=[Function,Vars3])), %% Bodyvars2?
%%        	debug(on)->writeln1([call,[Function,[Vars3]]]),
%%writeln1(["Query2",Query2,"Functions0",Functions0]),
        
        
        %interpret2(Query2,Functions0,Functions0,Result1), 
        
                 remember_and_turn_off_debug(Debug),
 
 
 
 
 %trace,
 
 	query_box(Query2,_Query3,Functions,Functions1),
	convert_to_grammar_part1(Functions1,[],Functions2,_),
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
%append(Functions2a,Functions1a,Functions2b),
	
	pred_numbers(Pred_numbers0),
	
	find_pred_sm(Reserved_words),%,"en"),
find_pred_numbers(Functions2a,Reserved_words,Pred_numbers),

	retractall(pred_numbers(_)),
 	assertz(pred_numbers(Pred_numbers)),
%trace,

	find_state_machine1(Functions2a,Functions3a,Pred_numbers),





	%trace,
         ((Tm=off->international_lucianpl1([lang,Lang2],off,%Debug,
         Query2,Functions3a,Result1a)
         %international_interpret([lang,Lang2],off,%Debug2,
%Query2,Functions,Result1a)
;

international_lucianpl1([lang,Lang2],off,%Debug,
Query2,Types,Modes,Functions3a,Result1a)	%international_interpret([lang,Lang2],off,%Debug2
	%Query2,Types,Modes,Functions,Result1a)
	)->true;(turn_back_debug(Debug),false)),
                  
 	  	  turn_back_debug(Debug),


	member(Result1,Result1a),

	retractall(pred_numbers(_)),
 	assertz(pred_numbers(Pred_numbers0)),

	retractall(lang(_)),
 	assertz(lang(Lang2a)),

	retractall(types(_)),
 	assertz(types(Types2a)),

		  (Types2a=on->(
		  	retractall(typestatements(_)),
 	assertz(typestatements(TypeStatements2a)),
	retractall(modestatements(_)),
 	assertz(modestatements(ModeStatements2a)));true),


	updatevars2(FirstArgs,Result1,[],Vars5),
	updatevars3(Vars1,Vars5,Vars6),
	reverse(Vars6,[],Vars7),
	((not(Vars7=[])->
	%%Vars7=[Var71|Vars72],
	(%trace,
	unique1(Vars7,[],Vars8)%,notrace
	)
);(
%%writeln1(here1),
	Vars8=[])).        


        

interpretstatement1(ssi,Functions0,_Functions,Query1,Vars1,Vars8,true,nocut,_) :-
        
        %trace,
               %writeln(interpretstatement1(ssi,Functions0,_Functions,Query1,Vars1,Vars8,true,nocut)),

get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("call",Dbw_call1),Dbw_call1=Dbw_call,

%%writeln1("h1/10"),
%trace,
%writeln([Functions0,Functions0]),
%find_pred_sm(Reserved_words1),

        %trace,
        ((Query1=[[Dbw_n,Dbw_call],[Function,Arguments]]%,        not_reserved_word(Function,Reserved_words1)
        )->true;
(Query1=[Function,Arguments],
Function=[Dbw_v,_]))%,Function=[Dbw_n1,Function_a],atom_string(Function_a,Function_s),
%,not_reserved_word(Function,Reserved_words1))
%)
,

%trace,
        %%not(Function=[n,grammar]->true;Function=[n,grammar_part]), ****
%%writeln1(["Arguments",Arguments,"Vars1",Vars1]),
        %%***writeln1(substitutevarsA1(Arguments,Vars1,[],Vars3,[],FirstArgs)),
        (Function=[Dbw_v,_]->
        (%trace,
        append([Function],Arguments,Arguments1),
        %trace,
        substitutevarsA1(Arguments1,Vars1,[],Vars3,[],FirstArgs),
        Vars3=[Function1|Vars31],
        Query2=[Function1,Vars31]);
        (%trace,
        substitutevarsA1(Arguments,Vars1,[],Vars3,[],FirstArgs),
        %simplify(Vars32,Vars3), %%% var to value, after updatevars:  more vars to values, and select argument vars from latest vars
%writeln1([substitutevarsA1,arguments,Arguments,vars1,Vars1,vars3,Vars3,firstargs,FirstArgs]),
        Query2=[Function,Vars3])), %% Bodyvars2?
%(Function=[n,compound213]->%true
%trace
%;true),
        %trace,
%%        	debug(on)->writeln1([call,[Function,[Vars3]]]),
%%writeln1(["Query2",Query2,"Functions0",Functions0]),
%trace,
%writeln1(interpret2(Query2,Functions0,Functions0,Result1)),

         remember_and_turn_off_debug(Debug),
 turndebug(off),	%trace,
         (lucianpl1(off,%,off,%Debug,
         Query2,Functions0,Result1a)%interpret2(Query2,Functions0,Functions0,Result1)
         ->true;(turn_back_debug(Debug),false)),
                  
 	  	  turn_back_debug(Debug),

     %trace,
     member(Result1,Result1a),
                %writeln1(interpret2(Query2,Functions0,Functions0,Result1)),
	%writeln1(updatevars2(FirstArgs,Result1,[],Vars5)),

	updatevars2(FirstArgs,Result1,[],Vars5),
	updatevars3(Vars1,Vars5,Vars6),
	reverse(Vars6,[],Vars7),
	((not(Vars7=[])->
	%%Vars7=[Var71|Vars72],
	(%trace,
	unique1(Vars7,[],Vars8)%,notrace
	)
);(
%%writeln1(here1),
	Vars8=[])).
%%**** reverse and take first instance of each variable.
	%%findresult3(Arguments,Vars6,[],Result2)
%%writeln1(["FirstArgs",FirstArgs,"Result1",Result1,"Vars5",Vars5,"Vars4",Vars4]),
%%writeln1(["Vars1:",Vars1,"Vars4:",Vars4]),
%%		debug(on)->writeln1([exit,[Function,[Result2]]]).
/*
interpretstatement1(ssi,Functions0,_Functions,Query,Vars,Vars,true,nocut,_) :-
find_pred_sm(Reserved_words1),

	Query=[Function],
	%trace,
	not_reserved_word(Function,Reserved_words1),
%debug_call(Skip,[Function]),

         remember_and_turn_off_debug(Debug),
  turndebug(off),	%trace,
         (lucianpl1(off,%Debug,
         Query,Functions0,_Result1)%interpret2(Query,Functions0,Functions0,_Result1)
         ->true;(turn_back_debug(Debug),false)),
                  
 	  	  turn_back_debug(Debug)
 	  	  
 	  	  
        

,!.

*/


interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_member2],[Variable1,Variable2]],Vars1,Vars2,true,nocut,Vars2c) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
%trace,
get_lang_word("member2",Dbw_member21),Dbw_member21=Dbw_member2,
%%writeln1(8),

        ssi_interpretpart(member2,Variable1,Variable2,Vars1,Vars2,Vars2c).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_member3],[Variable1,Variable2]],Vars1,Vars2,true,nocut,Vars2c) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
%trace,
get_lang_word("member3",Dbw_member31),Dbw_member31=Dbw_member3,
%%writeln1(8),
        ssi_interpretpart(member3,Variable1,Variable2,Vars1,Vars2,Vars2c).

interpretstatement4(ssi,_F0,_Functions,[[Dbw_n,Dbw_member],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[],AC) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("member",Dbw_member1),Dbw_member1=Dbw_member,
%%writeln1(8),
        ssi_interpretpart(member,Variable1,Variable2,Vars1,Vars2,AC).

interpretstatement4(ssi,_F0,_Functions,[[Dbw_n,Dbw_member2],[Variable1,Variable2]],Vars1,Vars2,true,nocut,Vars2c,AC) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
%trace,
get_lang_word("member2",Dbw_member21),Dbw_member21=Dbw_member2,
%%writeln1(8),

        ssi_interpretpart(member2,Variable1,Variable2,Vars1,Vars2,Vars2c,AC).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_member3],[Variable1,Variable2]],Vars1,Vars2,true,nocut,Vars2c,AC) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
%trace,
get_lang_word("member3",Dbw_member31),Dbw_member31=Dbw_member3,
%%writeln1(8),
        ssi_interpretpart(member3,Variable1,Variable2,Vars1,Vars2,Vars2c,AC).


interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_name]|Args],Vars1,Vars2,T,C,[]) :- %writeln(here),
interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_name]|Args],Vars1,Vars2,T,C).

%%%%


/* 
interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_equals4_on]|_],Vars,Vars,true,nocut,[]) :- %writeln(here),
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_equals4_on]|_],Vars,Vars,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_equals4_off]|_],Vars,Vars,true,nocut,[]) :- %writeln(here),
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_equals4_off]|_],Vars,Vars,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[n,trace2]|_],Vars,Vars,true,nocut,[]) :- %writeln(here),
interpretstatement1(non-ssi,_F0,_Functions,[[n,trace2]|_],Vars,Vars,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_trace]|_],Vars,Vars,true,nocut,[]) :- 
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_trace]|_],Vars,Vars,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_notrace]|_],Vars,Vars,true,nocut,[]) :- 
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_notrace]|_],Vars,Vars,true,nocut).

% * Different in ssi

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_cut]|_],Vars,Vars,true,cut,[]) :- 
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_cut]|_],Vars,Vars,true,cut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_true]|_],Vars,Vars,_,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_true]|_],Vars,Vars,_,nocut).
interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_fail]|_],Vars,Vars,_,nocut,[]) :- 
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_fail]|_],Vars,Vars,_,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_atom],[Variable]],Vars,Vars,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_atom],[Variable]],Vars,Vars,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_string],[Variable]],Vars,Vars,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_string],[Variable]],Vars,Vars,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_number],[Variable]],Vars,Vars,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_number],[Variable]],Vars,Vars,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_letters],[Variable]],Vars,Vars,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_letters],[Variable]],Vars,Vars,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_variable],[Variable]],Vars,Vars,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_variable],[Variable]],Vars,Vars,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Operator],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Operator],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Operator],[Variable2,Variable3,Variable1]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Operator],[Variable2,Variable3,Variable1]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Operator],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Operator],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_equals1],[Variable1,[Variable2,Variable3]]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_equals1],[Variable1,[Variable2,Variable3]]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_equals2],[Variable1,[Variable2,Variable3]]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_equals2],[Variable1,[Variable2,Variable3]]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_equals3],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_equals3],[Variable1,Variable2]],Vars1,Vars2,true,nocut).


interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_equals4],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_equals4],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_wrap],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_wrap],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_unwrap],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_unwrap],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_head],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_head],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_tail],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_tail],[Variable1,Variable2]],Vars1,Vars2,true,nocut).


interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_delete],[Variable1,Variable2,Variable3]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_delete],[Variable1,Variable2,Variable3]],Vars1,Vars2,true,nocut).
%%** all in form f,[1,1,etc], including + with 0,1

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_append],[Variable1,Variable2,Variable3]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_append],[Variable1,Variable2,Variable3]],Vars1,Vars2,true,nocut).
%get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
%get_lang_word("append",Dbw_append1),Dbw_append1=Dbw_append,
%%writeln1(9),
        %ssi_interpretpart(append,Variable1,Variable2,Variable3,Vars1,Vars2).


interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_stringconcat],[Variable1,Variable2,Variable3]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_stringconcat],[Variable1,Variable2,Variable3]],Vars1,Vars2,true,nocut).

%get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
%get_lang_word("stringconcat",Dbw_stringconcat1),Dbw_stringconcat1=Dbw_stringconcat,

%ssi_interpretpart(stringconcat,Variable1,Variable2,Variable3,Vars1,Vars2).


interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_stringtonumber],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_stringtonumber],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_random],[Variable1]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_random],[Variable1]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_length],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_length],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_ceiling],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_ceiling],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_date],[Year,Month,Day,Hour,Minute,Seconds]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_date],[Year,Month,Day,Hour,Minute,Seconds]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_round],[N1,N2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_round],[N1,N2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_Grammar,_Grammar2,[[Dbw_n,grammar_part],[Variable1,Variable2,Variable3]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_Grammar,_Grammar2,[[Dbw_n,grammar_part],[Variable1,Variable2,Variable3]],Vars1,Vars2,true,nocut).


interpretstatement1(ssi,_Functions0,_Functions,[[Dbw_n,Dbw_string_from_file],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_Functions0,_Functions,[[Dbw_n,Dbw_string_from_file],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,Functions0,Functions,[[Dbw_n,Dbw_maplist],[Variable1,Variable2,Variable3,Variable4]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,Functions0,Functions,[[Dbw_n,Dbw_maplist],[Variable1,Variable2,Variable3,Variable4]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_string_length],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_string_length],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_sort],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_sort],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_intersection],[Variable1,Variable2,Variable3]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_intersection],[Variable1,Variable2,Variable3]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_read_string],[Variable1]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_read_string],[Variable1]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_writeln],[Variable1]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_writeln],[Variable1]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_atom_string],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_atom_string],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_get_lang_word],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
interpretstatement1(non-ssi,_F0,_Functions,[[Dbw_n,Dbw_get_lang_word],[Variable1,Variable2]],Vars1,Vars2,true,nocut).

*/