get_earlier_cps_before_cp1(List1,Cp1,Cp3,Cps) :-
	%curr_cp(N),
	Cp1=[_Cp_b,Cp_a|_Cp],
	member([Cp_b,Cp_a|Cp3],List1),
	get_earlier_cps_before_cp(List1,Cp_a,[],Cps).
	%Cp2=[_,_|Cp3].
/*
get_earlier_cps_before_cp1(List1,Cp_a,Cps,Cps) :-
	not(member([_,Cp_a|_],List1)),!.
get_earlier_cps_before_cp1(List1,Cp_a,Cps1,Cps2) :-
	member([Cp_b,Cp_a|Cp3],List1),
	append(Cps1,[[Cp_b,Cp_a|Cp3]],Cps3),
	get_earlier_cps_before_cp1(List1,Cp_b,Cps3,Cps2),!.
*/
% new above that returns cp a


cp_since_findall_start2(List1,Cp1,Cp2,Cp3,CP_Vars1,CP_Vars2) :-
	%writeln1("y for trace:"),(get_char(y)->trace;true),
	get(curr_cp,Curr_cp,Curr_cp1),%writeln([curr_cp,Curr_cp]),
	writeln1(cp_since_findall_start22(List1,Cp1,Cp2,Cp3,CP_Vars1,CP_Vars2)),
	(get_last_cp_before_n2(List1,Cp1,Cp2,Cp3,CP_Vars1,_)->true;(writeln([get_last_cp_before_n2,abort]),abort)),
	%writeln1(cp_since_findall_start22(List1,Cp1,Cp2,Cp3)),
	get(curr_cp,Curr_cp1,CP_Vars1),%writeln([curr_cp,Curr_cp1]),
	writeln([cp_since_findall_start2,curr_cp,Curr_cp,Curr_cp1,Cp2,CP_Vars1]).
	%notrace.
	
	/*
cp_since_findall_start22(List1,Cp1,Cp2,Cp3) :-
%trace,
writeln1([list1,List1]),
	curr_cp(N),
	cp_since_findall_start21(List1,Cp1,N,Cp2),
	Cp2=[_,_|Cp3].

cp_since_findall_start21(List1,_Cp1,N,_Cp2) :-
	(not(member([N,_|_],List1)),fail),!.
cp_since_findall_start21(List1,Cp1,N,Cp2) :-
	member([N,B|Cp1],List1),
	%((Cp1=[_,_,_,["returns to",_]|_])->
	%fail%cp_since_findall_start21(List1,Cp1,B,Cp2)
	%;
	Cp2=[N,B|Cp1],!.
cp_since_findall_start21(List1,Cp1,N,Cp2) :-
	member([B,N|Cp1],List1),
	%((Cp1=[_,_,_,["returns to",_]|_])->
	%cp_since_findall_start21(List1,Cp1,B,Cp2);
	Cp2=[B,N|Cp1],!.
cp_since_findall_start21(List1,Cp1,N,Cp2) :-
	member([B,N|Cp3],List1),
	not(Cp1=Cp3),
	cp_since_findall_start21(List1,Cp1,B,Cp2),!.
*/