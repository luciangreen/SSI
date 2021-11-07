
%** debug displays in not, findall
	interpretstatement3(ssi,_,_,[[n,"[]"]|_],Vars,Vars,Result21,_Cut).
interpretstatement3(ssi,_,_,[[n,not]|_],Vars,Vars,Result21,_Cut) :-
debug_call(_Skip,[[n,not]]).

interpretstatement3(ssi,_,_,[[n,or]|_],Vars,Vars,Result21,_Cut).
interpretstatement3(ssi,_,_,[[n,"->"]|_],Vars,Vars,Result21,_Cut).

%% ** findall/2 is done above
