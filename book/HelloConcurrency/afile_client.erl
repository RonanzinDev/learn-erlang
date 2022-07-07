-module(afile_client).
-export([ls/1, get_file/2]).

ls(Server) ->
    Server ! {self(), list_dir},
    receive
        {Server, FileList} -> FileList
    end.

get_file(Server, File) ->
    Server ! {self(), {get_file, File}},
    receive
        {Server, Content} -> Content
    end.

% Assim no shell
% c(afile_server). -- compilando o afile_server modulo
% c(afile_client). -- compilando o afile_client modulo
% FileServer = afile_server:start("."). -- Criando o processo file server que a função start chama
% afile_client:get_file(FileServer, "afile_server.erl").
% No codigo acima, estamos passando por paremetro servidor e o arquivo, e assim mandando uma
% mensagem para o servidor nos retornar o arquivo
% FileServer ! {self(), list_dir}. -- mandando uma mensagem para FileServer
% receive X -> X end. -- recebendo q mensagem que FileServer nos retornar
