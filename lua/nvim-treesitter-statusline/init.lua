


local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event
local Split = require("nui.split")

function NvimTreeSitterStatusline()
    -- mount/open the component
	local lines = vim.fn.winheight("%")
	local columns = vim.fn.winwidth("%")
    local treesitter_statusline = Popup({
        enter = false,
        focusable = false,
        relative = "editor",
        border = {},
        position = {
            row = lines,
            col = 0,
        },
        -- zindex = 50,
        size = {
            width = columns,
            height = 1,
        },
        buf_options = {
            modifiable = true,
            readonly = false,
        },
		-- transparency
        win_options = {
            winblend = 100,
            winhighlight = "Normal:Normal",
        },

    })
    treesitter_statusline:mount()

	treesitter_statusline:on(event.VimResized, function()
		treesitter_statusline:unmount()
	end)


    local lsp_status = require("nvim-treesitter").statusline({
        indicator_size = 100,
        separator = " ❱ ",
        transform_fn = function(line)
            return line:gsub("%s*[%[%(%{]*%s*$", "")
        end
,
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
    vim.api.nvim_buf_set_lines(treesitter_statusline.bufnr, 0, 1, false, {
        lsp_status,
    })
-- treesitter_statusline:unmount()
end


-- without this you are garbage
vim.g.scrolloff = 1

vim.cmd("autocmd CursorHold * lua NvimTreeSitterStatusline()")
vim.cmd("autocmd CursorHoldI * lua NvimTreeSitterStatusline()")
vim.cmd("autocmd BufWrite * lua NvimTreeSitterStatusline()")
-- vim.cmd("autocmd BufEnter * lua NvimTreeSitterStatusline()")

