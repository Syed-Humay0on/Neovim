-- Re-enable disabled providers
local providers = { "python3_provider", "node_provider" }

for _, p in ipairs(providers) do
  vim.g["loaded_" .. p] = nil
  vim.cmd("runtime " .. p)
end

vim.g.python3_host_prog = "/home/proto/uv_env/bin/python"

