local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>zz", options)
map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>zz", options)
map("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", options)
map("n", "J", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
map("n", "K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", options)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
map("n", "<leader>sr", "<cmd>lua vim.lsp.buf.references()<CR>", options)
map("n", "<leader>ss", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", options)

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

-- Use <Tab> and <S-Tab> to navigate through popup menu
map('i', '<Tab>', 'v:lua.smart_tab()', { noremap = true, silent = true, expr = true })

map("i", "<CR>", [[compe#confirm("<CR>")]], { noremap = true, silent = true, expr = true })
-- map("i", "<leader>c", "compe#complete()", { noremap = true, silent = true, expr = true })