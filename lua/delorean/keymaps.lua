local telescope = require('telescope.builtin')
local theme = require("delorean.theme")
local coding = require("delorean.coding")

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("i", "jj", "<esc>", { desc = "Exit insert mode" })
keymap("i", "<c-c>", "<esc>")

keymap("n", ";", ":")
keymap("n", ":", ";")
keymap("v", ";", ":")
keymap("v", ":", ";")

keymap("n", "q:", ":q")

keymap("n", "j", "gj")
keymap("n", "k", "gk")

keymap("i", "<up>", "<nop>")
keymap("i", "<down>", "<nop>")
keymap("i", "<left>", "<nop>")
keymap("i", "<right>", "<nop>")

keymap("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
keymap("n", "<leader>Q", "<cmd>q!<cr>", { desc = "Quit!" })

keymap("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save" })
keymap("n", "<leader>fe", "<cmd>Explore<cr>", { desc = "Explore" })

-- Copy paste register
keymap("n", "<Leader>y", "\"+y")
keymap("v", "<Leader>y", "\"+y")
keymap("n", "<Leader>Y", "\"+Y")

keymap("n", "<Leader>d", "\"_d")
keymap("v", "<Leader>d", "\"_d")

keymap("n", "<Leader>p", "\"+p")
keymap("n", "<Leader>P", "\"+P")
keymap("v", "<Leader>p", "\"+p")
keymap("v", "<Leader>P", "\"+P")

-- Search for the word under cursor and jump back
keymap("n", "<leader>sw", "*``", { silent = true })
keymap("n", "<leader>sW", "#``", { silent = true })
keymap('n', '<leader>sa', function()
    local cword = vim.fn.expand("<cword>");
    vim.cmd("/" .. cword)  -- Highlight current word
	telescope.grep_string({ search = cword });
end)

-- Disable (cancel) highlight of the search
keymap("n", "<leader>sq", ":noh<cr><esc>:cclose<cr>", { silent = true, desc = "Clear search" })

-- Theme
keymap("n", "<leader>mtd", function()
    theme_default()
end, { desc = "Theme default" })

keymap("n", "<leader>mt1", function()
    theme_config_1()
end, { desc = "Theme 1" })

keymap("n", "<leader>mt2", function()
    theme_config_2()
end, { desc = "Theme 2" })

-- Window operations
keymap("n", "<leader>ws", "<cmd>split<cr>", { desc = "Split" })
keymap("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
keymap("n", "<tab>", "<C-w>w")
keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Jump to window down" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Jump to window up" })
keymap("n", "<C-h>", "<C-w><C-h>", { desc = "jump to window left" })
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Jump to window right" })

keymap("n", "<leader>w=", "<C-w>=<cr>")
keymap("n", "<leader>wl", "<C-w>10>")
keymap("n", "<leader>wh", "<C-w>10<")

-- Telescope
keymap('n', '<leader>ff', telescope.find_files, { desc = "Find files" })
keymap('n', '<Leader>fG', telescope.git_files, { desc = "Find git files" })
keymap('n', '<leader>fg', telescope.live_grep, { desc = "Live grep" })
keymap('n', '<leader>fb', telescope.buffers, { desc = "Find buffers" })
keymap('n', '<leader>fh', telescope.help_tags, { desc = "Help tags" })
keymap('n', '<leader>fo', "<cmd>BufExplorer<cr>")
keymap('n', '<leader>fn', "<cmd>vnew<cr>")

-- NERDTree
keymap('n', '<leader>ft', "<cmd>NERDTreeFocus<cr>" )
keymap('n', '<leader>fT', "<cmd>NERDTreeToggle<cr>" )
keymap('n', '<leader>fr', "<cmd>NERDTreeRefreshRoot<cr>" )
keymap('n', '<leader>fl', "<cmd>NERDTreeFind<cr>" )

keymap('n', '<leader>jl', vim.lsp.buf.format )

-- Comment frame
-- autocmd FileType c,cpp nnoremap <Leader>cf :.-1read !,code-frame.py --lang cpp --text <cword><cr>
-- autocmd FileType c,cpp vnoremap <Leader>cf y:.-1read !,code-frame.py --lang cpp --text "<c-r>""<cr>
-- autocmd FileType bash,python nnoremap <Leader>cf :.-1read !,code-frame.py --lang bash --text <cword><cr>
-- autocmd FileType bash,python vnoremap <Leader>cf y:.-1read !,code-frame.py --lang bash --text "<c-r>""<cr>
-- autocmd FileType c,cpp nnoremap <Leader>ct O// TODO(gregory) <esc><S-A>

keymap('n', '<leader>cf', function()
    local cword = vim.fn.expand("<cword>");
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local result = code_frame(cword, "cpp")
    vim.api.nvim_buf_set_text(0, row - 1, 0, row - 1, 0, result)
end, { desc = "" })

keymap('n', '<leader>ee', function() vim.cmd(":!odin build . -debug") end, { desc = "Run: odin build . -debug" })
keymap('n', '<leader>er', function() vim.cmd(":!odin run . -debug") end, { desc = "Run: odin run . -debug" })
keymap('n', '<leader>ec', function() vim.cmd(":!odin check .") end, { desc = "Run: odin check ." })
keymap('n', '<leader>et', function() vim.cmd(":!odin test .") end, { desc = "Run: odin test ." })
keymap('n', '<leader>es', function() vim.cmd(":!odin strip-semicolon .") end, { desc = "Run: odin strip-semicolon ." })
keymap('n', '<leader>ed', function() vim.cmd(":!odin doc .") end, { desc = "Run: odin doc ." })

-- Git
keymap("n", "<leader>gS", telescope.git_stash, { desc = "Git stash" })
keymap("n", "<leader>gC", telescope.git_commits, { desc = "Git commits" })
keymap("n", "<leader>gB", telescope.git_branches, { desc = "Git branches" })

keymap("n", "<leader>gp", "<cmd>GitGutterPreviewHunk<cr>", { desc = "Git preview hunk" })
keymap("n", "<leader>gk", "<cmd>GitGutterPrevHunk<cr>zz", { desc = "Git prev hunk" })
keymap("n", "<leader>gj", "<cmd>GitGutterNextHunk<cr>zz", { desc = "Git next hunk" })
keymap("n", "<leader>gu", "<cmd>GitGutterUndoHunk<cr>", { desc = "Git undo hunk" })
keymap("n", "<leader>gs", "<cmd>GitGutterStageHunk<cr>", { desc = "Git stage hunk" })
keymap("n", "<leader>gd", "<cmd>Git diff<cr>", { desc = "Git diff" })
keymap("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
keymap("n", "<leader>gq", "<cmd>pclose<cr>", { desc = "Git close" })

-- Lazygit
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- Move highlighted block
keymap("v", "J", ":m '>+1<cr>gv=gv")
keymap("v", "K", ":m '<-2<cr>gv=gv")
-- TODO Move lines downward and upward
-- keymap("n", "<A-j>", "<cmd>m .+1<cr>==")
-- keymap("n", "<A-k>", "<cmd>m .-2<cr>==")

-- Keep cursor in place after join
keymap("n", "J", "mzJ`z")

-- Half page jumping, keep cursor in the middle
-- keymap("n", "<c-d>", "<c-d>zz")
-- keymap("n", "<c-u>", "<c-u>zz")

-- Keep searches in the middle
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Preserve copied word on paste, e.g. use ve<leader>p instead of vep
keymap("x", "<leader>p", "\"_dP")


keymap("n", "<leader>fx", "<cmd>!chmod +x %<cr>", { silent = true })
keymap("n", "<leader>fX", "<cmd>!chmod -x %<cr>", { silent = true })

keymap("n", "<leader>fa", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch cpp <-> h" })

keymap("n", "<leader>mu", function ()
    print("Hello")
    local config_path = vim.fn.stdpath("config")
    print(config_path)
    -- TODO git pull
end)
