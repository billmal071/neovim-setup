local present, tabnine = pcall(require, "tabnine")

if not present then
  vim.notify "Tabnine not found, check config again"
  return
end

tabnine.setup {
  disable_auto_comment = true,
  accept_keymap = "<A-c>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = { gui = "#808080", cterm = 244 },
  execlude_filetypes = { "TelescopePrompt" },
}
