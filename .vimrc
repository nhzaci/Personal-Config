set nocompatible              " be iMproved, required
filetype off                  " required

let g:coc_global_extensions = [
  \  'coc-json',
  \  'coc-yaml',
  \  'coc-html',
  \  'coc-css',
  \  'coc-tsserver',
  \  'coc-eslint',
  \  'coc-stylelint',
  \  'coc-prettier',
  \  'coc-highlight',
  \  'coc-emmet',
  \  'coc-snippets',
  \  'coc-git',
  \  'coc-vetur',
  \  'coc-graphql',
  \ ]

" START OF VIM PLUG CONFIG ----------------------------------------
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': './install.sh' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'othree/html5.vim'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive'
Plug 'neoclide/vim-jsx-improve'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'jparise/vim-graphql'
Plug 'dart-lang/dart-vim-plugin'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jiangmiao/auto-pairs'
Plug 'metakirby5/codi.vim'
Plug 'tomlion/vim-solidity'

" Initialize plugin system
call plug#end()
" END OF VIM PLUG -------------------------------------------------

" -----------------------------------------------------------------
" Start of COC Config
" -----------------------------------------------------------------

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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
  else
    call CocAction('doHover')
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

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" -----------------------------------------------------------------
" End of COC Config
" -----------------------------------------------------------------

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set hlsearch
set ignorecase
set incsearch
set smartcase
syntax enable
set wrap
set cursorline
set noerrorbells
set mouse=a
set title
set wildmenu
set laststatus=2
set history=1000
set spell
set background=dark
set number relativenumber
set nu rnu
colorscheme gruvbox 

" Gruvbox settings below
let g:gruvbox_contrast_dark = "hard"

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_invert_selection='0'

" Key Remappings below here:
let mapleader=" "
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
nnoremap <Leader>gd :GoDef<Enter>
nnoremap <Leader>p :FZF<Enter>
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
nmap <leader><leader> V
vmap <Leader>y "+y

" Key mapping for exiting terminal
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

" Key mapping for html closing
imap </ </<C-X><C-O>

" Setting default airline theme
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'

" Setting NERDTreeSize
let g:NERDTreeWinSize=60
let NERDTreeShowHidden=1

" Setting fzf size
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
" fzf use silver searcher with gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
set rtp+=/opt/homebrew/opt/fzf

" Set vertical split for vim fugitive
set diffopt+=vertical
map <leader>gh :diffget //2<CR>
map <leader>gl :diffget //3<CR>

" set path for python3
let g:python3_host_prog = '/usr/bin/python3' " -- Set python 3 provider

" Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala"

" Help Vim recognize *.jsh as Java files
au BufRead,BufNewFile *.jsh set filetype=java"

" Set shiftwidth=4 for java
autocmd FileType java setlocal shiftwidth=4 softtabstop=4 expandtab tabstop=4
autocmd FileType scala setlocal shiftwidth=4 softtabstop=4 expandtab tabstop=4

" enable guides by default
let g:indent_guides_enable_on_vim_startup = 1

let g:codi#interpreters = {
                   \ 'amm': {
                       \ 'bin': 'amm',
                       \ 'prompt': '^@ ',
                       \ },
                   \ }
