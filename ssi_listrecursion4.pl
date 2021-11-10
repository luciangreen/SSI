/*
interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_member],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[]) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("member",Dbw_member1),Dbw_member1=Dbw_member,
%%writeln1(8),
        ssi_interpretpart(member,Variable1,Variable2,Vars1,Vars2).
*/
interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_member2],[Variable1,Variable2]],Vars1,Vars2,true,nocut,Vars2c) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
%trace,
get_lang_word("member2",Dbw_member21),Dbw_member21=Dbw_member2,
%%writeln1(8),

        ssi_interpretpart(member2,Variable1,Variable2,Vars1,Vars2,Vars2c).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_member2],[Variable1,Variable2]],Vars1,Vars2,true,nocut,Vars2c) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
%trace,
get_lang_word("member3",Dbw_member21),Dbw_member21=Dbw_member2,
%%writeln1(8),
        ssi_interpretpart(member3,Variable1,Variable2,Vars1,Vars2,Vars2c).

interpretstatement4(ssi,_F0,_Functions,[[Dbw_n,Dbw_member],[Variable1,Variable2]],Vars1,Vars2,true,nocut,[],AC) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("member",Dbw_member1),Dbw_member1=Dbw_member,
%%writeln1(8),
        ssi_interpretpart(member,Variable1,Variable2,Vars1,Vars2,AC).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_member2],[Variable1,Variable2]],Vars1,Vars2,true,nocut,Vars2c,AC) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
%trace,
get_lang_word("member2",Dbw_member21),Dbw_member21=Dbw_member2,
%%writeln1(8),

        ssi_interpretpart(member2,Variable1,Variable2,Vars1,Vars2,Vars2c,AC).

interpretstatement1(ssi,_F0,_Functions,[[Dbw_n,Dbw_member2],[Variable1,Variable2]],Vars1,Vars2,true,nocut,Vars2c,AC) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
%trace,
get_lang_word("member3",Dbw_member21),Dbw_member21=Dbw_member2,
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