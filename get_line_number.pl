get_line_number(Line_number2b,Functions,Level2,Vars3,Globals1,Line_number2a) :-

(Line_number2b=["returns to",%[Level_x,
	Line_number3,"pred_id",Pred_id]%]
	->
	(
member([[pred_num,Pred_id],Predicate_number2],Globals1),

member([Predicate_number2,_F|Rest],Functions),
(Rest=[_Args,":-",Lines]->true;
(Rest=[_Args]->Lines=[[[n,true]]];
(Rest=[":-",Lines];
(Rest=[],Lines=[[[n,true]]])))),



	member([Line_number3,["on true",A],["go after",_B],["on false",_C],["go to predicates",_D]|_Line],Lines),
A=Line_number2a,
%trace,
	reverse(Globals1,Globals33), % I reversed this
	%Globals1=Globals33,
	%writeln1(Globals3),
	%trace,
	member([[firstargs_uv2,Pred_id],FirstArgs1],Globals33),

	%trace,
	%writeln1(Globals33),
%writeln1([level,Level,level2,Level2]),
%writeln1(member([[firstargs_uv2,Level],FirstArgs1],Globals33)),
	Globals33=Globals43,
	%delete(Globals3,[[firstargs,Level2],FirstArgs],Globals4),
	member([[vars1,Pred_id],Vars11],Globals43),
	%delete(Globals4,[[vars1,Level2],Vars1],Globals21),
	Globals43=Globals212,

reverse(Globals212,Globals22),
	%Result1=Vars3,
	%trace,
	updatevars2(FirstArgs1,Vars3,[],Vars5),
	updatevars3(Vars11,Vars5,Vars6),
	reverse(Vars6,[],Vars7),
	((not(Vars7=[])->
	(
	unique1(Vars7,[],Vars8)
	)
);(
	Vars8=[])),
	
	Vars8=Vars44 %% 4 not 2? ***
)
;

(Line_number2a=Line_number2b
%,
%,Level_x=Level2
%Vars44=Vars3

)).