-module(concurrency).
-export([start/0, loop/0]).
% Pid ! Msg  --------- Pid(processo identifier) é igual ao Id do processo,
% e Msg é a mensagem que queremos enviar para aquele processo

% Tbm temos a syntax de receiver(o que vai receber a mensagem. Assim é a sintaxe.
% receive
%   Messag1 -> ....;
%   Message2 -> ..
% end.

% uma descrição mais precisa seria dizer que send envia uma mensagem
% para a caixa de correio de um processo e que receive tenta remover uma mensagem do
% caixa de correio do processo atual.

start() ->
    spawn(concurrency, loop, []).

loop() ->
    receive
        {From, Message} ->
            From ! Message,
            loop()
    end.
