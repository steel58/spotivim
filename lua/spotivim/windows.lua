local M = {}

local function get_global_data()
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")
    return {
        width = math.floor(width * 0.8),
        height = math.floor(height * 0.8),
        row = math.floor(height * 0.1),
        col = math.floor(width * 0.1),
    }
end

function M.setup()
    M.search_buffer = vim.api.nvim_create_buf(false, true)
    M.results_buffer = vim.api.nvim_create_buf(false, true)
    M.types_buffer = vim.api.nvim_create_buf(false, true)
end

local function draw_search_window()
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

local function draw_search_types_window()
    local window_defaults = get_global_data()
    local row = window_defaults.height + window_defaults.row - 3
    local win = vim.api.nvim_open_win(M.types_buffer, true, {
        relative = "editor",
        row = row,
        col = window_defaults.col,
        width = window_defaults.width,
        height = 1,
        focusable = true,
        title = " Search Types ",
        title_pos = "center",
        border = "rounded",
        style = "minimal"
    })
    vim.api.nvim_buf_set_lines(
        M.types_buffer,
        row,
        row,
        false,
        {"Album | Artist | Playlist | Track | Show | Episode | Audiobook"}
    )
    M.search_types_window = win
end

local function draw_search_results_window()
    local window_defaults = get_global_data()
    local win = vim.api.nvim_open_win(M.results_buffer, true, {
        relative = "editor",
        row = window_defaults.row,
        col = window_defaults.col,
        width = window_defaults.width,
        height = window_defaults.height - 5,
        focusable = true,
        title = " Search Types ",
        title_pos = "center",
        border = "rounded",
        style = "minimal"
    })
    M.search_results_window = win
end

function M.draw_windows()
    draw_search_types_window()
    draw_search_results_window()
    draw_search_window()
end

return M
