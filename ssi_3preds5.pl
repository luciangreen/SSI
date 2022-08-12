/*
interpretpart(read_string1,Variable1,Vars1,Vars2) :- 
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("read_string",Dbw_read_string),
       getvalue(Variable1,Value1,Vars1),
        debug_call(Skip,[[Dbw_n,Dbw_read_string],[variable]]),
	((read_string(user_input, "\n", "\r", _End1, Value1A),
        val1emptyorvalsequal(Value1,Value1A),
        putvalue(Variable1,Value1A,Vars1,Vars2))->
      debug_exit(Skip,[[Dbw_n,Dbw_read_string],[Value1A]])
;     debug_fail(Skip,[[Dbw_n,Dbw_read_string],[variable]])),!.
*/

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
get_lang_word("member2",Dbw_member21),Dbw_member21=Dbw_member2,
        getvalues_equals4(Variable1,Variable2,Value1,Value2,Vars1),
debug_call(Skip,[[Dbw_n,Dbw_member2],[Value1,Value2]]),
	((%Value2=empty,
	
	matrix_member(Matrix),findall(X,(member(Y,[Value1,Value2]),(contains_var(empty,Y)->X=o;X=i)),Z),
foldr(atom_concat,Z,'',W),(member(W,Matrix)->true;(writeln([incorrect,member2,modes,W]),abort)),

(W=ii->
(member(Value2,Value1)->

    (Vars1=Vars2,	
      debug_exit(Skip,[[Dbw_n,Dbw_member2],[Value1,Value2]]));
    (Vars1=Vars2,
     debug_fail(Skip,[[Dbw_n,Dbw_member2],[Value1,Value2]])));

(      
(W=io->
((findall([Vars2b,[Value1,Value2a],Value2a],(member(Value2a,Value1),
	putvalue_equals4(Variable2,Value2a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value2a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
			Vars2c=[[Dbw_n,Dbw_member2],[Value1,Value2],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

	
      debug_exit(Skip,[[Dbw_n,Dbw_member2],[Value1,Value2a]])));
      
        
        
(W=oi->

(%trace,
     command_n_sols(N),
	findall([Vars2b,[Value1a,Value2],Value1a],(
	
%replace_in_term([Value2,],_%'$VAR'(_)
%        ,empty,Value1A1),
        	findnsols(N,Value1A1,(member(Value2,Value1A),
        
        %Value1A=[Value3A2|Value3A3],
        %ValueIA1=[Value3A2,"|",Value3A3],
        	        	
        replace_in_term(Value1A,_%'$VAR'(_)
        ,empty,Value1A2),
        
        convert_to_lp_pipe(Value1A2,Value1A1)
        )
        ,ValueA),!,
        
        
        %val1emptyorvalsequal(Value3,Value3A),
        %trace,
        %Vars1=Vars2,
        member(Value1a,ValueA),
        putvalue_equals4(Variable1,Value1a,Vars1,Vars2b)	),Vars2a),
        %trace,
        Vars2a=[[Vars2,_,Value1a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
			Vars2c=[[Dbw_n,Dbw_member2],[Value1,Value2],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1]

	,
      debug_exit(Skip,[[Dbw_n,Dbw_member2],[Value1a,Value2]]));
      
      
(W=oo->


(%trace,
command_n_sols(N),
	findall([Vars2b,[Value1,Value2a],%Value1a,
	Value2a],(findnsols(N,%[Value1A2,
	Value2A2%]
	,(member(Value1A,Value2A),
        %replace_in_term(Value1A,_%'$VAR'(_)
        %,empty,Value1A1),
        replace_in_term(Value2A,_%'$VAR'(_)
        ,empty,Value2A1),
        
        %convert_to_lp_pipe(Value1A1,Value1A2),
        convert_to_lp_pipe(Value2A1,Value2A2)
        )
        ,ValueA),!,
        %val1emptyorvalsequal(Value3,Value3A),
        %trace,
        %Vars1=Vars2,
        member(%[Value1a,
        Value2a%]
        ,ValueA),
        %putvalue_equals4(Variable1,Value1a,Vars1,Vars3),%)->
        putvalue_equals4(Variable2,Value2a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,%Value1a,
	Value2a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,%_,
		_],Vars2d),Vars2c1),
		
%trace,
					Vars2c=[[Dbw_n,Dbw_member2],[Value1,Value2a],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_member2],[Value1,Value2a]]))))))))      ->true;(%writeln1(fail-ssi_interpretpart(member2,Variable1,Variable2,Vars1,Vars2,Vars2c)),
      fail)).
            
      
      

ssi_interpretpart(stringconcat,Variable1,Variable2,Variable3,Vars1,Vars2,Vars2c) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("stringconcat",Dbw_stringconcat1),Dbw_stringconcat1=Dbw_stringconcat,
%Vars1=Vars2,
%trace,        

getvalues_equals4(Variable1,Variable2,Variable3,Value1z,Value2z,Value3z,Vars1),
debug_call(Skip,[[Dbw_n,Dbw_stringconcat],[Value1z,Value2z,Value3z]]),	

matrix(Matrix),findall(X,(member(Y,[Value1z,Value2z,Value3z]),(Y=empty->X=o;X=i)),Z),
foldr(atom_concat,Z,'',W),(member(W,Matrix)->true;(writeln([incorrect,stringconcat,modes,W]),abort)),

%findall(Item_u,(member(Item,[Value1z,Value2z,Value3z]),replace_empty_with_undefined(Item,Item_u)),[Value1,Value2,Value3]),
[Value1z,Value2z,Value3z]=[Value1,Value2,Value3],

(W=iii->
(%findall([Vars2b,[Value1,Value2a],Value2a],(,*
((string_concat(Value1,Value2,Value3)
%,
%replace_undefined_with_empty(Item,Item_e)
)->
(Vars1=Vars2,
debug_exit(Skip,[[Dbw_n,Dbw_stringconcat],[Value1,Value2,Value3]]));
(Vars1=Vars2,
debug_fail(Skip,[[Dbw_n,Dbw_stringconcat],[Value1,Value2,Value3]]))),
	%putvalue_equals4(Variable2,Value2a,Vars1,Vars2b)
	%),Vars2a),Vars2a=[[Vars2,_,Value2a]|Vars2d],
		%findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1)),
		
					Vars2c=[[Dbw_n,Dbw_stringconcat],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			[]]
);		

%numbers(3,1,[],N),
%findall(P,(member(N1,N),get_item_n(Z,N1,Z1),(Z1=i->get_item_n([Value1,Value2,Value3],N1,P));P=[v1,N1]%(Z1=o,get_item_n([Value1a,Value2a,Value3a],N1,P))
%),P1),

(W=iio->
	(findall([Vars2b,[Value1,Value2,Value3a],Value3a],(string_concat(Value1,Value2,Value3a),
	putvalue_equals4(Variable3,Value3a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value3a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
		
					Vars2c=[[Dbw_n,Dbw_stringconcat],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_stringconcat],[Value1,Value2,Value3a]]));
		

(W=ioi->
	(findall([Vars2b,[Value1,Value2a,Value3],Value2a],(string_concat(Value1,Value2a,Value3),
	putvalue_equals4(Variable2,Value2a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value2a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
		
					Vars2c=[[Dbw_n,Dbw_stringconcat],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_stringconcat],[Value1,Value2a,Value3]]));


/*
(W=ioo->
	(findall([Vars2b,[Value1,Value2a,Value3a],Value2a,Value3a],(string_concat*(Value1,Value2a,Value3a),
	putvalue_equals4(Variable2,Value2a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value2a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
		
					Vars2c=[[Dbw_n,Dbw_stringconcat],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_stringconcat],[Value1,Value2a,Value3]]));
*/	

(W=oii->
	(findall([Vars2b,[Value1a,Value2,Value3],Value1a],(string_concat(Value1a,Value2,Value3),
	putvalue_equals4(Variable1,Value1a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value1a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
		
					Vars2c=[[Dbw_n,Dbw_stringconcat],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_stringconcat],[Value1a,Value2,Value3]]));


/*
(W=oio->
	(findall([Vars2b,[Value1a,Value2,Value3],Value1a],(string_concat(Value1a,Value2,Value3),
	putvalue_equals4(Variable1,Value1a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value1a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
		
					Vars2c=[[Dbw_n,Dbw_stringconcat],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_stringconcat],[Value1a,Value2,Value3]]));
*/

(W=ooi->
	(%trace,
	findall([Vars2b,[Value1a,Value2a,Value3],Value1a,Value2a],(string_concat(Value1a,Value2a,Value3),
	putvalue_equals4(Variable1,Value1a,Vars1,Vars2ba),
	putvalue_equals4(Variable2,Value2a,Vars2ba,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value1a,Value2a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_,_],Vars2d),Vars2c1),
		
					Vars2c=[[Dbw_n,Dbw_stringconcat],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_stringconcat],[Value1a,Value2a,Value3]]))

))))).	




	
ssi_interpretpart(append,Variable1,Variable2,Variable3,Vars1,Vars2,Vars2c) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("append",Dbw_append1),Dbw_append1=Dbw_append,
%Vars1=Vars2,
        getvalues_equals4(Variable1,Variable2,Variable3,Value1z,Value2z,Value3z,Vars1),
debug_call(Skip,[[Dbw_n,Dbw_append],[Value1z,Value2z,Value3z]]),	

matrix(Matrix),findall(X,(member(Y,[Value1z,Value2z,Value3z]),(contains_var(empty,Y)->X=o;X=i)),Z),
foldr(atom_concat,Z,'',W),(member(W,Matrix)->true;(writeln([incorrect,append,modes,W]),abort)),

%findall(Item_u,(member(Item,[Value1z,Value2z,Value3z]),replace_empty_with_undefined(Item,Item_u)),[Value1,Value2,Value3]),
[Value1z,Value2z,Value3z]=[Value1,Value2,Value3],

(
(W=iii->
(%findall([Vars2b,[Value1,Value2a],Value2a],(,*
((append(Value1,Value2,Value3)
%,
%replace_undefined_with_empty(Item,Item_e)
)->
(Vars1=Vars2,
debug_exit(Skip,[[Dbw_n,Dbw_append],[Value1,Value2,Value3]]));
(Vars1=Vars2,
debug_fail(Skip,[[Dbw_n,Dbw_append],[Value1,Value2,Value3]]))),
	%putvalue_equals4(Variable2,Value2a,Vars1,Vars2b)
	%),Vars2a),Vars2a=[[Vars2,_,Value2a]|Vars2d],
		%findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1)),
		
					Vars2c=[[Dbw_n,Dbw_append],[Value1,Value2,Value3],W,_,%,%Value2a
			_,_,%[Value1,Value2a]
			[]]
);
		

%numbers(3,1,[],N),
%findall(P,(member(N1,N),get_item_n(Z,N1,Z1),(Z1=i->get_item_n([Value1,Value2,Value3],N1,P));P=[v1,N1]%(Z1=o,get_item_n([Value1a,Value2a,Value3a],N1,P))
%),P1),

(W=iio->
	(findall([Vars2b,[Value1,Value2,Value3a],Value3a],(append(Value1,Value2,Value3a),
	putvalue_equals4(Variable3,Value3a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value3a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
		
					Vars2c=[[Dbw_n,Dbw_append],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_append],[Value1,Value2,Value3a]]));
		

(W=ioi->
	(findall([Vars2b,[Value1,Value2a,Value3],Value2a],(append(Value1,Value2a,Value3),
	putvalue_equals4(Variable2,Value2a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value2a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
		
					Vars2c=[[Dbw_n,Dbw_append],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_append],[Value1,Value2a,Value3]]));


%/* % this is possible later x
(W=ioo->



findall([Vars2b,[Value1,Value2a,Value3a],Value3a],(

        append1(Value1,_Value2A,Value3A),%ValueA),
        replace_in_term(Value3A,_%'$VAR'(_)
        ,empty,Value3A1),
        Value3A1=[Value3A2|Value3A3],
        Value3A4=[Value3A2,"|",Value3A3],
        %val1emptyorvalsequal(Value3,Value3A),
        %trace,
        %Vars1=Vars2,
        %member([Value1A,Value3A],ValueA),
        putvalue_equals4(Variable3,Value3A4,Vars1,Vars2b)%)->
        
        
        	%(findall([Vars2b,[Value1,Value2a,Value3a],Value2a,Value3a],(append*(Value1,Value2a,Value3a),
	%putvalue_equals4(Variable2,Value2a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value3a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
		
					Vars2c=[[Dbw_n,Dbw_append],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_append],[Value1,Value2,Value3a]]));
%*/	

(W=oii->
	(findall([Vars2b,[Value1a,Value2,Value3],Value1a],(append(Value1a,Value2,Value3),
	putvalue_equals4(Variable1,Value1a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value1a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
		
					Vars2c=[[Dbw_n,Dbw_append],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_append],[Value1a,Value2,Value3]]));


%/* possible later x

(W=oio->


(command_n_sols(N),
	findall([Vars2b,[Value1a,Value2,Value3a],Value1a,Value3a],(findnsols(N,[Value1A1,Value3A1],(append1(Value1A,Value2,Value3A),
        replace_in_term(Value1A,_%'$VAR'(_)
        ,empty,Value1A1),
        replace_in_term(Value3A,_%'$VAR'(_)
        ,empty,Value3A1))
        ,ValueA),!,
        %val1emptyorvalsequal(Value3,Value3A),
        %trace,
        %Vars1=Vars2,
        member([Value1a,Value3a],ValueA),
        putvalue_equals4(Variable1,Value1a,Vars1,Vars3),%)->
        putvalue_equals4(Variable3,Value3a,Vars3,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value1a,Value3a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_,_],Vars2d),Vars2c1),
		
					Vars2c=[[Dbw_n,Dbw_append],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_append],[Value1a,Value2,Value3a]]));
%*/

(W=ooi->
	(%trace,
	findall([Vars2b,[Value1a,Value2a,Value3],Value1a,Value2a],(append(Value1a,Value2a,Value3),
	putvalue_equals4(Variable1,Value1a,Vars1,Vars2ba),
	putvalue_equals4(Variable2,Value2a,Vars2ba,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value1a,Value2a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_,_],Vars2d),Vars2c1),
		
					Vars2c=[[Dbw_n,Dbw_append],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_append],[Value1a,Value2a,Value3]]));
      
(W=ooo->


(%trace,
command_n_sols(N),
replace_in_term(Value2,empty,%'$VAR'(_)
        _,Value22),	findall([Vars2b,[Value1a,%Value2a,
	Value3a],Value1a,%Value2a,
	Value3a],(findnsols(N,[Value1A1,%Value2A1,
	Value3A1],(append1(Value1A,Value22,Value3A),
        replace_in_term(Value1A,_%'$VAR'(_)
        ,empty,Value1A2),
        %replace_in_term(Value2A,_%'$VAR'(_)
        %,empty,Value2A1),
        replace_in_term(Value3A,_%'$VAR'(_)
        ,empty,Value3A2),
        convert_to_lp_pipe(Value1A2,Value1A1),
        %convert_to_lp_pipe(Value2A2,Value2A1),
        convert_to_lp_pipe(Value3A2,Value3A1)
        )
        ,ValueA),!,
        %val1emptyorvalsequal(Value3,Value3A),
        %trace,
        %Vars1=Vars2,
        member([Value1a,%Value2a,
        Value3a],ValueA),
        putvalue_equals4(Variable1,Value1a,Vars1,Vars3b),%)->
        %putvalue_equals4(Variable2,Value2a,Vars3b,Vars3),%)->
        putvalue_equals4(Variable3,Value3a,Vars3b,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value1a,%Value2a,
	Value3a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_,_],Vars2d),Vars2c1),
		
					Vars2c=[[Dbw_n,Dbw_append],[Value1,Value2,Value3],_,_,%,%Value2a
			_,_,%[Value1,Value2a]
			Vars2c1],

      debug_exit(Skip,[[Dbw_n,Dbw_append],[Value1a,Value2a,Value3a]]))


)))))))->true;(%writeln1(fail-ssi_interpretpart(append,Variable1,Variable2,Variable3,Vars1,Vars2,Vars2c)),
fail)).	


     % writeln(Vars2c),trace.
%%;     %%debug_fail(Skip,[[n,member2],[Value1,Value2]])),!.
%%		((debug(on)->(writeln1([fail,[[n,member2],[Value1,value]],"Press c."]),(leash1(on)->true;(not(get_single_char(97))->true;abort)));true),fail))))).

ssi_interpretpart(member3,Variable2,Variable1,Vars1,Vars2,Vars2c) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("member3",Dbw_member31),Dbw_member31=Dbw_member3,
        getvalues_equals4(Variable1,Variable2,Value1,Value2,Vars1),
debug_call(Skip,[[Dbw_n,Dbw_member3],[Value1,Value2]]),	((%Value2=empty,
	((findall([Vars2b,[Value1,Value2a],Value2a],(member(Value2a,Value1),
	putvalue_equals4(Variable2,Value2a,Vars1,Vars2b)
	),Vars2a),Vars2a=[[Vars2,_,Value2a]|Vars2d],
		findall([Vars2e,Vals2g],member([Vars2e,Vals2g,_],Vars2d),Vars2c1),
					Vars2c=[[Dbw_n,Dbw_member3],[Value1,Value2],_,_,%,[Value1,Value2a]
					_,_,Vars2c1]

	))),
      debug_exit(Skip,[[Dbw_n,Dbw_member3],[Value1,Value2a]])).

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
get_lang_word("member2",Dbw_member21),Dbw_member21=Dbw_member2,
%trace,
AC=[[Dbw_n,Dbw_member2],Value1_Value2,Value1a_Value2a,Vars2|_],
%writeln1(AC),
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
      
      
      
      
ssi_interpretpart(stringconcat,_Variable1,_Variable2,_Variable3,_Vars1,Vars2,_Vars2c,AC) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("stringconcat",Dbw_stringconcat1),Dbw_stringconcat1=Dbw_stringconcat,

AC=[[Dbw_n,Dbw_stringconcat],Values,Values_a,Vars2|_],

debug_call(Skip,[[Dbw_n,Dbw_stringconcat],Values]),	

      debug_exit(Skip,[[Dbw_n,Dbw_stringconcat],Values_a]).
            
            
            
            
ssi_interpretpart(append,_Variable1,_Variable2,_Variable3,_Vars1,Vars2,_Vars2c,AC) :-
get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
get_lang_word("append",Dbw_append1),Dbw_append1=Dbw_append,

AC=[[Dbw_n,Dbw_append],Values,Values_a,Vars2|_],

debug_call(Skip,[[Dbw_n,Dbw_append],Values]),	

      debug_exit(Skip,[[Dbw_n,Dbw_append],Values_a]).
            
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
        	