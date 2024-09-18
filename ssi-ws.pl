#!/usr/bin/swipl -f -q

% Place in root directory, check paths below.

% run with swipl ssi-ws.pl in e.g. crontab -e

:- initialization main.

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

% we need this module from the HTTP client library for http_read_data
:- use_module(library(http/http_client)).
:- http_handler('/', web_form, []).

% GitHub/Algorithm-Writer-with-Lists/
:-include('GitHub/SSI/ssi.pl').

main :-
	working_directory(_, 'GitHub/SSI/'),

delete_old_sessions,
ssi_server(8000),sleep(86390),halt.

main :- halt(1).

%server(Port) :-
%        http_server(http_dispatch, [port(Port)]).

	/*
	browse http://127.0.0.1:8000/
	This demonstrates handling POST requests
	   */

