d(Pred_id,D0,Level,Predicate_number,Line_number_b,Query,Vars1,Vars2,All_predicate_numbers,Line,Choice_point_trail1,Globals3,Functions,Result1, Result2,Globals2,Choice_point_trail3,CP_Vars1,CP_Vars2) :-

%append(D,All_predicate_numbers,All_predicate_numbers3),
	%All_predicate_numbers3=

	% * vars1,3
		findall([All_predicate_numbers0,"prev_pred_id",Pred_id],member(All_predicate_numbers0,D0),D),

	
	D=
	[All_predicate_numbers1|All_predicate_numbers2],
	
	Level2 is Level+1,

%writeln1(append_cp(Choice_point_trail1,[[Pred_id,Level,Predicate_number,["returns to",Line_number_b],"predicate",Query,
	%Vars2,All_predicate_numbers]],Choice_point_trail11)
%),

append_cp(Choice_point_trail1,[[Pred_id,Level,Predicate_number,["returns to",Line_number_b,"pred_id",Pred_id],"predicate",Query,
	Vars1,All_predicate_numbers]],Choice_point_trail11,CP_Vars1,CP_Vars3),

%Line=[Function,Arguments],



get_lang_word("v",Dbw_v),
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("call",Dbw_call1),Dbw_call1=Dbw_call,

%find_pred_sm(Reserved_words1),
Line=Query1,
        ((Query1=[[Dbw_n,Dbw_call],[Function,Arguments]]
        )->true;
(Query1=[Function,Arguments]
)
),

        (Function=[Dbw_v,_]->
        (append([Function],Arguments,Arguments1),
        substitutevarsA1(Arguments1,Vars1,[],Vars3,[],FirstArgs),
        
        append(Globals3,[[[firstargs_uv2,Pred_id],FirstArgs]],Globals31),
        append(Globals31,[[[vars1,Pred_id],Vars1]],Globals32),

        Vars3=[Function1|Vars31],
        Query2=[Function1,Vars31]);
        (
        substitutevarsA1(Arguments,Vars1,[],Vars3,[],FirstArgs),
        
        append(Globals3,[[[firstargs_uv2,Pred_id],FirstArgs]],Globals32),

        Query2=[Function,Vars3])),
        %interpret2(Query2,Functions0,Functions0,Result1), 

/*
	updatevars2(FirstArgs,Result1,[],Vars5),
	updatevars3(Vars1,Vars5,Vars6),

*/
	All_predicate_numbers1=[All_predicate_numbers11,"prev_pred_id",Prev_pred_id],


	%% **
	%(Pred_id=3->writeln(here1);true),
	ssi1([["prev_pred_id",Prev_pred_id],Level2,All_predicate_numbers11,-1,"predicate",Query2,
	Vars1,All_predicate_numbers2],
	 _End_result2, %don't need
	 Functions,Vars2,
	Result1, Result2,  % don't need
	Globals32,Globals2,
	Choice_point_trail11,
	Choice_point_trail3,
	CP_Vars3,CP_Vars2)
	
	
% 		append(Result3,[End_result],Result2)
 .