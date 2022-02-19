:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

% we need this module from the HTTP client library for http_read_data
:- use_module(library(http/http_client)).
:- http_handler('/', ssi_web_form, []).

%:- include('files/listprolog.pl').

ssi_server(Port) :-
        http_server(http_dispatch, [port(Port)]).

	/*
	browse http://127.0.0.1:8000/
	This demonstrates handling POST requests
	   */

	   ssi_web_form(_Request) :-
	   
																										              format('Content-type: text/html~n~n', []),
																			
data(Header,Footer),

format(Header,[]),

Debug=off,

	test_open_types_cases(4,Query,Types,Modes,Functions),

international_lucianpl([lang,"en"],Debug,Query,Types,Modes,Functions,_Result),

	%test(1,Query,Functions,Result),
	%international_lucianpl([lang,"en"],Debug,Query,Functions,Result1),


format(Footer,[])

/*format('
	   
	   <form action="/landing" method="POST">
  <label for=query>Query (e.g. [[n,reverse],[[1,2,3],[],[v,l]]]):</label>
  <input type=text id=query name=query><br><br>
  <label for=functions>Functions (e.g. [
[[n,reverse],[[],[v,l],[v,l]]],
[[n,reverse],[[v,l],[v,m],[v,n]],":-",
[[[n,head],[[v,l],[v,h]]],
[[n,tail],[[v,l],[v,t]]],
[[n,wrap],[[v,h],[v,h1]]],
[[n,append],[[v,h1],[v,m],[v,o]]],
[[n,reverse],[[v,t],[v,o],[v,n]]]
]
]
]):</label>
  <input type=text id=functions name=functions><br><br>
  <input type=submit name=submit value=\'Submit\'>
</form>
', [])
*/

/*
	   	reply_html_page(
			    title('State Saving Interpreter'),

% run ssi until input needed
% data hidden
			    	    [
				    	     form([action='/landing', method='POST'], [
													      		p([], [
																	  label([for=query],'Query (e.g. [[n,reverse],[[1,2,3],[],[v,l]]]):'),
																	  		  input([name=query, type=textarea])
																			  		      ]),
													      		p([], [
																	  label([for=functions],'Functions (e.g. [
[[n,reverse],[[],[v,l],[v,l]]],
[[n,reverse],[[v,l],[v,m],[v,n]],":-",
[[[n,head],[[v,l],[v,h]]],
[[n,tail],[[v,l],[v,t]]],
[[n,wrap],[[v,h],[v,h1]]],
[[n,append],[[v,h1],[v,m],[v,o]]],
[[n,reverse],[[v,t],[v,o],[v,n]]]
]
]
]):'),
																	  		  input([name=functions, type=textarea])
																			  		      ]),
																					      		p([], input([name=submit, type=submit, value='Submit'], []))
																								      ])])
																								      
																								      */
																								      .

																								      :- http_handler('/landing', landing_pad, []).

																								      landing_pad(Request) :-
																								              member(method(post), Request), !,
																									              http_read_data(Request, Data, []),
				
				%Hidden1='[empty,[v,a],1,false,lang("en"),debug2(off),debug3(off),debug4(off),retry_back(on),retry_back_stack([[1,[ssi,[[["prev_pred_id",0],1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[],[]],_71770,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],_72624,[],_72636,[],_72648,[],_72660,[[curr_cp,0],[curr_cp_index,0]],_72708]]],[2,[ssi,[[1,1,0,0,"line",-,[[[v,a],empty],[[v,b],empty]],[]],_72864,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],_73718,[],_73730,[[[firstargs,1],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,1],[n,query_box_1]],[[arguments1,1],[[v,a],[v,b]]],[[skip,1],false],[[level,1],1],[[pred_num,1],0],[pred_id_chain,0,1]],_74078,[[1,2,1,1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]]],_74284,["appearance of command",-],[[min_cp,1],[max_cp,2],[curr_cp,2],[curr_cp_index,2]],_74396]]],[3,[ssi,[[["prev_pred_id",1],2,1,-1,"predicate",[[n,cultivate_person],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]],_74634,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],_75488,[],_75500,[[[firstargs,1],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,1],[n,query_box_1]],[[arguments1,1],[[v,a],[v,b]]],[[skip,1],false],[[level,1],1],[[pred_num,1],0],[pred_id_chain,0,1],[[vars1,1],[[[v,a],empty],[[v,b],empty]]],[[firstargs_uv2,1],[[v,a],[v,b]]]],_76004,[[1,2,1,1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]],[2,3,1,1,0,["returns to",0,"pred_id",1],"predicate",-,[[[v,a],empty],[[v,b],empty]],[]]],_76384,[[min_cp,1],[max_cp,3],[curr_cp,3],[curr_cp_index,3]],_76468]]],[4,[ssi,[[2,2,1,0,"line",-,[[[v,a],empty],[[v,b],empty]],[]],_76624,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],_77478,[],_77490,[[[firstargs,1],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,1],[n,query_box_1]],[[arguments1,1],[[v,a],[v,b]]],[[skip,1],false],[[level,1],1],[[pred_num,1],0],[pred_id_chain,0,1],[[vars1,1],[[[v,a],empty],[[v,b],empty]]],[[firstargs_uv2,1],[[v,a],[v,b]]],[[firstargs,2],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,2],[n,cultivate_person]],[[arguments1,2],[[v,a],[v,b]]],[[skip,2],false],[[level,2],2],[[pred_num,2],1],[pred_id_chain,1,2]],_78330,[[1,2,1,1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]],[2,3,1,1,0,["returns to",0,"pred_id",1],"predicate",-,[[[v,a],empty],[[v,b],empty]],[]],[3,4,2,2,1,-1,"predicate",[[n,cultivate_person],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]]],_78904,["appearance of command",-],[[min_cp,1],[max_cp,4],[curr_cp,4],[curr_cp_index,4]],_79016]]],[5,[ssi,[[2,2,1,1,"line",-,[[[v,a],empty],[[v,b],empty]],[]],_79172,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],_80026,[],_80038,[[[firstargs,1],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,1],[n,query_box_1]],[[arguments1,1],[[v,a],[v,b]]],[[skip,1],false],[[level,1],1],[[pred_num,1],0],[pred_id_chain,0,1],[[vars1,1],[[[v,a],empty],[[v,b],empty]]],[[firstargs_uv2,1],[[v,a],[v,b]]],[[firstargs,2],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,2],[n,cultivate_person]],[[arguments1,2],[[v,a],[v,b]]],[[skip,2],false],[[level,2],2],[[pred_num,2],1],[pred_id_chain,1,2],[[vars1,2],[[[v,a],empty],[[v,b],empty]]]],_80968,[[1,2,1,1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]],[2,3,1,1,0,["returns to",0,"pred_id",1],"predicate",-,[[[v,a],empty],[[v,b],empty]],[]],[3,4,2,2,1,-1,"predicate",[[n,cultivate_person],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]]],_81542,["appearance of command",-],[[min_cp,1],[max_cp,4],[curr_cp,4],[curr_cp_index,4]],_81654]]]]),retry_back_stack_n(5),cumulative_or_current_text(current),number_of_current_text(1),html_api_maker_or_terminal(html),pred_numbers([[[n,cultivate_person],2,[1]],[[n,query_box_1],2,[0]]]),pred_id(2),types(on),typestatements([[[n,cultivate_person],[[t,string],[t,string]]]]),modestatements([[[n,cultivate_person],[output,output]]]),ssi1([2,2,1,2,"line",-,_82116,[]],_82050,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],_23438,[],_23312,[[[firstargs,1],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,1],[n,query_box_1]],[[arguments1,1],[[v,a],[v,b]]],[[skip,1],false],[[level,1],1],[[pred_num,1],0],[pred_id_chain,0,1],[[vars1,1],[[[v,a],empty],[[v,b],empty]]],[[firstargs_uv2,1],[[v,a],[v,b]]],[[firstargs,2],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,2],[n,cultivate_person]],[[arguments1,2],[[v,a],[v,b]]],[[skip,2],false],[[level,2],2],[[pred_num,2],1],[pred_id_chain,1,2],[[vars1,2],[[[v,a],empty],[[v,b],empty]]],[[vars1,2],[[[v,a],empty],[[v,b],empty]]]],_23462,[[1,2,1,1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]],[2,3,1,1,0,["returns to",0,"pred_id",1],"predicate",-,[[[v,a],empty],[[v,b],empty]],[]],[3,4,2,2,1,-1,"predicate",[[n,cultivate_person],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]]],_23474,[[min_cp,1],[max_cp,4],[curr_cp,4],[curr_cp_index,4]],_23486),ssi1([-3,"line",-,[[[v,a],empty],[[v,b],empty]]])]',																						              

%Hidden1='[n,read_string,empty,[v,b],3,false,lang("en"),debug2(off),debug3(off),debug4(off),retry_back(on),retry_back_stack([[1,[ssi,[[["prev_pred_id",0],1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[],[]],_47234,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],_48088,[],_48100,[],_48112,[],_48124,[[curr_cp,0],[curr_cp_index,0]],_48172]]],[2,[ssi,[[1,1,0,0,"line",-,[[[v,a],empty],[[v,b],empty]],[]],_48328,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],_49182,[],_49194,[[[firstargs,1],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,1],[n,query_box_1]],[[arguments1,1],[[v,a],[v,b]]],[[skip,1],false],[[level,1],1],[[pred_num,1],0],[pred_id_chain,0,1]],_49542,[[1,2,1,1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]]],_49748,["appearance of command",-],[[min_cp,1],[max_cp,2],[curr_cp,2],[curr_cp_index,2]],_49860]]],[3,[ssi,[[["prev_pred_id",1],2,1,-1,"predicate",[[n,cultivate_person],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]],_50098,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],_50952,[],_50964,[[[firstargs,1],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,1],[n,query_box_1]],[[arguments1,1],[[v,a],[v,b]]],[[skip,1],false],[[level,1],1],[[pred_num,1],0],[pred_id_chain,0,1],[[vars1,1],[[[v,a],empty],[[v,b],empty]]],[[firstargs_uv2,1],[[v,a],[v,b]]]],_51468,[[1,2,1,1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]],[2,3,1,1,0,["returns to",0,"pred_id",1],"predicate",-,[[[v,a],empty],[[v,b],empty]],[]]],_51848,[[min_cp,1],[max_cp,3],[curr_cp,3],[curr_cp_index,3]],_51932]]],[4,[ssi,[[2,2,1,0,"line",-,[[[v,a],empty],[[v,b],empty]],[]],_52088,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],_52942,[],_52954,[[[firstargs,1],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,1],[n,query_box_1]],[[arguments1,1],[[v,a],[v,b]]],[[skip,1],false],[[level,1],1],[[pred_num,1],0],[pred_id_chain,0,1],[[vars1,1],[[[v,a],empty],[[v,b],empty]]],[[firstargs_uv2,1],[[v,a],[v,b]]],[[firstargs,2],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,2],[n,cultivate_person]],[[arguments1,2],[[v,a],[v,b]]],[[skip,2],false],[[level,2],2],[[pred_num,2],1],[pred_id_chain,1,2]],_53794,[[1,2,1,1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]],[2,3,1,1,0,["returns to",0,"pred_id",1],"predicate",-,[[[v,a],empty],[[v,b],empty]],[]],[3,4,2,2,1,-1,"predicate",[[n,cultivate_person],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]]],_54368,["appearance of command",-],[[min_cp,1],[max_cp,4],[curr_cp,4],[curr_cp_index,4]],_54480]]],[5,[ssi,[[2,2,1,1,"line",-,[[[v,a],empty],[[v,b],empty]],[]],_54636,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],_55490,[],_55502,[[[firstargs,1],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,1],[n,query_box_1]],[[arguments1,1],[[v,a],[v,b]]],[[skip,1],false],[[level,1],1],[[pred_num,1],0],[pred_id_chain,0,1],[[vars1,1],[[[v,a],empty],[[v,b],empty]]],[[firstargs_uv2,1],[[v,a],[v,b]]],[[firstargs,2],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,2],[n,cultivate_person]],[[arguments1,2],[[v,a],[v,b]]],[[skip,2],false],[[level,2],2],[[pred_num,2],1],[pred_id_chain,1,2],[[vars1,2],[[[v,a],empty],[[v,b],empty]]]],_56432,[[1,2,1,1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]],[2,3,1,1,0,["returns to",0,"pred_id",1],"predicate",-,[[[v,a],empty],[[v,b],empty]],[]],[3,4,2,2,1,-1,"predicate",[[n,cultivate_person],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]]],_57006,["appearance of command",-],[[min_cp,1],[max_cp,4],[curr_cp,4],[curr_cp_index,4]],_57118]]],[6,[ssi,[[2,2,1,2,"line",-,[[[v,a],y]],[]],_57244,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],[[[v,a],y]],[],_58140,[[[firstargs,1],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,1],[n,query_box_1]],[[arguments1,1],[[v,a],[v,b]]],[[skip,1],false],[[level,1],1],[[pred_num,1],0],[pred_id_chain,0,1],[[vars1,1],[[[v,a],empty],[[v,b],empty]]],[[firstargs_uv2,1],[[v,a],[v,b]]],[[firstargs,2],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,2],[n,cultivate_person]],[[arguments1,2],[[v,a],[v,b]]],[[skip,2],false],[[level,2],2],[[pred_num,2],1],[pred_id_chain,1,2],[[vars1,2],[[[v,a],empty],[[v,b],empty]]],[[vars1,2],[[[v,a],empty],[[v,b],empty]]],[[skip,2,1],false]],_59196,[[1,2,1,1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]],[2,3,1,1,0,["returns to",0,"pred_id",1],"predicate",-,[[[v,a],empty],[[v,b],empty]],[]],[3,4,2,2,1,-1,"predicate",[[n,cultivate_person],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]]],_59770,["appearance of command",-],[[min_cp,1],[max_cp,4],[curr_cp,4],[curr_cp_index,4]],_59882]]],[7,[ssi,[[2,2,1,3,"line",-,[[[v,a],y]],[]],_60008,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],[[[v,a],y]],[],_60904,[[[firstargs,1],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,1],[n,query_box_1]],[[arguments1,1],[[v,a],[v,b]]],[[skip,1],false],[[level,1],1],[[pred_num,1],0],[pred_id_chain,0,1],[[vars1,1],[[[v,a],empty],[[v,b],empty]]],[[firstargs_uv2,1],[[v,a],[v,b]]],[[firstargs,2],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,2],[n,cultivate_person]],[[arguments1,2],[[v,a],[v,b]]],[[skip,2],false],[[level,2],2],[[pred_num,2],1],[pred_id_chain,1,2],[[vars1,2],[[[v,a],empty],[[v,b],empty]]],[[vars1,2],[[[v,a],empty],[[v,b],empty]]],[[skip,2,1],false],[[vars1,2],[[[v,a],y]]]],_62020,[[1,2,1,1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]],[2,3,1,1,0,["returns to",0,"pred_id",1],"predicate",-,[[[v,a],empty],[[v,b],empty]],[]],[3,4,2,2,1,-1,"predicate",[[n,cultivate_person],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]]],_62594,["appearance of command",-],[[min_cp,1],[max_cp,4],[curr_cp,4],[curr_cp_index,4]],_62706]]]]),retry_back_stack_n(7),cumulative_or_current_text(current),number_of_current_text(1),html_api_maker_or_terminal(html),pred_numbers([[[n,cultivate_person],2,[1]],[[n,query_box_1],2,[0]]]),pred_id(2),types(on),typestatements([[[n,cultivate_person],[[t,string],[t,string]]]]),modestatements([[[n,cultivate_person],[output,output]]]),ssi1([2,2,1,-2,"line",-,_63168,[]],_63102,[[0,[n,query_box_1],[[v,a],[v,b]],":-",[[0,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,[1]],[n,cultivate_person],[[v,a],[v,b]]]]],[1,[n,cultivate_person],[[v,a],[v,b]],":-",[[0,[on_true,1],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you create the person?"]],[1,[on_true,2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,a]]],[2,[on_true,3],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,writeln],["Do you switch them on to existing for the rest of their life?"]],[3,[on_true,-2],[go_after,-],[on_false,-3],[go_to_predicates,-],[n,read_string],[[v,b]]]]]],[[[v,a],y]],[],_1102,[[[firstargs,1],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,1],[n,query_box_1]],[[arguments1,1],[[v,a],[v,b]]],[[skip,1],false],[[level,1],1],[[pred_num,1],0],[pred_id_chain,0,1],[[vars1,1],[[[v,a],empty],[[v,b],empty]]],[[firstargs_uv2,1],[[v,a],[v,b]]],[[firstargs,2],[[[v,a],[v,a]],[[v,b],[v,b]]]],[[function,2],[n,cultivate_person]],[[arguments1,2],[[v,a],[v,b]]],[[skip,2],false],[[level,2],2],[[pred_num,2],1],[pred_id_chain,1,2],[[vars1,2],[[[v,a],empty],[[v,b],empty]]],[[vars1,2],[[[v,a],empty],[[v,b],empty]]],[[skip,2,1],false],[[vars1,2],[[[v,a],y]]],[[vars1,2],[[[v,a],y]]]],_1106,[[1,2,1,1,0,-1,"predicate",[[n,query_box_1],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]],[2,3,1,1,0,["returns to",0,"pred_id",1],"predicate",-,[[[v,a],empty],[[v,b],empty]],[]],[3,4,2,2,1,-1,"predicate",[[n,cultivate_person],[[v,a],[v,b]]],[[[v,a],empty],[[v,b],empty]],[]]],_1110,[[min_cp,1],[max_cp,4],[curr_cp,4],[curr_cp_index,4]],_1114),ssi1([-3,"line",-,[[[v,a],y]]])]',

				format('Content-type: text/html~n~n', []),
																											      	format('<p>', []),
																												        %%portray_clause(Data),
																												        
																												        %%term_to_atom(Term,Data),
	
		%format(Data,[])

																												        
%/*
Data=[%%debug='off',%%Debug1,
input=Input,
ssi=Hidden,submit=_],
%term_to_atom(Hidden1,Hidden),

%*/
%Input="2",
%/*
term_to_atom([Dbw_n,Dbw_read_string,Value1,Variable1,Line_number_b,Skip,lang(Lang),



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
	Hidden), %****
	%*/
%term_to_atom(Hidden1,Hidden),
%format(Hidden)

	%format('here',[])
	%/*
lang(Lang),

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
retractall(typestatements(_)),assertz(typestatements(Typestatements)),
retractall(modestatements(_)),assertz(modestatements(Modestatements)),

atom_string(Input,Value1A),

data(Header,Footer),

format(Header,[]),


	%test(1,Query,Functions,Result),
	%international_lucianpl([lang,"en"],Debug,Query,Functions,Result1),


%trace,

        ((val1emptyorvalsequal(Value1,Value1A),
        putvalue(Variable1,Value1A,Vars3,Vars2))->
      (debug_exit(Skip,[[Dbw_n,Dbw_read_string],[Value1A]]),

 (var(Skip)->Globals3=Globals4;
 append(Globals3,[[[skip,Pred_id,Line_number_b],Skip]],Globals4)),
 
       
      	ssi1([Pred_id,Level,Predicate_number,A,"line",Query,
	Vars2,All_predicate_numbers], _End_result31, Functions,Vars2,
	Result1, Result2, 
	Globals4,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3,
	CP_Vars3,CP_Vars2)

      )
;     (debug_fail(Skip,[[Dbw_n,Dbw_read_string],[variable]]),

      	ssi1([Pred_id,Level,Predicate_number,C,"line",Query,
	Vars1,All_predicate_numbers], _End_result3, Functions,Vars2,
	Result1, Result2, 
	Globals3,Globals2,
	Choice_point_trail1e,
	Choice_point_trail3,
	CP_Vars3,CP_Vars2)


)),

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
