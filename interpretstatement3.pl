
%** debug displays in not, findall
interpretstatement3(ssi,_,_,[[n,"[]"]|_],Vars,Vars,_Result21,_Cut,_,Skip) :-
	debug_call(Skip,[[n,"[]"]]).

	%debug_call(Skip,[[n,"[]"]]).
interpretstatement3(ssi,_,_,[[n,not]|_],Vars,Vars,_Result21,_Cut,_,Skip) :-
	debug_call(Skip,[[n,not]]).

interpretstatement3(ssi,_,_,[[n,or]|_],Vars,Vars,_Result21,_Cut,_,Skip) :-
	debug_call(Skip,[[n,or]]).

interpretstatement3(ssi,_,_,[[n,"->"]|_],Vars,Vars,_Result21,_Cut,_,Skip) :-
	debug_call(Skip,[[n,"->"]]).

interpretstatement3(ssi,_,_,[[n,findall]|_],Vars,Vars,_Result21,_Cut,_,Skip) :-
	debug_call(Skip,[[n,findall]]).

%% ** findall/2 is done above
