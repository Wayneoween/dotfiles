" README {
" vim: set foldmarker={,} foldlevel=0 spell:
"
"    This is my personal vim configuration. As quite a lot of effort went into
"    it, I would be glad if this was useful for anybody else than me.
"
"    Feel free to ask question or reuse any useful parts.
"
"    I also periodically sync my current vimrc to Github, so feel free to grab
"    the current version from there:
"        https://github.com/Wayneoween/vimrc
" }

" Basic {
    "Use vim defaults
    set nocompatible
    "Disable filetype detection during init
    filetype plugin on
    "Enable Syntax highlighting
    syntax enable
    "Explicitly define xterm as environment
    behave xterm
    "More screen updates
    set ttyfast
    "Enable modelines, secured by ciaranm/securemodelines
    set modeline
    "No exec
    set secure
    "Encoding
    set encoding=utf-8
    "Remove splash screen
    set shortmess+=I
    "Function of the backspace key
    set backspace=indent,eol,start
    "Don't use swap files
    set noswapfile
    "Use this specific term env
    set term=xterm-256color
    set t_RV=
" }

" Operating System Specific {
    let os = substitute(system('uname'), "\n", "", "")
    if os == "FreeBSD"
    elseif os == "Linux"
    elseif os == "Darwin"
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_SR = "\<Esc>]50;CursorShape=2\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
" }

" I chose to use vim-plug as a plugin manager (https://github.com/junegunn/vim-plug)
" vim-plug setup {
    call plug#begin('~/.vim/plugged')

    " Styling of vim
    " {

        " start screen for vim
        " https://vimawesome.com/plugin/vim-startify
        Plug 'mhinz/vim-startify'

        " Solarized Colorscheme for vim
        " https://vimawesome.com/plugin/vim-colors-solarized-ours
        Plug 'altercation/vim-colors-solarized'

        " a nice statusline at the bottom for vim
        " https://vimawesome.com/plugin/vim-airline-superman
        Plug 'vim-airline/vim-airline'

        " theme repository for vim-airline
        " https://vimawesome.com/plugin/vim-airline-themes
        Plug 'vim-airline/vim-airline-themes'

        " shows a git diff in the 'gutter' (sign column)
        " https://vimawesome.com/plugin/vim-gitgutter
        Plug 'airblade/vim-gitgutter'

    " }

    " Language Support
    " {

        " Asynchronous Lint Engine for vim
        " https://vimawesome.com/plugin/ale
        Plug 'dense-analysis/ale'

        " collection of language packs for vim
        " https://vimawesome.com/plugin/vim-polyglot
        Plug 'sheerun/vim-polyglot'

        " Make vim more puppet friendly
        " https://github.com/rodjek/vim-puppet
        Plug 'rodjek/vim-puppet'

        " GoLang Support
        " https://github.com/fatih/vim-go
        " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

        " code completion with language servers
        " https://github.com/neoclide/coc.nvim
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " }

    " External Tool Wrapping
    " {

        " the best Git wrapper of all time
        " https://vimawesome.com/plugin/fugitive-vim
        Plug 'tpope/vim-fugitive'

        " a git commit browser using vim-fugitive
        Plug 'junegunn/gv.vim'

        " fzf-based commands and mappings for vim
        " https://vimawesome.com/plugin/fzf-vim
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'

        " search tool
        " https://vimawesome.com/plugin/ack-vim
        Plug 'mileszs/ack.vim'

        " rubocop
        Plug 'ngmy/vim-rubocop'

    " }

    " Features and enhancements
    " {

        " https://editorconfig.org plugin for vim
        " https://vimawesome.com/plugin/editorconfig-vim
        Plug 'editorconfig/editorconfig-vim'

        " file system explorer for vim
        " https://vimawesome.com/plugin/nerdtree-red
        Plug 'scrooloose/nerdtree'

        " user-configurable modeline support for vim
        " https://vimawesome.com/plugin/securemodelines
        Plug 'ciaranm/securemodelines'

        " to comment stuff out in vim
        " https://vimawesome.com/plugin/commentary-vim
        Plug 'tpope/vim-commentary'

        " surroundings: parentheses, brackets, quotes, XML tags
        " https://vimawesome.com/plugin/surround-vim
        Plug 'tpope/vim-surround'

        " changes the working directory to the project root
        " https://vimawesome.com/plugin/rooter
        Plug 'airblade/vim-rooter'

        " NERDTree showing git status flags
        " https://vimawesome.com/plugin/nerdtree-git-plugin
        Plug 'Xuyuanp/nerdtree-git-plugin'
    " }

    " Initialize plugin system
    call plug#end()
" }

" General {
    " Backup and temporary files {
         set nobackup
         "set backupdir=~/.vim/.vimbak
         set undofile
         set undodir=~/.vim/.vimundo
         set directory=~/.vim/.vimtmp,.
         set history=2048
         set undolevels=2048
    " }
    " Tab completion {
        set wildmenu
        set wildmode=list:longest,list:full
        set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
    " }
    " Searching {
        "Highlightsearch
        set hlsearch
        "Start searching with the first character
        set incsearch
        "Ignore case
        set ignorecase
        "Match case if searchstring starts with uppercase
        set smartcase
        "Global search by default
        set gdefault
        "Treat more characters as special (like in perl) when searching (e.g. . *)
        set magic
    " }
    " Spelling {
        set spelllang=en
    " }
    " Misc {
        " Only one whitespace after _J_oining after a dot
        set nojoinspaces
        " Disable autoselection of vim clipboard
        set clipboard-=autoselect
        set guioptions-=a
        " Use the best available cryptmethod
        if has("patch-7.4.399")
            set cryptmethod=blowfish2
        endif
    " }
" }

" Appearance and handling {
    " Theme {
        " Use a portable version of solarized in all terminals except iterm
        if $LC_TERM != 'iterm'
            let t_Co=256
            let g:solarized_termcolors=256
            let g:solarized_termtrans=1
        endif
        " Set colorscheme to solarized
        colorscheme solarized
        " Use the dark version of solarized
        set background=dark
    " }
    " Color tweaks {
        " Used by listchars
        hi Search ctermbg=DarkYellow ctermfg=White
        hi SpecialKey ctermbg=4

        "hi Identifier ctermfg=6 cterm=bold
            " 0 black, 1 darkred, 2 darkgreen, 3 darkyellow, 4 darkblue, 5 darkmagenta, 6 darkcyan, 7 grey
            " Non-safe Colors, 16-Color-Term:
            " darkgrey, lightblue, lightgreen, lightcyan, lightred, lightmagenta, " lightyellow, white
    " }
    " Statusbar {
        "Renaming xterm window
        set title
        "Don't show line numbers
        set nonumber
        "Always show the status bar
        set laststatus=2
    " }
    " Misc Handling {
        "Always let 5 lines below and above the cursor on the screen
        set scroll=11
        set scrolloff=5
        set sidescroll=8
        "Bracket matching
        set showmatch
        "Show unfinished commands
        set showcmd
        "No Bell
        set noerrorbells visualbell t_vb=
        set mouse=
    " }
" }

" Text Formatting/Layout {
    " Whitespace and Tab display {
        set nolist
        "set list listchars=tab:>.,trail:.
        set listchars=tab:\ \ ,trail:\.
        "set list listchars=tab:>.,trail:�
    " }
    " Overlong lines display {
        "Don't do newlines automatically
        set fo-=t
        "Scroll right by default instead of breaking the line
        set nowrap
        "Don't stat a new line automatically break lines
        set wrapmargin=0
        "But continue with a mark in the next line
        set showbreak=>>>
    " }
    " Indention {
        "One Tab per indentation level. 4 column wide Tabs.
        "Intelligently detect current indention level
        set autoindent
        "Size of real Tabs
        set tabstop=4
        "Indent amount when using TAB
        set softtabstop=4
        "Indent amount when using cindent, >>, ..
        set shiftwidth=4
        "Do not expand tabs to spaces
        set noexpandtab
    " }
    " Folding (disabled) {
        "Disable folding completely
        "set nofoldenable
        "Disable folding in the initial view
        set foldlevel=20
        "Make folding indent sensitive
        set foldmethod=indent
    " }
" }

" Mappings and functions {
    " Misc {
        "Easier escape
        inoremap jj <ESC>
        inoremap ,, <ESC>
        "Match brackets key
        nnoremap <tab> %
        vnoremap <tab> %
        "Clear highlight
        map <silent> <C-l> :silent nohl<CR>
        "Save as root
        cmap w!! %!sudo tee > /dev/null %
    " }
    " Custom Keyset {
        let mapleader = ","
        "Reselect just pasted content
        nnoremap <leader>v V`]
        "Split Window and switch over to it
        nnoremap <leader>w <C-w>v<C-w>l
        nnoremap <leader>w <C-w>h<C-w>l
        "Search and replace all occurences of word
        nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
        "Upload file or buffer to ix.io
        noremap <silent> <leader>i :w !ix<CR>
    " }
    " C&P between files via a tempfile {
        "Copy to buffer
        vnoremap <leader>y :w! ~/.vim/.vimbak/vimbuffer<CR>
        nnoremap <leader>y :.w! ~/.vim/.vimbak/vimbuffer<CR>
        "Paste from buffer
        nnoremap <leader>p :r ~/.vim/.vimbak/vimbuffer<CR>
        nnoremap <leader>P :-r ~/.vim/.vimbak/vimbuffer<CR>
    " }
    " Disable arrow keys by default {
    "    nnoremap <up> <nop>
    "    nnoremap <down> <nop>
    "    nnoremap <left> <nop>
    "    nnoremap <right> <nop>
    "    inoremap <up> <nop>
    "    inoremap <down> <nop>
    "    inoremap <left> <nop>
    "    inoremap <right> <nop>
        "nnoremap j gj
        "nnoremap k gk
    " }
    " Reminders {
        "+y (copy)
        "+x (cut)
        "+p (paste)
    " }
    " Functions {
        " Toggle background {
            function ToggleSolarizedBackground()
                if &background != 'light'
                    colorscheme solarized
                    set background=light
                else
                    colorscheme solarized
                    set background=dark
                endif
            endfunction
        " }
        " Toggle the arrow keys {
        "    function ToggleArrowKeys()
        "        if !exists('s:arrow_keys')
        "            unmap <up>
        "            unmap <down>
        "            unmap <left>
        "            unmap <right>
        "            let s:arrow_keys = 1
        "        else
        "            nnoremap <up> <nop>
        "            nnoremap <down> <nop>
        "            nnoremap <left> <nop>
        "            nnoremap <right> <nop>
        "            inoremap <up> <nop>
        "            inoremap <down> <nop>
        "            inoremap <left> <nop>
        "            inoremap <right> <nop>
        "            unlet s:arrow_keys
        "        endif
        "    endfunction
        " }
        " Toggle whitespace and tab display {
            function ToggleList()
                if &list
                    set nolist
                else
                    set list
                endif
            endfunction
        " }
        " Toggle visual highlighting of lines longer than 80 chars {
            function ToggleColorColumn()
                if exists('+colorcolumn')
                    if empty(&colorcolumn)
                        highlight ColorColumn ctermbg=red
                        if empty(&textwidth)
                            set colorcolumn=81
                        else
                            set colorcolumn=+1
                        endif
                    else
                        set colorcolumn=
                    endif
                else
                    if !exists('s:color_column')
                        highlight OverLength ctermbg=red ctermfg=white
                        match OverLength /\%81v.\+/
                        let s:color_column = 1
                    else
                        match OverLength //
                        unlet s:color_column
                    endif
                endif
            endfunction
        " }
        " Toggle line numbers {
            function ToggleNumber()
                if &number
                    set norelativenumber
                    set nonumber
                else
                    set norelativenumber
                    set number
                endif
            endfunction
        " }
        " Toggle relative line numbers {
            function ToggleRelNumber()
                if &relativenumber
                    set nonumber
                    set norelativenumber
                else
                    set number
                    set relativenumber
                endif
            endfunction
        " }
        " Toggle line wrap {
            function ToggleWrap()
                if &wrap
                    set nowrap
                else
                    set wrap
                endif
            endfunction
        " }
    " }
    " Function Keys {
        " Handling:
        " <F2> Toggle git diff cloumn
        map <silent><F2> :GitGutterToggle <CR>
        " <L-F2> Toggle git diff line highlighting
        map <silent><leader><F2> :GitGutterLineHighlightsToggle <CR>
        " <F3> Toggle line numbers
        map <silent><F3> :call ToggleRelNumber() <CR>
        " <F4> Toggle paste mode
        set pastetoggle=<F4>
        " Looks:
        " <F5> Toggle whitespace and tab display
        map <silent><F5> :call ToggleList() <CR>
        " <F6> Toggle line number
        map <silent><F6> :call ToggleNumber() <CR>
        " <F7> Toggle line wrap
        map <silent><F7> :call ToggleWrap() <CR>
        " <L-F7> Toggle background
        call togglebg#map("<leader><F7>")
        map <silent><leader><F7> :call ToggleSolarizedBackground() <CR>
        " <F8> Toggle visual highlighting of lines longer than 80 chars
        map <silent><F8> :call ToggleColorColumn() <CR>
        " Functions:
        " <F12> Display all custom keybindings
        map <silent><F12> :!egrep '" <([LS]-)?F[1-9][0-2]?> ' ~/.vimrc <CR>
    " }
" }
" Settings for addons {
    " CoC recommended settings {
        "TextEdit might fail if not set
        set hidden
        "Long updatetimes suck
        set updatetime=300
        " Don't pass messages to |ins-completion-menu|.
        set shortmess+=c
        " Always show the signcolumn, otherwise it would shift the text each time
        " diagnostics appear/become resolved.
        if has("nvim-0.5.0") || has("patch-8.1.1564")
            " Recently vim can merge signcolumn and number column into one
            set signcolumn=number
        else
            set signcolumn=yes
        endif
        " Use tab for trigger completion with characters ahead and navigate.
        " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
        " other plugin before putting this into your config.
        inoremap <silent><expr> <TAB>
                    \ pumvisible() ? "\<C-n>" :
                    \ <SID>check_back_space() ? "\<TAB>" :
                    \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
            let col = col('.') - 1
            return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        " Use <c-space> to trigger completion.
        if has('nvim')
            inoremap <silent><expr> <c-space> coc#refresh()
        else
            inoremap <silent><expr> <c-@> coc#refresh()
        endif

        " Make <CR> auto-select the first completion item and notify coc.nvim to
        " format on enter, <cr> could be remapped by other vim plugin
        inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

        " GoTo code navigation.
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)

        " Use K to show documentation in preview window.
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
            if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
            elseif (coc#rpc#ready())
                call CocActionAsync('doHover')
            else
                execute '!' . &keywordprg . " " . expand('<cword>')
            endif
        endfunction

        " Highlight the symbol and its references when holding the cursor.
        autocmd CursorHold * silent call CocActionAsync('highlight')

        " Symbol renaming.
        nmap <leader>rn <Plug>(coc-rename)

        " Formatting selected code.
        xmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)

        augroup mygroup
            autocmd!
            " Setup formatexpr specified filetype(s).
            autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
            " Update signature help on jump placeholder.
            autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        augroup end

        " Apply AutoFix to problem on the current line.
        nmap <leader>qf  <Plug>(coc-fix-current)
    " }
    " fzf.vim {
        nnoremap <C-p> :Files<CR>
    " }
    " ALE {
        nmap <silent> <C-k> <Plug>(ale_previous_wrap)
        nmap <silent> <C-j> <Plug>(ale_next_wrap)
        let g:ale_open_list = 1
        let g:ale_lint_on_text_changed = 1
        let g:ale_lint_on_enter = 1
        let g:ale_lint_on_save = 1
        let g:ale_fix_on_save = 0
        let g:ale_display_lsp = 1

        let b:ale_linters = {
                    \ 'javascript': ['eslint'],
                    \ 'python': ['flake8', 'pylint'],
                    \ 'ruby': ['rubocop'],
                    \ 'yaml': ['yamllint'],
                    \ }
        " Set this. Airline will handle the rest.
        let g:airline#extensions#ale#enabled = 1
    " }
    " ack.vim {
        if executable('ag')
            nnoremap <C-p> :Files<Cr>
            nnoremap <C-g> :Ag<Cr>
            let g:ackprg = 'ag --vimgrep'
            " let g:ackprg = 'ag --nogroup --nocolor --column'
        endif
    " }
    " vim-gitgutter {
        let g:gitgutter_enabled = 1
        highlight SignColumn ctermfg=239 ctermbg=235 guifg=Yellow
        highlight GitGutterAdd ctermfg=2 ctermbg=235 guifg=#009900
        highlight GitGutterChange ctermfg=3 ctermbg=235 guifg=#bbbb00
        highlight GitGutterDelete ctermfg=1 ctermbg=235 guifg=#ff2222
        nmap <leader>j <Plug>GitGutterNextHunk
        nmap <leader>k <Plug>GitGutterPrevHunk
        " Decrease amount of executions
        "let g:gitgutter_eager = 0
    " }
    " vim-go {
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_structs = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1
    " }
    " json-vim {
        augroup json_autocmd
            autocmd!
            autocmd FileType json set autoindent
            autocmd FileType json set formatoptions=tcq2l
            autocmd FileType json set textwidth=78 shiftwidth=2
            autocmd FileType json set softtabstop=2 tabstop=8
            autocmd FileType json set expandtab
            autocmd FileType json set foldmethod=syntax
        augroup END
    " }
    " NERDtree {
         " Autostart NERDtree when opening an empty buffer
         "autocmd StdinReadPre * let s:std_in=1
         "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
         let g:NERDTreeNodeDelimiter = "\u00a0"
         let g:NERDTreeHijackNetrw = 0

         " Close vim if NERDtree is only window
         autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

         " https://github.com/scrooloose/nerdtree/issues/480
         function! NERDTreeToggleInCurDir()
             " If NERDTree is open in the current buffer
             if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
                 exe ":NERDTreeClose"
             else
                 if (expand("%:t") != '')
                     exe ":NERDTreeFind"
                 else
                     exe ":NERDTreeToggle"
                 endif
             endif
         endfunction

         " Toggle NERDtree with CTRL-e
         nnoremap <C-e> :call NERDTreeToggleInCurDir()<CR>
    " }
    " easytags {
        augroup easytags
            autocmd!
            let g:easytags_file = '~/.vim/tags'
        augroup END
    " }
    " Airline.vim {
        augroup airline_config
            autocmd!
            let g:airline_theme='solarized'
            let g:airline_powerline_fonts = 1
            let g:airline_enable_syntastic = 1
            let g:airline#extensions#tabline#buffer_nr_format = '%s '
            let g:airline#extensions#tabline#buffer_nr_show = 1
            let g:airline#extensions#tabline#enabled = 1
            let g:airline#extensions#tabline#fnamecollapse = 0
            let g:airline#extensions#tabline#fnamemod = ':t'
        augroup END
    " }
    " syntastic {
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_aggregate_errors = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 0
        let g:syntastic_check_on_wq = 1

        " ruby
        let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of a variable in void context'}

        " lua
        let g:syntastic_lua_checkers = ["luac", "luacheck"]
        let g:syntastic_lua_luacheck_args = "--no-unused-args"

        " html
        let syntastic_mode_map = { 'passive_filetypes': ['html'] }
    " }
    " tagbar {
        nmap <F9> :TagbarToggle<CR>
        let g:tagbar_type_puppet = {
                    \ 'ctagstype': 'puppet',
                    \ 'kinds': [
                      \'c:class',
                      \'s:site',
                      \'n:node',
                      \'d:definition',
                      \'r:resource',
                      \'f:default'
                      \]
                    \}
    " }
" }

" Conditionals {
    if has('autocmd')
        augroup testgroup
        autocmd!
        " Filetype detection {
            au BufRead,BufNewFile *.gui         set ft=perl
            au BufRead,BufNewFile *.haml        set ft=haml
            au BufRead,BufNewFile *.hs          set ft=haskell
            au BufRead,BufNewFile *.ino,*.pde   set ft=arduino
            au BufRead,BufNewFile *.j2          set ft=jinja
            au BufRead,BufNewFile *.json        set ft=json
            au BufRead,BufNewFile *.pp          set ft=puppet expandtab
            au BufRead,BufNewFile *.sh.erb      set ft=sh
            au BufRead,BufNewFile .vimrc        set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
            au BufRead,BufNewFile Capfile       set ft=ruby
            au BufRead,BufNewFile Vagrantfile*  set ft=ruby
            au BufRead,BufNewFile *.go          set ft=go
            au BufRead,BufNewFile *.coffee      set ft=js
        " }
        " Filetype settings {
            au FileType arduino                 set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
            au FileType eruby,ruby              set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
            au FileType scss,yaml,css,dot       set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
            au FileType haskell                 set tabstop=4 softtabstop=2 shiftwidth=2 expandtab
            au FileType html                    set tabstop=2 softtabstop=2 shiftwidth=2 smartindent expandtab
            au FileType javascript              set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
            au FileType lua                     set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
            au FileType markdown                set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
            au FileType perl                    set tabstop=8 softtabstop=4 shiftwidth=4 noexpandtab smarttab shiftround
            au FileType python                  set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
            au FileType sh,bash                 set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
            au FileType tex                     set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
            au FileType vim                     set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
        " }
    endif
" }

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
