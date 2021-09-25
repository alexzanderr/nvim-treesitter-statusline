
# nvim treesitter statusline


## showcase
![image 1](https://github.com/alexzanderr/nvim-treesitter-statusline/blob/master/images/ifstatement.png)

![image 2](https://github.com/alexzanderr/nvim-treesitter-statusline/blob/master/images/class.png)

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

