local M = {}

function M.setup()
    M.seach_buffer = vim.api.nvim_create_buf(false, true)
    M.results_buffer = vim.api.nvim_create_buf(false, true)
    M.types_buffer = vim.api.nvim_create_buf(false, true)
end

function M.draw_search_window()
    vim.api.nvim_open_win(M.search_buffer, true, {
        relative = "editor",
        row = 3,
        col = 3,
        width = 40,
        height = 4,
        focusable = true,
        title = "Spotivim Search",
        title_pos = "center",
        border = "rounded",
    })
end

return M
