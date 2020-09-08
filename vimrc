set encoding=utf-8
syntax enable

filetype off

call plug#begin('~/.vim/plugz')
  Plug 'bkad/CamelCaseMotion'
  Plug 'vim-airline/vim-airline'
  Plug 'dense-analysis/ale'
  Plug 'jiangmiao/auto-pairs'
  Plug 'kien/ctrlp.vim'
  Plug 'mattn/emmet-vim'
  Plug 'junegunn/fzf.vim'
  Plug 'sjl/gundo.vim'
  Plug 'ruby-formatter/rufo-vim'
  Plug 'majutsushi/tagbar'
  Plug 'tomtom/tcomment_vim'
  Plug 'ap/vim-css-color'
  Plug 'junegunn/vim-emoji'
  Plug 'kyuhi/vim-emoji-complete'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'Galooshi/vim-import-js'
  Plug 'sheerun/vim-polyglot'
  Plug 'prettier/vim-prettier'
  Plug 'tpope/vim-ragtag'
  Plug 'mhinz/vim-startify'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-dadbod'
  Plug 'rizzatti/dash.vim'
  Plug 'mhinz/vim-mix-format'
call plug#end()

compiler ruby

" NVim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

vnoremap ST :Strikethrough<CR>
vnoremap OL :Overline<CR>
vnoremap UL :Underline<CR>
vnoremap DUL :DoubleUnderline<CR>
let g:startify_session_autoload= 1

highlight FoldColumn  gui=bold    guifg=grey65     guibg=Grey90
highlight Folded      gui=italic  guifg=Black      guibg=Grey90
highlight LineNr      gui=NONE    guifg=grey60     guibg=Grey90
set hlsearch
set nrformats=
set number
set showmatch
set incsearch
set background=light
set hidden
set previewheight=10
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
set clipboard=unnamed
set rtp+=/usr/local/opt/fzf
set completefunc=emoji#complete

let g:AckAllFiles = 0
let g:AckCmd = 'ack --type-add ruby=.feature --ignore-dir=tmp 2> /dev/null'
highlight ALEWarning ctermbg=165
highlight ALEWarning ctermbg=166

let html_use_css=1
let html_number_lines=0
let html_no_pre=1

" ALE Config
let g:ale_fix_on_save = 1
let g:ale_close_preview_on_insert = 1

let g:ale_sign_error = emoji#for('skull')
let g:ale_sign_warning = emoji#for('collision')

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

let g:rubycomplete_buffer_loading = 1

let g:no_html_toolbar = 'yes'

let g:prettier#autoformat = 0
let g:prettier#config#parser = 'babylon'
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md Prettier

let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']
set tags=./tags,tags;$HOME
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

let g:autoclose_on = 1
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview

autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType tex setlocal textwidth=78
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78

autocmd FileType ruby runtime ruby_mappings.vim
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


let g:emoji_complete_overwrite_standard_keymaps = 0
let maplocalleader="\<Space>"
imap <C-L> <SPACE>=><SPACE>
imap <C-G> \|><SPACE>
imap <C-S> <Plug>(emoji-start-complete)
map <silent> s :FZF<CR>
map <silent> <LocalLeader>cj :!clj %<CR>
map <silent> <LocalLeader>rt :!ctags -F `ack --ruby -f`<CR>
map <silent> <LocalLeader>fr :CtrlPClearCache<CR>
map <silent> <LocalLeader>be :CtrlPBuffer<CR>
map <silent> <LocalLeader>hh :History<CR>
map <silent> <LocalLeader>bb :Buffer<CR>
map <silent> <LocalLeader>gd :e product_diff.diff<CR>:%!git diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>pd :e product_diff.diff<CR>:%!svn diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>bd :bufdo :bd<CR>
map <silent> <LocalLeader>cc :TComment<CR>
map <silent> <LocalLeader>imp :TsuImport<CR>
nmap <silent> <LocalLeader>tt :TagbarToggle<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>
map<silent> <LocalLeader>df :exec("tag ".expand("<cword>"))<CR>
map<silent> <LocalLeader>dff :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"ws -- white space: removes all trailing whitespace from a file
map <silent> <LocalLeader>ws :%s/\s\+$//<CR>

"fl -- format line: expands a single line of parameters into multiple lines
map <silent> <LocalLeader>fl :s/\([;,{]\) */\1\r  /g<CR>:s/  }/}/g<CR>:nohls<CR>

"command Wsudo w !sudo tee %       <----uncomment for Shift+W sudo save"
cnoremap <Tab> <C-L><C-D>

if version >= 700
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
  autocmd FileType tex setlocal spell spelllang=en_us
endif

if &t_Co == 256
  colorscheme solarized
  hi Normal guibg=NONE ctermbg=NONE
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
highlight LineLengthError ctermbg=17 guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=20 guibg=black

"Set filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru,Guardfile,*.god}     set ft=ruby

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
au BufRead,BufNewFile *.jar,*.war,*.ear,*.sar,*.rar                                   set filetype=zip

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

" returns true iff focused window is FuzzyFinder
function! RCisFFFocused()
  return -1 != match(expand('%'), 'fuf')
endfunction

" returns true iff focused window is rspec
function! RCisRspecFocused()
  return -1 != match(expand('%'), 'rb_test_output')
endfunction

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

"Map esc to hh
:imap hh <Esc>
" Map Tab to ctrlp
:imap <Tab><Tab> <c-p>

" Enable PowerLine
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

" VIM Split Enhancements
nnoremap <M-Right> <C-W>n
nnoremap <M-Left> <C-W>d
nnoremap <M-Down> <C-W>h
nnoremap <M-Up> <C-W>t

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
"
" Cursor/Line Highlighting
autocmd VimEnter * hi CursorLine cterm=NONE ctermbg=55
autocmd VimEnter * hi CursorColumn cterm=NONE ctermbg=55

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
  au WinLeave * setlocal nocursorline nocursorcolumn
augroup END

" Allow local settings overrides with ~/.vimrc.local
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
