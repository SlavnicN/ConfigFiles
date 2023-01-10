if not vim.g.vscode then
    vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

    require("catppuccin").setup({
        transparent_background = true,
        term_colors = false,
        compile = {
            enabled = false,
            path = vim.fn.stdpath("cache") .. "/catppuccin",
        },
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15,
        },
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        integrations = {
            -- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
        },
        color_overrides = {},
        highlight_overrides = {},
    })

        -- Example config in lua
        vim.g.nord_contrast = true
        vim.g.nord_borders = false
        vim.g.nord_disable_background = false
        vim.g.nord_italic = false
        vim.g.nord_uniform_diff_background = true
        vim.g.nord_bold = false

        -- Load the colorscheme
        --require('nord').set()

        vim.cmd [[colorscheme nordfox]]

end
