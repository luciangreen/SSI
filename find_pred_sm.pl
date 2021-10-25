/**

cd SSI
swipl
['../listprologinterpreter/listprolog.pl'].
assertz(lang("en2")).
load_lang_db.
['find_pred_sm.pl'].
find_pred_sm(RW,"en"),writeln1(RW).

["+","-","*","/","abort","any","append","atom","brackets","call","ceiling","code","creep","cut","date","delete","equals1","equals2","equals3","equals4","exit","fail","grammar","head","is","length","letters","list","member","member2","n","not","number","or","predicatename","random","round","skip","string","string_from_file","stringconcat","stringtonumber","sys","findall_sys","t","tail","true","unwrap","v","variable","vgp","wrap","input","output","string_length","sort","intersection","read_string","writeln","atom_string","trace","notrace","sqrt","notrace"]

**/

find_pred_sm(Reserved_words1) :-
	Reserved_words1=["+","-","*","/","abort","any","append","atom","brackets","call","ceiling","code","creep","cut","date","delete","equals1","equals2","equals3","equals4","equals4_on","equals4_off","exit","fail","grammar","head","is","length","letters","list","member","member2","member3","n","not","number","or","predicatename","random","round","skip","string","string_from_file","stringconcat","stringtonumber","sys","findall_sys","t","tail","true","unwrap","v","variable","vgp","wrap","input","output","string_length","sort","intersection","read_string","writeln","atom_string","trace","notrace","sqrt","notrace","get_lang_word"].

	
% list of reserved words from lang dict

/**
	lang(Lang1),
	%(Lang1="en"->Lang2="en2";Lang2=Lang1),
	lang_db(Lang_DB),
	findall(En_word3,
	 (member([En_word,En_word2,Lang1,_T_word],
	 Lang_DB),
	 (Lang2="en"->En_word3=En_word;En_word3=En_word2),
	 not(member(En_word,["findall","maplist"]))),
	 % these reserved words are taken out to be run as list prolog algorithms
	 Reserved_words1).
**/

/**
	 
% keeps list of pred numbers of clauses for a predicate (run after finding predicate and line numbers and before finding state machine)

find_pred_numbers([[0,[n,downpipe],[[v,a],[v,a],[v,b]]],[1,[n,downpipe],[[v,a],[v,b],[v,c]],":-",[[0,[n,member2],[[v,c],[v,c1]]],[1,[n,equals1],[[v,c1]]],[2,[n,equals1],[[v,c12]]],[3,[n,"->"],[[4,[n,>],[[v,a],[v,c121]]],[5,[n,downpipe],[[v,c121],[v,b],[v,c]]],[6,[n,"->"],[[7,[n,>],[[v,a],[v,c122]]],[8,[n,downpipe],[[v,c122],[v,b],[v,c]]],[9,[n,fail]]]]]]]]],
["+","-","*","/","abort","any","append","atom","brackets","call","ceiling","code","creep","cut","date","delete","equals","equals2","equals3","equals4","exit","fail","grammar","head","is","length","letters","list","member","member2","n","not","number","or","predicatename","random","round","skip","string","string_from_file","stringconcat","stringtonumber","sys","findall_sys","t","tail","true","unwrap","v","variable","vgp","wrap","input","output","string_length","sort","intersection","read_string","writeln","atom_string","trace","notrace","sqrt","notrace"],
Pred_numbers),writeln1(Pred_numbers).

Pred_numbers = [[[n, downpipe], 3, [0, 1]]].

**/

find_pred_numbers(Functions,_Reserved_words,Pred_numbers) :-
%trace,
	findall([Pred_name1,Arity1],(
	
	%member([_Pred_number1,Pred_name1|Arguments_Body],Functions),(Arguments=":-"->Arity1=0;length(Arguments,Arity1))
	
	member([Pred_number2,Pred_name1|Rest],Functions),
(Rest=[Args,":-",Lines]->length(Args,Arity1);
(Rest=[Args]->(Lines=[[[n,true]]],length(Args,Arity1));
(Rest=[":-",Lines]->Arity1=0;
(Rest=[],Lines=[[[n,true]]],Arity1=0))))


	),Unique_predicates1),
	sort(Unique_predicates1,Unique_predicates2),

	% functions may contain a reserved word:
	%forall((member([Pred_name3,_Arity3],Unique_predicates2),not(member(Pred_name3,Reserved_words))),(term_to_atom(Pred_name3,Pred_name31),concat_list(["Error: Functions contains reserved word: ",Pred_name31,"."],Note),writeln(Note),abort)),
		%trace,
		findall([Pred_name2,Arity1,Pred_number3],(member([Pred_name2,Arity1],Unique_predicates2),findall(Pred_number2,(
		
		
%member([Pred_number2,Pred_name2,Arguments2|_],Functions),length(Arguments2,Arity2)


	member([Pred_number2,Pred_name2|Rest],Functions),
(Rest=[Args,":-",Lines]->length(Args,Arity1);
(Rest=[Args]->(Lines=[[[n,true]]],length(Args,Arity1));
(Rest=[":-",Lines]->Arity1=0;
(Rest=[],Lines=[[[n,true]]],Arity1=0))))



),Pred_number3)),Pred_numbers).

% stores these in pred calls in the sm - see ssi_find_sm.pl


