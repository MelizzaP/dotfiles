set encoding=utf-8
set nocompatible
syntax on

filetype off
" Disable FuzzyFinder for old version of VIM
if v:version < '702'
  let g:pathogen_disabled = []
  call add(g:pathogen_disabled, 'l9')
  call add(g:pathogen_disabled, 'vim-fuzzyfinder')
  call add(g:pathogen_disabled, 'vimclojure')
endif

call pathogen#infect()
filetype plugin indent on

compiler ruby

highlight FoldColumn  gui=bold    guifg=grey65     guibg=Grey90
highlight Folded      gui=italic  guifg=Black      guibg=Grey90
highlight LineNr      gui=NONE    guifg=grey60     guibg=Grey90
set hlsearch
set number
set showmatch
set incsearch
set background=dark
set hidden
set backspace=indent,eol,start
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set ruler
set wrap
set dir=/tmp//
set scrolloff=5
set foldmethod=syntax
set foldlevelstart=20
set foldcolumn=0
set ignorecase
set smartcase

let g:AckAllFiles = 0
let g:AckCmd = 'ack --type-add ruby=.feature --ignore-dir=tmp 2> /dev/null'

let html_use_css=1
let html_number_lines=0
let html_no_pre=1

let vimclojure#WantNailgun = 0
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

let g:rubycomplete_buffer_loading = 1

let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(exe|so|dll|bak|orig|sw[po]|class|png|jpeg|jpg)$',
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|tmp|node_modules|vendor|source_maps|coverage)$'
  \ }
let g:ctrlp_match_window  = 'top,order:ttb,min:1,max:20,results:20'
let g:ctrlp_reuse_window = 'startify'

let g:no_html_toolbar = 'yes'

" Delete this line (or set g:autoclose_on to 1) to enable autoclose parens
let g:autoclose_on = 1
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview

autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType tex setlocal textwidth=78
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78

autocmd FileType ruby runtime ruby_mappings.vim
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

imap <C-L> <SPACE>=><SPACE>
map <silent> <LocalLeader>cj :!clj %<CR>
map <silent> <LocalLeader>rt :!ctags -F `ack --ruby -f`<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>ff :CtrlP<CR>
map <silent> <LocalLeader>fr :CtrlPClearCache<CR>
map <silent> <LocalLeader>be :CtrlPBuffer<CR>
map <silent> <LocalLeader>gd :e product_diff.diff<CR>:%!git diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>pd :e product_diff.diff<CR>:%!svn diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>nh :nohls<CR>
map <LocalLeader>aw :Ack '<C-R><C-W>'
map <silent> <LocalLeader>bd :bufdo :bd<CR>
map <silent> <LocalLeader>cc :TComment<CR>
map <silent> <LocalLeader>uc :TComment<CR>

"ws -- white space: removes all trailing whitespace from a file
map <silent> <LocalLeader>ws :%s/\s\+$//<CR>

"fl -- format line: expands a single line of parameters into multiple lines
map <silent> <LocalLeader>fl :s/\([;,{]\) */\1\r  /g<CR>:s/  }/}/g<CR>:nohls<CR>

"ss -- string-to-symbol: converts hash with string keys to symbol keys
map <silent> <LocalLeader>ss :%s/\[['"]\(.\{-}\)['"]]/[:\1]/g<CR>:nohls<CR>

"command Wsudo w !sudo tee %       <----uncomment for Shift+W sudo save"
cnoremap <Tab> <C-L><C-D>

if version >= 700
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
  autocmd FileType tex setlocal spell spelllang=en_us
endif

if &t_Co == 256
  colorscheme vividchalk
endif

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
map <silent> <LocalLeader>hws :highlight clear ExtraWhitespace<CR>

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%81v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

"Set filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru,Guardfile,*.god}     set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                                         set ft=markdown
au BufNewFile,BufRead {*.coffee,*.coffee.erb}                                         set filetype=coffee
au BufNewFile,BufRead {*.eco,*.eco.erb}                                               set filetype=mason
au BufNewFile,BufRead {*.less,*.less.erb}                                             set filetype=less
au BufNewFile,BufRead *.js.erb                                                        set filetype=javascript
au BufNewFile,BufRead *.raml                                                          set filetype=yaml
au BufNewFile,BufRead {*.handlebars,*.hbs}                                            set filetype=handlebars
au BufRead,BufNewFile *.hamlbars                                                      set filetype=haml

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

" Fix copy/paste on Ubuntu
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Create a VIM scratch file with F4
map <F4> :tabe ~/vim_scratch.txt<CR>
imap <F4> :tabe ~/vim_scratch.txt<CR>

" Ctags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F5> :TlistToggle<cr>
nnoremap <F6> :GundoToggle<CR>

" Close window if NERDTree is only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Open NERDTree on launch if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" returns true iff is NERDTree open/active
function! rc:isNTOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" returns true iff focused window is NERDTree window
function! rc:isNTFocused()
  return -1 != match(expand('%'), 'NERD_Tree')
endfunction

" returns true iff focused window is FuzzyFinder
function! rc:isFFFocused()
  return -1 != match(expand('%'), 'fuf')
endfunction

" returns true iff focused window is rspec
function! rc:isRspecFocused()
  return -1 != match(expand('%'), 'rb_test_output')
endfunction

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! rc:syncTree()
  if &modifiable && rc:isNTOpen() && !rc:isNTFocused() && !rc:isFFFocused() && !rc:isRspecFocused() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

autocmd BufEnter * call rc:syncTree()

" Fix numpad escape character issue
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OR *
imap <Esc>OQ /
imap <Esc>Ol +
imap <Esc>OS -

"Map esc to jj
:imap jj <Esc>

" Enable PowerLine
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

" VIM Split Enhancements
nnoremap <M-Right> <C-W>l
nnoremap <M-Left> <C-W>h
nnoremap <M-Down> <C-W>j
nnoremap <M-Up> <C-W>k

" Pane resizing
noremap <C-M-Left> :vertical resize -2<CR>
noremap <C-M-Right> :vertical resize +2<CR>
noremap <C-M-Up> :resize +1<CR>
noremap <C-M-Down> :resize -1<CR>

" Disable Markdown folding
let g:vim_markdown_folding_disabled=1

" Enable Rubocop/Syntastic integration
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_html_tidy_ignore_errors=["proprietary attribute \"ng-", "trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

" Vundle configuration
"call vundle#rc()
"Bundle 'gmarik/vundle'
"Bundle 'Valloric/YouCompleteMe'

" Allow local settings overrides with ~/.vimrc.local
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Color scheme Birds of Paradise
set background=dark
hi clear
syntax reset

" Colors for the User Interface.

hi Cursor      guibg=#cc4455  guifg=white    gui=bold ctermbg=4 ctermfg=15
hi link CursorIM Cursor
hi Normal      guibg=#332211  guifg=white    gui=none ctermbg=0 ctermfg=15
hi NonText     guibg=#445566  guifg=#ffeecc  gui=bold ctermbg=8 ctermfg=14
hi Visual      guibg=#557799  guifg=white    gui=none ctermbg=9 ctermfg=15

hi Linenr      guibg=bg	      guifg=#aaaaaa  gui=none ctermbg=bg ctermfg=7

hi Directory   guibg=bg	      guifg=#337700  gui=none ctermbg=bg ctermfg=10

hi IncSearch   guibg=#0066cc  guifg=white    gui=none ctermbg=1 ctermfg=15
hi link Seach IncSearch

hi SpecialKey  guibg=bg	guifg=fg       gui=none ctermbg=bg ctermfg=fg
hi Titled      guibg=bg	guifg=fg       gui=none ctermbg=bg ctermfg=fg

hi ErrorMsg    guibg=bg	guifg=#ff0000  gui=bold ctermbg=bg ctermfg=12
hi ModeMsg     guibg=bg	guifg=#ffeecc  gui=none ctermbg=bg ctermfg=14
hi link	 MoreMsg     ModeMsg
hi Question    guibg=bg	guifg=#ccffcc  gui=bold ctermbg=bg ctermfg=10
hi link	 WarningMsg  ErrorMsg

hi StatusLine	  guibg=#ffeecc	 guifg=black	gui=bold ctermbg=14 ctermfg=0
hi StatusLineNC	  guibg=#cc4455	 guifg=white	gui=none ctermbg=4  ctermfg=11
hi VertSplit	  guibg=#cc4455	 guifg=white	gui=none ctermbg=4  ctermfg=11

hi DiffAdd     guibg=#446688  guifg=fg	  gui=none ctermbg=1 ctermfg=fg
hi DiffChange  guibg=#558855  guifg=fg	  gui=none ctermbg=2 ctermfg=fg
hi DiffDelete  guibg=#884444  guifg=fg	  gui=none ctermbg=4 ctermfg=fg
hi DiffText    guibg=#884444  guifg=fg	  gui=bold ctermbg=4 ctermfg=fg

" Colors for Syntax Highlighting.

hi Comment  guibg=#334455  guifg=#dddddd  gui=none    ctermbg=8	  ctermfg=7

hi Constant    guibg=bg	   guifg=white	  gui=bold    ctermbg=8	  ctermfg=15
hi String      guibg=bg	   guifg=#ffffcc  gui=italic  ctermbg=bg  ctermfg=14
hi Character   guibg=bg	   guifg=#ffffcc  gui=bold    ctermbg=bg  ctermfg=14
hi Number      guibg=bg	   guifg=#bbddff  gui=bold    ctermbg=1   ctermfg=15
hi Boolean     guibg=bg	   guifg=#bbddff  gui=none    ctermbg=1   ctermfg=15
hi Float       guibg=bg	   guifg=#bbddff  gui=bold    ctermbg=1   ctermfg=15

hi Identifier  guibg=bg    guifg=#ffddaa  gui=bold    ctermbg=bg  ctermfg=12
hi Function    guibg=bg    guifg=#ffddaa  gui=bold    ctermbg=bg  ctermfg=12
hi Statement   guibg=bg    guifg=#ffffcc  gui=bold    ctermbg=bg  ctermfg=14

hi Conditional guibg=bg    guifg=#ff6666  gui=bold    ctermbg=bg  ctermfg=12
hi Repeat      guibg=bg    guifg=#ff9900  gui=bold    ctermbg=4   ctermfg=14
hi Label       guibg=bg    guifg=#ffccff  gui=bold    ctermbg=bg   ctermfg=13
hi Operator    guibg=bg    guifg=#cc9966  gui=bold    ctermbg=6   ctermfg=15
hi Keyword     guibg=bg	   guifg=#66ffcc  gui=bold    ctermbg=bg  ctermfg=10
hi Exception   guibg=bg	   guifg=#66ffcc  gui=bold    ctermbg=bg  ctermfg=10

hi PreProc	  guibg=bg	 guifg=#ffcc99	gui=bold ctermbg=4  ctermfg=14
hi Include	  guibg=bg	 guifg=#99cc99	gui=bold ctermbg=bg ctermfg=10
hi link Define	  Include
hi link Macro	  Include
hi link PreCondit Include

hi Type		  guibg=bg	 guifg=#ff7788  gui=bold    ctermbg=bg	ctermfg=12
hi StorageClass	  guibg=bg	 guifg=#99cc99  gui=bold    ctermbg=bg	ctermfg=10
hi Structure	  guibg=bg	 guifg=#99ff99  gui=bold    ctermbg=bg	ctermfg=10
hi Typedef	  guibg=bg	 guifg=#99cc99  gui=italic  ctermbg=bg	ctermfg=10

hi Special	  guibg=bg	 guifg=#bbddff	gui=bold    ctermbg=1	ctermfg=15
hi SpecialChar	  guibg=bg	 guifg=#bbddff	gui=bold    ctermbg=1	ctermfg=15
hi Tag		  guibg=bg	 guifg=#bbddff	gui=bold    ctermbg=1	ctermfg=15
hi Delimiter	  guibg=bg	 guifg=fg	gui=bold    ctermbg=1	ctermfg=fg
hi SpecialComment guibg=#334455	 guifg=#dddddd	gui=italic  ctermbg=1	ctermfg=15
hi Debug	  guibg=bg	 guifg=#ff9999	gui=none    ctermbg=8	ctermfg=12

hi Underlined guibg=bg guifg=#99ccff gui=underline ctermbg=bg ctermfg=9 cterm=underline

hi Title    guibg=#445566  guifg=white	  gui=bold    ctermbg=1	  ctermfg=15
hi Ignore   guibg=bg	   guifg=#cccccc  gui=italic  ctermbg=bg  ctermfg=8
hi Error    guibg=#ff0000  guifg=white	  gui=bold    ctermbg=12  ctermfg=15
hi Todo	    guibg=#556677  guifg=#ff0000  gui=bold    ctermbg=1	  ctermfg=12

hi htmlH2 guibg=bg guifg=fg gui=bold ctermbg=8 ctermfg=fg
hi link htmlH3 htmlH2
hi link htmlH4 htmlH3
hi link htmlH5 htmlH4
hi link htmlH6 htmlH5

" And finally.

let g:colors_name = "Guardian"
let colors_name   = "Guardian"

