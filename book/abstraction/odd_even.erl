-module(odd_even).
-export([odds_and_evens2/1]).
% passamos qualquer lista pro parametro, por exemplo [1,2,3,4,5,6]
odds_and_evens2(L) ->
    odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H | T], Odds, Evens) ->
    case (H rem 2) of
        % Na primeira passagem T vai ser [2,3,4,5,6], H vai ser 1 e o Odds e Evens vai ser []
        % Na segunda Odds vai Odds vai ser [1] e por ai vai indo
        1 -> odds_and_evens_acc(T, [H | Odds], Evens);
        0 -> odds_and_evens_acc(T, Odds, [H | Evens])
    end;
odds_and_evens_acc([], Odds, Evens) ->
    {Odds, Evens}.
