% performance_test.pl
% Tests for SSI performance optimizations

% Test deterministic operation detection
test_deterministic_detection :-
    init_performance_optimizations,
    init_performance_metrics,
    Query = [n, equals4],
    (is_deterministic_operation(Query, [], _) ->
        writeln('PASS: Deterministic operation detection works')
    ;
        writeln('FAIL: Deterministic operation detection failed')
    ).

% Test choice point optimization
test_choice_point_optimization :-
    init_performance_optimizations,
    init_performance_metrics,
    Trail1 = [[1,2,pred1,1,"line",query1,vars1,all_preds1]],
    NewCP = [[1,2,pred1,1,"line",query1,vars1,all_preds1]],  % Same choice point
    optimized_append_cp(Trail1, [NewCP], Trail2, [], CP_Vars),
    (Trail2 = Trail1 ->
        writeln('PASS: Redundant choice point pruning works')
    ;
        writeln('FAIL: Choice point optimization failed')
    ).

% Test variable binding cache
test_variable_cache :-
    init_performance_optimizations,
    init_performance_metrics,
    Args = [arg1, arg2],
    Vars = [var1, var2],
    % First call should compute and cache
    cached_substitutevarsA1(Args, Vars, [], Vars3_1, [], FirstArgs_1),
    % Second call should use cache
    cached_substitutevarsA1(Args, Vars, [], Vars3_2, [], FirstArgs_2),
    (Vars3_1 = Vars3_2, FirstArgs_1 = FirstArgs_2 ->
        writeln('PASS: Variable binding cache works')
    ;
        writeln('FAIL: Variable binding cache failed')
    ).

% Test paraphraser optimization detection
test_paraphraser_optimization :-
    init_paraphraser_optimizations,
    Query = [n, paraphraser],
    (is_paraphraser_operation(Query) ->
        writeln('PASS: Paraphraser operation detection works')
    ;
        writeln('FAIL: Paraphraser operation detection failed')
    ).

% Test performance metrics
test_performance_metrics :-
    init_performance_metrics,
    increment_metric(choice_points_created),
    increment_metric(choice_points_created),
    increment_metric(deterministic_operations),
    get_performance_metrics(Metrics),
    (member([choice_points_created, 2], Metrics),
     member([deterministic_operations, 1], Metrics) ->
        writeln('PASS: Performance metrics tracking works')
    ;
        writeln('FAIL: Performance metrics tracking failed')
    ).

% Test text processing cache
test_text_cache :-
    init_paraphraser_optimizations,
    Text = "hello world",
    Seps = " ",
    % This would normally call split_on_substring117a
    % For testing, we'll just test the cache mechanism
    cache_key(split_test(Text, Seps), Key1),
    cache_key(split_test(Text, Seps), Key2),
    (Key1 = Key2 ->
        writeln('PASS: Text processing cache key generation works')
    ;
        writeln('FAIL: Text processing cache key generation failed')
    ).

% Run all performance tests
run_performance_tests :-
    writeln('Running SSI Performance Optimization Tests...'),
    writeln(''),
    test_deterministic_detection,
    test_choice_point_optimization,
    test_variable_cache,
    test_paraphraser_optimization,
    test_performance_metrics,
    test_text_cache,
    writeln(''),
    writeln('Performance tests completed.').

% Benchmark test for nested operations
benchmark_nested_operations(N, Time) :-
    init_performance_optimizations,
    init_performance_metrics,
    get_time(Start),
    benchmark_nested_loop(N),
    get_time(End),
    Time is End - Start.

benchmark_nested_loop(0) :- !.
benchmark_nested_loop(N) :-
    N > 0,
    % Simulate nested operations
    increment_metric(choice_points_created),
    increment_metric(deterministic_operations),
    Query = [n, equals4],
    is_deterministic_operation(Query, [], _),
    N1 is N - 1,
    benchmark_nested_loop(N1).

% Display performance statistics
show_performance_stats :-
    get_performance_metrics(Metrics),
    writeln('Performance Statistics:'),
    member([Metric, Count], Metrics),
    format('  ~w: ~w~n', [Metric, Count]),
    fail.
show_performance_stats.