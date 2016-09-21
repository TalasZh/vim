" Pathogen
execute pathogen#infect()




syntax on
"filetype plugin indent on
"set background dark
set t_Co=256
"colorscheme desert256
"set background=dark
set foldlevel=99
"colorscheme morning


" vim-indent-guides
set ts=2 sw=2 et
let g:indent_guides_start_level = 2

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" tern_for_vim
let g:tern_show_argument_hints='on_hold'
" and 
let g:tern_map_keys=1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERDTree
let g:nerdtree_tabs_open_on_console_startup=1

" vim-javascript configuration
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax

" snipMate
let g:snipMate = {}
let g:snipMate.scope_aliases = {}

" vim-snippets
" assuming you want to use snipmate snippet engine
" ActivateAddons vim-snippets snipmate


" ctrl.vim
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

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

" tagbar
nmap <F8> :TagbarToggle<CR>

" ctrl-space
"set nocompatible
"set hidden

" youcompleteme
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
