-module(list_compression).
-export([example/0]).

example() ->
    L = [1, 2, 3, 4],
    % seria o mesmo que list:map(fun(X) -> X * 2 end, L)
    % X vai ser cada elemento da lista.
    % L é a list aque declaramos ali em cima
    % || significa um pattern matching em cada
    A = [X * 2 || X <- L],
    % Outro exemplo
    Buy = [{orange, 4}, {newpaper, 1}, {apple, 10}, {pears, 6}, {milk, 3}],
    B = [{Name, 2 * Number} || {Name, Number} <- Buy],
    [A, B].
