return {
  {
    "nvim-treesitter/nvim-treesitter", build=":TSUpdate",
    config=function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install=true,
        sync_install=false,
        highlight={enable=true},
        indent={enable=true},
        additional_vim_regex_highlighting = false
      })

      vim.cmd([[
        augroup TemplFileType
          autocmd!
          autocmd BufRead, BufNewFile *.tmpl setfiletype templ
        augroup END
      ]])
    end
  }

}
