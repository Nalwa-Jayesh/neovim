-- lua/plugins/mini.lua
return {
    spec = {
        { src = "https://github.com/echasnovski/mini.statusline" },
        { src = "https://github.com/echasnovski/mini.surround" },
        { src = "https://github.com/echasnovski/mini.move" },
        { src = "https://github.com/echasnovski/mini.notify" },
    },
    setup = function()
        require("mini.statusline").setup({ use_icons = true })
        require("mini.surround").setup()
        require("mini.move").setup()
        require("mini.notify").setup()
    end,
}
