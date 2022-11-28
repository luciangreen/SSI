:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

% we need this module from the HTTP client library for http_read_data
:- use_module(library(http/http_client)).
:- http_handler('/', ssi_web_form, []).

%:-include('test_form1.pl').

%:- include('files/listprolog.pl').

ssi_server(Port) :-
        http_server(http_dispatch, [port(Port)]).

	/*
	browse http://127.0.0.1:8000/
	This demonstrates handling POST requests
	   */

	   ssi_web_form(_Request) :-
retractall(html_api_maker_or_terminal(_)),
assertz(html_api_maker_or_terminal(html
 %terminal
 )),
																										              format('Content-type: text/html~n~n', []),
																			
data(Header,Footer),

format(Header,[]),

Debug=off,

	%test_open_types_cases(4,Query,Types,Modes,Functions),

%international_lucianpl([lang,"en"],Debug,Query,Types,Modes,Functions,_Result),

testopen_cases(6,Query,Functions),
	%test(1,Query,Functions,Result),

% Form and HTML Table
%test1(Functions),	
%Query=[[n,test]],
	
	international_lucianpl([lang,"en"],Debug,Query,Functions,_Result1),


format(Footer,[])

																								      .

																								      :- http_handler('/landing', landing_pad, []).

																								      landing_pad(Request) :-
																								              member(method(post), Request), !,
																									              http_read_data(Request, Data, []),
				

				format('Content-type: text/html~n~n', []),
																											      	format('<p>', []),
																												        %%portray_clause(Data),
																												        
																												        %%term_to_atom(Term,Data),
	
		%format(Data,[])
																												        
%/*
Data=[%%debug='off',%%Debug1,
input=Input1,
ssi=Hidden1,submit=_],
%term_to_atom(Hidden1,Hidden),

%writeln(Data),
%*/
%/*

%writeln(Hidden1),
%writeln(Input1),

	%replace_new(Hidden1,"&quot;","\"",Hidden2),
	%replace_new(Input1,"&quot;","\"",Input2),

%writeln(Hidden2),
%writeln(Input2)
%/*
term_to_atom(Hidden11,Hidden1),

%writeln1([atom_string(Hidden11,Hidden1)]),

get_session(Hidden11,Session),

%/*
%term_to_atom(
Session=[Dbw_n,Dbw_read_string,Value1,Variable1,Line_number_b,Skip,lang(Lang),



debug2(Debug2),
debug3(Debug3),
debug4(Debug4),
retry_back(Retry_back),
retry_back_stack(Retry_back_stack),
retry_back_stack_n(Retry_back_stack_n),
cumulative_or_current_text(Cumulative_or_current_text),
number_of_current_text(Number_of_current_text),
html_api_maker_or_terminal(Html_api_maker_or_terminal),
pred_numbers(Pred_numbers),

pred_id(Pred_id),
types(Types),
typestatements(Typestatements),
modestatements(Modestatements),


	ssi1([Pred_id,Level,Predicate_number,A,"line",Query,
	Vars3,All_predicate_numbers], _End_result3, Functions,_Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3,
	CP_Vars3,CP_Vars2),
	
	ssi1([C,"line",Query,Vars1])],
	%Session), 
	%*/

%/*	
lang(Lang),

retractall(session_number(_)),assertz(session_number(Hidden11)),
retractall(debug2(_)),assertz(debug2(Debug2)),
retractall(debug3(_)),assertz(debug3(Debug3)),
retractall(debug4(_)),assertz(debug4(Debug4)),
retractall(retry_back(_)),assertz(retry_back(Retry_back)),
retractall(retry_back_stack(_)),assertz(retry_back_stack(Retry_back_stack)),
retractall(retry_back_stack_n(_)),assertz(retry_back_stack_n(Retry_back_stack_n)),
retractall(cumulative_or_current_text(_)),assertz(cumulative_or_current_text(Cumulative_or_current_text)),
retractall(number_of_current_text(_)),assertz(number_of_current_text(Number_of_current_text)),
retractall(html_api_maker_or_terminal(_)),assertz(html_api_maker_or_terminal(Html_api_maker_or_terminal)),
retractall(pred_numbers(_)),assertz(pred_numbers(Pred_numbers)),

retractall(pred_id(_)),assertz(pred_id(Pred_id)),
retractall(types(_)),assertz(types(Types)),
retractall(typestatements(_)),

	%findall([A,C],(member([A,B],TypeStatements),expand_types(B,[],C)),TypeStatements1),

assertz(typestatements(Typestatements)),
retractall(modestatements(_)),assertz(modestatements(Modestatements)),


atom_string(Input1,Value1A),
%*/

data(Header,Footer),
%/*
format(Header,[]),


	%test(1,Query,Functions,Result),
	%international_lucianpl([lang,"en"],Debug,Query,Functions,Result1),


%trace,

        ((val1emptyorvalsequal(Value1,Value1A),
        putvalue(Variable1,Value1A,Vars3,Vars2a))->
      (debug_exit(Skip,[[Dbw_n,Dbw_read_string],[Value1A]]),

 (var(Skip)->Globals3=Globals4;
 append(Globals3,[[[skip,Pred_id,Line_number_b],Skip]],Globals4)),
 
       %trace,
      	ssi1([Pred_id,Level,Predicate_number,A,"line",Query,
	Vars2a,All_predicate_numbers], _End_result31, Functions,_Vars21,
	Result1, Result2, 
	Globals4,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3,
	CP_Vars3,CP_Vars2)

      )
;     (debug_fail(Skip,[[Dbw_n,Dbw_read_string],[variable]]),

      	ssi1([Pred_id,Level,Predicate_number,C,"line",Query,
	Vars1,All_predicate_numbers], _End_result3, Functions,_Vars21,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3,
	CP_Vars3,CP_Vars2)


)),
%*/
format(Footer,[])
%*/
.
%term_to_atom(Debug2,'off'),
%term_to_atom(Query2,Query1),
%term_to_atom(Functions2,Functions1),

%international_interpret([lang,"en"],Debug2,Query2,Functions2,Result),
																														%%format('</p><p>========~n', []),
																															%%portray_clause
																															%portray_clause(result),
																																																															%%writeln1(Data),

%format('</p>').


data(Header,Footer) :-

Header='<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>State Saving Interpreter</title>
    <style type="text/css"> 
<!-- 

A:link {text-decoration: none;} 
A:visited {text-decoration: none;} 
A:hover {text-decoration: underline;} 

img {
 height: auto;
 max-width: 100%;
 object-fit: contain;
} 

table {table-layout: fixed; width: 100%;}

td {word-wrap: break-word;}

--> 
  </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">

  </head>
  <body style="background-color: rgb(255, 239, 227);">

   
    <div style="text-align: center;">
      <table width="80%">
        <tbody>
          <tr>
            <td>
              <p>',

Footer='</p>
            </td>
          </tr>
        </tbody>
      </table>
      <br>

    <br>
  </body>
</html>'.
