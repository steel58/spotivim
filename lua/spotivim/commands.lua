local M = {}

function M.init_commands()
    vim.api.nvim_create_user_command("PrintConfig", function()
        local config = require("spotivim").config
        require("spotivim.utils").print_table(config)
    end, {
    desc = "Print all config data",
    })
end

return M
