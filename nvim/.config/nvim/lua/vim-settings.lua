-- Enable relatve line number indicators
vim.opt.number = true
vim.opt.relativenumber = true

-- Set Tabs Size to like 4 spaces and by default reploaces tabs with spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4


vim.g.mapleader = " " -- Set Map Leader
vim.g.maplocalleader = " " -- ...and local leader
vim.g.c_syntax_for_h = 1 -- Use C syntax for `.h` files instead of C++
vim.opt.cinoptions = "l1" -- Fix C switch-cases formatting
vim.opt.hlsearch = true -- Search highlighting
vim.opt.incsearch = true -- Incremental search
vim.opt.ignorecase = true -- Ignore casing
vim.opt.smartcase = true -- ...unless there's an uppercase
vim.opt.swapfile = false -- Disable swapfile
vim.opt.winborder = "rounded" -- Nicer floating windows
vim.opt.cmdheight = 0 -- Disable default statusline
vim.opt.conceallevel = 0 -- Fix vim fucking hiding double quotes in fucking JavaScript Object Notation's files
vim.opt.splitright = true -- Split right by default
vim.opt.splitbelow = true -- Split below by default
vim.opt.undofile = true -- Save undo history


-- Chmod file to execution via <leader> + ex
vim.keymap.set(
    "n", "<leader>e", function()
        vim.cmd("!chmod +x %")
    end
)

vim.keymap.set(
    "n", "<leader>cl", function ()
        vim.cmd("let @/=''")
    end
)
