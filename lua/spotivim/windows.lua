local M = {}

local function get_global_data()
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("rows")
    return {
        width = width * 0.8,
        height = height * 0.8,
        row = height * 0.1,
        col = width * 0.1,
    }
end

function M.setup()
    M.search_buffer = vim.api.nvim_create_buf(false, true)
    M.results_buffer = vim.api.nvim_create_buf(false, true)
    M.types_buffer = vim.api.nvim_create_buf(false, true)
end

function M.draw_search_window()
    local window_defaults = get_global_data()
    local win = vim.api.nvim_open_win(M.search_buffer, true, {
        relative = "editor",
        row = window_defaults.height + window_defaults.row,
        col = window_defaults.col,
        width = window_defaults.width,
        height = 1,
        focusable = true,
        title = " Spotivim Search ",
        title_pos = "center",
        border = "rounded",
        style = "minimal"
    })
    M.search_window = win
end

return M
