## 概要
自分用neovim設定ファイル。  
まだneovimを使い始めたばかりなので移行は大変でしたが、ある程度整ってきたかなと思います。  
基本的にはMac(iTerm2)で使用、たまにWindowsのWSL(Windows Terminal)で使用。

## ディレクトリ構成

```
├── init.vim          " メインの設定ファイル
├── plugins.vim       " プラグイン関係
├── toml              " プラグイン関係
│   ├── dein.toml
│   └── dein_lazy.toml
├── coc-settings.json " cocの設定
├── colors
│   └── tender.vim
└── pack
    └── plugins
        └── start     " プラグインを作る時にここにシンボリックリンクを貼ってテストしたり
```

## キーマップ
各ファイルで定義しているので、ここにメモとしてまとめておく。  
基本方針は"**vim本来の操作性を崩さないように**"すること。  
そのためプラグインを呼び出すためのマッピングが主で、vimそのもののキーマップは**なるべく**変更しないようにする。  
どうしてもの場合は仕方ない。
```vim
nnoremap <C-n> :NERDTreeToggle<CR>                                           " NERDTree表示/非表示切り替え
nnoremap <C-w>t :NERDTreeFind<CR>                                            " NERDTreeを開き、現在開いているファイルの場所にジャンプ
nnoremap <C-p> :Files<CR>                                                    " ファイル名検索(カレントディレクトリ配下)
nnoremap gb :Buffers<CR>                                                     " ファイル名検索(バッファリスト)
nnoremap <C-/> <Plug>(caw:hatpos:toggle)                                     " コメントアウト(ノーマルモード)
vnoremap <C-/> <Plug>(caw:hatpos:toggle)                                     " コメントアウト(ビジュアルモード)
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"         " 補完の選択をEnterで決定
nnoremap <space>d <Plug>(coc-definition)                                     " 定義ジャンプ(※)
nnoremap <space>h :<C-u>call CocAction('doHover')<CR>                        " 関数とかの情報を表示する
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <C-c><C-c> :nohlsearch<CR><Esc>
inoremap <C-c> <Esc>
nnoremap <TAB> :bn<Enter>                                                    " 次のバッファに切り替え
nnoremap <S-TAB> :bN<Enter>                                                  " 前のバッファに切り替え
tnoremap <Esc> <C-\><C-n>                                                    " ターミナルモード(:termimal)から```ESC```でノーマルモードにに入る
```
※定義元を画面分割して表示したい場合は、画面分割後ジャンプする  
　最初はキーマップを定義していたが結局この手順に落ち着いている

## プラグイン管理
dein.vimを使用。

## インストールが必要な外部ツール
本当はもっとある気がするけど主なものだけでもメモしておく。
- ripgrep  
→fzfのRgを使用するのに必要
- bat  
→fzfのプレビューウィンドウをsyntax highlightするのに必要
- node, npm
→coc.nvimを使用するのに必要

## session管理
sessionが壊れないための対策
- sessionoptionsで、保存する内容を限定する。以下のように設定している。
```vim
set sessionoptions=buffers,curdir,tabpages
```
- NERDTreeやhelpなど、sessionが不安定になりやすいものを閉じた状態で```:mesession!```で保存する

## ファイル管理
- ファイルの行き来
  - 主にfzfとNERDTreeで行き来する
    - fzf
    ```vim
    " fzfの操作
    :Files    " ファイル名検索(キーマップ→<C-p>)
    :Buffers  " バッファからファイル名で検索(キーマップ→gb)
    :Rg       " Grep
    ```
    - NERDTree
    主に```<C-w>t```(:NERDTreeFind)で現在のファイル位置にジャンプしてそこを起点にファイルを探すときくらい  
    後は普通にプロジェクトのルートからディレクトリを辿ったりとか
  - 定義ジャンプ→```<space>d```
- ファイル作成、リネーム、移動等  
NERDTreeの機能を使うより```:terminal```で操作した方が楽...

## カッコ、クォーテーション、htmlの閉じタグ補完
[自作プラグイン](https://github.com/ukiuki-engineer/vim-autoclose)を使用。

## NOTE
- Fonts  
[Cica](https://github.com/miiton/Cica/releases/download/v5.0.3/Cica_v5.0.3.zip)を使用。
- coc.nvimの拡張機能を探す場所
  - [githubのwiki](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions)
  - [npm moduleを検索するサイト](https://www.npmjs.com/search?q=keywords%3Acoc.nvim)

## FIXME
- lspの一部のエラー表示が出ないように設定で変更できないか  
例えば以下のような場合
  - laravelで```use DB```としても、DBを使ってる箇所で```undefined```と表示される  
  →多分、DBをフルパスで書かないと怒られるようになってる
  - markdwonで、```#```を使わずに```##```から始めると警告が出る  
  →```#```はでかくなりすぎて自分はあまり好きじゃないから使わない...
  - コメントの中はundefinedをcheckしない
