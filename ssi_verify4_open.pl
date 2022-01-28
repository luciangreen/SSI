%% ssi_test cases, Debug=trace=on or off, N=output=result
ssi_testopen(Debug,NTotal) :- ssi_testopen(Debug,0,NTotal),!.
ssi_testopen(_Debug,NTotal,NTotal) :- NTotal=3, !.
ssi_testopen(Debug,NTotal1,NTotal2) :-
	NTotal3 is NTotal1+1,
	testopen_cases(NTotal3,Query,Functions),
	((international_lucianpl([lang,"en"],Debug,Query,Functions,Result),not(Result=[]))->(writeln([ssi_test,NTotal3,result,Result]),writeln([ssi_test,NTotal3,passed]));(writeln([ssi_test,NTotal3,failed]))),
	writeln(""),
	ssi_testopen(Debug,NTotal3,NTotal2),!.

%% ssi_test individual cases, Debug=trace=on or off, N=case number
ssi_testopen1(Debug,N) :-
	testopen_cases(N,Query,Functions),
((international_lucianpl([lang,"en"],Debug,Query,Functions,Result),not(Result=[]))->(writeln([ssi_test,N,result,Result]),writeln([ssi_test,N,passed]));(writeln([ssi_test,N,failed]))),!.
