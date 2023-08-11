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
lua require("lspconfig").gopls.setup({})

" hooks
autocmd BufWritePre *.rs,*.scala lua vim.lsp.buf.format({ async = false })

lua <<EOF
    function org_imports(wait_ms)
      local params = vim.lsp.util.make_range_params()
      params.context = {only = {"source.organizeImports"}}
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
      for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
          else
            vim.lsp.buf.execute_command(r.command)
          end
        end
      end
  end
EOF

augroup GO_LSP
	autocmd!
	autocmd BufWritePre *.go :silent! lua vim.lsp.buf.formatting()
	autocmd BufWritePre *.go :silent! lua org_imports(3000)
augroup END

" colors
colorscheme slate

" keybindings
nnoremap <leader>b <cmd>cclose<cr>
nnoremap <C-\><C-t> <cmd>tabnew<cr>
nnoremap <C-\><C-\> <cmd>tabnext<cr>
nnoremap <C-n><C-t> <cmd>NvimTreeToggle<cr>

" telescope
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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
