%:-include('../Languages/make_docs.pl').

%:-include('ssi_verify4.pl').
%:-include('ssi_verify4_types.pl').
%:-include('ssi_verify4_open.pl').
%:-include('ssi_verify4_open_types.pl').

% ssi_test						(NTotal3,Query,Functions,Result)
% ssi_test_types_cases		(NTotal3,Query,Types,Modes,Functions,Result)
% ssi_testopen_cases		(N,		   Query,Functions)
% ssi_test_open_types		(NTotal3,Query,Types,Modes,Functions)
	
%% ssi_test_all_bt00("en2",off,NTotal,Score).

ssi_test_all_bt00(Lang,Debug,NTotal,Score) :-
	retractall(lang(_)),
	assertz(lang(Lang)),

	ssi_test_all_bt0(test,4,Lang,Debug,NT1,S1),
	writeln0([ssi_verify4,S1,/,NT1,passed]),
	writeln0(""),	writeln0(""),
	
	ssi_test_all_bt0(test_types_cases,6,Lang,Debug,NT2,S2),
	writeln0([ssi_verify4_types,S2,/,NT2,passed]),
	writeln0(""),	writeln0(""),
	
	ssi_test_all_bt0(testopen_cases,3,Lang,Debug,NT3,S3),
	writeln0([ssi_verify4_open,S3,/,NT3,passed]),
	writeln0(""),	writeln0(""),

	ssi_test_all_bt0(test_open_types_cases,5,Lang,Debug,NT4,S4),
	writeln0([ssi_verify4_open_types,S4,/,NT4,passed]),
	writeln0(""),	writeln0(""),

	NTotal is NT1+NT2+NT3+NT4,
	Score is S1+S2+S3+S4.
	
ssi_test_all_bt0(Ssi_test,Arity,Lang,Debug,NTotal,Score) :-
	functor(Ssi_test2,Ssi_test,Arity),
	findall(ssi_test2,(Ssi_test2),B),length(B,NTotal1),
ssi_test_all_bt0(Ssi_test,Arity,Lang,Debug,0,NTotal,0,Score,NTotal1),!.
ssi_test_all_bt0(_Ssi_test,_Arity,_Lang,_Debug,NTotal,NTotal,Score,Score,NTotal) :- 
%NTotal=105, 
	!.
ssi_test_all_bt0(Ssi_test,Arity,Lang,Debug,NTotal1,NTotal2,Score1,Score2,NTotal4) :-
	NTotal3 is NTotal1+1,
	ssi_test_all_bt000(Ssi_test,Debug,NTotal3,Score1,Score3,Lang),
	writeln0(""),
	ssi_test_all_bt0(Ssi_test,Arity,Lang,Debug,NTotal3,NTotal2,Score3,Score2,NTotal4),!.

%% ssi_test_all_bt01 individual cases, Debug=trace=on or off, N=case number, Passed=output=result

%% ssi_test_all_bt01(ssi_test,            4,"en2",off,1,Passed).
%% ssi_test_all_bt01(ssi_test_types_cases,6,"en2",off,1,Passed).
%% ssi_test_all_bt01(ssi_testopen_cases,  3,"en2",off,1,Passed).
%% ssi_test_all_bt01(ssi_test_open_types, 5,"en2",off,1,Passed).

ssi_test_all_bt01(test,_Arity,Lang,Debug,NTotal3,Passed) :-
	ssi_test_all_bt000(test,Debug,NTotal3,0,Passed1,Lang),
	(Passed1=1->Passed=passed;Passed=failed),
	/**
	((international_lucianpl([lang,"en"],Debug,Query,Functions,Result1),%%writeln(Result1),
	Result=Result1
	)->(Passed=passed,writeln([ssi_test_all_bt0,N,passed]));(Passed=failed,writeln([ssi_test_all_bt0,N,failed]))),
**/
	!.

ssi_test_all_bt000(test,Debug,NTotal3,Score1,Score3,Lang) :-
	test(NTotal3,Query,Functions,Result),
	trans_alg1(Query,"en",Lang,Query1),
	(Query=Query1->true%writeln("Query=Query1")
	;(writeln0("not(Query=Query1)"),abort)),
	trans_alg1(Functions,"en",Lang,Functions1),
	(Debug=on->writeln1(Functions);true),
	(Debug=on->writeln1(Functions1);true),
	(Functions=Functions1->true%writeln("Functions=Functions1")
	;(writeln0("not(Functions=Functions1)"),abort)),
	trans_alg1(Result,"en",Lang,Result1),
	(Result1=_Result11->true%writeln("Result1=Result11")
	;(writeln0("not(Result1=Result11)"),abort)),
			(international_lucianpl([lang,"en"],Debug,Query1,Functions1,Result1)
	%%writeln1(Result2
	->(Score3 is Score1+1,writeln0([ssi_test,NTotal3,passed]));(Score3=Score1,writeln0([ssi_test,NTotal3,failed]))).

ssi_test_all_bt000(test_types_cases,Debug,NTotal3,Score1,Score3,Lang) :-

test_types_cases(NTotal3,Query,Types,Modes,Functions,Result),

	trans_alg1(Query,"en",Lang,Query1),
	%trans_alg1(Types,"en",Lang,Types1),
	
	findall([F1|Types00],(member([F1|Types003],Types),
	
	expand_types1(Types003,[],Types00)),Types004),
	
	%Types004=[[[n, find_record], [[t, brackets], [[[t, list], [[t, number], [t, string]]], [t, number], [t, string]]]]],

	trans_alg1(Types004,"en",Lang,Types005),%,expand_types1(Types002,[],Types003),simplify_types(Types003,[],Types00)
	%),Types1),
	
	%simplify_types(Types01,[],Types1),%findall
	findall([F|Types100],(member([F|Types101],Types005),simplify_types(Types101,[],Types100)),Types1),

	
	trans_alg1(Modes,"en",Lang,Modes1),
	trans_alg1(Functions,"en",Lang,Functions1),
	(Debug=on->writeln1(Functions1);true),
	trans_alg1(Result,"en",Lang,Result1),

(international_lucianpl([lang,"en"],Debug,Query1,Types1,Modes1,Functions1,Result1)->(Score3 is Score1+1,writeln0([ssi_test_types,NTotal3,passed]));(Score3=Score1,writeln0([ssi_test_types,NTotal3,failed]))).
	
ssi_test_all_bt000(testopen_cases,Debug,NTotal3,Score1,Score3,Lang) :-
	testopen_cases(NTotal3,Query,Functions),
	trans_alg1(Query,"en",Lang,Query1),
	trans_alg1(Functions,"en",Lang,Functions1),
	(Debug=on->writeln1(Functions1);true),
	((international_lucianpl([lang,"en"],Debug,Query1,Functions1,Result),not(Result=[]))->(Score3 is Score1+1,writeln0([ssi_testopen,NTotal3,result,Result]),writeln0([ssi_test,NTotal3,passed]));(Score3=Score1,writeln0([ssi_testopen,NTotal3,failed]))).

ssi_test_all_bt000(test_open_types_cases,Debug,NTotal3,Score1,Score3,Lang) :-
	test_open_types_cases(NTotal3,Query,Types,Modes,Functions),
	trans_alg1(Query,"en",Lang,Query1),
	%trans_alg1(Types,"en",Lang,Types1),

	findall([F1|Types00],(member([F1|Types003],Types),
	
	expand_types1(Types003,[],Types00)),Types004),
	
	%Types004=[[[n, find_record], [[t, brackets], [[[t, list], [[t, number], [t, string]]], [t, number], [t, string]]]]],

	trans_alg1(Types004,"en",Lang,Types005),%,expand_types1(Types002,[],Types003),simplify_types(Types003,[],Types00)
	%),Types1),
	
	%simplify_types(Types01,[],Types1),%findall
	findall([F|Types100],(member([F|Types101],Types005),simplify_types(Types101,[],Types100)),Types1),
	
	trans_alg1(Modes,"en",Lang,Modes1),
	trans_alg1(Functions,"en",Lang,Functions1),
	(Debug=on->writeln1(Functions1);true),


((international_lucianpl([lang,"en"],Debug,Query1,Types1,Modes1,Functions1,Result),not(Result=[]))->(Score3 is Score1+1,writeln0([ssi_test_open_types,NTotal3,result,Result]),writeln0([ssi_test_open_types,NTotal3,passed]));(Score3=Score1,writeln0([ssi_test_open_types,NTotal3,failed]))).

trans_alg1(Query,"en",Lang,Query1) :-
	trans_alg(Query,"en",Lang,Query2),
	trans_alg(Query2,Lang,"en",Query1).
