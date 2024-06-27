require('nvim-autopairs').setup({
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
})

local npairs = require("nvim-autopairs")
local rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.add_rules({
    rule("|", "|", { "rust" }):with_move(cond.after_regex("|")),
    rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(function(opts)
        return opts.char == ">"
    end),
})
