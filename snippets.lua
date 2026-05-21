vim.cmd.packadd("LuaSnip")
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
