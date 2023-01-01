## 概要
自分用neovim設定ファイル。
まだneovimを使い始めたばかりなので、これから徐々に育てていく...

## ディレクトリ構成

```
├── init.vim          " メインの設定ファイル
├── plugins.vim       " プラグイン関係
├── toml              " プラグイン関係
│   ├── dein.toml
│   └── dein_lazy.toml
├── coc-settings.json " cocの設定
├── colors
│   └── tender.vim
└── pack
    └── plugins
        └── start     " プラグインを作る時にここにシンボリックリンクを貼ってテストしたり
```

## キーマップ
各ファイルで定義しているので、ここにメモとしてまとめておく。
```vim
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<space>
nnoremap gb :Buffers<CR>
nnoremap <C-/> <Plug>(caw:i:toggle)                                          " コメントアウト(Ctrl + /)
vnoremap <C-/> <Plug>(caw:i:toggle)                                          " コメントアウト(Ctrl + /)
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nnoremap <space>d <Plug>(coc-definition)                            " 定義ジャンプ(space d)
nnoremap <space>ds :sp<CR><Plug>(coc-definition)                    " 定義ジャンプした時に水平分割(space ds)
nnoremap <space>dv :vs<CR><Plug>(coc-definition)                    " 定義ジャンプした時に垂直分割(space dv)
nnoremap <space>h :<C-u>call CocAction('doHover')<cr>               " 関数とかのドキュメントを表示する
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <C-c><C-c> :nohlsearch<CR><Esc>
inoremap <C-c> <Esc>
nnoremap <TAB> :bn<Enter>                                                    " 次のバッファに切り替え(Tab)
nnoremap <S-TAB> :bN<Enter>                                                  " 前のバッファに切り替え(Shift+Tab)
tnoremap <Esc> <C-\><C-n>                                                    " ターミナルモード(:termimal)からノーマルモードにに入る(ESC)
```

## プラグイン管理
dein.vimを使用。

## Fonts
[Cica](https://github.com/miiton/Cica/releases/download/v5.0.3/Cica_v5.0.3.zip)を使用。