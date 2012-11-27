let g:solarized_termcolors=16
let g:solarized_termtrans = 1
let g:solarized_visibility="high"
let g:solarized_contrast = "high"
colorscheme solarized
colorscheme molokai
if has("mac")
  set guifont=Monaco:h12.00
  set fuopt=maxhorz,maxvert
else
  set gfn=DejaVu\ Sans\ Mono\ Bold\ 10
end

set guioptions-=T  "remove toolbar
set guioptions-=m  "remove menu

set lines=47
set columns=161
