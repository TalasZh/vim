
" set nopaste
set shell=zsh

set laststatus=2

syntax on
"filetype plugin indent on
"set background dark
set t_Co=256
"colorscheme desert256
"set background=dark
set foldlevel=99
set formatoptions+=rqno
set comments=sl:/*,mb:*,elx:*/

set pastetoggle=
set nopaste

" colorscheme morning
"function! s:IsOnlyComment(getlineArg)
"  let commentRegex='^\s*'.substitute(&commentstring,'%s','\\s*','').'$'
"  return strlen(matchstr(getline(a:getlineArg), commentRegex)) > 0
"endfunction
"
"function! SmartEnter()
"  if s:IsOnlyComment('.')
"    return "\<Esc>S"
"  else
"    return "\<CR>"
"  endif
"endfunction
"
"inoremap <expr> <CR> SmartEnter()

"-----------------------------------------------------------
" Basic / Misc
"-----------------------------------------------------------

" Used for saving git and hg commits
"filetype on
"filetype off

" Set to allow you to backspace while back past insert mode
set backspace=2

" Increase History
set history=999

" Enable numbers in the left column
set number

" Give context to where the cursor is positioned in a file
set scrolloff=14

" Use UTF-8 encoding
set encoding=utf-8 nobomb

" Hide buffers after they are abandoned
"set hidden

" Disable files that don't need to be created
"set noswapfile
"set nobackup
"set nowb

" Auto Complete Menu
set completeopt=longest,menu


"-----------------------------------------------------------
" Tabbing and Spaces 
"-----------------------------------------------------------

" Use 4 spaces instead of tabs
set tabstop=4
set softtabstop=4 
set shiftwidth=4
set expandtab

" Auto indent
set autoindent 
set smartindent
set cindent

" replace trailing whitespace and tabs with unicode characters
exec "set listchars=tab:\uBB\uBB,trail:\u2716,nbsp:~"
set list


"-----------------------------------------------------------
" Pathogen - plugin/package manager for vim
"-----------------------------------------------------------

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = ['vim-snipmate']

" for some reason the csscolor plugin is very slow when run on the terminal
" but not in GVim, so disable it if no GUI is running
if !has('gui_running')
    call add(g:pathogen_disabled, 'csscolor')
endif

" Gundo requires at least vim 7.3
if v:version < '703' || !has('python')
    call add(g:pathogen_disabled, 'gundo')
endif

if v:version < '702'
    call add(g:pathogen_disabled, 'autocomplpop')
    call add(g:pathogen_disabled, 'fuzzyfinder')
    call add(g:pathogen_disabled, 'l9')
endif

" call pathogen#infect()
execute pathogen#infect()





"-----------------------------------------------------------
" vim-indent-guides - visually seeing file indents
"-----------------------------------------------------------
set ts=2 sw=2 et
let g:indent_guides_start_level = 2

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


"-----------------------------------------------------------
" tern_for_vim - javscript linting plugin for vim
"-----------------------------------------------------------
let g:tern_show_argument_hints='on_hold'
" and 
let g:tern_map_keys=1


"-----------------------------------------------------------
" syntastic - code syntax checking plugin
"-----------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint']
let g:Synstatic_javascript_jshint_conf="~/.jshintrc"

let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'         " Error Symbol
let g:syntastic_warning_symbol='⚠'       " Warning Symbol
let g:syntastic_style_error_symbol='⚡'   " Style Error Symbol
let g:syntastic_style_warning_symbol='⚡' " Style Warning Symbol


"-----------------------------------------------------------
" NERDTree - Sidebar explorer for project structure
"-----------------------------------------------------------
let g:nerdtree_tabs_open_on_console_startup=1


"-----------------------------------------------------------
" vim-javascript - 
"-----------------------------------------------------------
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax


"-----------------------------------------------------------
" snipMate - snippets engine written in VimL
"-----------------------------------------------------------
"imap <Tab> <Plug>snipMateNextOrTrigger
"smap <Tab> <Plug>snipMateNextOrTrigger
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'

"let g:snipMate = {}
"let g:snipMate.scope_aliases = {}
"let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails,ruby-1.9'


"-----------------------------------------------------------
" vim-snippets - snippets plugin
"-----------------------------------------------------------
" assuming you want to use snipmate snippet engine
" ActivateAddons vim-snippets snipmate



"-------------------------------
" ctrl - heuristic search plugin
"-------------------------------
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Linux/MacOSX
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }


"----------------------------------------------------------------
" tagbar - easy class navigation with annotated functions, etc...
"----------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>

""""""" ctrl-space
"set nocompatible
"set hidden



"-----------------------------------------------------------
" YouCompleteMe - Intelligent completion with fuzzy matching
"-----------------------------------------------------------

" Bundle 'Valloric/YouCompleteMe'

let g:ycm_dont_warn_on_startup = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

let g:ycm_filetype_blacklist = {}

let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_confirm_extra_conf=0


"----------------------------------------
" UltiSnips - Fancy snippet functionality
"----------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"au FileType javascript :UltiSnipsAddFiletypes javascript


" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

nnoremap <leader>ue :UltiSnipsEdit<cr>


"----------------------------------------
" vim-go - golan plugin for vim
"----------------------------------------
" By default syntax-highlighting for Functions, Methods and Structs is disabled
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"

" Sometimes when using both vim-go and syntastic Vim will start lagging while saving and opening files
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Another issue with vim-go and syntastic is that the location list window that contains the output of commands such as :GoBuild and :GoTest might not appear
let g:go_list_type = "quickfix"

" Run commands such as go run for the current 
" file with <leader>r or go build and go test for the current package with <leader>b and <leader>t respectively. Display beautifully annotated source code to see which functions are covered with <leader>c
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)


