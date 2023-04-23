return function(_, opts)
  require("which-key").setup(opts)
  require("theaveasso.utils").which_key_register()
end
