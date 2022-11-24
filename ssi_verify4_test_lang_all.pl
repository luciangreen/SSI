%:-include('../Languages/make_docs.pl').

%:-include('ssi_verify4.pl').
%:-include('ssi_verify4_types.pl').
%:-include('ssi_verify4_open.pl').
%:-include('ssi_verify4_open_types.pl').

%% ssi_test_all00("en",off,NTotal,Score).

%% ssi_test_all0(test,4,"en",off,A,B).

%% ssi_test_all01(test,_,"en",off,1,Passed).

ssi_test_all00(Lang,Debug,NTotal,Score) :-
	retractall(lang(_)),
	assertz(lang(Lang)),

	ssi_test_all0(test,5,Lang,Debug,NT1,S1),
	writeln0([ssi_verify4,S1,/,NT1,passed]),
	writeln0(""),	writeln0(""),
	
	ssi_test_all0(test_types_cases,6,Lang,Debug,NT2,S2),
	writeln0([ssi_verify4_types,S2,/,NT2,passed]),
	writeln0(""),	writeln0(""),
	
	ssi_test_all0(testopen_cases,3,Lang,Debug,NT3,S3),
	writeln0([ssi_verify4_open,S3,/,NT3,passed]),
	writeln0(""),	writeln0(""),

	ssi_test_all0(test_open_types_cases,5,Lang,Debug,NT4,S4),
	writeln0([ssi_verify4_open_types,S4,/,NT4,passed]),
	writeln0(""),	writeln0(""),

	NTotal is NT1+NT2+NT3+NT4,
	Score is S1+S2+S3+S4.
	
ssi_test_all0(Test,Arity,Lang,Debug,NTotal,Score) :-
	functor(Test2,Test,Arity),
	findall(Test2,(Test2),B1),
	functor(Test3,Test,Arity),
	arg(1,Test3,lpi),
	delete(B1,Test3,B),
	length(B,NTotal1),
ssi_test_all0(Test,Arity,Lang,Debug,0,NTotal,0,Score,NTotal1),!.
ssi_test_all0(_Test,_Arity,_Lang,_Debug,NTotal,NTotal,Score,Score,NTotal) :- 
%NTotal=105, 
	!.
ssi_test_all0(Test,Arity,Lang,Debug,NTotal1,NTotal2,Score1,Score2,NTotal4) :-
	NTotal3 is NTotal1+1,
	ssi_test_all000(Test,Debug,NTotal3,Score1,Score3,Lang),
	writeln0(""),
	ssi_test_all0(Test,Arity,Lang,Debug,NTotal3,NTotal2,Score3,Score2,NTotal4),!.

%% ssi_test_all01 individual cases, Debug=trace=on or off, N=case number, Passed=output=result

%% ssi_test_all01(ssi_test,            4,"en2",off,1,Passed).
%% ssi_test_all01(ssi_test_types_cases,6,"en2",off,1,Passed).
%% ssi_test_all01(ssi_testopen_cases,  3,"en2",off,1,Passed).
%% ssi_test_all01(ssi_test_open_types, 5,"en2",off,1,Passed).

ssi_test_all01(Test,_Arity,Lang,Debug,NTotal3,Passed) :-
	ssi_test_all000(Test,Debug,NTotal3,0,Passed1,Lang),
	(Passed1=1->Passed=passed;Passed=failed),
	/**
	((international_lucianpl([lang,"en"],Debug,Query,Functions,Result1),%%writeln(Result1),
	Result=Result1
	)->(Passed=passed,writeln([ssi_test_all0,N,passed]));(Passed=failed,writeln([ssi_test_all0,N,failed]))),
**/
	!.

ssi_test_all000(test,Debug,NTotal3,Score1,Score3,Lang) :-
	test(Version,NTotal3,Query,Functions,Result),
	(Version=both->true;Version=ssi),
	trans_alg(Query,"en",Lang,Query1),
	trans_alg(Functions,"en",Lang,Functions1),
	(Debug=on->writeln1(Functions);true),
	(Debug=on->writeln1(Functions1);true),
	trans_alg(Result,"en",Lang,Result1),


			((
catch(call_with_time_limit(480,international_lucianpl([lang,Lang],Debug,Query1,Functions1,Result1)),_,false)	%,writeln1(Result2)
	)
	->(Score3 is Score1+1,writeln0([ssi_test,NTotal3,passed]));(Score3=Score1,writeln0([ssi_test,NTotal3,failed]))).

ssi_test_all000(test_types_cases,Debug,NTotal3,Score1,Score3,Lang) :-

test_types_cases(NTotal3,Query,Types,Modes,Functions,Result),

	trans_alg(Query,"en",Lang,Query1),
	trans_alg(Types,"en",Lang,Types1),
	trans_alg(Modes,"en",Lang,Modes1),
	trans_alg(Functions,"en",Lang,Functions1),
	(Debug=on->writeln1(Functions1);true),
	trans_alg(Result,"en",Lang,Result1),

(catch(call_with_time_limit(480,international_lucianpl([lang,Lang],Debug,Query1,Types1,Modes1,Functions1,Result1)),_,false)	%,writeln1(Result2)
->(Score3 is Score1+1,writeln0([ssi_test_types,NTotal3,passed]));(Score3=Score1,writeln0([ssi_test_types,NTotal3,failed]))).
	
ssi_test_all000(testopen_cases,Debug,NTotal3,Score1,Score3,Lang) :-
	testopen_cases(NTotal3,Query,Functions),
	trans_alg(Query,"en",Lang,Query1),
	trans_alg(Functions,"en",Lang,Functions1),
	(Debug=on->writeln1(Functions1);true),
	((international_lucianpl([lang,Lang],Debug,Query1,Functions1,Result),not(Result=[]))->(Score3 is Score1+1,writeln0([ssi_testopen,NTotal3,result,Result]),writeln0([ssi_test,NTotal3,passed]));(Score3=Score1,writeln0([ssi_testopen,NTotal3,failed]))).

ssi_test_all000(test_open_types_cases,Debug,NTotal3,Score1,Score3,Lang) :-
	test_open_types_cases(NTotal3,Query,Types,Modes,Functions),
	trans_alg(Query,"en",Lang,Query1),
	trans_alg(Types,"en",Lang,Types1),
	trans_alg(Modes,"en",Lang,Modes1),
	trans_alg(Functions,"en",Lang,Functions1),
	(Debug=on->writeln1(Functions1);true),


((international_lucianpl([lang,Lang],Debug,Query1,Types1,Modes1,Functions1,Result),not(Result=[]))->(Score3 is Score1+1,writeln0([ssi_test_open_types,NTotal3,result,Result]),writeln0([ssi_test_open_types,NTotal3,passed]));(Score3=Score1,writeln0([ssi_test_open_types,NTotal3,failed]))).

