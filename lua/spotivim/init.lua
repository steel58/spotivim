local M = {}

local defaults = {
    greeting = "Hello from my plugin!",
}

M.config = vim.deepcopy(defaults)

function M.setup(opts)
    M.config = vim.tbl_deep_extend("force", defaults, opts or {})

    require("my_plugin.commands").init_commands()
end

function M.hello()
    print(M.config.greeting)
end

return M
