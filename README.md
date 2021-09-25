
# nvim treesitter statusline


## showcase

module if statement:
![image 1](https://github.com/alexzanderr/nvim-treesitter-statusline/blob/master/images/ifstatement.png)

class attribute inside init
![image 2](https://github.com/alexzanderr/nvim-treesitter-statusline/blob/master/images/class.png)


for loop inside __init__ method
![image 2](https://github.com/alexzanderr/nvim-treesitter-statusline/blob/master/images/forclass.png)


## install using packer
```lua
use {
	"alexzanderr/nvim-treesitter-statusline",
	requires = {
		"nvim-treesitter/nvim-treesitter",
		"MunifTanjim/nui.nvim",
	}
}
```


## setup

in `init.lua`:
```lua
require("nvim-treesitter-statusline")
```


## why?

vs code always had this status line where you can see your cursor location in the current file

i really wanted this in `neovim` and also other people can try this and be glad.


## source code
```lua
local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event
local Split = require("nui.split")

function NvimTreeSitterStatusline()
    -- mount/open the component
    local treesitter_statusline = Popup({
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
    treesitter_statusline:mount()
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
end


-- without this you are garbage
vim.g.scrolloff = 1

vim.cmd("autocmd CursorHold * lua NvimTreeSitterStatusline()")
vim.cmd("autocmd CursorHoldI * lua NvimTreeSitterStatusline()")
vim.cmd("autocmd BufWrite * lua NvimTreeSitterStatusline()")
vim.cmd("autocmd BufEnter * lua NvimTreeSitterStatusline()")

```

this is the `init.lua` from the plugin

if you can make this better, please submit `PR`s


peace!
