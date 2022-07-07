-module(testejs).

-export([start/0, increment/1]).

start() ->
  spawn(?MODULE, increment, [0]).

increment(Value) -> 
  receive
    {Pid, increment} ->
      Next = Value + 1,
      Pid ! {self(), Next},
      increment(Next);
    {_, stop} -> true
  end.
