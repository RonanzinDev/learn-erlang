-module(for_loop).
-export([for/3]).

for(Max, Max, F) -> [F(Max)];
% Aqui por exemplo se passarmos for(1,10,fun(I) -> I end)., ira criar uma lista [F(1), F(2),...,F(10)]
% ou podemos ter essa lista toda ao quadrado. Ex: for(1,10, fun(I) -> I * I end).
for(I, Max, F) -> [F(I)| for(I+1, Max, F)].


