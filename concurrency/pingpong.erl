-module(pingpong).

-export([start/0, ping/1, pong/0]).
% fazendo match quando a função receber 0 pings, assim enviando uma mensagem para a função
% pong(que é o Pong_PID) com o atom finished
ping(0) ->
    pong ! finished,
    io:format("ping finished ~n", []);
% Rebendo a quantidade de pings como parametro e enviando para a função pong o PID do ping e o atom ping
ping(N) ->
    pong ! {ping, self()},
    % recebendo a mensagem pong
    receive
        pong ->
            io:format("Ping received pong : ~w ~n", [N])
    end,
    %aqui tirando 1 da quantidade de ping até chegar a 0 e cair na função de cima
    ping(N - 1).

% A função pong pode receber duas mensagens, uma é o atom finished, e o outro é o atom ping
% e o PID da função ping. Assim que receber o ping e o pid a função manda uma mensagem para a função
% ping com o atom pong
pong() ->
    receive
        finished ->
            io:format("Pong finished", []);
        {ping, Ping_PID} ->
            io:format("Pong received ping ~n"),
            Ping_PID ! pong,
            pong()
    end.

start() ->
    % fazendo o registro do nome pong como um processo que tem um PID, e fazendo
    % a função pong ser responsavel por ela
    register(pong, spawn(?MODULE, pong, [])),
    %pong = spawn(pingpong, pong, []),
    spawn(?MODULE, ping, [100, pong]).
