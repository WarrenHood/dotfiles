local ls = require("luasnip")
local s = ls.snippet

return {
    ls.parser.parse_snippet("test", "fn $1($2) {\n$0}"),
}

