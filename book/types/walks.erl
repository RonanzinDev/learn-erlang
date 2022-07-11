-module(walks).

-export([plan_route/2]).

% dizendo que se a função plan_router receber 2 argumentos do tipo point()
% , ela vai retornar um objeto do tipo router()
% From e To, são variaveis para ajudar o usuario a entender melhor
-spec plan_route(From :: point(), To :: point()) -> route().

-type direction() :: north | south | east | west.
-type point() :: {integer(), integer()}.
-type route() :: [{go, direction(), integer()}].

plan_route(Point1, Point2) ->
    [{go, east, Point1 + Point2}].
