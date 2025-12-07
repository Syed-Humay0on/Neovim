return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    -- you'll need at least one of these
    {'ibhagwan/fzf-lua'},
  },
  config = function()
    require('neoclip').setup()
  end,
}
