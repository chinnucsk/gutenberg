#!/usr/bin/env escript
%%! -pz deps/riakc/ebin -pz deps/protobuffs/ebin -pz ebin
%% -*- mode: erlang; -*-

-define(BOOKS, [{<<"book">>,<<"adventures-of-huckleberry-finn">>},
                {<<"book">>,<<"the-adventures-of-tom-sawyer">>},
                {<<"book">>,<<"around-the-world-in-80-days">>},
                {<<"book">>,<<"peter-pan">>},
                {<<"book">>,<<"alices-adventures-in-wonderland">>},
                {<<"book">>,<<"the-importance-of-being-earnest">>},
                {<<"book">>,<<"the-three-musketeers">>},
                {<<"book">>,<<"paradise-lost">>},
                {<<"book">>,<<"the-count-of-monte-cristo">>},
                {<<"book">>,<<"anne-of-green-gables">>},
                {<<"book">>,<<"the-jungle-book">>},
                {<<"book">>,<<"oliver-twist">>},
                {<<"book">>,<<"the-war-of-the-worlds">>},
                {<<"book">>,<<"pride-and-prejudice">>},
                {<<"book">>,<<"the-tale-of-peter-rabbit">>},
                {<<"book">>,<<"war-and-peace">>},
                {<<"book">>,<<"moby-dick">>},
                {<<"book">>,<<"the-odyssey-of-homer">>},
                {<<"book">>,<<"the-wonderful-wizard-of-oz">>},
                {<<"book">>,<<"treasure-island">>},
                {<<"book">>,<<"the-return-of-sherlock-holmes">>},
                {<<"book">>,<<"sense-and-sensibility">>},
                {<<"book">>,<<"through-the-looking-glass">>},
                {<<"book">>,<<"hamlet">>},
                {<<"book">>,<<"walden">>},
                {<<"book">>,<<"frankenstein">>}]).

-define(MAP_WORDS, {map, {modfun, gutenberg, map_words}, none, false}).
-define(REDUCE_COUNT, {reduce, {modfun, gutenberg, reduce_count}, none, true}).
-define(REDUCE_SET_UNION, {reduce, {modfun, riak_kv_mapreduce, reduce_set_union},
                           none, true}).
-define(REDUCE_SORT, {reduce, {modfun, riak_kv_mapreduce, reduce_sort},
                      none, true}).

-define(COUNT_QUERY, [?MAP_WORDS, ?REDUCE_COUNT]).
-define(SET_UNION_QUERY, [?MAP_WORDS, ?REDUCE_SET_UNION, ?REDUCE_SORT]).

mapred(Query) ->
    {ok, Pid} = riakc_pb_socket:start_link("127.0.0.1", 8087),
    io:fwrite(" Query: ~p~n", [Query]),
    Results = riakc_pb_socket:mapred(Pid, ?BOOKS, Query, 120000),
    io:fwrite("Result: ~p~n", [Results]),
    riakc_pb_socket:stop(Pid).

main(["count"]) ->
    mapred(?COUNT_QUERY);

main(["set"]) ->
    mapred(?SET_UNION_QUERY);

main(_) ->
    io:format("usage: test.escript count|set\n"),
    halt(1).
