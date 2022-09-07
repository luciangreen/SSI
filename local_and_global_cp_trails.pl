% saves local to global cp trails and vv

save_local_to_global_cp_trail(Choice_point_trail1,[],
	CP_Vars1,CP_Vars2) :-
	%writeln1(save_local_to_global_cp_trail(Choice_point_trail1,[],CP_Vars1,CP_Vars2)),
	%trace,
	
	(Choice_point_trail1=[]->CP_Vars1=CP_Vars2;
	(
	(Choice_point_trail1=[[Pred_id,_,_,_,_,_,_,
		_|_]|_]->true;((writeln(save_local_to_g_abort),abort))),
		
		%notrace,
		(Pred_id=["prev_pred_id",Prev_pred_id]->Pred_id1=Prev_pred_id;Pred_id1=Pred_id),
		
				
	member([global_cp_trail,Global_cp_trail1],CP_Vars1),
	
	append(Global_cp_trail1,[["pred_id",Pred_id1,Choice_point_trail1]],Global_cp_trail2),
	
	delete(CP_Vars1,[global_cp_trail,Global_cp_trail1],CP_Vars3),
	append(CP_Vars3,[[global_cp_trail,Global_cp_trail2]],
	CP_Vars2))),!.
	
	
	
load_local_from_global_cp_trail(Pred_id,%Choice_point_trail1,
Choice_point_trail2,
	CP_Vars1,CP_Vars2) :-
	%writeln1(load_local_from_global_cp_trail(Pred_id,%Choice_point_trail1,Choice_point_trail2,	CP_Vars1,CP_Vars2)),
	%trace,
	
	%Choice_point_trail1=[[Pred_id,_,_,_,_,_,_,
	%	_]|_],
		(Pred_id=["prev_pred_id",Prev_pred_id]->Pred_id1=Prev_pred_id;Pred_id1=Pred_id),
		
				
	member([global_cp_trail,Global_cp_trail1],CP_Vars1),
		member(["pred_id",Pred_id1,Choice_point_trail2],Global_cp_trail1),
	
		delete(Global_cp_trail1,["pred_id",Pred_id1,Choice_point_trail2],Global_cp_trail2),

	delete(CP_Vars1,[global_cp_trail,Global_cp_trail1],CP_Vars3),
	append(CP_Vars3,[[global_cp_trail,Global_cp_trail2]],
	CP_Vars2),!.
	
	