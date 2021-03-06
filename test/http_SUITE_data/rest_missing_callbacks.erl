-module(rest_missing_callbacks).

-export([init/2]).
-export([allowed_methods/2]).
-export([content_types_accepted/2]).
-export([content_types_provided/2]).

init(Req, Opts) ->
	{cowboy_rest, Req, Opts}.

allowed_methods(Req, State) ->
	{[<<"GET">>, <<"PUT">>], Req, State}.

content_types_accepted(Req, State) ->
	cowboy_error_h:ignore(cowboy_rest, process_content_type, 3),
	{[
		{<<"application/json">>, put_application_json}
	], Req, State}.

content_types_provided(Req, State) ->
	cowboy_error_h:ignore(cowboy_rest, set_resp_body, 2),
	{[
		{<<"text/plain">>, get_text_plain}
	], Req, State}.
