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
