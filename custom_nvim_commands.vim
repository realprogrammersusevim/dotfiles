function! PlugSync()  " Function called by PlugSync command to sync my plugins
	PlugClean
	PlugUpdate
	PlugInstall
endfunction

command -nargs=0 PlugSync call PlugSync()  " Define my PlugSync command

function! VlimeServer()
	!sbcl --load ~/.local/share/nvim/plugged/vlime/lisp/start-vlime.lisp
endfunction

command -nargs=0 VlimeServer call VlimeServer()  " Start the Vlime server

