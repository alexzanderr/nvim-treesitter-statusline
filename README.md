
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

