" vim
set showmatch
set ignorecase
set relativenumber
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

" plugins

lua require("telescope").setup()
lua require("plugins")
lua require("cmp-config")
lua require("metals-config")
lua require("nvim-tree-config")
lua require("dap-config")

" colors
colorscheme slate

" keybindings
nnoremap <C-\><C-t> <cmd>tabnew<cr>
nnoremap <C-\><C-\> <cmd>tabnext<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fmc <cmd>Telescope metals commands<cr>
nnoremap <C-n><C-t> <cmd>NvimTreeToggle<cr>

" hooks
autocmd BufWritePre *.rs,*.scala lua vim.lsp.buf.format({ async = false })
