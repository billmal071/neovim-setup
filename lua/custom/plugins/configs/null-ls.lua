local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt,
  b.formatting.prettierd,
  b.diagnostics.eslint_d.with {
    diagnostics_format = "[eslint] #{m}\n(#{c})",
    -- inlay_hints = {
    --   severity = "hint",
    --   only_current_line = true,
    -- },
  },
  b.code_actions.eslint_d,
  -- b.code_actions.refactoring,
  -- ansible
  b.diagnostics.ansiblelint,
  b.formatting.ansiblelint,
  b.code_actions.ansiblelint,
  b.diagnostics.yamllint,
  -- terraform
  b.formatting.terraform_fmt,
  b.diagnostics.terraform_validate,
  -- b.diagnostics.tfsec,

  -- docker
  b.diagnostics.hadolint,

  -- github actions
  b.diagnostics.actionlint,

  -- sql
  b.formatting.sqlfluff.with {
    extra_args = { "--dialect", "postgres", "mysql" },
  },

  -- markdown
  b.diagnostics.markdownlint,

  -- nginx
  b.formatting.nginx_beautifier,

  -- python
  b.diagnostics.pylint.with {
    diagnostics_postprocess = function(diagnostic)
      diagnostic.code = diagnostic.message_id
    end,
  },
  b.formatting.isort,
  b.formatting.black,
  b.formatting.autopep8,

  -- golang
  b.formatting.gofumpt,
  b.formatting.goimports,
  b.formatting.goimports_reviser,
  b.diagnostics.golangci_lint,
  b.diagnostics.staticcheck,

  -- java
  b.formatting.google_java_format,

  -- rust
  b.formatting.rustfmt,

  -- Lua
  b.formatting.stylua,

  -- prisma
  -- b.formatting.prismaFmt,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
