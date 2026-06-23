local M = {}

local defaults = {
    client_secret = "NONE",
    client_id = "NONE",
    country_code = "CA",
}

M.config = vim.deepcopy(defaults)

function M.setup(opts)
    M.config = vim.tbl_deep_extend("force", defaults, opts or {})
    require("spotivim.windows").setup()
    require("spotivim.commands").init_commands()
end

return M
