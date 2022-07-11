-module(mylists).

-export([sum/1, map/2]).

sum([H | T]) ->
  H + sum(T);
sum([]) ->
  0.

% lendaria funÃ§Ã£o map que nos salva sempre no Fsharp
map(_, []) ->
  [];
map(F, [H | T]) ->
  [F(H) | map(F, T)].
