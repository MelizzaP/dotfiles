" Vim color file
" Maintainer: Kenneth Love
" Last Change: 2010-07-16
" Version 0.1
" based on 'Birds of Paradise' theme for Coda:
" http://joebergantine.com/werkstatt/birds-of-paradise
" With thanks to the Ego color scheme by Robby Colvin

set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "birds"

" GUI Colors
hi Cursor               gui=reverse guibg=#8DA1A1 guifg=#ffffff
hi CursorIM             gui=bold guifg=#ffffff guibg=#8da1a1
hi CursorLine           gui=NONE guibg=#3d4646
hi CusorColumn          gui=NONE guibg=#3d4646
hi ErrorMsg                      guifg=#7b5f40  guibg=FireBrick
hi VertSplit            gui=NONE guifg=white guibg=#372725
hi Folded               gui=bold guibg=#7b5f40 guifg=#493432
hi FoldColumn           gui=NONE guibg=#7b5f40 guifg=#493432
hi LineNr               guibg=#372725 guifg=white
hi NonText              gui=NONE guibg=#372725 guifg=white
hi Normal               gui=NONE guibg=#372725 guifg=white
hi StatusLine           gui=bold guibg=gray guifg=black
hi StatusLineNC         gui=NONE guibg=grey60 guifg=grey10
hi Visual               gui=reverse guibg=#ffffff guifg=black
hi WarningMsg           gui=bold guifg=FireBrick1 guibg=bg
hi Search               gui=NONE guibg=#7b5f40 guifg=black

" General Syntax Colors
hi Comment              gui=NONE guifg=#6b4e32 guibg=bg
hi Todo                 gui=bold guifg=#6b4e32 guibg=bg

hi Identifier           gui=bold guifg=#ef5d32 guibg=bg
hi Type                 gui=bold guifg=#ef5d32 guibg=bg

hi Statement            gui=bold guifg=#efac32 guibg=bg
hi Conditional          gui=bold guifg=#efac32 guibg=bg
hi Operator             gui=bold guifg=#efac32 guibg=bg
hi Label                gui=bold guifg=#efac32 guibg=bg
hi Define               gui=bold guifg=#efac32 guibg=bg
hi Macro                gui=bold guifg=#efac32 guibg=bg

hi String               gui=NONE guifg=#d9d762 guibg=bg
