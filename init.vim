" ================================================================================
" init.vim
" ================================================================================
if &modifiable == 1
  set enc=utf-8
  set fenc=utf-8
endif
set helplang=ja
" 編集中のファイルが変更されたら自動で読み直す
" set autoread
set cursorline
set cursorcolumn
" 行番号を表示
set number
" タブや改行を表示
set list
set listchars=tab:»-,trail:-,eol:↓,extends:»,precedes:«,nbsp:%
" Tab 文字を半角スペースにする
set expandtab
" 行頭での Tab 文字の表示幅
set shiftwidth=2
" ファイルタイプ毎のインデント設定
augroup fileTypeIndent
  autocmd!
  autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END
set clipboard+=unnamed
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set nowrapscan
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" キーマッピング
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <C-c><C-c> :nohlsearch<CR><Esc>
inoremap <C-c> <Esc>
nnoremap <TAB> :bn<Enter>
nnoremap <S-TAB> :bN<Enter>
" FIXME: 背景が透明じゃなくなる...
" if !has('gui_running')
"   augroup transpancy
"     autocmd!
"     autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
"     autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
"     autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none
"     autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none
"     autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none
"   augroup END
" endif
" ------------------------------------------------------------------------------
"
" IME切り替え設定
"
augroup im_select
  autocmd!
  if has('mac')
    autocmd InsertLeave * :call system('im-select com.apple.keylayout.ABC')
    autocmd InsertEnter * :call system('im-select com.apple.keylayout.ABC')
    autocmd BufRead * :call system('im-select com.apple.keylayout.ABC')
    autocmd CmdlineLeave * :call system('im-select com.apple.keylayout.ABC')
    autocmd CmdlineEnter * :call system('im-select com.apple.keylayout.ABC')
  endif
augroup END
" ------------------------------------------------------------------------------
source ~/.config/nvim/plugins.vim
