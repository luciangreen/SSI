%% ssi_test_pl(Debug[on/off],Total,Score).

%%:- use_module(library(time)).

%% ssi_test_pl cases, Debug=trace=on or off, NTotal=output=total cases, Score=output=result

ssi_test_pl(Debug,NTotal,Score) :- ssi_test_pl(Debug,0,NTotal,0,Score),!.
ssi_test_pl(_Debug,NTotal,NTotal,Score,Score) :- NTotal=1, !.
ssi_test_pl(Debug,NTotal1,NTotal2,Score1,Score2) :-
	NTotal3 is NTotal1+1,
	test_pl(NTotal3,Query,Functions,Result),
	p2lpconverter_command([string,Query],Query1),
	p2lpconverter([string,Functions],Functions1),	
	p2lpconverter_term([string,Result],Result2),	
	((international_lucianpl([lang,"en"],Debug,Query1,Functions1,Result1),
	%writeln1([result1,Result1]),
	Result2=Result1	
	)->(Score3 is Score1+1,writeln0([ssi_test_pl,NTotal3,passed]));(Score3=Score1,writeln0([ssi_test_pl,NTotal3,failed]))),
	writeln0(""),
	ssi_test_pl(Debug,NTotal3,NTotal2,Score3,Score2),!.

%% ssi_test_pl individual cases, Debug=trace=on or off, N=case number, Passed=output=result

ssi_test_pl1(Debug,N,Passed) :-
	test_pl(N,Query,Functions,Result),
	p2lpconverter_command([string,Query],Query1),
	p2lpconverter([string,Functions],Functions1),	
	p2lpconverter_term([string,Result],Result2),	
	((international_lucianpl([lang,"en"],Debug,Query1,Functions1,Result1),
	%writeln1([result1,Result1]),
	Result2=Result1	
	)->(Passed=passed,writeln0([ssi_test_pl,N,passed]));(Passed=failed,writeln0([ssi_test_pl,N,failed]))),!.
