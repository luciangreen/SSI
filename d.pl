d(Pred_id,D0,Level,Predicate_number,Line_number_b,Query,Vars1,Vars2,All_predicate_numbers,Line,Choice_point_trail10,Globals33,Functions,Result1, Result2,Globals2,Choice_point_trail3,CP_Vars10,CP_Vars2) :-

%writeln1(d(Pred_id,D0,Level,Predicate_number,Line_number_b,Query,Vars1,Vars2,All_predicate_numbers,Line,Choice_point_trail1,Globals3,Functions,Result1, Result2,Globals2,Choice_point_trail3,CP_Vars1,CP_Vars2)),

%trace,
(enable_last_call_optimization(Globals33,Choice_point_trail10,Choice_point_trail1,Predicate_number,Line_number_b,Functions,CP_Vars10,CP_Vars1,Globals33,Globals3)
->increment_metric(last_call_optimizations)
;
(Choice_point_trail10=Choice_point_trail1,CP_Vars1=CP_Vars10,Globals33=Globals3)),

%(
%append(D,All_predicate_numbers,All_predicate_numbers3),
	%All_predicate_numbers3=

	% * vars1,3
	
	Level2 is Level+1,

%writeln1(append_cp(Choice_point_trail1,[[Pred_id,Level,Predicate_number,["returns to",Line_number_b],"predicate",Query,
	%Vars2,All_predicate_numbers]],Choice_point_trail11)
%),

%Line=[Function,Arguments],



get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
%get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
%get_lang_word("call",Dbw_call1),Dbw_call1=Dbw_call,

%find_pred_sm(Reserved_words1),
Line=Query1,
        %((Query1=[[Dbw_n,Dbw_call],[Function,Arguments]]
        %)->true;
%(
Query1=[Function,Arguments]
%)
%)
,

        ((Function=[Dbw_v,Function2],
        not(reserved_word2(Function2)))->
        (append([Function],Arguments,Arguments1),
        % Use cached variable substitution for performance
        cached_substitutevarsA1(Arguments1,Vars1,[],Vars3,[],FirstArgs),
        
        append(Globals3,[[[firstargs_uv2,Pred_id],FirstArgs]],Globals31),
        del_append(Globals31,[[[vars1,Pred_id],Vars1]],Globals32),

        Vars3=[Function1|Vars31],
        Query2=[Function1,Vars31],
        
        pred_numbers(Pred_numbers),
        length(Arguments,Arity1),
        %trace,
        member([Function1,Arity1,Pred_numbers1],Pred_numbers),        
	findall([All_predicate_numbers0,"prev_pred_id",Pred_id],member(All_predicate_numbers0,Pred_numbers1),D)
	%All_predicate_numbers01=[[All_predicate_numbers1,"prev_pred_id",Prev_pred_id]|All_predicate_numbers2]

        
        );
        (
        % Use cached variable substitution for performance
        cached_substitutevarsA1(Arguments,Vars1,[],Vars3,[],FirstArgs),
        
        append(Globals3,[[[firstargs_uv2,Pred_id],FirstArgs]],Globals32),

        Query2=[Function,Vars3],
        	findall([All_predicate_numbers0,"prev_pred_id",Pred_id],member(All_predicate_numbers0,D0),D)
        
        )
        
        

	


        
        ),
        %interpret2(Query2,Functions0,Functions0,Result1), 

/*
	updatevars2(FirstArgs,Result1,[],Vars5),
	updatevars3(Vars1,Vars5,Vars6),

*/
	D=
	[All_predicate_numbers1|All_predicate_numbers2],

	All_predicate_numbers1=[All_predicate_numbers11,"prev_pred_id",Prev_pred_id],



append_cp(Choice_point_trail1,[[Pred_id,Level,Predicate_number,["returns to",Line_number_b,"pred_id",Pred_id],"predicate",Query,
	Vars1,All_predicate_numbers
	%D
	]],Choice_point_trail11,CP_Vars1,CP_Vars3),

	%% **
	%(Pred_id=3->writeln(here1);true),
	
	%trace,
%cut_cps_if_necessary(Prev_pred_id,Choice_point_trail11,Choice_point_trail12,CP_Vars3,CP_Vars32,All_predicate_numbers11,Globals32)	,
Choice_point_trail11=Choice_point_trail12,
CP_Vars3=CP_Vars32,
	%notrace,
	%writeln1(cut_cps_if_necessary(Prev_pred_id,Choice_point_trail11,Choice_point_trail12,CP_Vars3,CP_Vars32,All_predicate_numbers11,Globals32)	),
	ssi1([["prev_pred_id",Prev_pred_id],Level2,All_predicate_numbers11,-1,"predicate",Query2,
	Vars1,All_predicate_numbers2],
	 _End_result2, %don't need
	 Functions,Vars2,
	Result1, Result2,  % don't need
	Globals32,Globals2,
	Choice_point_trail12,
	Choice_point_trail3,
	CP_Vars32,CP_Vars2)
	
	
% 		append(Result3,[End_result],Result2)
 .
 
cut_cps_if_necessary(Pred_id,Choice_point_trail11,Choice_point_trail2,CP_Vars1,CP_Vars2,Predicate_number,Globals3) :-

cut_cps_if_necessary(Pred_id,Choice_point_trail11,Choice_point_trail2,CP_Vars1,CP_Vars2,Predicate_number,Globals3,check-rec).

/*
cut_cps_if_necessary1(Pred_id,Choice_point_trail11,Choice_point_trail2,CP_Vars1,CP_Vars2,Predicate_number,Globals3) :-

cut_cps_if_necessary(Pred_id,Choice_point_trail11,Choice_point_trail2,CP_Vars1,CP_Vars2,Predicate_number,Globals3,no-check-rec).
*/

cut_cps_if_necessary(Pred_id,Choice_point_trail11,Choice_point_trail2,CP_Vars1,CP_Vars2,Predicate_number,Globals3,CR_flag) :-
 
 % find pred_id group

findall(Pred_ids,collect_connected_pred_ids(Pred_id,[Pred_id],Pred_ids,Predicate_number,Globals3),Pred_ids1),

%(not(Pred_ids1=[[_]])->writeln1(cut_cps_if_necessary(Pred_id,Choice_point_trail11,Choice_point_trail2,CP_Vars1,CP_Vars2,Predicate_number,Globals3));true),

flatten(Pred_ids1,Pred_ids1a),
sort(Pred_ids1a,Pred_ids2),
 
 %writeln([2,Pred_ids2]),
 %(Pred_ids2=[117]->%writeln(*****************)%
 %true
 %turndebug(on)
 %;true),

 % if no cp data for pred_id group, cut cps
 findall([A,B2,C,D_Level,E_Predicate_number2,F_Line_number_a2,Pred_or_line,H,I,All_predicate_numbers2],(member([A,B2,C,D_Level,E_Predicate_number2,F_Line_number_a2,Pred_or_line,H,I,All_predicate_numbers2],Choice_point_trail11),
 member(C,Pred_ids2)%,not(F_Line_number_a2= -1),
 %not(F_Line_number_a2=["returns to", _, "pred_id", _])
 ),M),
 ((CR_flag=check-rec->recursive_predicate(Pred_id,Pred_ids2,Globals3);true),(forall(member([A,B2,C,D_Level,E_Predicate_number2,F_Line_number_a2,Pred_or_line,H,I,All_predicate_numbers2],M),
 
 	(Pred_or_line="line"->
	(All_predicate_numbers2=[_Ab,_Bb,_Cb,_Db,_Eb,
	_Fb,Vars2c],not(Vars2c=[]));
	Pred_or_line="predicate"->
	not(All_predicate_numbers2=[]))))->
	
	
cut_cps(Choice_point_trail11,Choice_point_trail2,CP_Vars1,CP_Vars2,Pred_id,Predicate_number,Globals3);

(Choice_point_trail11=Choice_point_trail2,CP_Vars1=CP_Vars2)).

%recursive_predicate(A,A,_):- !.
recursive_predicate(A,B,_):-member(A,B),!.
recursive_predicate(A,B,Globals3):-
 member([pred_id_chain,C,A],Globals3),
 (member(C,B)->true;
 (recursive_predicate(C,B,Globals3))),!.
 
/*
recursive_predicate(A,_B,Predicate_number,Globals3):-
 member([pred_id_chain,C,A],Globals3),
 ((%member(C,B),
 member([[pred_num,C],Predicate_number],Globals3))->true;
 (recursive_predicate(C,_B,Globals3))),!.
*/