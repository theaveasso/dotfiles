return  {
  "laytan/cloak.nvim",
  config = function()
    require("cloak").setup({
      enable = true,
      cloak_character = "*",
      pattern = {
        file_patterns = "*.env*",
        cloak_pattern =  "=.+",
        replace = nil
      }
    })

  end
}
