para([
[[n,paraphraser],":-",
[
	%[[n,trace]],
	%[[n,phrase_from_file],[[[n,string],[[v,codes]]],'file.txt']],

[[n,writeln],["Please enter the file to paraphrase."]],

[[n,text_area
],["rows=\"8\" style=\"width:100%\"","",[v,string_a]]],
	
	[[n,string_codes],[[v,string_a],[v,codes]]],
	[[n,=],[[v,sepandpad],"#@~%`$?-+*^,()|.:;=_/[]<>{}\\n\\r\\s\\t\\\\\\!0123456789"
	]],
	[[n,string_codes],[[v,sepandpad],[v,sepandpad1]]],
	[[n,split_on_substring117],[[v,codes],[v,sepandpad1],[],[v,file_list]]],
	%[[n,phrase_from_file],[[[n,string],[[v,codes2]]],'thesaurus.txt']],
	%[[n,string_codes],[[v,string2],[v,codes2]]],
	%[[n,trace]],
	[[n,writeln],["Please enter the thesaurus or []."]],

[[n,text_area
],["rows=\"2\" style=\"width:100%\"","[]",[v,string2]]],


%[[n,read_string],[[v,string2]]],

[[n,term_to_atom],[[v,synonym_list],[v,string2]]],

	%[[n,trace]],

[[n,paraphrase1],[[v,file_list],[],[v,file_list2a],[v,synonym_list],[v,synonym_list2]]],
	[[n,concat_list],[[v,file_list2a],[v,file_list_a]]],

	[[n,writeln],[[v,file_list_a]]],
	
	/*[
	[[n,open],['file2.txt',write,[v,stream1]]],
	[[n,write],[[v,stream1],[v,file_list_a]]],
	[[n,close],[[v,stream1]]]
	],*/
	[[n,term_to_atom],[[v,synonym_list2],[v,synonym_list_a]]],
	
	[[n,writeln],["Finished (submit does nothing). Please save thesaurus below."]],

	[[n,text_area
],["rows=\"4\" style=\"width:100%\"",[v,synonym_list_a],[v,s]]],
	/*[
	[[n,open],['thesaurus.txt',write,[v,stream2]]],
	[[n,write],[[v,stream2],[v,synonym_list_a]]],
	[[n,close],[[v,stream2]]]
	],*/
	
	[[n,cut]]
]],
[[n,string_to_list2],[[v,b],[v,a1],[v,a2]],":-",
[
	[[n,string_concat],[[v,d],"",[v,b]]],
	[[n,string_length],[[v,d],1]],
	[[n,append],[[v,a1],[[v,d]],[v,a2]]],
	[[n,cut]]
]],
[[n,string_to_list2],[[v,a],[v,b],[v,c]],":-",
[
	[[n,string_concat],[[v,d],[v,e],[v,a]]],
	[[n,string_length],[[v,d],1]],
	[[n,append],[[v,b],[[v,d]],[v,f]]],
	[[n,string_to_list2],[[v,e],[v,f],[v,c]]]
]],
[[n,paraphrase1],[[""],[v,file_list],[v,file_list],[v,synonym_list],[v,synonym_list]],":-",
[
	[[n,cut]]
]],
[[n,paraphrase1],[[],[v,file_list],[v,file_list],[v,synonym_list],[v,synonym_list]],":-",
[
	[[n,cut]]
]],
[[n,paraphrase1],[[v,file_list],[v,file_list1],[v,file_list2],[v,synonym_list],[v,synonym_list2]],":-",
[
	[[n,equals4],[[v,file_list],[[v,file_list3],"|",[v,file_list4]]]],
	[[n,string_concat],[[v,file_list5],[v,'_e'],[v,file_list3]]],
	[[n,string_length],[[v,file_list5],1]],
	%[[n,trace]],
	[[n,string_codes],[[v,file_list5],[v,file_list5_c]]],
	[[n,"->"],
	[
		%[[n,not],[[[n,phrase],[[[n,word1],[[v,file_list5_c]]],[v,'_']]]]],
		[[n,not],[[[n,word1],[[v,file_list5_c]]]]],

		[[n,true]],

		[[n,member],[["the","a","i","on","with","of","an","for","to","was","were","and","in","my","from","out","by"],[v,file_list3]]]
	]],
	[[n,append],[[v,file_list1],[[v,file_list3]],[v,file_list6]]],
	[[n,paraphrase1],[[v,file_list4],[v,file_list6],[v,file_list2],[v,synonym_list],[v,synonym_list2]]],
	[[n,cut]]
]],

[[n,paraphrase1],[[v,file_list],[v,file_list1],[v,file_list2],[v,synonym_list],[v,synonym_list2]],":-",
[
	%[[n,trace]],
	[[n,equals4],[[v,file_list],[[v,file_list3],"|",[v,file_list4]]]],
	[[n,string_concat],[[v,file_list5],[v,'_e'],[v,file_list3]]],
	[[n,string_length],[[v,file_list5],1]],
	[[n,string_codes],[[v,file_list5],[v,file_list5_c]]],
	[[n,word1],[[v,file_list5_c]]],
	[[n,"->"],
	[
	[[n,"->"],
	[
		[[[n,member],[[v,synonym_list],[v,s1]]],
		[[n,=],[[v,s1],[[v,file_list3],[v,synonym]]]]],

		[[n,true]],

		[[[n,member],[[v,synonym_list],[v,s2]]],
		[[n,=],[[v,s2],[[v,synonym],[v,file_list3]]]]]
	]],
	[
	[[n,append],[[v,file_list1],[[v,synonym]],[v,file_list6]]],
	[[n,=],[[v,synonym_list],[v,synonym_list1]]]
	],
	
	[[[n,concat_list],[["What is a synonym for: ",[v,file_list3],"\n","or <Return> to skip."],[v,notification]]],
	[[n,writeln],[[v,notification]]],
	[[n,read_string],[[v,input]]],
	[[n,"->"],
	[
		[[n,equals4],[[v,input],""]],

		[
		[[n,=],[[v,synonym2],[v,file_list3]]]
		],

		[
		[[n,=],[[v,synonym2],[v,input]]]
		]
	]],
	[[n,append],[[v,synonym_list],[[[v,file_list3],[v,synonym2]]],[v,synonym_list1]]]
	]]],
	[[n,append],[[v,file_list1],[[v,synonym2]],[v,file_list6]]],
	[[n,paraphrase1],[[v,file_list4],[v,file_list6],[v,file_list2],[v,synonym_list1],[v,synonym_list2]]],
	[[n,cut]]
]],
[[n,split_on_substring117],[[],[v,'_a'],[v,e],[v,e]],":-",
[
	[[n,cut]]
]],
[[n,split_on_substring117],[[v,a],[v,b2],[v,e],[v,c]],":-",
[
	[[n,intersection],[[v,a],[v,b2],[]]],
	[[n,string_codes],[[v,e1],[v,e]]],
	[[n,string_codes],[[v,a1],[v,a]]],
	[[n,concat_list],[[[v,e1],[v,a1]],[v,c2]]],
	[[n,append_list],[[[v,c2]],[v,c]]],
	[[n,cut]]
]],
[[n,split_on_substring117],[[v,a],[v,b2],[v,e],[v,c]],":-",
[
	%[[n,=],[[v,b2],[[v,b],"|",[v,b3]]]],
	[[n,member],[[v,b2],[v,b]]],
	[[n,append],[[[v,b]],[v,d],[v,a]]],
	[[n,split_on_substring117],[[v,d],[v,b2],[],[v,c1]]],
	%[[n,trace]],
	[[n,string_codes],[[v,e1],[v,e]]],
	%[[n,"->"],[[]]
	[[n,equals4],[[v,b3],[[v,b]]]],
	%[[n,trace]],
	[[n,string_codes],[[v,b1],[v,b3]]],
	
	[[n,"->"],[[[n,equals4],[[v,e1],""]],
	[[n,maplist],[[n,append],[[[v,b1]],[v,c1]],[],[v,c]]],
	[[n,maplist],[[n,append],[[[v,e1],[v,b1]],[v,c1]],[],[v,c]]]
	]],
	[[n,cut]]
]],
[[n,split_on_substring117],[[v,a],[v,b],[v,e1],[v,c]],":-",
[
	[[n,get_item_n],[1,[v,a],[v,e]]],
	[[n,append],[[[v,e]],[v,d],[v,a]]],
	%[[n,length],[[v,e],1]],
	[[n,append],[[v,e1],[[v,e]],[v,e2]]],
	[[n,split_on_substring117],[[v,d],[v,b],[v,e2],[v,c]]],
	[[n,cut]]
]],

[[n,append_list],[[v,a1],[v,b]],":-",
[
	[[n,append_list],[[],[v,a1],[v,b]]],
	[[n,cut]]
]],
[[n,append_list],[[v,a],[],[v,a]],":-",
[
	[[n,cut]]
]],
[[n,append_list],[[v,a],[v,list],[v,b]],":-",
[
	[[n,equals4],[[v,list],[[v,item],"|",[v,items]]]],
	[[n,append],[[v,a],[[v,item]],[v,c]]],
	[[n,append_list],[[v,c],[v,items],[v,b]]]
]],
[[n,concat_list],[[],""],":-",
[
	[[n,cut]]
]],
[[n,concat_list],[[v,a1],[v,b]],":-",
[
	[[n,concat_list],["",[v,a1],[v,b]]],
	[[n,cut]]
]],
[[n,concat_list],[[v,a],[v,list],[v,b]],":-",
[
	[[n,concat_list1],[[v,a],[v,list],[v,b]]]
]],
[[n,concat_list1],[[v,a],[],[v,a]],":-",
[
	[[n,cut]]
]],
[[n,concat_list1],[[v,a],[v,list],[v,b]],":-",
[
	[[n,equals4],[[v,list],[[v,item],"|",[v,items]]]],
	[[n,string_concat],[[v,a],[v,item],[v,c]]],
	[[n,concat_list1],[[v,c],[v,items],[v,b]]]
]],
        [[n,get_item_n],[1,[v,b],[v,c]],":-",
        [       [[n,head],[[v,b],[v,c]]]
        ]],
        [[n,get_item_n],[[v,a],[v,b],[v,c]],":-",
        [       [[n,not],[[[n,=],[[v,a],1]]]],
                [[n,tail],[[v,b],[v,t]]],
                [[n,-],[[v,a],1,[v,d]]],
                [[n,get_item_n],[[v,d],[v,t],[v,c]]]
        ]]
]).
