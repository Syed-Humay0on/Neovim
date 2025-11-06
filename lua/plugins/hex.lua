return {
  "RaafatTurki/hex.nvim",
  opts = {
    -- optional config
    dump_cmd = "xxd -g 1 -u", -- command used for hex dump
    assemble_cmd = "xxd -r",  -- command used to revert hex to binary
    filetypes = { "binary", "hex" },
  },
  keys = {
    { "<leader>hx", "<cmd>HexToggle<cr>", desc = "Toggle hex view" },
  },
}
