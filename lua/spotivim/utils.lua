local M = {}

local function dump(tbl)
    if type(tbl) == 'table' then
        local s = '{ '
        for k,v in pairs(tbl) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(tbl)
    end
end

function M.print_table(tbl)
    print(dump(tbl))
end

return M
