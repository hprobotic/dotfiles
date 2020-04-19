" .vimrc / init.vim
" The following vim/neovim configuration works for both Vim and NeoVim

" ensure vim-plug is installed and then load it
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')
"colorschemes
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'

"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"navigation
Plug 'nguquen/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'

"monitoring
Plug 'wakatime/vim-wakatime'

"editor
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'xabikos/vscode-react'

Plug 'nguquen/vim-shot-f'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
"Plug 'chaoren/vim-wordmotion'
" General {{{
    " Abbreviations
    abbr funciton function
    abbr teh the
    abbr tempalte template
    abbr fitler filter
    abbr cosnt const
    abbr attribtue attribute
    abbr attribuet attribute

    set autoread " detect when a file is changed

    set history=1000 " change history to 1000
    set textwidth=120

    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

    if (has('nvim'))
        " show results of substition as they're happening
        " but don't open a split
        set inccommand=nosplit
    endif

    set backspace=indent,eol,start " make backspace behave in a sane manner
    set clipboard=unnamed

    " Searching
    set ignorecase " case insensitive searching
    set smartcase " case-sensitive if expresson contains a capital letter
    set hlsearch " highlight search results
    set incsearch " set incremental search, like modern browsers
    set nolazyredraw " don't redraw while executing macros

    set magic " Set magic on, for regex

    " error bells
    set noerrorbells
    set visualbell
    set t_vb=
    set tm=500
" }}}
" Appearance {{{
    set number " show line numbers
    set wrap " turn on line wrapping
    set wrapmargin=8 " wrap lines when coming within n characters from side
    set linebreak " set soft wrapping
    set showbreak=… " show ellipsis at breaking
    set autoindent " automatically set indent of new line
    set ttyfast " faster redrawing
    set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
    set laststatus=2 " show the status line all the time
    set so=7 " set 7 lines to the cursors - when moving vertical
    set wildmenu " enhanced command line completion
    set hidden " current buffer can be put into background
    set showcmd " show incomplete commands
    set noshowmode " don't show which mode disabled for PowerLine
    set wildmode=list:longest " complete files like a shell
    set shell=$SHELL
    set cmdheight=1 " command bar height
    set title " set terminal title
    set showmatch " show matching braces
    set mat=2 " how many tenths of a second to blink
    set updatetime=300
    set signcolumn=yes
    set shortmess+=c

    " Tab control
    set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
    set tabstop=4 " the visible width of tabs
    set softtabstop=4 " edit as if the tabs are 4 characters wide
    set shiftwidth=4 " number of spaces to use for indent and unindent
    set shiftround " round indent to a multiple of 'shiftwidth'

    " code folding settings
    set foldmethod=syntax " fold based on indent
    set foldlevelstart=99
    set foldnestmax=10 " deepest fold is 10 levels
    set nofoldenable " don't fold by default
    set foldlevel=1

    " toggle invisible characters
    set list
    set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
    set showbreak=↪

    set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
    " switch cursor to line when in insert mode, and block when not
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

    if &term =~ '256color'
        " disable background color erase
        set t_ut=
    endif

    " enable 24 bit color support if supported
    if (has("termguicolors"))
        if (!(has("nvim")))
            let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
            let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        endif
        set termguicolors
    endif

    " highlight conflicts
    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

    " Load colorschemes
    Plug 'chriskempson/base16-vim'

    " LightLine {{{
        Plug 'itchyny/lightline.vim'
        Plug 'nicknisi/vim-base16-lightline'
        let g:lightline = {
            \   'colorscheme': 'base16',
            \   'active': {
            \       'left': [ [ 'mode', 'paste' ],
            \               [ 'gitbranch' ],
            \               [ 'readonly', 'filetype', 'filename' ]],
            \       'right': [ [ 'percent' ], [ 'lineinfo' ],
            \               [ 'fileformat', 'fileencoding' ],
            \               [ 'gitblame', 'currentfunction',  'cocstatus', 'linter_errors', 'linter_warnings' ]]
            \   },
            \   'component_expand': {
            \   },
            \   'component_type': {
            \       'readonly': 'error',
            \       'linter_warnings': 'warning',
            \       'linter_errors': 'error'
            \   },
            \   'component_function': {
            \       'fileencoding': 'helpers#lightline#fileEncoding',
            \       'filename': 'helpers#lightline#fileName',
            \       'fileformat': 'helpers#lightline#fileFormat',
            \       'filetype': 'helpers#lightline#fileType',
            \       'gitbranch': 'helpers#lightline#gitBranch',
            \       'cocstatus': 'coc#status',
            \       'currentfunction': 'helpers#lightline#currentFunction',
            \       'gitblame': 'helpers#lightline#gitBlame'
            \   },
            \   'tabline': {
            \       'left': [ [ 'tabs' ] ],
            \       'right': [ [ 'close' ] ]
            \   },
            \   'tab': {
            \       'active': [ 'filename', 'modified' ],
            \       'inactive': [ 'filename', 'modified' ],
            \   },
            \   'separator': { 'left': '', 'right': '' },
            \   'subseparator': { 'left': '', 'right': '' }
        \ }
    " }}}
" }}}

" AutoGroups {{{
    " file type specific settings
    augroup configgroup
        autocmd!

        " automatically resize panes on resize
        autocmd VimResized * exe 'normal! \<c-w>='
        autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
        autocmd BufWritePost .vimrc.local source %
        " save all files on focus lost, ignoring warnings about untitled buffers
        autocmd FocusLost * silent! wa

        " make quickfix windows take all the lower section of the screen
        " when there are multiple windows open
        autocmd FileType qf wincmd J
        autocmd FileType qf nmap <buffer> q :q<cr>
    augroup END
" }}}
" General Functionality {{{
    " better terminal integration
    " substitute, search, and abbreviate multiple variants of a word
    Plug 'tpope/vim-abolish'

    " easy commenting motions
    Plug 'tpope/vim-commentary'

    " mappings which are simply short normal mode aliases for commonly used ex commands
    Plug 'tpope/vim-unimpaired'

    " endings for html, xml, etc. - ehances surround
    Plug 'tpope/vim-ragtag'

    " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
    Plug 'tpope/vim-surround'

    " tmux integration for vim
    Plug 'benmills/vimux'

    " enables repeating other supported plugins with the . command
    Plug 'tpope/vim-repeat'

    " .editorconfig support
    Plug 'editorconfig/editorconfig-vim'

    " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
    Plug 'AndrewRadev/splitjoin.vim'

    " detect indent style (tabs vs. spaces)
    Plug 'tpope/vim-sleuth'

    " Startify: Fancy startup screen for vim {{{
        Plug 'mhinz/vim-startify'

        " Don't change to directory when selecting a file
        let g:startify_files_number = 5
        let g:startify_change_to_dir = 0
        let g:startify_custom_header = [ ]
        let g:startify_relative_path = 1
        let g:startify_use_env = 1

        " Custom startup list, only show MRU from current directory/project
        let g:startify_lists = [
        \  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
        \  { 'type': function('helpers#startify#listcommits'), 'header': [ 'Recent Commits' ] },
        \  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
        \  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
        \  { 'type': 'commands',  'header': [ 'Commands' ]       },
        \ ]

        let g:startify_commands = [
        \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
        \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
        \ ]

        let g:startify_bookmarks = [
            \ { 'c': '~/.config/nvim/init.vim' },
            \ { 'g': '~/.gitconfig' },
            \ { 'z': '~/.zshrc' }
        \ ]

        autocmd User Startified setlocal cursorline
        nmap <leader>st :Startify<cr>
    " }}}

    " Close buffers but keep splits
    Plug 'moll/vim-bbye'
    nmap <leader>b :Bdelete<cr>

    " Writing in vim {{{{
        Plug 'junegunn/goyo.vim'

        autocmd! User GoyoEnter nested call helpers#goyo#enter()
        autocmd! User GoyoLeave nested call helpers#goyo#leave()
    " }}}

    " context-aware pasting
    Plug 'sickill/vim-pasta'

    " NERDTree {{{
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'ryanoasis/vim-devicons'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        let g:WebDevIconsOS = 'Darwin'
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:DevIconsEnableFolderExtensionPatternMatching = 1
        let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
        let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
        let NERDTreeNodeDelimiter = "\u263a" " smiley face

        augroup nerdtree
            autocmd!
            autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
            autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
        augroup END

        "open NERDTree automatically when vim starts up on opening a directory
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
        "NerdTreeToggleAndFind
        function NerdTreeToggleAndFind()
            if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen() || bufname('%') == ''
                :NERDTreeToggle
            else
                :NERDTreeFind
            endif
        endfunction
        nnoremap <silent> <C-n> :call NerdTreeToggleAndFind()<CR>

        let NERDTreeShowHidden=1
        " let NERDTreeDirArrowExpandable = '▷'
        " let NERDTreeDirArrowCollapsible = '▼'
        let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }
    " }}}

    " FZF {{{
        Plug '/usr/local/opt/fzf'
        Plug 'junegunn/fzf.vim'
        let g:fzf_layout = { 'down': '~25%' }

        if isdirectory(".git")
            " if in a git project, use :GFiles
            nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
        else
            " otherwise, use :FZF
            nmap <silent> <leader>t :FZF<cr>
        endif

        nmap <silent> <leader>s :GFiles?<cr>

        nmap <silent> <leader>r :Buffers<cr>
        nmap <silent> <leader>e :FZF<cr>
        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)

        " Insert mode completion
        imap <c-x><c-k> <plug>(fzf-complete-word)
        imap <c-x><c-f> <plug>(fzf-complete-path)
        imap <c-x><c-j> <plug>(fzf-complete-file-ag)
        imap <c-x><c-l> <plug>(fzf-complete-line)

        nnoremap <silent> <Leader>C :call fzf#run({
        \   'source':
        \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
        \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
        \   'sink':    'colo',
        \   'options': '+m',
        \   'left':    30
        \ })<CR>

        command! FZFMru call fzf#run({
        \  'source':  v:oldfiles,
        \  'sink':    'e',
        \  'options': '-m -x +s',
        \  'down':    '40%'})

        command! -bang -nargs=* Find call fzf#vim#grep(
            \ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
            \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
        command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
        command! -bang -nargs=? -complete=dir GitFiles
            \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
    " }}}

    " vim-fugitive {{{
        Plug 'tpope/vim-fugitive'
        nmap <silent> <leader>gs :Gstatus<cr>
        nmap <leader>ge :Gedit<cr>
        nmap <silent><leader>gr :Gread<cr>
        nmap <silent><leader>gb :Gblame<cr>

        Plug 'tpope/vim-rhubarb' " hub extension for fugitive
        Plug 'sodapopcan/vim-twiggy'
        Plug 'rbong/vim-flog'
    " }}}

    " UltiSnips {{{
        Plug 'SirVer/ultisnips' " Snippets plugin
        let g:UltiSnipsExpandTrigger="<C-l>"
        let g:UltiSnipsJumpForwardTrigger="<C-j>"
        let g:UltiSnipsJumpBackwardTrigger="<C-k>"
    " }}}

    " coc {{{
        Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

        let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-json',
        \ 'coc-tsserver',
        \ 'coc-git',
        \ 'coc-eslint',
        \ 'coc-tslint-plugin',
        \ 'coc-pairs',
        \ 'coc-sh',
        \ 'coc-vimlsp',
        \ 'coc-emmet',
        \ 'coc-prettier',
        \ 'coc-ultisnips',
        \ 'coc-explorer',
        \ 'coc-diagnostic',
        \ 'coc-python'
        \ ]

        autocmd CursorHold * silent call CocActionAsync('highlight')

        " coc-prettier
        command! -nargs=0 Prettier :CocCommand prettier.formatFile
        nmap <leader>f :CocCommand prettier.formatFile<cr>

        " coc-git
        nmap [g <Plug>(coc-git-prevchunk)
        nmap ]g <Plug>(coc-git-nextchunk)
        nmap gs <Plug>(coc-git-chunkinfo)
        nmap gu :CocCommand git.chunkUndo<cr>

        nmap <silent> <leader>k :CocCommand explorer<cr>

        "remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        nmap <silent> gh <Plug>(coc-doHover)

        " diagnostics navigation
        nmap <silent> [c <Plug>(coc-diagnostic-prev)
        nmap <silent> ]c <Plug>(coc-diagnostic-next)

        " rename
        nmap <silent> <leader>rn <Plug>(coc-rename)

        " Remap for format selected region
        xmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)

        " organize imports
        command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

        " Use K to show documentation in preview window
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
            if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
            else
                call CocAction('doHover')
            endif
        endfunction

        "tab completion
        inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
        " position. Coc only does snippet and additional edit on confirm.
        if exists('*complete_info')
            inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
        else
            imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        endif

        " For enhanced <CR> experience with coc-pairs checkout :h coc#on_enter()
        inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    " }}}
" }}}
" Language-Specific Configuration {{{
    " html / templates {{{
        " emmet support for vim - easily create markdup wth CSS-like syntax
        Plug 'mattn/emmet-vim'

        " match tags in html, similar to paren support
        Plug 'gregsexton/MatchTag', { 'for': 'html' }

        " html5 support
        Plug 'othree/html5.vim', { 'for': 'html' }

        " mustache support
        Plug 'mustache/vim-mustache-handlebars'

        " pug / jade support
        Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }

		" nunjucks support
        Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'njk' }

        " liquid support
        Plug 'tpope/vim-liquid'
    " }}}

    " JavaScript {{{
        Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }
        " Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
        Plug 'moll/vim-node', { 'for': 'javascript' }
		Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
		Plug 'MaxMEllon/vim-jsx-pretty'
		let g:vim_jsx_pretty_highlight_close_tag = 1
    " }}}

    " TypeScript {{{
        Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
        " Plug 'Shougo/vimproc.vim', { 'do': 'make' } TODO what still needs this?
    " }}}


    " Styles {{{
        Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
        Plug 'groenewege/vim-less', { 'for': 'less' }
        Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
        Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
        Plug 'stephenway/postcss.vim', { 'for': 'css' }
    " }}}

    " markdown {{{
        Plug 'tpope/vim-markdown', { 'for': 'markdown' }
        let g:markdown_fenced_languages = [ 'tsx=typescript.tsx' ]

        " Open markdown files in Marked.app - mapped to <leader>m
        Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' }
        nmap <leader>m :MarkedOpen!<cr>
        nmap <leader>mq :MarkedQuit<cr>
        nmap <leader>* *<c-o>:%s///gn<cr>
    " }}}
    " Python
    "Python black formatting
    Plug 'axiros/axblack'

    " JSON {{{
        Plug 'elzr/vim-json', { 'for': 'json' }
        let g:vim_json_syntax_conceal = 0
    " }}}

    Plug 'ekalinin/Dockerfile.vim'
" }}}
call plug#end()
" Colorscheme and final setup {{{
    " This call must happen after the plug#end() call to ensure
    " that the colorschemes have been loaded
    if filereadable(expand("~/.vimrc_background"))
        let base16colorspace=256
        source ~/.vimrc_background
    else
        colorscheme onedark
    endif
    syntax on
    filetype plugin indent on
    " make the highlighting of tabs and other non-text less annoying
    highlight SpecialKey ctermfg=19 guifg=#333333
    highlight NonText ctermfg=19 guifg=#333333

    highlight Normal ctermbg=none
" }}}

"let alt 'send' ESC key
let s:printable_ascii = map(range(65, 122), 'nr2char(v:val)')
for s:char in s:printable_ascii
  execute "inoremap <A-" . s:char . "> <Esc>" . s:char
endfor
unlet s:printable_ascii s:char
let mapleader=" "
"disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
"bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>
"mapping misc keys
let g:gitgutter_map_keys = 0
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>x :x<CR>
noremap <silent> <Leader>h <C-W><C-H>
noremap <silent> <Leader>j <C-W><C-J>
noremap <silent> <Leader>k <C-W><C-K>
noremap <silent> <Leader>l <C-W><C-L>
noremap <silent> <leader>u :UndotreeToggle<CR>
noremap <silent> <Leader>re :reg<CR>
noremap <silent> <Leader>p "0p
noremap <silent> <Leader>y :let @0=@*<CR>
noremap <silent> <Leader>ch :noh<CR>
noremap <silent> <Leader>tt :tabnew<CR>
"mapping for quick switch windows
let g:airline_section_c = '%{winnr()}  %<%f%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
for i in range(1, 9)
  execute 'nnoremap <silent> <Leader>' . i . ' :' . i . 'wincmd w<CR>'
endfor
"Toggle number display
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <silent> <Leader>nt :call NumberToggle()<cr>
" grepprg settings
if executable('rg')
  " Use ag over grep
  set grepprg=rg\ --vimgrep\ --no-heading
endif
" ale settings
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = 'ℹ'
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\  'javascript': ['flow', 'eslint'],
\  'javascriptreact': ['flow', 'eslint'],
\  'typescript': ['eslint'],
\  'typescriptreact': ['eslint'],
\  'python': 'flake8',
\  'java': [],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'css': ['prettier'],
\   'json': ['prettier'],
\   'graphql': ['prettier'],
\}
let g:ale_fix_on_save = 1
set signcolumn=yes
" easymotion settings
let g:EasyMotion_do_mapping = 0 "Disable default mappings
let g:EasyMotion_startofline = 0 "keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
map <Leader>f <Plug>(easymotion-bd-w)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
map <Leader>/ <Plug>(easymotion-sn)
map <Leader>n <Plug>(easymotion-next)
map <Leader>N <Plug>(easymotion-prev)
" multiple-cursors settings
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_next_key='<C-s>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" tagbar settings
nnoremap <silent> <Leader>tb :TagbarToggle<CR>
" nerdcommenter settings
let NERDSpaceDelims=1

" delimitMate settings
let g:endwise_no_mappings = 1
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

"use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

imap <silent><expr> <TAB>
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ pumvisible() ? coc#_select_confirm() :
      \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
let g:coc_snippet_next = '<tab>'
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <silent><expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd FileType css,scss setlocal iskeyword=@,48-57,_,-,?,!,192-255
autocmd FileType json syntax match Comment +\/\/.\+$+
"integrate with airline
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
"don't give |ins-completion-menu| messages.
set shortmess+=c
"Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
"Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Using CocList
nnoremap <silent> <C-p> :<C-u>CocList files<cr>
nnoremap <silent> <Leader>g :<C-u>CocList grep<cr>
nnoremap <silent> <Leader>o :<C-u>CocList outline<cr>
nnoremap <silent> <Leader>b :<C-u>CocList buffers<cr>
nnoremap <silent> <Leader>[ :<C-u>CocList --normal locationlist<cr>
nnoremap <silent> <Leader>] :<C-u>CocList --normal quickfix<cr>
nnoremap <silent> <Leader>rl :<C-u>CocListResume<cr>
hi CursorLine guibg=#4f5b66
"jsx highlight
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
highlight! def link jsxComponentName Identifier
highlight! def link jsVariableType Identifier
highlight! def link jsImport Identifier

" defaults:
let g:black_linelength = 88
let g:black_fast = 1
" set appropriately:
let g:black_virtualenv = "~/.pyenv/versions/3.7.6"

" Clean whitespace at saves:
"autocmd BufWritePre * execute ':RemoveWhitespace'
fun! Blackify()
    if &ft =~ 'python'
        :Black
    endif
endfun
" blackify at any write of a python file:
autocmd BufWritePre * call Blackify()
