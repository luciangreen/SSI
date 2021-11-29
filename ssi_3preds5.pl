/*ssi_interpretpart(member,Variable1,Variable2,Vars1,Vars2,Vars2c) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("member",Dbw_member),
        getvalues_equals4(Variable1,Variable2,Value1,Value2,Vars1),
debug_call(Skip,[[Dbw_n,Dbw_member],[Value1,Value2]]),
  	%(((not(Value2=empty)->member(Value2,Value1),
	((findall([[Value1,Value3],Vars2b,Value3],(member(Value3,Value1),
	putvalue_equals4(Variable2,Value3,Vars1,Vars2b)%%,Vars2=Vars1
	),Vars2a),Vars2a=[[_,Vars2,Value3]|Vars2d],
	findall([[Value11,Value21],Vars2e],member([[Value11,Value21],Vars2e,Value31],Vars2d),Vars2c1),
	Vars2c=[[[Dbw_n,Dbw_member],[Value1,Value2],Value3]|[Vars2c1]]
	)->
      debug_exit(Skip,[[Dbw_n,Dbw_member],[Value1,Value3]])
;     debug_fail(Skip,[[Dbw_n,Dbw_member],[Value1,Value2]])),!.
*/

ssi_interpretpart(member2,Variable1,Variable2,Vars1,Vars2,Vars2c) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("member2",Dbw_member2),
        getvalues_equals4(Variable1,Variable2,Value1,Value2,Vars1),
debug_call(Skip,[[Dbw_n,Dbw_member2],[Value1,Value2]]),	((%Value2=empty,
	((findall([Vars2b,[Value1,Value2a],Value2a],(member(Value2a,Value1),
	putvalue_equals4(Variable2,Value2a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value2a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
			Vars2c=[[Dbw_n,Dbw_member2],[Value1,Value2],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1]

	))),
      debug_exit(Skip,[[Dbw_n,Dbw_member2],[Value1,Value2a]])).
     % writeln(Vars2c),trace.
%%;     %%debug_fail(Skip,[[n,member2],[Value1,Value2]])),!.
%%		((debug(on)->(writeln1([fail,[[n,member2],[Value1,value]],"Press c."]),(leash1(on)->true;(not(get_single_char(97))->true;abort)));true),fail))))).

ssi_interpretpart(member3,Variable2,Variable1,Vars1,Vars2,Vars2c) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("member3",Dbw_member2),
        getvalues_equals4(Variable1,Variable2,Value1,Value2,Vars1),
debug_call(Skip,[[Dbw_n,Dbw_member2],[Value1,Value2]]),	((%Value2=empty,
	((findall([Vars2b,[Value1,Value2a],Value2a],(member(Value2a,Value1),
	putvalue_equals4(Variable2,Value2a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value2a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
					Vars2c=[[Dbw_n,Dbw_member2],[Value1,Value2],_,_,%,[Value1,Value2a]
					_,_,Vars2c1]

	))),
      debug_exit(Skip,[[Dbw_n,Dbw_member2],[Value1,Value2a]])).

%%%

/*
ssi_interpretpart(member,Variable1,Variable2,Vars1,Vars2,Vars2c,AC) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("member",Dbw_member),
AC=[[_Dbw_n,_Dbw_member],[Value1,Value2],[Value1a,Value2a]],
        %getvalues_equals4(Variable1,Variable2,Value1,Value2,Vars1),
debug_call(Skip,[[Dbw_n,Dbw_member],[Value1,Value2]]),
  	%(((not(Value2=empty)->member(Value2,Value1),
	%((findall([[Value1,Value3],Vars2b,Value3],(member(Value3,Value1),
	%putvalue_equals4(Variable2,Value3,Vars1,Vars2b)%%,Vars2=Vars1
	%),Vars2a),Vars2a=[[_,Vars2,Value3]|Vars2d],
	%findall([[Value11,Value21],Vars2e],member([[Value11,Value21],Vars2e,Value31],Vars2d),Vars2c1),
	%Vars2c=[[[Dbw_n,Dbw_member],[Value1,Value2],Value3]|[Vars2c1]]
	%)->
      debug_exit(Skip,[[Dbw_n,Dbw_member],[Value1,Value3]])
%;     debug_fail(Skip,[[Dbw_n,Dbw_member],[Value1,Value2]])),
!.
*/

ssi_interpretpart(member2,_Variable1,_Variable2,_Vars1,Vars2,_Vars2c,AC) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("member2",Dbw_member2),
%trace,
AC=[[Dbw_n,Dbw_member2],Value1_Value2,Value1a_Value2a,Vars2|_],
%writeln1(AC),
    %getvalues_equals4(Variable1,Variable2,Value1,Value2,Vars1),
debug_call(Skip,[[Dbw_n,Dbw_member2],Value1_Value2]),	%((%Value2=empty,
	%((findall([Vars2b,Value2a],(member(Value2a,Value1),
	%putvalue_equals4(Variable2,Value2a,Vars1,Vars2b)
	%),Vars2a),Vars2a=[[Vars2,Value2a]|Vars2d],
	%	findall(Vars2e,member([Vars2e,_],Vars2d),Vars2c)
	%))),
      debug_exit(Skip,[[Dbw_n,Dbw_member2],Value1a_Value2a])%)
      .
%%;     %%debug_fail(Skip,[[n,member2],[Value1,Value2]])),!.
%%		((debug(on)->(writeln1([fail,[[n,member2],[Value1,value]],"Press c."]),(leash1(on)->true;(not(get_single_char(97))->true;abort)));true),fail))))).

/*
ssi_interpretpart(member3,_Variable2,_Variable1,_Vars1,Vars2,_Vars2c,AC) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("member3",Dbw_member2),
%trace,
AC=[[_Dbw_n,_Dbw_member],[Value1,Value2],[Value1a,Value2a],Vars2|_],

%getvalues_equals4(Variable1,Variable2,Value1,Value2,Vars1),
debug_call(Skip,[[Dbw_n,Dbw_member2],[Value1,Value2]]),	%((%Value2=empty,
	%((findall([Vars2b,Value2a],(member(Value2a,Value1),
	%putvalue_equals4(Variable2,Value2a,Vars1,Vars2b)
	%),Vars2a),Vars2a=[[Vars2,Value2a]|Vars2d],
	%	findall(Vars2e,member([Vars2e,_],Vars2d),Vars2c)
	%))),
      debug_exit(Skip,[[Dbw_n,Dbw_member2],[Value1a,Value2a]]).
*/
/*
ssi_interpretpart(stringconcat,Terminal,Phrase2,Phrase1,Vars1,Vars2,Vars2c) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("stringconcat",Dbw_stringconcat),
	%%Variables1=[Terminal,Phrase1,Phrase2], %% terminal can be v or "a"
        ((getvalues2([Terminal,Phrase1,Phrase2],
        	[],[TerminalValue1,Phrase1Value1,Phrase2Value1],Vars1,[],[Flag1,Flag2,_Flag3]), %% prolog vars, list of vars, [v]=[prolog var]
        %%delete(Value1,Value2,Value3A),
        
        (findall([Vars2b,TerminalValue1,TerminalValue3,Phrase1Value1,Phrase1Value3,Phrase2Value1],(
        (Terminal=[_Value]->TerminalValue2=[TerminalValue1];TerminalValue2=TerminalValue1),
             
 
(Terminal=""->(TerminalValue2="",
       
string_concat(TerminalValue2,Phrase2Value1,Phrase1Value1))->true;
            ((var(TerminalValue2)->(string_concat(TerminalValue2,Phrase2Value1,Phrase1Value1)),string_length(TerminalValue2,1)
            );string_concat(TerminalValue2,Phrase2Value1,Phrase1Value1))),
                
        putvalue(Terminal,TerminalValue2,Vars1,Vars3),
        putvalue(Phrase2,Phrase2Value1,Vars3,Vars4),
        putvalue(Phrase1,Phrase1Value1,Vars4,Vars2b)

        ),Vars2a),Vars2a=[[Vars2,TerminalValue1,TerminalValue3,Phrase1Value1,Phrase1Value3,Phrase2Value1]|Vars2d], 
		findall(Vars2e,member([Vars2e,_],Vars2d),Vars2c)),
        (Flag1=true->TerminalValue3=variable1;TerminalValue3=TerminalValue1),
        (Flag2=true->Phrase1Value3=variable2;Phrase1Value3=Phrase1Value1))->

(debug_call(Skip,[[Dbw_n,Dbw_stringconcat],[TerminalValue3,Phrase1Value3,Phrase2]]),	

debug_exit(Skip,[[Dbw_n,Dbw_stringconcat],[TerminalValue1,Phrase1Value1,Phrase2Value1]])
        	);
        	
        	(debug_call(Skip,[[Dbw_n,Dbw_stringconcat],[variable1,variable2,variable3]]),
        	debug_fail(Skip,[[Dbw_n,Dbw_stringconcat],[variable1,variable2,variable3]])
        	)).%!.
*/
        	
/*
ssi_interpretpart(grammar_part,Variables1,Vars1,Vars2) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
%get_lang_word("grammar_part",Dbw_grammar_part),

	Variables1=[Terminal,Phrase1,Phrase2], %% terminal can be v or "a"
        %%terminal(Terminal),
        getvalues2([Terminal,Phrase1,Phrase2],
        	[],[TerminalValue1,Phrase1Value1,Phrase2Value1],Vars1,[],[Flag1,Flag2,_Flag3]), %% prolog vars, list of vars, [v]=[prolog var]
        %%delete(Value1,Value2,Value3A),
    ((    (Terminal=[_Value]->TerminalValue2=[TerminalValue1];TerminalValue2=TerminalValue1),



((string(Phrase1Value1)->Phrase1Value1=Phrase1Value11;(number(Phrase1Value1)->number_string(Phrase1Value1,Phrase1Value11);Phrase1Value1=Phrase1Value11)),

(Terminal=""->TerminalValue2="";true),
       
(((var(TerminalValue2)->(string_concat(TerminalValue2,Phrase2Value1,Phrase1Value11)),string_length(TerminalValue2,1));string_concat(TerminalValue2,Phrase2Value1,Phrase1Value11))->true;    

string_concat(TerminalValue2,Phrase2Value1,Phrase1Value11))->true;
            


((Phrase1Value1=[_ItemA|_ItemsA]),(Terminal=[]->(TerminalValue2=[],

((var(TerminalValue2)->length(TerminalValue2,1);true),(append(TerminalValue2,Phrase2Value1,Phrase1Value1))))->true;

(append(TerminalValue2,Phrase2Value1,Phrase1Value1)->true)))),

        putvalue(Terminal,TerminalValue2,Vars1,Vars3),
        putvalue(Phrase2,Phrase2Value1,Vars3,Vars4),
        putvalue(Phrase1,Phrase1Value1,Vars4,Vars2),
        (Flag1=true->TerminalValue3=variable1;TerminalValue3=TerminalValue1),
        (Flag2=true->Phrase1Value3=variable2;Phrase1Value3=Phrase1Value1))->
        	(debug_call(Skip,[[Dbw_n,grammar_part],[TerminalValue3,Phrase1Value3,Phrase2]]),
        	debug_exit(Skip,[[Dbw_n,grammar_part],[TerminalValue1,Phrase1Value1,Phrase2Value1]]));

% CAW requires input,input,output with "a","ab",[v,a] where [v,a]="b"
        	(debug_call(Skip,[[Dbw_n,grammar_part],[Terminal,Phrase1,Phrase2]]),
        (debug_fail(Skip,[[Dbw_n,grammar_part],[Terminal,Phrase1,Phrase2]])))),!.
        	
*/
        	