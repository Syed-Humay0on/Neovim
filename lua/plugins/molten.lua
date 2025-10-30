return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
    end,
    config = function()
      -- Wait until molten is available before attaching
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
          vim.schedule(function()
            if vim.fn.exists(":MoltenAttach") == 2 then
              vim.cmd("MoltenAttach")
            else
              vim.notify("MoltenAttach not ready yet", vim.log.levels.WARN)
            end
          end)
        end,
      })
    end,
  },
}
