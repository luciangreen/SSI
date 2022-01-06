flush_after_last_findall(Choice_point_trail1,Choice_point_trail2,CP_Vars1,CP_Vars2) :-


reverse(Choice_point_trail1,Choice_point_trail14),
	member([A1,A2,_,_,_,_,"findall",_|_],Choice_point_trail14),
	%_D11=[_,_,_,_,"findall",_|_],
%trace,
	get_later_cps_than_cp11(Choice_point_trail1,
	[A1,A2,_,_,_,_,"findall",-|_],
	_D1,B),

%trace,
	
delete_cp2(Choice_point_trail1,B,Choice_point_trail2,CP_Vars1,CP_Vars2).	
	%subtract(Choice_point_trail1,B,Choice_point_trail2).
	
delete_cp2(List1,[],List1,Cp_vars1,Cp_vars1) :- !.
							delete_cp2(List1,B,List2,Cp_vars1,Cp_vars2) :-
		B=[B1|B21],					delete_cp(List1,B1,List3,Cp_vars1,Cp_vars3,Swaps),
		replace_cps(Swaps,B21,[],B22),
							delete_cp2(List3,B22,List2,Cp_vars3,Cp_vars2).


replace_cps(_,[],B,B) :- !.
replace_cps(Swaps,B21,B23,B22) :-
		B21=[B31|B32],
		(member([B31,B33],Swaps)->
		append(B23,[B33],B34);
		append(B23,[B31],B34)),
		replace_cps(Swaps,B32,B34,B22).
						
				
		
