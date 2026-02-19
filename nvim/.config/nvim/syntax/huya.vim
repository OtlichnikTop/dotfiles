" Vim syntax file
" Language:               ХУЯ
" Mainteiner:             OtlichnikTop
" Last Change:            2025 Nov 20

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn keyword     huyaKeyword     про вернуть вкл для пока библ печать нч кц то если иначе ост внешняя структ пер ввод

syn keyword     huyaType        конст цел нат нат8 вещ массив

syn match huyaComment "//.*$"
syn match huyaString /"[^"]*"/
syn match huyaGuillemets "«[^»]*»"
syn match huyaNumber "\<\d\+\>"
syn match huyaBoolean "\<\(истина\|ложь\)\>"
syn match huyaFloat "\<\d\+\.\d*\>"

syn keyword     huyaTodo        contained СДЕЛАТЬ ПОЧИНИТЬ ПОФИКСИТЬ ЗАМЕТКА

syn match huyaFunctionCall "\<\w\+\s*(" contains=ALLBUT,huyaComment

hi link huyaKeyword Keyword
hi link huyaType Type
hi link huyaComment Comment
hi link huyaString String
hi link huyaGuillemets String
hi link huyaNumber Number
hi link huyaBoolean Boolean
hi link huyaFloat Float
hi link huyaFunctionCall Function

let b:current_syntax = "huya"
