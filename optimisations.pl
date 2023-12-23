
del_append(Globals31,[[[vars1,Pred_id],Vars1]],Globals32) :-
 delete(Globals31,[[[vars1,Pred_id],_]],Globals33),
 append(Globals33,[[[vars1,Pred_id],Vars1]],Globals32),!.


last_call_optimisation(Globals3,Choice_point_trail11,Choice_point_trail3,Predicate_number,Line_number_b,Functions,CP_Vars1,CP_Vars2) :-

% is recursive, determinate

member([[pred_num,Pred_id],Predicate_number],Globals3),

findall(Pred_ids,collect_connected_pred_ids(Pred_id,[Pred_id],Pred_ids,Predicate_number,Globals3),Pred_ids1),

flatten(Pred_ids1,Pred_ids1a),
sort(Pred_ids1a,Pred_ids2),
  findall([A,B2,C,D_Level,E_Predicate_number2,F_Line_number_a2,Pred_or_line,H,I,All_predicate_numbers2],(member([A,B2,C,D_Level,E_Predicate_number2,F_Line_number_a2,Pred_or_line,H,I,All_predicate_numbers2],Choice_point_trail11),
 member(C,Pred_ids2)
 ),M),
 recursive_predicate(Pred_id,Pred_ids2,Globals3),(forall(member([A,B2,C,D_Level,E_Predicate_number2,F_Line_number_a2,Pred_or_line,H,I,All_predicate_numbers2],M),
 
 	(Pred_or_line="line"->
	(All_predicate_numbers2=[_Ab,_Bb,_Cb,_Db,_Eb,
	_Fb,Vars2c],not(Vars2c=[]));
	Pred_or_line="predicate"->
	not(All_predicate_numbers2=[])))),
	
% is in last clause of a predicate

append(_,[[Predicate_number|Commands]|Functions1],Functions),
not(append(_,[[Predicate_number|_]|_],Functions1)),

% is last command

append(_,[Commands1],Commands),
append(_,[Line_number_b|_],Commands1),


%delete_frame_contents

collect_connected_pred_ids2(Pred_id,Pred_ids2,Pred_ids3,Globals3),


	findall(E2,(member(C1,Pred_ids3),
	E2=[_A,_B2,C1,_D_Level,_E_Predicate_number2,_F_Line_number_a2,_Pred_or_line,_H,_I,_All_predicate_numbers2],
	member(E2,Choice_point_trail11)
	
	),E3),
	
	subtract(E3,[[_,_,Pred_id,_,_,-1,"predicate",_,_,_]],E31),

delete_cps(Choice_point_trail11,E31,Choice_point_trail3,CP_Vars1,CP_Vars2),!.

% - change records of pn to new pn, same pid
% connect firstargs in globals to new first args x needs to go back through frame tops, first args needs to be computed afterwards, so don't do in 1 frame

%run_in_current_frame() :-!.

