vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
    pattern = "*",
    desc = "Run LSP formatting on a file on save",
    callback = function()
        if vim.fn.exists(":Format") > 0 then
            vim.cmd.Format()
        end

        vim.cmd([[%s/\s\+$//e]])

        local cursor_pos = vim.fn.getpos('.')
        vim.cmd([[ %s/\($\n\s*\)\+\%$/\r/e ]])
        vim.fn.setpos('.', cursor_pos)
    end,
})
