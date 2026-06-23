local M = {}

function M.init_commands()
    vim.api.nvim_create_user_command("MyPluginHello", function()
        require("my_plugin").hello()
    end, {
        desc = "Print a greeting",
    })
end

return M
