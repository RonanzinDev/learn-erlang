-module(fatorial).
-export([factorial/1]).
% tambe pode ser escrito assim:
% factorial(N) when N == 0 -> 1;
factorial(0) -> 1;
% factorial(N) when N > 0 -> N * factorial(N - 1).
factorial(N) -> N * factorial(N - 1).
