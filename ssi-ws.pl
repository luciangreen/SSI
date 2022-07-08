#!/usr/bin/swipl -f -q

% Place in root directory, check paths below.

:- initialization main.

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

% we need this module from the HTTP client library for http_read_data
:- use_module(library(http/http_client)).
:- http_handler('/', web_form, []).

% GitHub/Algorithm-Writer-with-Lists/
:- include('GitHub2/SSI/ssi.pl').

main :-
	working_directory(_, 'GitHub2/SSI/'),

delete_old_sessions,
ssi_server(8007),sleep(86400).

main :- halt(1).

%server(Port) :-
%        http_server(http_dispatch, [port(Port)]).

	/*
	browse http://127.0.0.1:8000/
	This demonstrates handling POST requests
	   */

