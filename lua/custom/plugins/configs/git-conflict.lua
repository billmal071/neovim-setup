local present, git_conflict = pcall(require, "git-conflict")

if not present then
  return
end

git_conflict.setup {
  default_mappings = {
    ours = "my",
    theirs = "thr",
    none = "non",
    both = "bth",
    next = "nxt",
    prev = "prv",
  }, -- disable buffer local mapping created by this plugin
  default_commands = true, -- disable commands created by this plugin
  disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = "DiffText",
    current = "DiffAdd",
  },
}
