%% only_ssi_test(Debug[on/off],Total,Score).

%%:- use_module(library(time)).

%% only_ssi_test cases, Debug=trace=on or off, NTotal=output=total cases, Score=output=result

only_ssi_test(Debug,NTotal,Score) :- only_ssi_test(Debug,0,NTotal,0,Score),!.
only_ssi_test(_Debug,NTotal,NTotal,Score,Score) :- NTotal=1, !.
only_ssi_test(Debug,NTotal1,NTotal2,Score1,Score2) :-
	NTotal3 is NTotal1+1,
	only_ssi_test(NTotal3,Query,Functions,Result),
	((international_lucianpl([lang,"en"],Debug,Query,Functions,Result1)
	%,writeln1([Result,Result1])
	,Result=Result1)
	->(Score3 is Score1+1,writeln0([only_ssi_test,NTotal3,passed]));(Score3=Score1,writeln0([only_ssi_test,NTotal3,failed]))),
	writeln0(""),
	only_ssi_test(Debug,NTotal3,NTotal2,Score3,Score2),!.

%% only_ssi_test individual cases, Debug=trace=on or off, N=case number, Passed=output=result

only_ssi_test1(Debug,N,Passed) :-
	only_ssi_test(N,Query,Functions,Result),
	((international_lucianpl([lang,"en"],Debug,Query,Functions,Result1),
	%writeln1([result1,Result1]),
	Result=Result1
	)->(Passed=passed,writeln0([only_ssi_test,N,passed]));(Passed=failed,writeln0([only_ssi_test,N,failed]))),!.


only_ssi_test(1,[[n,findall],[[[v,a],[v,b]],[[n,appendz],[[v,a],[v,b],[1,2,3]]],[v,c]]],
[
[[n,appendz],[[],[v,a],[v,a]]%,":-",[[[n,true]]]
],
[[n,appendz],[[[v,a],"|",[v,d]],[v,b],[[v,a],"|",[v,c]]],":-",
[
[[n,appendz],[[v,d],[v,b],[v,c]]]%,[[n,cut]]
]
]]
,[[[[v,c],[[[],[1,2,3]],[[1],[2,3]],[[1,2],[3]],[[1,2,3],[]]]]]]).

only_ssi_test(2,[[n,family_test]], % compatible with ssi, requires more memory

[
[[n,parent],[albert,jim]],
[[n,parent],[albert,peter]],
[[n,parent],[jim,brian]],
[[n,parent],[peter,lee]],
[[n,parent],[peter,john]],
[[n,year_of_birth],[albert,1926]],
[[n,year_of_birth],[peter,1945]],
[[n,year_of_birth],[jim,1949]],
[[n,year_of_birth],[brian,1974]],
[[n,year_of_birth],[john,1974]],
[[n,year_of_birth],[lee,1975]],
[[n,gender],[albert,male]],
[[n,gender],[jim,male]],
[[n,gender],[peter,male]],
[[n,gender],[brian,male]],
[[n,gender],[lee,male]],
[[n,gender],[john,male]],
[[n,grandparent],[[v,gg]],":-",
[
	[[n,findall],
	[
		[[v,a],[v,b]],

		[[n,parent],[[v,a],[v,b]]],

		[v,c]
	]],
	[[n,findall],
	[
		[[v,grandparent],[v,grandchild]],

		[
		[[n,member],[[[v,grandparent],[v,child]],[v,c]]],
		[[n,member],[[[v,child],[v,grandchild]],[v,c]]]
		],

		[v,gg]
	]],
	[[n,cut]]
]],
[[n,comment],["% older(A,B)"]],
[[n,comment],["% means A is older than B"]],
[[n,comment],["%"]],
[[n,older],[[v,gg]],":-",
[
	[[n,findall],
	[
		[[v,a],[v,b]],

		[[n,year_of_birth],[[v,a],[v,b]]],

		[v,c]
	]],
	[[n,findall],
	[
		[[v,a1],[v,b1]],

		[
		[[n,member],[[[v,a1],[v,y1]],[v,c]]],
		[[n,member],[[[v,b1],[v,y2]],[v,c]]],
		[[n,>],[[v,y2],[v,y1]]]
		],

		[v,gg]
	]],
	[[n,cut]]
]],
[[n,comment],["% siblings(A,B)"]],
[[n,comment],["% means A and B are siblings"]],
[[n,comment],["%"]],
[[n,siblings],[[v,gg]],":-",
[
	[[n,findall],
	[
		[[v,a],[v,b]],

		[[n,parent],[[v,a],[v,b]]],

		[v,c]
	]],
	[[n,findall],
	[
		[[v,a1],[v,b1]],

		[
		[[n,member],[[[v,x],[v,a1]],[v,c]]],
		[[n,member],[[[v,x],[v,b1]],[v,c]]],
		[[n,not],[[[n,=],[[v,a1],[v,b1]]]]]
		],

		[v,gg]
	]],
	[[n,cut]]
]],
[[n,comment],["% A & B share a common parent"]],
[[n,comment],["%"]],
[[n,comment],["% A is different from B  (Bratko, p175)"]],
[[n,comment],["% sibling_list(Child, Siblings)"]],
[[n,comment],["% Siblings is a list of A1's brothers and sisters"]],
[[n,comment],["%"]],
[[n,sibling_list],[[v,a1],[v,siblings]],":-",
[
	[[n,findall],
	[
		[[v,a],[v,b]],

		[[n,parent],[[v,a],[v,b]]],

		[v,c]
	]],
	[[n,findall],
	[
		[[v,a1],[v,b1]],

		[
		[[n,member],[[[v,x],[v,a1]],[v,c]]],
		[[n,member],[[[v,x],[v,b1]],[v,c]]],
		[[n,not],[[[n,=],[[v,a1],[v,b1]]]]]
		],

		[v,list]
	]],
	[[n,remove_duplicates],[[v,list],[v,siblings]]],
	[[n,cut]]
]],
[[n,comment],["% remove_duplicates(List, Result)"]],
[[n,comment],["%"]],
[[n,comment],["% Removes duplicate entries in a list"]],
[[n,comment],["%"]],
[[n,remove_duplicates],[[],[]],":-",
[
	[[n,cut]]
]],
[[n,remove_duplicates],[[[[v,x1],[v,x2]],"|",[v,rest]],[[[v,x1],[v,x2]],"|",[v,result]]],":-",
[
	[[n,delete],[[v,rest],[[v,x1],[v,x2]],[v,r1]]],
	[[n,delete],[[v,r1],[[v,x2],[v,x1]],[v,r2]]],
	[[n,remove_duplicates],[[v,r2],[v,result]]],
	[[n,cut]]
]],
[[n,comment],["% older_brother(A,B)"]],
[[n,comment],["% means A is an older brother of B"]],
[[n,comment],["%"]],
[[n,older_brother],[[v,gg]],":-",
[
	[[n,older_brother1],[[v,p],[v,y],[v,g]]],
	[[n,findall],
	[
		[[v,a],[v,b],[v,c1],[v,b3]],

		[
		[[n,member],[[[v,a],[v,b]],[v,p]]],
		[[n,member],[[[v,b],[v,c1]],[v,y]]],
		[[n,member],[[[v,b],[v,b3]],[v,g]]]
		],

		[v,c]
	]],
	[[n,findall],
	[
		[[v,a1],[v,b1]],

		[
		[[n,member],[[[v,x],[v,a1],[v,c2],male],[v,c]]],
		[[n,member],[[[v,x],[v,b1],[v,c21],[v,'_']],[v,c]]],
		[[n,>],[[v,c2],[v,c21]]]
		],

		[v,gg]
	]],
	[[n,cut]]
]],
[[n,older_brother1],[[v,p],[v,y],[v,g]],":-",
[
	[[n,findall],
	[
		[[v,a],[v,b]],

		[[n,parent],[[v,a],[v,b]]],

		[v,p]
	]],
	[[n,findall],
	[
		[[v,a],[v,b]],

		[[n,year_of_birth],[[v,a],[v,b]]],

		[v,y]
	]],
	[[n,findall],
	[
		[[v,a],[v,b]],

		[[n,gender],[[v,a],[v,b]]],

		[v,g]
	]],
	[[n,cut]]
]],
[[n,comment],["% descendant(Person, Descendant)"]],
[[n,comment],["% means Descendant is a descendant of Person."]],
[[n,comment],["%"]],
[[n,descendant],[[v,a1],[v,b1]],":-",
[
	[[n,findall],
	[
		[[v,a],[v,b]],

		[[n,parent],[[v,a],[v,b]]],

		[v,c]
	]],
	[[n,descendant1],[[v,a1],[v,b1],[v,c],[v,c]]]
]],
[[n,descendant1],[[v,'_person'],[],[],[v,'_']],":-",
[
	[[n,cut]]
]],
[[n,descendant1],[[v,person],[v,d2],[[[v,person],[v,c2]],"|",[v,c1]],[v,e]],":-",
[
	[[n,descendant1],[[v,c2],[v,d],[v,e],[v,e]]],
	[[n,descendant1],[[v,person],[v,descendant],[v,c1],[v,e]]],
	[[n,foldr_append],[[[[v,c2]],[v,d],[v,descendant]],[],[v,d2]]],
	[[n,cut]]
]],
[[n,descendant1],[[v,person1],[v,descendant],[[[v,person2],[v,'_c2']],"|",[v,c1]],[v,e]],":-",
[
	[[n,not],[[[n,=],[[v,person1],[v,person2]]]]],
	[[n,descendant1],[[v,person1],[v,descendant],[v,c1],[v,e]]],
	[[n,cut]]
]],
[[n,foldr_append],[[],[v,b],[v,b]],":-",
[
	[[n,cut]]
]],
[[n,foldr_append],[[[v,a1],"|",[v,a2]],[v,b],[v,c]],":-",
[
	[[n,append],[[v,b],[v,a1],[v,d]]],
	[[n,foldr_append],[[v,a2],[v,d],[v,c]]],
	[[n,cut]]
]],
[[n,comment],["% ancestor(Person, Ancestor)"]],
[[n,comment],["% means Ancestor is an ancestor of Person."]],
[[n,comment],["%"]],
[[n,comment],["% This is functionally equivalent to descendant(Ancestor, Person)."]],
[[n,comment],["%"]],
[[n,ancestor],[[v,a1],[v,b1]],":-",
[
	[[n,findall],
	[
		[[v,a],[v,b]],

		[[n,parent],[[v,a],[v,b]]],

		[v,c]
	]],
	[[n,ancestor1],[[v,a1],[v,b1],[v,c],[v,c]]]
]],
[[n,ancestor1],[[v,'_person'],[],[],[v,'_']],":-",
[
	[[n,cut]]
]],
[[n,ancestor1],[[v,person],[v,d2],[[[v,c2],[v,person]],"|",[v,c1]],[v,e]],":-",
[
	[[n,ancestor1],[[v,c2],[v,d],[v,e],[v,e]]],
	[[n,ancestor1],[[v,person],[v,ancestor],[v,c1],[v,e]]],
	[[n,foldr_append],[[[[v,c2]],[v,d],[v,ancestor]],[],[v,d2]]],
	[[n,cut]]
]],
[[n,ancestor1],[[v,person1],[v,ancestor],[[[v,'_c2'],[v,person2]],"|",[v,c1]],[v,e]],":-",
[
	[[n,not],[[[n,=],[[v,person1],[v,person2]]]]],
	[[n,ancestor1],[[v,person1],[v,ancestor],[v,c1],[v,e]]],
	[[n,cut]]
]],
[[n,comment],["% children(Parent, ChildList)"]],
[[n,comment],["% ChildList is bound to a list of the children of Parent."]],
[[n,comment],["%"]],
[[n,children],[[v,parent],[v,childlist]],":-",
[
	[[n,findall],
	[
		[v,child],

		[[n,parent],[[v,parent],[v,child]]],

		[v,childlist]
	]]
]],
[[n,comment],["% list_count(List, Count)"]],
[[n,comment],["% Count is bound to the number of elements in List."]],
[[n,comment],["%"]],
[[n,list_count],[[],0]],
[[n,list_count],[[[v,'_'],"|",[v,tail]],[v,count]],":-",
[
	[[n,list_count],[[v,tail],[v,tailcount]]],
	[[n,+],[[v,tailcount],1,[v,count]]]
]],
[[n,comment],["% count_descendants(Person, Count)"]],
[[n,comment],["% Count is bound to the number of descendants of Person."]],
[[n,comment],["%"]],
[[n,count_descendants],[[v,person],[v,count]],":-",
[
	[[n,descendant],[[v,person],[v,list]]],
	[[n,list_count],[[v,list],[v,count]]]
]],
[[n,family_test],":-",
[
	[[n,grandparent],[[v,result1]]],
	[[n,writeln],[[v,result1]]],
	[[n,older],[[v,result2]]],
	[[n,writeln],[[v,result2]]],
	[[n,siblings],[[v,result3]]],
	[[n,writeln],[[v,result3]]],
	[[n,sibling_list],[john,[v,result5]]],
	[[n,writeln],[[v,result5]]],
	[[n,older_brother],[[v,result6]]],
	[[n,writeln],[[v,result6]]],
	[[n,descendant],[albert,[v,result7]]],
	[[n,writeln],[[v,result7]]],
	[[n,ancestor],[john,[v,result8]]],
	[[n,writeln],[[v,result8]]],
	[[n,children],[albert,[v,childlist]]],
	[[n,writeln],[[v,childlist]]],
	[[n,list_count],[[1,2,3],[v,count1]]],
	[[n,writeln],[[v,count1]]],
	[[n,count_descendants],[albert,[v,count2]]],
	[[n,writeln],[[v,count2]]]
]]
]
,[[]]).


/*
only_ssi_test(3,[[n,older_brother],[[v,result6]]], %% trying to get working with ssi

[
[[n,parent],[albert, jim]],
[[n,parent],[albert, peter]],
[[n,parent],[jim, brian]],
[[n,parent],[john, darren]],
[[n,parent],[peter, lee]],
[[n,parent],[peter, sandra]],
[[n,parent],[peter, james]],
[[n,parent],[peter, kate]],
[[n,parent],[peter, kyle]],
[[n,parent],[brian, jenny]],
[[n,parent],[irene, jim]],
[[n,parent],[irene, peter]],
[[n,parent],[pat, brian]],
[[n,parent],[pat, darren]],
[[n,parent],[amanda, jenny]],

[[n,older_brother],[[v,c]],":-",
[
	[[n,findall],
	[
		[[v,a],[v,b]],

		[
		[[n,siblings],[[v,a],[v,b]]],
		[[n,male],[[v,a]]],
		[[n,older],[[v,a],[v,b]]]
		],

		[v,c]
	]]
]],
[[n,siblings],[[v,a],[v,b]],":-",
[
	[[n,parent],[[v,x],[v,a]]],
	[[n,parent],[[v,x],[v,b]]],
	[[n,not],[[[n,=],[[v,a],[v,b]]]]]
]],
[[n,male],[albert]],
[[n,male],[jim]],
[[n,male],[peter]],
[[n,male],[brian]],
[[n,male],[john]],
[[n,male],[darren]],
[[n,male],[james]],
[[n,male],[kyle]],
[[n,yearofbirth],[irene,1923]],
[[n,yearofbirth],[pat,1954]],
[[n,yearofbirth],[lee,1970]],
[[n,yearofbirth],[sandra,1973]],
[[n,yearofbirth],[jenny,2004]],
[[n,yearofbirth],[amanda,1979]],
[[n,yearofbirth],[albert,1926]],
[[n,yearofbirth],[jim,1949]],
[[n,yearofbirth],[peter,1945]],
[[n,yearofbirth],[brian,1974]],
[[n,yearofbirth],[john,1955]],
[[n,yearofbirth],[darren,1976]],
[[n,yearofbirth],[james,1969]],
[[n,yearofbirth],[kate,1975]],
[[n,yearofbirth],[kyle,1976]],
[[n,older],[[v,a],[v,b]],":-",
[
	[[n,yearofbirth],[[v,a],[v,y1]]],
	[[n,yearofbirth],[[v,b],[v,y2]]],
	[[n,>],[[v,y2],[v,y1]]]
]],
[[n,family_test],":-",
[
	[[n,older_brother],[[v,result6]]],
	[[n,writeln],[[v,result6]]]
]]
],
[[[[v,result6],[[peter, jim], [james, lee], [james, sandra], [james, kate], [james, kyle], [peter, jim], [brian, darren]]]]]).

*/