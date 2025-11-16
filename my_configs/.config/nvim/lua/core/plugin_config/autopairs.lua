-- Load nvim-autopairs safely
local npairs_ok, npairs = pcall(require, "nvim-autopairs")
if not npairs_ok then
  return
end

-- 1️⃣ Setup first
npairs.setup({
  check_ts = true,           -- enable Treesitter integration if you want
  enable_check_bracket_line = true,
})

-- 2️⃣ Load Rule and conditions after setup
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

-- 3️⃣ Add rules

-- Pair $$ in TeX files
npairs.add_rule(Rule("$$","$$","tex"))

-- Pair $ in TeX/LaTeX with conditions
npairs.add_rules({
  Rule("$", "$", {"tex", "latex"})
    :with_pair(cond.not_after_regex("%%"))
    :with_pair(cond.not_before_regex("xxx", 3))
    :with_move(cond.none())
    :with_del(cond.not_after_regex("xx"))
    :with_cr(cond.none()),
  --Rule("a","a","-vim")  -- disable for .vim files
})

-- Pair $$ conditionally
npairs.add_rules({
  Rule("$$","$$","tex")
    :with_pair(function(opts)
        if opts.line == "aa $$" then
          return false
        end
    end)
})

-- Regex examples
npairs.add_rules({
  Rule("u%d%d%d%d$", "number", "lua")
    :use_regex(true),
  Rule("x%d%d%d%d$", "number", "lua")
    :use_regex(true)
    :replace_endpair(function(opts)
        return opts.prev_char:sub(#opts.prev_char - 3, #opts.prev_char)
    end),
  Rule("b%d%d%d%d%w$", "", "vim")
    :use_regex(true, "<tab>")
    :replace_endpair(function(opts)
        return opts.prev_char:sub(#opts.prev_char - 4,#opts.prev_char) .. "<esc>viwU"
    end)
})

-- Exclude filetypes
npairs.add_rule(
  Rule("$$","$$")
    :with_pair(cond.not_filetypes({"lua"}))
)

