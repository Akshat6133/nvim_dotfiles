--print("set is being sourcing")
-- Cursor shapes for terminal Neovim
--vim.api.nvim_exec([[
--  let &t_SI = "\<Esc>[5 q" " insert: blinking I-beam
--  let &t_SR = "\<Esc>[3 q" " replace: blinking underline
--  let &t_EI = "\<Esc>[1 q" " normal: blinking block
--]], false)

--vim.opt.guicursor = " "
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = true
vim.o.autowriteall = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard="unnamedplus"
--vim.api.nvim_set_option("clipboard", "unnamed")

--print("cb started")
--vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
--vim.api.nvim_set_option("clipboard", "unnamed")
--print("set is being sourced")
--print("set.lua was sourced")

