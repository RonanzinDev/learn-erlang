-module(afile_server).
-export([start/1, loop/1]).

start(Dir) -> spawn(?MODULE, loop, [Dir]).

loop(Dir) ->
    receive
        {Client, list_dir} ->
            Client ! {self(), file:list_dir(Dir)};
        {Client, {get_file, File}} ->
            Full = filename:join(Dir, File),
            % aqui ele nos retorna uma mensagem(que no caso é para o shell)
            Client ! {self(), file:read_file(Full)}
    end,
    loop(Dir).
