% merge cps lists

a:-member(_,[1,2]).
a:-b,fail.
b:-d.
b:-e.
d.
e.

% if fails, retries cps at end

/*
changes
- level 0 - move next pred cp here *1
 - -2 new result list
 - -3 same result list
- levels 1+
 - *1
 
 find continuous loop bug
 delete go to 0 without finishing top level commands in 1 first x is on -2 or -3
 
*/