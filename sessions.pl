generate_session_key(Key5) :-
 repeat,
 api-key(API_key),
 length(Key,10),
 findall(Key1,(member(_,Key),random(X),Key1 is ceiling(10*X)),Key2),
 flatten([API_key,"-",Key2],List),
 foldr(string_concat,List,"",Key4),
 string_atom(Key4,Key5),
 foldr(string_concat,["sessions/session",Key5,".txt"],Path),
 not(exists_file(Path)),
 %number_string(Key31,Key3),
 %Key4=API_key-Key31,
 !.
 
 
% each day, delete sessions older than 1 year x day x month
 
delete_old_sessions :-

get_time(Now),
One_month_ago is Now - 2592000.0,

%findall(J5,(%member(K1,K),	
directory_files("sessions/",F),
	delete_invisibles_etc(F,G),

findall(_,(
member(H,G),string_concat("sessions/",H,H1),
set_time_file(H1, [access(Access)], []),
Access < One_month_ago,
delete_file(H1)
),_),!.


% save session

% api key...

%save_session_first_time(Session) :-
% generate_session_key(Session_number),
% save_session(Session_number,Session),!.

save_session(Session_number,Session) :-
 (var(Session_number)->generate_session_key(Session_number);true),
 foldr(string_concat,["sessions/session",Session_number,".txt"],Path),

 save_file_s(Path,Session),!.
 
% () check if generated key is the same as another key


% get session

get_session(Session_number,Session) :-
 foldr(string_concat,["sessions/session",Session_number,".txt"],Path),
 open_file_s(Path,Session),!.


