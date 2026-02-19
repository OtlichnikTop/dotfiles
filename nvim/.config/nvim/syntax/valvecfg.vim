" Vim syntax file
" Language:    Good old Source (and GoldSource) engine script files
" Maintainer:    Igor N. Prischepoff (igor@tyumbit.ru, pri_igor@mail.ru)
" Last change:    2012 Aug 11
" 2024 Nov 14 by Vim project:  // only denotes a comment when starting a line (#16051)

" quit when a syntax file was already loaded
if exists ("b:current_syntax")
    finish
endif

" case off
syn case ignore
syn keyword VCfgOnOff  ON OFF YES NO TRUE FALSE  contained
syn match UncPath "\\\\\p*" contained
"Dos Drive:\Path
syn match VCfgDirectory "[a-zA-Z]:\\\p*" contained
"Parameters
syn match   VCfgParams    ".\{0}="me=e-1 contains=CfgComment
"... and their values (don't want to highlight '=' sign)
syn match   VCfgValues    "=.*"hs=s+1 contains=CfgDirectory,UncPath,CfgComment,CfgString,CfgOnOff

" Keywords
syn keyword VCfgKeyword bind unbind exec alias

syn keyword VCfgKeyType KP_END KP_DOWNARROW KP_PGDN KP_LEFTARROW KP_5 KP_RIGHTARROW KP_HOME KP_UPARROW KP_PGUP
syn keyword VCfgKeyType 1 2 3 4 5 6 7 8 9 0 q w e r t y u i o p a s d f g h j k l z x c v b n m 
syn keyword VCfgKeyType F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12
syn keyword VCfgKeyType MOUSE1 MOUSE2 MOUSE3 MOUSE4 MOUSE5 MWHEELUP MWHEELDOWN
syn keyword VCfgKeyType CTRL ALT SHIFT RCTRL RALT RSHIFT TAB
"syn keyword VCfgKeyType [ ] ; ' , . / \ - =

" Sections
syn match VCfgSection  "\[.*\]"
syn match VCfgSection  "{.*}"

" String
syn match VCfgString    /"[^"]*"/

" Comments (Everything before leading '//')
syn match VCfgComment    "//.*"

" Define the default highlighting.
hi link VCfgOnOff    Label
hi link VCfgComment  Comment
hi link VCfgSection  Type
hi link VCfgString   String
hi link VCfgKeyword  Keyword
hi link VCfgParams   Keyword
hi link VCfgValues   Constant
hi link VCfgDirector Directory
hi link UncPath      Directory
hi link VCfgKeyType  Type


let b:current_syntax = "valve_cfg"
" vim:ts=8
