local ok, aerial = pcall(require, "aerial")

if not ok then
  return
end

aerial.setup {
  log_level = "info",
  backends = { "treesitter" },
  filter_kind = {
    "Class",
    "Field",
    "Variable",
    "Constructor",
    "Enum",
    "Function",
    "Interface",
    "Module",
    "Method",
    "Struct",
  },
  vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>"),
}
