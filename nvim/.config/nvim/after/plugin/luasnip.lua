local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local haskell_snippets = require('haskell-snippets').all
-- local c = ls.choice_node
-- local t = ls.text_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

ls.setup()
ls.add_snippets('haskell', haskell_snippets, { key = 'haskell' })

ls.add_snippets('rust', {
    s('implg', fmt([[
    impl<{}> {} for {} {{
        {}
    }}
    ]],
        {
            i(1), i(2, 'Trait'), i(3, 'Type'), i(4, '// trait methods here')
        }
    )),
})

-- LuaSnip keymappings
vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(-1) end, { silent = true })
