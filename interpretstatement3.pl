
%** debug displays in not, findall
	interpretstatement3(ssi,_,_,[[n,"[]"]|_],Vars,Vars,_Result21,_Cut,_).
interpretstatement3(ssi,_,_,[[n,not]|_],Vars,Vars,_Result21,_Cut,_) :-
debug_call(_Skip,[[n,not]]).

interpretstatement3(ssi,_,_,[[n,or]|_],Vars,Vars,_Result21,_Cut,_).
interpretstatement3(ssi,_,_,[[n,"->"]|_],Vars,Vars,_Result21,_Cut,_).
interpretstatement3(ssi,_,_,[[n,findall]|_],Vars,Vars,_Result21,_Cut,_) :-
debug_call(_Skip,[[n,findall]]).

%% ** findall/2 is done above
