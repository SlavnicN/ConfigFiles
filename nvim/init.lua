if vim.g.vscode then
    vim.g.mapleader = " "
    vim.keymap.set("n", "<leader>h", ":noh<CR>")
    vim.opt.clipboard = 'unnamedplus'
    local augroup = vim.api.nvim_create_augroup

    local autocmd = vim.api.nvim_create_autocmd
    local yank_group = augroup('HighlightYank', {})

    function R(name)
        require("plenary.reload").reload_module(name)
    end

    autocmd('TextYankPost', {
        group = yank_group,
        pattern = '*',
        callback = function()
            vim.highlight.on_yank({
                higroup = 'IncSearch',
                timeout = 80,
            })
        end,
    })

else
    require("MeinConfig")
end
