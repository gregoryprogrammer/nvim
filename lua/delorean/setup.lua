local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4  -- indent
opt.expandtab = true
opt.softtabstop = 4
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.signcolumn = "yes"  -- show sign column so that text doesm't shift
-- opt.colorcolumn = "80"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")  -- use system clipboard as default registeo

-- Split windows
opt.splitright = true
opt.splitbelow = true


-- autocmd BufWritePost * GitGutter
-- let g:gitgutter_realtime = 1
opt.updatetime=100
vim.g.gitgutter_realtime = 1
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*" },
    command = "GitGutter",
})

vim.api.nvim_create_autocmd("BufWrite", {
    pattern = { "*.py" },
    command = "Autoformat",
})


local function window()
    return vim.api.nvim_win_get_number(0)
end


vim.g.ackprg ='ag --nogroup --nocolor --column'
