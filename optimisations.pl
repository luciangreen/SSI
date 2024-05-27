
/*
del_append(Globals31,[[[vars1,Pred_id],Vars1]],Globals32) :-
 delete(Globals31,[[[vars1,Pred_id],_]],Globals33),
 append(Globals33,[[[vars1,Pred_id],Vars1]],Globals32),!.
*/
del_append(Globals1,[[[vars1,Pred_id],Vars1]],Globals3) :-
(var(Vars1)->Globals1=Globals3;
append(Globals1,[[[vars1,Pred_id],Vars1]],Globals3)),!.

last_call_optimisation(Globals3,Choice_point_trail11,Choice_point_trail3,Predicate_number,Line_number_b,Functions,CP_Vars1,CP_Vars2,Globals33,Globals3) :-

% is determinate

member([[pred_num,Pred_id],Predicate_number],Globals3),!,

findall(Pred_ids,collect_connected_pred_ids1(Pred_id,[Pred_id
],Pred_ids,Predicate_number,Globals3),Pred_ids1),

flatten(Pred_ids1,Pred_ids1a),
sort(Pred_ids1a,Pred_ids2),
  findall([A,B2,C,D_Level,E_Predicate_number2,F_Line_number_a2,Pred_or_line,H,I,All_predicate_numbers2],(member([A,B2,C,D_Level,E_Predicate_number2,F_Line_number_a2,Pred_or_line,H,I,All_predicate_numbers2],Choice_point_trail11),
 member(C,Pred_ids2)
 ),M),

 %recursive_predicate(Pred_id,Pred_ids2,Globals3),
 (forall(member([A,B2,C,D_Level,E_Predicate_number2,F_Line_number_a2,Pred_or_line,H,I,All_predicate_numbers2],M),
 
 	(Pred_or_line="line"->
	(All_predicate_numbers2=[_Ab,_Bb,_Cb,_Db,_Eb,
	_Fb,Vars2c],(Vars2c=[]));
	Pred_or_line="predicate"->
	(All_predicate_numbers2=[])))),
	
% is in last clause of a predicate

append(_,[[Predicate_number,F1,Args1|Commands]|Functions1],Functions),!,



not((append(_,[[_Predicate_number_b,F1,Args2|_]|_],Functions1),
length(Args1,L),length(Args2,L))),!,

%[1,[n,count],[1,2],":-"

% is last command
append(_,[Commands1],Commands),!,
append(_,[[Line_number_b,_,_,_,_,F2,Args3|_]|_],Commands1),
%[0, [on_true, -2], [go_after, -], [on_false, -3], [go_to_predicates, [1, 2]], [n, count], [0, [v, n]]]

% is recursive

F1=F2,length(Args1,L),length(Args3,L),!,

%delete_frame_contents

collect_connected_pred_ids2(Pred_id,Pred_ids2,Pred_ids3,Globals3),

flatten(Pred_ids3,Pred_ids3a),
sort(Pred_ids3a,Pred_ids4),


	findall(E2,(member(C1,Pred_ids4),
	E2=[_A,_B2,C1,_D_Level,_E_Predicate_number2,_F_Line_number_a2,_Pred_or_line,_H,_I,_All_predicate_numbers2],
	member(E2,Choice_point_trail11)
	
	),E3),
	%trace,
	delete(E3,[_,_,_Pred_id,_,_,-1,"predicate",_,_,_],E32),
	
	delete(E32,[_,_,_Pred_id1,_,_,["returns to",_,"pred_id",_],"predicate",_,_,_],E31),
	%E32=E31,

delete_cps(Choice_point_trail11,E31,Choice_point_trail3,CP_Vars1,CP_Vars2),!.

% - change records of pn to new pn, same pid
% connect firstargs in globals to new first args x needs to go back through frame tops, first args needs to be computed afterwards, so don't do in 1 frame

%run_in_current_frame() :-!.

