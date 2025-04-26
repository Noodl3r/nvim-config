-- Basic Neovim settings
vim.o.undofile = true                             -- Enable persistent undo history
vim.o.undodir = vim.fn.stdpath('data') .. '/undo' -- Set undo file directory
vim.o.backup = false                              -- Disable backup files
vim.o.writebackup = false                         -- Disable write backup
vim.o.swapfile = false                            -- Disable swap files


-- general settings
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set ts=2")
vim.cmd("set cmdheight=0")
vim.cmd("set termguicolors")
vim.cmd("set scrolloff=5")
vim.cmd("autocmd FileType sql setlocal noautoindent")
vim.cmd("autocmd FileType sql setlocal nosmartindent")
vim.cmd("autocmd FileType sql setlocal nocindent")
vim.cmd("set signcolumn=no")
vim.cmd("au TextYankPost * lua vim.highlight.on_yank()") -- Visual feedback on yank
vim.opt.laststatus = 0                                   -- Completely turn off status line
vim.opt.cmdheight = 0                                    -- You can also hide the command line when not in use

vim.o.scrolloff = 5
vim.opt.smartcase = true

vim.opt.shiftwidth = 2
vim.o.autoindent = true                     -- Enable auto indentation
vim.o.smartindent = true                    -- Automatically insert indentation
vim.o.completeopt = "menuone,noselect,menu" -- Enhance completion behavior



-- Enable spell checking and set spell language to English
vim.opt.spell = true
vim.opt.spelllang = "en"

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.o.wrap = true
vim.o.linebreak = true -- wrapping lines
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.smoothscroll = true
vim.o.lazyredraw = true
vim.notify = require("notify")
