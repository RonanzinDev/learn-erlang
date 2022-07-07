% ESSE É PARA ANOTAR ALGUMAS COISAS DE LISTA
-module(listas).

% Uma função recursiva que ira multiplicar todos os elementos por
% Só vai funcionar se não tiver listas dentro da lista passado no parametro.
double([Head | Tail]) when integer(H) ->
  [2 * H | double(T)];

double([Head | Tail]) when list(H) ->
  [double(H) | double(T)];

double([]) -> 
  [].
