" vim
set showmatch
set ignorecase
set relativenumber
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

" plugins

lua require("plugins")
lua require("telescope-config")
lua require("cmp-config")
lua require("nvim-tree-config")
lua require("lspconfig").gopls.setup({})
lua require("metals-config")
lua require("go-config")
lua require("c-config")
lua require("lsp-custom-config")

" hooks
autocmd BufWritePre *.rs,*.scala,*.h,*.c lua vim.lsp.buf.format({ async = false })

" format go code and run goimports on save
augroup GO_LSP
    autocmd!
    autocmd BufWritePre *.go :silent! lua vim.lsp.buf.format()
    autocmd BufWritePre *.go :silent! lua org_imports(3000)
augroup END

" process packer plugin changes
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" colors
colorscheme tokyonight-storm

" keybindings
nnoremap <leader>b <cmd>cclose<cr>
nnoremap <C-\><C-t> <cmd>tabnew<cr>
nnoremap <C-\><C-\> <cmd>tabnext<cr>
nnoremap <C-n><C-t> <cmd>NvimTreeToggle<cr>
nnoremap <C-h> <cmd>ClangdSwitchSourceHeader<cr>
nnoremap <C-n><C-o> <cmd>NvimTreeFindFile<cr>
nnoremap <C-l><C-s> <cmd>!ls $(dirname %)<cr>

" telescope
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope lsp_dynamic_workspace_symbols<cr>

" lsp
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap gds <cmd>lua vim.lsp.buf.document_symbol()<cr>
nnoremap gws <cmd>lua vim.lsp.buf.workspace_symbol()<cr>
nnoremap <leader>cl <cmd>lua vim.lsp.codelens.run()<cr>
nnoremap <leader>sh <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>f <cmd>lua vim.lsp.buf.format()<cr>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>aa <cmd>lua vim.diagnostic.setqflist()<cr>
nnoremap <leader>ae <cmd>lua vim.diagnostic.setqflist({ severity = "E" })<cr>
nnoremap <leader>aw <cmd>lua vim.diagnostic.setqflist({ severity = "W" })<cr>
nnoremap <leader>d <cmd>lua vim.diagnostic.setloclist<cr>
nnoremap [c <cmd>lua vim.diagnostic.goto_prev({ wrap = false })<cr>
nnoremap ]c <cmd>lua vim.diagnostic.goto_next({ wrap = false })<cr>
