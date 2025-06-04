local imb = function(e)
  vim.schedule(function()
    local kernels = vim.fn.MoltenAvailableKernels()
    local kernel_name = nil
    local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
    if venv then kernel_name = string.match(venv, "/.+/(.+)") end
    if kernel_name and vim.tbl_contains(kernels, kernel_name) then
      vim.cmd(("MoltenInit %s"):format(kernel_name))
    else
      vim.cmd("MoltenInit")
    end
    vim.cmd("MoltenImportOutput")
  end)
end

vim.api.nvim_create_autocmd("BufAdd", {
  pattern = { "*.ipynb" },
  callback = imb,
})
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.ipynb",
  callback = function()
    if require("molten.status").initialized() == "Molten" then
      vim.cmd("MoltenExportOutput!")
    end
  end
})
