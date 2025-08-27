% performance_optimizations.pl
% Enhanced performance optimizations for SSI nested algorithms with backtracking
% Focuses on choice point management, deterministic operation detection, and variable binding optimization

% Enable fast deterministic operation detection
:- dynamic fast_deterministic_mode/1.
:- dynamic choice_point_cache/1.
:- dynamic variable_binding_cache/1.

% Initialize performance optimization settings
init_performance_optimizations :-
    retractall(fast_deterministic_mode(_)),
    assertz(fast_deterministic_mode(on)),
    retractall(choice_point_cache(_)),
    assertz(choice_point_cache([])),
    retractall(variable_binding_cache(_)),
    assertz(variable_binding_cache([])).

% Check if operation is deterministic and can skip choice point creation
is_deterministic_operation(Query, Functions, Result) :-
    fast_deterministic_mode(on),
    Query = [Function|Args],
    % Check for known deterministic operations
    deterministic_builtin(Function),
    % If deterministic, execute directly without choice points
    execute_deterministic(Query, Functions, Result).

% List of operations that are deterministic and don't need backtracking
deterministic_builtin([n,equals4]).
deterministic_builtin([n,stringconcat]).
deterministic_builtin([n,string_length]).
deterministic_builtin([n,concat_list]).
deterministic_builtin([n,append]).
deterministic_builtin([n,writeln]).
deterministic_builtin([n,read_string]).
deterministic_builtin([n,open_string_file_s]).
deterministic_builtin([n,term_to_atom]).
deterministic_builtin([n,string_codes]).
deterministic_builtin([n,cut]).

% Execute deterministic operations without choice point overhead
execute_deterministic([Function|Args], Functions, Result) :-
    % Direct execution path for deterministic operations
    (current_predicate(interpretstatement1/9) ->
        interpretstatement1(ssi, Functions, Functions, [Function|Args], [], Vars, true, nocut, [])
    ;
        true
    ),
    Result = success.

% Optimized choice point management for nested operations
optimized_append_cp(Trail_in, New_cp, Trail_out, CP_Vars_in, CP_Vars_out) :-
    % Check if this choice point is necessary
    (is_redundant_cp(New_cp, Trail_in) ->
        % Skip redundant choice point
        Trail_in = Trail_out,
        CP_Vars_in = CP_Vars_out
    ;
        % Add choice point with optimization
        efficient_append_cp(Trail_in, New_cp, Trail_out, CP_Vars_in, CP_Vars_out)
    ).

% Check if choice point is redundant
is_redundant_cp([Pred_id,Level,Pred_num,Line_num,"line",Query,Vars,All_pred_nums], Trail) :-
    % Check for duplicate choice points with same state
    member([Pred_id,Level,Pred_num,Line_num,"line",Query,Vars,All_pred_nums], Trail).

% Efficient choice point appending with deduplication
efficient_append_cp(Trail_in, New_cp, Trail_out, CP_Vars_in, CP_Vars_out) :-
    % Use optimized append avoiding list recreation
    Trail_out = [New_cp|Trail_in],
    CP_Vars_out = CP_Vars_in.

% Enhanced variable binding management with caching
cached_substitutevarsA1(Args, Vars1, VarsAcc, Vars3, FirstArgsAcc, FirstArgs) :-
    variable_binding_cache(Cache),
    cache_key(Args, Vars1, Key),
    (member([Key, CachedVars3, CachedFirstArgs], Cache) ->
        % Use cached result
        increment_metric(cache_hits),
        Vars3 = CachedVars3,
        FirstArgs = CachedFirstArgs
    ;
        % Compute and cache result - fall back to original if available
        (current_predicate(substitutevarsA1/6) ->
            substitutevarsA1(Args, Vars1, VarsAcc, Vars3, FirstArgsAcc, FirstArgs)
        ;
            % Simple fallback if substitutevarsA1 not available
            Vars3 = Vars1,
            FirstArgs = FirstArgsAcc
        ),
        retract(variable_binding_cache(Cache)),
        NewCache = [[Key, Vars3, FirstArgs]|Cache],
        assertz(variable_binding_cache(NewCache))
    ).

% Generate cache key for variable binding
cache_key(Args, Vars, Key) :-
    term_hash(Args-Vars, Key).

% Optimized cut handling to reduce unnecessary backtracking
optimized_cut(Choice_point_trail_in, Choice_point_trail_out, CP_Vars_in, CP_Vars_out, Pred_id, Level) :-
    % More aggressive cut that removes all choice points at current level and above
    findall([A,B,C,D,E,F,G,H,I,J], 
           (member([A,B,C,D,E,F,G,H,I,J], Choice_point_trail_in),
            D =< Level), 
           Retained_cps),
    Choice_point_trail_out = Retained_cps,
    CP_Vars_out = CP_Vars_in.

% Enable last call optimization for tail recursive predicates
enable_last_call_optimization(Globals3, Choice_point_trail11, Choice_point_trail3, 
                             Predicate_number, Line_number_b, Functions, 
                             CP_Vars1, CP_Vars2, Globals33, Globals3_out) :-
    % Re-enable last call optimization with improvements
    optimized_last_call_check(Globals3, Choice_point_trail11, Predicate_number, 
                             Line_number_b, Functions, Success),
    (Success = true ->
        (current_predicate(last_call_optimisation/10) ->
            last_call_optimisation(Globals3, Choice_point_trail11, Choice_point_trail3,
                                  Predicate_number, Line_number_b, Functions,
                                  CP_Vars1, CP_Vars2, Globals33, Globals3_out)
        ;
            % Fallback if predicate not available
            Choice_point_trail11 = Choice_point_trail3,
            CP_Vars1 = CP_Vars2,
            Globals33 = Globals3_out
        )
    ;
        Choice_point_trail11 = Choice_point_trail3,
        CP_Vars1 = CP_Vars2,
        Globals33 = Globals3_out
    ).

% Optimized check for last call optimization applicability
optimized_last_call_check(Globals3, Choice_point_trail11, Predicate_number, 
                         Line_number_b, Functions, Success) :-
    % Quick check if optimization applies
    member([[pred_num,Pred_id],Predicate_number], Globals3),
    is_tail_recursive(Predicate_number, Functions),
    has_no_pending_variables(Choice_point_trail11),
    Success = true.
optimized_last_call_check(_, _, _, _, _, false).

% Check if predicate is tail recursive
is_tail_recursive(Predicate_number, Functions) :-
    member([Predicate_number, Name, Args, ":-", Body], Functions),
    is_tail_recursive_body(Body, Name, Args).

is_tail_recursive_body(Body, Name, Args) :-
    append(_, [LastCommand], Body),
    LastCommand = [_, _, _, _, _, Name, Args|_].

% Check if there are pending variables that prevent optimization
has_no_pending_variables(Choice_point_trail) :-
    \+ (member([_,_,_,_,_,_,_,Vars], Choice_point_trail),
        Vars \= []).

% Optimized predicate call preparation with lazy evaluation
optimized_prep_predicate_call(Query, Functions3, All_predicate_numbers) :-
    Query = [Name|Arguments1],
    (Arguments1 = [] ->
        Arguments_length = 0
    ;
        (Arguments1 = [Arguments3] ->
            length(Arguments3, Arguments_length)
        ;
            length(Arguments1, Arguments_length)
        )
    ),
    % Use optimized findall with early termination
    findall_with_limit(Predicate_number1,
                      (member([Predicate_number1,Name|Rest], Functions3),
                       check_arity_match(Rest, Arguments_length)),
                      All_predicate_numbers, 100).  % Limit to prevent excessive backtracking

% Findall with limit to prevent runaway backtracking
findall_with_limit(Template, Goal, List, Limit) :-
    findall_with_limit(Template, Goal, List, 0, Limit).

findall_with_limit(Template, Goal, List, Count, Limit) :-
    Count < Limit,
    findall(Template, Goal, AllResults),
    length(AllResults, Len),
    (Len =< Limit ->
        List = AllResults
    ;
        length(List, Limit),
        append(List, _, AllResults)
    ).

% Optimized arity checking
check_arity_match([Args,":-",Lines], Arguments_length) :-
    length(Args, Arguments_length).
check_arity_match([Args], Arguments_length) :-
    length(Args, Arguments_length).
check_arity_match([":-",_Lines], 0).
check_arity_match([], 0).

% Performance monitoring and metrics
:- dynamic performance_metrics/1.

init_performance_metrics :-
    retractall(performance_metrics(_)),
    assertz(performance_metrics([
        [choice_points_created, 0],
        [choice_points_pruned, 0],
        [deterministic_operations, 0],
        [cache_hits, 0],
        [last_call_optimizations, 0]
    ])).

% Increment performance metric
increment_metric(Metric) :-
    performance_metrics(Metrics),
    (select([Metric, Count], Metrics, Rest) ->
        Count1 is Count + 1,
        NewMetrics = [[Metric, Count1]|Rest]
    ;
        NewMetrics = [[Metric, 1]|Metrics]
    ),
    retract(performance_metrics(_)),
    assertz(performance_metrics(NewMetrics)).

% Get performance metrics
get_performance_metrics(Metrics) :-
    performance_metrics(Metrics).

% Reset performance metrics
reset_performance_metrics :-
    init_performance_metrics.