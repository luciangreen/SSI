%% ssi_test(Debug[on/off],Total,Score).

%%:- use_module(library(time)).

%% ssi_test cases, Debug=trace=on or off, NTotal=output=total cases, Score=output=result

ssi_test(Debug,NTotal,Score) :- ssi_test(Debug,0,NTotal,0,Score),!.
ssi_test(_Debug,NTotal,NTotal,Score,Score) :- NTotal=196, !.
ssi_test(Debug,NTotal1,NTotal2,Score1,Score2) :-
	NTotal3 is NTotal1+1,
	test(NTotal3,Query,Functions,Result),
	(international_lucianpl([lang,"en"],Debug,Query,Functions,Result)
	%%writeln1(Result2
	->(Score3 is Score1+1,writeln0([ssi_test,NTotal3,passed]));(Score3=Score1,writeln0([ssi_test,NTotal3,failed]))),
	writeln0(""),
	test(Debug,NTotal3,NTotal2,Score3,Score2),!.

%% ssi_test individual cases, Debug=trace=on or off, N=case number, Passed=output=result

ssi_test1(Debug,N,Passed) :-
	test(N,Query,Functions,Result),
	((international_lucianpl([lang,"en"],Debug,Query,Functions,Result1),
	writeln1([result1,Result1]),
	Result=Result1
	)->(Passed=passed,writeln0([ssi_test,N,passed]));(Passed=failed,writeln0([ssi_test,N,failed]))),!.
