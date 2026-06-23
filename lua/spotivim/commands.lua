local M = {}

local function print_config()
    local config = require("spotivim").config
    print(config)
end


function M.init_commands()
    vim.api.nvim_create_user_command("MyPluginHello", function()
        require("spotivim").hello()
    end, {
        desc = "Print a secret",
    })
    vim.api.nvim_create_user_command("PrintConfig", function()
        print_config()
    end, {
        desc = "Print all config data",
    })
end

return M
