
%** debug displays in not, findall
interpretstatement3(ssi,_,_,[[Dbw_n,"[]"]|_],Vars,Vars,_Result21,_Cut,_,Skip) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
Skip=false.
	%debug_call(Skip,[[Dbw_n,"[]"]]).

	%debug_call(Skip,[[n,"[]"]]).
interpretstatement3(ssi,_,_,[[Dbw_n,Dbw_not]|_],Vars,Vars,_Result21,_Cut,_,Skip) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
	debug_call(Skip,[[Dbw_n,Dbw_not]]).

interpretstatement3(ssi,_,_,[[Dbw_n,Dbw_or]|_],Vars,Vars,_Result21,_Cut,_,Skip) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
Skip=false.
	%debug_call(Skip,[[Dbw_n,Dbw_or]]).

interpretstatement3(ssi,_,_,[[Dbw_n,"->"]|_],Vars,Vars,_Result21,_Cut,_,Skip) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
Skip=false.
	%debug_call(Skip,[[Dbw_n,"->"]]).

interpretstatement3(ssi,_,_,[[Dbw_n,Dbw_findall]|_],Vars,Vars,_Result21,_Cut,_,Skip) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,
%Skip=false.
	%trace,
	debug_call(Skip,[[Dbw_n,Dbw_findall]]).

%% ** findall/2 is done above
