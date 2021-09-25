

local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event
local Split = require("nui.split")

-- https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup

function FloatingWindow()
    -- mount/open the component
    local floating_window = Popup({
        enter = false,
        focusable = false,
        relative = "editor",
        border = {},
        position = {
            row = 38,
            col = 0,
        },
        -- zindex = 50,
        size = {
            width = 100,
            height = 1,
        },
        buf_options = {
            modifiable = true,
            readonly = false,
        },
    })
    floating_window:mount()
    local lsp_status = require("nvim-treesitter").statusline({
        indicator_size = 100,
        separator = " ❱ ",
        transform_fn = function(line)
            return line:gsub("%s*[%[%(%{]*%s*$", "")
        end
,
        -- type_patterns = {'module', 'class', 'function', 'method', 'variable', 'comment', 'number', 'import'}
        -- module is wrong, it prints the file comment in the script
        type_patterns = {
            "class",
            "function",
            "method",
            "import",
            "for",
            "if",
            "while",
            "variable",
            "comment",
        },
    })
    -- print(lsp_status)
    vim.api.nvim_buf_set_lines(floating_window.bufnr, 0, 1, false, {
        lsp_status,
    })
end


-- without this you are garbage
vim.g.scrolloff = 1

-- vim.cmd("autocmd InsertLeave * lua FloatingWindow()")
vim.cmd("autocmd CursorHold * lua FloatingWindow()")
vim.cmd("autocmd CursorHoldI * lua FloatingWindow()")
vim.cmd("autocmd BufWrite * lua FloatingWindow()")
vim.cmd("autocmd BufEnter * lua FloatingWindow()")
