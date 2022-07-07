-module(counter).

-export([start/0, increment/1, process/0]).

start() ->
    register(process1, spawn(counter, process, [])),
    spawn(counter, increment, [0]).

process() ->
    receive
        {Increment_PID, Value} ->
            Increment_PID ! increment,
            io:format("~w", [Value]);
        finished ->
            io:format("Finished...", [])
    end.

increment(100) ->
    process1 ! finished;
increment(Val) ->
    receive
        increment ->
            process ! {self(), Val},
            increment(Val + 1)
    end.
