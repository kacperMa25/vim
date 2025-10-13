return {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
        local cmp = require("cmp")
        opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
            ["<CR>"] = cmp.mapping(function(fallback)
                fallback()
            end, { "i", "s" }),
        })
    end,
}
