%% ssi_test_types(Debug[on/off],Total,Score).

%%:- use_module(library(time)).

%% ssi_test cases, Debug=trace=on or off, NTotal=output=total cases, Score=output=result

ssi_test_types(Debug,NTotal,Score) :- ssi_test_types(Debug,0,NTotal,0,Score),!.
ssi_test_types(_Debug,NTotal,NTotal,Score,Score) :- NTotal=58, !.
ssi_test_types(Debug,NTotal1,NTotal2,Score1,Score2) :-
	NTotal3 is NTotal1+1,
	test_types_cases(NTotal3,Query,Types,Modes,Functions,Result),
	(international_lucianpl([lang,"en"],Debug,Query,Types,Modes,Functions,Result)->(Score3 is Score1+1,writeln0([ssi_test_types,NTotal3,passed]));(Score3=Score1,writeln0([ssi_test_types,NTotal3,failed]))),
	writeln0(""),
	ssi_test_types(Debug,NTotal3,NTotal2,Score3,Score2),!.

%% ssi_test individual cases, Debug=trace=on or off, N=case number, Passed=output=result

ssi_test_types1(Debug,N,Passed) :-
	test_types_cases(N,Query,Types,Modes,Functions,Result),
	((international_lucianpl([lang,"en"],Debug,Query,Types,Modes,Functions,Result1),%writeln(Result1),
	Result=Result1
	)->(Passed=passed,writeln0([ssi_test_types,N,passed]));(Passed=failed,writeln0([ssi_test_types,N,failed]))),!.

