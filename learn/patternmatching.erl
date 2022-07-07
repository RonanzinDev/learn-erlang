-module(patternmatching).
-export([area/1]).
% se receber um atom square ele vai parar nesse, e assim por diante

area({square, Side}) ->
    Side * Side;
area({rectangle, X, Y}) ->
    X * Y;
area({cicle, Radius}) ->
    Radius * Radius * 3.14;
area({triangle, A, B, C}) ->
    S = (A + B + C) / 2,
    math:sqrt(S * (S - A) * (S - B) * (S - C)).
