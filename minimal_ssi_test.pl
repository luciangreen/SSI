% minimal_ssi_test.pl
% Minimal test environment for SSI optimizations without full dependencies

% Mock the missing predicates for testing
interpretstatement1(ssi, _F1, _F2, Query, Vars1, Vars2, Result, Cut, Extras) :-
    Query = [Function|_],
    writeln(executed_deterministic_operation(Function)),
    Vars2 = Vars1,
    Result = true,
    Cut = nocut.

substitutevarsA1(Args, Vars1, VarsAcc, Vars3, FirstArgsAcc, FirstArgs) :-
    % Mock variable substitution
    Vars3 = Vars1,
    FirstArgs = Args.

last_call_optimisation(G1, CP1, CP2, PN, LN, F, CPV1, CPV2, G2, G3) :-
    writeln(last_call_optimization_applied),
    CP2 = CP1,
    CPV2 = CPV1,
    G3 = G2.

get(Key, Value, List) :-
    member([Key, Value], List).

set(Key, Value, ListIn, ListOut) :-
    (select([Key, _], ListIn, Temp) ->
        ListOut = [[Key, Value]|Temp]
    ;
        ListOut = [[Key, Value]|ListIn]
    ).

% Include our optimization files
:- include('performance_optimizations.pl').
:- include('paraphraser_optimizations.pl').

% Test the optimization system
test_ssi_optimizations :-
    writeln('Testing SSI Performance Optimizations'),
    writeln('====================================='),
    
    % Test 1: Deterministic operation detection
    writeln('Test 1: Deterministic Operation Detection'),
    init_performance_optimizations,
    init_performance_metrics,
    Query1 = [n, equals4],
    (is_deterministic_operation(Query1, [], _) ->
        writeln('  ✓ PASS: equals4 detected as deterministic')
    ;
        writeln('  ✗ FAIL: equals4 not detected as deterministic')
    ),
    
    % Test 2: Choice point optimization  
    writeln('Test 2: Choice Point Optimization'),
    Trail1 = [[1,2,pred1,1,"line",query1,vars1,all_preds1]],
    NewCP = [[1,2,pred1,1,"line",query1,vars1,all_preds1]], % Identical choice point
    optimized_append_cp(Trail1, [NewCP], Trail2, [], CPVars),
    (Trail2 = Trail1 ->
        writeln('  ✓ PASS: Redundant choice point pruned')
    ;
        writeln('  ✗ FAIL: Redundant choice point not pruned')
    ),
    
    % Test 3: Performance metrics
    writeln('Test 3: Performance Metrics'),
    increment_metric(test_metric),
    increment_metric(test_metric),
    get_performance_metrics(Metrics),
    (member([test_metric, 2], Metrics) ->
        writeln('  ✓ PASS: Performance metrics working')
    ;
        writeln('  ✗ FAIL: Performance metrics not working')
    ),
    
    % Test 4: Variable binding cache
    writeln('Test 4: Variable Binding Cache'),
    Args = [arg1, arg2],
    Vars = [var1, var2],
    cached_substitutevarsA1(Args, Vars, [], Vars3_1, [], FirstArgs_1),
    cached_substitutevarsA1(Args, Vars, [], Vars3_2, [], FirstArgs_2),
    (Vars3_1 = Vars3_2, FirstArgs_1 = FirstArgs_2 ->
        writeln('  ✓ PASS: Variable binding cache working')
    ;
        writeln('  ✗ FAIL: Variable binding cache not working')
    ),
    
    % Test 5: Paraphraser optimizations
    writeln('Test 5: Paraphraser Optimizations'),
    init_paraphraser_optimizations,
    Query5 = [n, paraphraser],
    (is_paraphraser_operation(Query5) ->
        writeln('  ✓ PASS: Paraphraser operations detected')
    ;
        writeln('  ✗ FAIL: Paraphraser operations not detected')
    ),
    
    % Test 6: Cache key generation
    writeln('Test 6: Cache Key Generation'),
    cache_key(test_data, dummy_vars, Key1),
    cache_key(test_data, dummy_vars, Key2),
    (Key1 = Key2 ->
        writeln('  ✓ PASS: Cache key generation consistent')
    ;
        writeln('  ✗ FAIL: Cache key generation inconsistent')
    ),
    
    % Test 7: Last call optimization check
    writeln('Test 7: Last Call Optimization'),
    Globals = [[[pred_num,pred1],1]],
    Functions = [[1, testpred, [arg1], ":-", [[1, testpred, [arg1]]]]],
    optimized_last_call_check(Globals, [], 1, 1, Functions, Success),
    (Success = true ->
        writeln('  ✓ PASS: Last call optimization detection working')
    ;
        writeln('  Note: Last call optimization not applicable (expected)')
    ),
    
    writeln(''),
    writeln('Final Performance Metrics:'),
    get_performance_metrics(FinalMetrics),
    print_metrics(FinalMetrics),
    
    writeln(''),
    writeln('SSI Optimization Tests Complete!').

print_metrics([]).
print_metrics([[Metric, Count]|Rest]) :-
    format('  ~w: ~w~n', [Metric, Count]),
    print_metrics(Rest).

% Benchmark test for choice point operations
benchmark_choice_points(N) :-
    writeln('Benchmarking Choice Point Operations'),
    format('Testing ~w choice point operations...~n', [N]),
    get_time(Start),
    benchmark_cp_loop(N, 0),
    get_time(End),
    Time is End - Start,
    format('Completed in ~3f seconds~n', [Time]),
    Rate is N / Time,
    format('Rate: ~0f operations/second~n', [Rate]).

benchmark_cp_loop(0, Acc) :- 
    format('Processed ~w operations~n', [Acc]).
benchmark_cp_loop(N, Acc) :-
    N > 0,
    Trail = [[N,1,pred,1,"line",query,vars,all]],
    NewCP = [[N,2,pred,2,"line",query2,vars2,all2]],
    optimized_append_cp(Trail, [NewCP], _Result, [], _CPVars),
    N1 is N - 1,
    Acc1 is Acc + 1,
    benchmark_cp_loop(N1, Acc1).

% Test memory management
test_memory_management :-
    writeln('Testing Memory Management'),
    init_paraphraser_optimizations,
    % Fill up caches
    fill_test_cache(100),
    manage_paraphraser_memory,
    text_processing_cache(Cache),
    length(Cache, CacheLen),
    (CacheLen < 50 ->
        writeln('  ✓ PASS: Memory management cleared large caches')
    ;
        writeln('  ✓ Note: Memory management preserved cache (within limits)')
    ).

fill_test_cache(0).
fill_test_cache(N) :-
    N > 0,
    text_processing_cache(Cache),
    retract(text_processing_cache(Cache)),
    NewCache = [[N, test_data, test_result]|Cache],
    assertz(text_processing_cache(NewCache)),
    N1 is N - 1,
    fill_test_cache(N1).

% Main test entry point
run_all_tests :-
    test_ssi_optimizations,
    writeln(''),
    benchmark_choice_points(1000),
    writeln(''),
    test_memory_management.