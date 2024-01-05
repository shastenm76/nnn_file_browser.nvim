-- ~/.local/share/nvim/lazy/nnn_file_browser.nvim/lua/plugins/file_browser.lua

local M = {}

function M.open_nnn_browser()
    local buf = vim.api.nvim_create_buf(false, true)

    -- Run nnn in a terminal window
    vim.fn.termopen('nnn', { cwd = vim.fn.getcwd(), on_exit = function() vim.api.nvim_buf_delete(buf, { force = true }) end })

    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = 40,
        height = 10,
        row = 10,
        col = 10,
        style = 'minimal',
        border = 'single',
    })

    return { buf = buf, win = win }
end

return M

