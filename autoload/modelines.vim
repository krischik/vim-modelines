"-------------------------------------------------------------------------------
"  Description: Insert modelines
"   Maintainer: Martin Krischik
"    Copyright: Copyright (C) 2006 … 2026 Martin Krischik
" Name Of File: plugin/modelines.vim
" Last Changed: Monday, 23 Aug 2026
"      Version: 3.2
"	 Usage: install with dein
"      History: 18.11.2006 MK Bram's suggestion for runtime integration
"		18.11.2006 MK "set: :" syntax for "/* */" languages   
"		17.09.2007 MK change to bundle use NERD_Commenter when
"			      available  
"		01.09.2022 MK Change to GitHub delivery. 
"		01.09.2022 MK Use GitHub und dein to publish new versions
"		25.09.2022 MK Add spell language and file encoding
"		25.09.2022 MK update nerdcommenter 
"		23.07.2026 MK fix version without nerdcommenter 
"-------------------------------------------------------------------------------

if version < 700
   finish
endif 

let g:loaded_modlines=1
setlocal cpoptions-=C

if exists("loaded_nerd_comments")
    "------------------------------------------------------------------------------
    "
    "	Insert Modelines with standard informations
    "
    function modelines#Insert ()
	let l:Line = line (".")

	call append (
	    \ l:Line + 0,
	    \ "vim: set"				    .
	    \ " textwidth="		    . &textwidth    .
	    \ (&wrap ? " " : " no")	    . "wrap"	    .
	    \ " tabstop="		    . &tabstop	    .
	    \ " shiftwidth="		    . &shiftwidth   .
	    \ " softtabstop="		    . &softtabstop  .
	    \ (&expandtab ? " " : " no")    . "expandtab"   .
	    \ " :")
	call append (
	    \ l:Line + 1,
	    \ "vim: set"				    .
	    \ " filetype="		    . &filetype	    .
	    \ " fileencoding="		    . &fileencoding .
	    \ " fileformat="		    . &fileformat   .
	    \ " foldmethod="		    . &foldmethod   .
	    \ " :")
	call append (
	    \ l:Line + 2,
	    \ "vim: set"				    .
	    \ (&spell ? " " : " no")	    . "spell"	    .
	    \ " spelllang="		    . &spelllang    .
	    \ " :")
	execute (l:Line + 1) . "," . (l:Line + 3) . " call nerdcommenter#Comment('n', 'comment')"
    endfunction
else
    "------------------------------------------------------------------------------
    "
    "	Insert Modelines with standard informations
    "
    function modelines#Insert ()
	let l:Line = line (".")

	call append (
	    \ l:Line + 0,
	    \ substitute (
		\ &commentstring				,
		\ "\%s"						,
		\ " vim: set"					.
		\ (&wrap ? " " : " no")		. "wrap"	.
		\ " textwidth="			. &textwidth    .
		\ (&wrap ? " " : " no")		. "wrap"	.
		\ " tabstop="			. &tabstop	.
		\ " shiftwidth="		. &shiftwidth   .
		\ " softtabstop="		. &softtabstop  .
		\ (&expandtab ? " " : " no")	. "expandtab"	.
		\ " :"						,
		\ ""))
	call append (
	    \ l:Line + 1,
	    \ substitute (
		\ &commentstring				,
		\ "\%s"						,
		\ " vim: set"					.
		\ " filetype="			. &filetype	.
		\ " fileencoding="		. &fileencoding .
		\ " fileformat="		. &fileformat   .
		\ " foldmethod="		. &foldmethod   .
		\ " :"						,
		\ ""))
	call append (
	    \ l:Line + 2,
	    \ substitute (
		\ &commentstring				,
		\ "\%s"						,
		\ "vim: set"					.
		\ (&spell ? " " : " no")	. "spell"	.
		\ " spelllang="			. &spelllang    .
		\ " :"						,
		\ ""))
    endfunction
endif

finish

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"-------------------------------------------------------------------------------
" vim: set textwidth=78 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
" vim: set filetype=vim fileencoding=utf-8 fileformat=unix foldmethod=marker :
" vim: set spell spelllang=en_gb :
