vim.g.mapleader = ' '
vim.pack.add {
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter'},
    { src = 'https://github.com/stevearc/oil.nvim'},
    { src = 'https://github.com/nvim-tree/nvim-web-devicons'},
    { src = 'https://github.com/RedsXDD/neopywal.nvim'},
    { src = 'https://github.com/brenoprata10/nvim-highlight-colors'},
    { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2'},
    { src = 'https://github.com/hat0uma/csvview.nvim'},
    { src = 'https://github.com/windwp/nvim-autopairs'},
    { src = 'https://github.com/L3MON4D3/LuaSnip'},
    { src = 'https://github.com/saadparwaiz1/cmp_luasnip'},
    { src = 'https://github.com/echasnovski/mini.nvim'},
    { src = 'https://github.com/kdheepak/lazygit.nvim'},
    { src = 'https://github.com/chentoast/marks.nvim'},
    { src = 'https://github.com/mbbill/undotree'},
    { src = 'https://github.com/nvim-lua/plenary.nvim'},
    { src = 'https://github.com/p00f/clangd_extensions.nvim'},
    { src = 'https://github.com/hrsh7th/nvim-cmp'},
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp'},
    { src = 'https://github.com/hrsh7th/cmp-buffer'},
    { src = 'https://github.com/hrsh7th/cmp-path'},
    { src = 'https://github.com/hrsh7th/cmp-cmdline'},
}


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = 'menu,menuone,fuzzy,noinsert'
vim.opt.swapfile = false
vim.opt.confirm = true
vim.opt.linebreak = true
vim.opt.termguicolors = true
vim.opt.wildoptions:append { 'fuzzy' }
vim.opt.path:append { '**' }
vim.opt.smoothscroll = true
vim.opt.scrolloff = 8
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.grepprg = 'rg --vimgrep --no-messages --smart-case'
--vim.opt.statusline = '[%n] %<%f %h%w%m%r%=%-14.(%l,%c%V%) %P'
vim.opt.laststatus = 0
vim.opt.rulerformat = '%t'
vim.opt.winborder = "rounded"
vim.opt.spell = true
vim.opt.spelllang = {"en_us"}

vim.cmd.colorscheme('neopywal')


vim.cmd [[
  aunmenu PopUp
  autocmd! nvim.popupmenu
]]

-- Only highlight with tree sitter
vim.cmd('syntax on')

require("nvim-highlight-colors").setup {
    render = 'virtual',
    virtual_symbol = '⚫︎',
    virtual_symbol_suffix = '',
}
require('nvim-autopairs').setup{}
require('oil').setup {
    default_file_explorer = true,
    columns = { 'icon' },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
	 show_hidden = true,
    },
    keymaps = {
        ['qq'] = 'actions.close',
    }
}
require("mini.indentscope").setup({
    symbol = "│",
    draw = {
        delay = 0,
        animation = require("mini.indentscope").gen_animation.none(),
    },
})

local harpoon = require('harpoon')
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				save_on_change = true,
				sync_on_ui_close = true,
				filename = vim.fn.stdpath("data") .. "/harpoon.json",
			},
			default = {
				display = function(item)
					return vim.fn.fnamemodify(item.value, ":t")
				end,
			},
		})

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
vim.keymap.set('n', '<leader>e', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end)
vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end)
vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end)

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {
    link = "Identifier",
})

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {
            link = "Identifier",
        })
    end,
})

vim.api.nvim_create_autocmd("UIEnter", {
    once = true,
    callback = function()
        if vim.fn.argc() == 0 then
            vim.defer_fn(function()
                vim.cmd("Oil")
            end, 10)
        end
    end,
})


-- Keymaps
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q:", "<nop>")

vim.keymap.set('n', '<leader><tab>', ':Oil<CR>', { silent = true })
vim.keymap.set('n', '<leader>w', ':w<CR>', {silent = true})
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', {silent = true})
vim.keymap.set('n', '<leader>ff', ':find ', {silent = false})
-- vim.keymap.set('n', '<leader>fd', ':find ~/.config/nvim ', {silent = false})

vim.keymap.set('n', '<leader>fg', function()
  local input = vim.fn.input("Grep > ")
  if input == "" then return end
  vim.cmd("grep " .. vim.fn.shellescape(input))
end)

vim.keymap.set('n', '<leader>q', function()
  local wins = vim.fn.getqflist({ winid = 0 }).winid
  if wins ~= 0 then
    vim.cmd('cclose')
  else
    vim.cmd('copen 5')
  end
end, { silent = true })

-- Map <C-l> in insert mode to correct the last misspelled word
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = true, silent = true })

vim.keymap.set("v", "<leader>y", '"+y', {noremap = true, silent = true})
vim.keymap.set("n", "<leader>yy", 'V"+y', {noremap = true, silent = true})
vim.keymap.set("n", "<leader>Y", '<cmd>%y+<CR>', {noremap = true, silent = true})
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- For the stupid arrow keys
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Up>', 'gk', opts)
vim.keymap.set('n', '<Down>', 'gj', opts)
vim.keymap.set('v', '<Up>', 'gk', opts)
vim.keymap.set('v', '<Down>', 'gj', opts)
vim.keymap.set('o', '<Up>', 'gk', opts)
vim.keymap.set('o', '<Down>', 'gj', opts)
vim.keymap.set('i', '<Up>', '<C-o>gk', opts)
vim.keymap.set('i', '<Down>', '<C-o>gj', opts)

vim.keymap.set("n", "<ESC>", ":nohlsearch<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'typst',
    callback = function()
        local function typst_watch()
            vim.cmd("vsplit")
            vim.cmd("vertical resize 23")
            local file = vim.fn.expand("%:p")
            vim.cmd("terminal typst watch " .. vim.fn.shellescape(file))
            vim.cmd("wincmd h")
        end

        vim.keymap.set('n', '<leader>c', typst_watch, { buffer = true, silent = true })
        vim.keymap.set('n', '<leader>r', function()
            local pdf = vim.fn.expand("%:p:r") .. ".pdf"
            vim.cmd("!zathura --fork " .. vim.fn.shellescape(pdf) .. " &")
        end, { buffer = true, silent = true })
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'c', 'cpp'},
    callback = function()
        vim.keymap.set('n', '<leader>h', '<cmd>ClangdSwitchSourceHeader<CR>', { buffer = true, silent = true })
        vim.keymap.set('n', '<leader>l',
            ':w<cr>:vert rightbelow split | term g++ -std=c++20 -DLOCAL_TEST -O2 -Wall -Wextra -pedantic % -o TEST && ./TEST<cr>',
            { buffer = true, silent = true })
    end,
})

vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { buffer = true, noremap = true })
    end
})

-- LSP config
vim.lsp.config('clangd', {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp' },
    root_markers = { 'compile_commands.json', 'CMakeLists.txt', '.git' },
})
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.cpp', '*.h', '*.c' },
    callback = function() vim.lsp.buf.format({ async = false }) end,
})

vim.lsp.config('verible', {
    cmd = { 'verible-verilog-ls' },
    filetypes = { 'verilog', 'systemverilog' },
    root_markers = { '.git' },
})

vim.lsp.enable({
	"lua_ls", "cssls", "svelte", "tinymist",
	"rust_analyzer", "clangd", "ruff",
	"glsl_analyzer", "haskell-language-server", "hlint",
	"intelephense", "tailwindcss", "ts_ls",
	"emmet_language_server", "emmet_ls", "solargraph",
    "zls", "pyright", "verible"
})

-- Autocommands

vim.api.nvim_create_autocmd('FileType', {
    callback = function() pcall(vim.treesitter.start) end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.o.signcolumn = 'no'
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client and client.name == 'clangd' then
            require('clangd_extensions')
        end
        if client:supports_method('textDocument/completion') then
            vim.o.complete = 'o,.,w,b,u'
            vim.o.completeopt = 'menu,menuone,popup,noinsert'
            vim.lsp.completion.enable(true, client.id, args.buf)
        end
	local map = function(keys, func) 
            vim.keymap.set('n', keys, func, { buffer = args.buf, silent = true })
        end
        map('gd', vim.lsp.buf.definition)
        map('gr', vim.lsp.buf.references)
        map('K',  vim.lsp.buf.hover)
        map('<leader>r', vim.lsp.buf.rename)
        map('<leader>ca', vim.lsp.buf.code_action)
    end
})

vim.diagnostic.config({
    virtual_text = true,      -- shows errors inline at end of line
    signs = true,             -- shows signs in the gutter
    underline = true,         -- underlines the problematic code
    update_in_insert = false, -- don't show errors while typing
    severity_sort = true,     -- errors before warnings
})

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = vim.fn.expand('~/.config/nvim/init.lua'),
    callback = function() dofile(vim.env.HOME .. '/.config/nvim/init.lua') end,
})

vim.api.nvim_create_autocmd('QuickFixCmdPost', {
    pattern = { 'grep', 'vimgrep' },
    callback = function() vim.cmd('copen 5') end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'verilog', 'systemverilog' },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        -- build/simulate keymap
        vim.keymap.set('n', '<leader>l',
            ':w<CR>:vert rightbelow split | term iverilog % -o sim && ./sim<CR>',
            { buffer = true, silent = true })
    end,
})


-- Evil snippet stuff : 
local ls = require("luasnip")

local function map(lhs, rhs, opts)
    opts = opts or {}
    local mode = opts.mode or 'n'
    opts.mode = nil
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', { silent = true }, opts))
end

map("<Tab>", function()
    if ls.expandable() then
        ls.expand()
    elseif ls.locally_jumpable(1) and ls.in_snippet() then
        ls.jump(1)
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
    end
end, { mode = { "i", "s" } })

map("<S-Tab>", function()
    ls.jump(-1)
end, { mode = { "s", "i" } })

map("<C-1>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { mode = { "s", "i" } })

require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets" })
ls.config.setup({ enable_autosnippets = true })


-- CMP stuff : 

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
        {name = 'path'},
    }, {
        {name = 'buffer'},
    }),
  })
      cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
