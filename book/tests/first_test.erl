-module(first_test).
-export([test/0, area/1]).

test() ->
    % fazendo patern matching. Se o resultado da função for 12 ele passa
    % se não retorna error.
    12 = area({rectangle, 3, 4}),
    144 = area({square, 12}),
    test_workded.

area({rectangle, Width, Heigth}) -> Width * Heigth;
area({square, Side}) -> Side * Side.
