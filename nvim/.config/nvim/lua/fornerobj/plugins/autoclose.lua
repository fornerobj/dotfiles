return {
    'm4xshen/autoclose.nvim',
    config = function()
        local autoclose = require("autoclose")
        autoclose.setup({
            keys = {
                ['"'] = { escape = true, close = true, pair = '""' },
                ["'"] = { escape = true, close = true, pair = "''" },
                ["`"] = { escape = true, close = true, pair = "``" },
            },
            options = {
                disabled_filetypes = { "text", "markdown" },
            },
        })
    end,
}
