" Plugins will be downloaded under the specified directory.

call plug#begin('~/.local/share/nvim/site/plugged')

"LPS Autocompletion  
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-path' " complet file path
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer' " complet word on the buffer that you are in
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' " Snippets plugin

" Zettelkasten
Plug 'renerocksai/telekasten.nvim'

" Statusline 
Plug 'nvim-lualine/lualine.nvim'

"Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"NerdTree
Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-web-devicons'                " Idk why I need this one 
Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree

"Nord nvim theme
"Plug 'arcticicestudio/nord-vim'
Plug 'shaunsingh/nord.nvim'
"Catppucin theme
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
"Tokio theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

"Syntac highlight and prettier \ 'branch': 'release/1.x',
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install && yarn add prettier-plugin-solidity',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift',
    \ 'solidity'] }

" Do I need this ?  
Plug 'frazrepo/vim-rainbow'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

lua << EOF
require('plugins.lualine')
require('plugins.lsp_config')
require('plugins.telescope')
require('plugins.telekasten')
require('plugins.catppuccin')
require('plugins.nvim-treesitter')
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""
" Color Settings
"""""""""""""""""""""""""""""""""""""""""""""""""
"syntax on
"
"Personal custom
"
let mapleader = " " " map leader to Space
map <leader>h :noh<CR>
 
" Tab = 4 space 
set tabstop=4
set shiftwidth=4
set expandtab
"highlight that move with cursor
set cursorline 
set number relativenumber
set clipboard+=unnamedplus
"Mouse
set mouse=a
inoremap jk <Esc>
set colorcolumn=80
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38
" Automatically close NERDTree when you open a file
let NERDTreeQuitOnOpen=1
map <leader>t :NERDTreeToggle<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Check if your terminal has 24-bit color support 
if (has("termguicolors"))
    set termguicolors
endif

"syntax enable
"Example config in Vim-Script
"let g:nord_contrast = v:true
"let g:nord_borders = v:true
"let g:nord_disable_background = v:false
"let g:nord_italic = v:false
"let g:nord_uniform_diff_background = v:true
"let g:nord_cursor_line_number_background = 0
"let g:nord_bold_vertical_split_line = 1
"colorscheme nord
"colorscheme tokyonight
"colorscheme tokyonight-storm

"Add transparency with picom setting 
"highlight Normal guibg=NONE

""""""""""""""""""""""""""
"Zettelkasten
""""""""""""""""""""""""""

nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>
nnoremap <leader>zT :lua require('telekasten').goto_today()<CR>
nnoremap <leader>zW :lua require('telekasten').goto_thisweek()<CR>
nnoremap <leader>zw :lua require('telekasten').find_weekly_notes()<CR>
nnoremap <leader>zn :lua require('telekasten').new_note()<CR>
nnoremap <leader>zN :lua require('telekasten').new_templated_note()<CR>
nnoremap <leader>zy :lua require('telekasten').yank_notelink()<CR>
nnoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>
nnoremap <leader>zb :lua require('telekasten').show_backlinks()<CR>
nnoremap <leader>zF :lua require('telekasten').find_friends()<CR>
nnoremap <leader># :lua require('telekasten').show_tags()<CR>
nnoremap <leader>[ <ESC>:lua require('telekasten').insert_link({ i=true })<CR>
nnoremap <leader>z :lua require('telekasten').panel()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

":Telescope find_files cwd=(whatever) will search in that directory
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fgs <cmd>lua require('telescope.builtin').git_status()<cr>

