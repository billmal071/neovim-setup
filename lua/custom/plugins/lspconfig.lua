local ok, ih = pcall(require, "inlay-hints")
if not ok then
  vim.notify "inlay-hints not installed, install through simrat/inlay-hints"
  return
end

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  -- "null-ls",
  "html",
  "cssls",
  "tsserver",
  "clangd",
  -- "rust_analyzer",
  "tailwindcss",
  "prismals",
  "pylsp",
  "gopls",
  -- "jdtls",
  "ansiblels",
  -- "terraform_lsp",
  "terraformls",
  "tflint",
  "dockerls",
  "solidity_ls",
  "vuels",
  "yamls",
  "angularls",
  "emmet_ls",
  "codeqlls",
  "sqlls",
  "bashls",
  -- "denols"
}

local protocol = require "vim.lsp.protocol"

protocol.CompletionItemKind = {
  "", -- Text
  "", -- Method
  "", -- Function
  "", -- Constructor
  "", -- Field
  "", -- Variable
  "", -- Class
  "ﰮ", -- Interface
  "", -- Module
  "", -- Property
  "", -- Unit
  "", -- Value
  "", -- Enum
  "", -- Keyword
  "﬌", -- Snippet
  "", -- Color
  "", -- File
  "", -- Reference
  "", -- Folder
  "", -- EnumMember
  "", -- Constant
  "", -- Struct
  "", -- Event
  "ﬦ", -- Operator
  "", -- TypeParameter
}

-- lspconfig.tsserver.setup {
--   preferences = {
--     disable_formatting = true,
--     settings = {
--       javascript = {
--         inlayHints = {
--           includeInlayEnumMemberValueHints = true,
--           includeInlayFunctionLikeReturnTypeHints = true,
--           includeInlayFunctionParameterTypeHints = true,
--           includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
--           includeInlayParameterNameHintsWhenArgumentMatchesName = true,
--           includeInlayPropertyDeclarationTypeHints = true,
--           includeInlayVariableTypeHints = true,
--         },
--       },
--       typescript = {
--         inlayHints = {
--           includeInlayEnumMemberValueHints = true,
--           includeInlayFunctionLikeReturnTypeHints = true,
--           includeInlayFunctionParameterTypeHints = true,
--           includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
--           includeInlayParameterNameHintsWhenArgumentMatchesName = true,
--           includeInlayPropertyDeclarationTypeHints = true,
--           includeInlayVariableTypeHints = true,
--         },
--       },
--     },
--   },
--   init_options = require("nvim-lsp-ts-utils").init_options,
--   --
--   on_attach = function(client, bufnr)
--     local ts_utils = require "nvim-lsp-ts-utils"
--     ih.on_attach(client, bufnr)
--     -- defaults
--     ts_utils.setup {
--       debug = false,
--       disable_commands = false,
--       enable_import_on_completion = false,
--
--       -- import all
--       import_all_timeout = 5000, -- ms
--       -- lower numbers = higher priority
--       import_all_priorities = {
--         same_file = 1, -- add to existing import statement
--         local_files = 2, -- git files or files with relative path markers
--         buffer_content = 3, -- loaded buffer content
--         buffers = 40, -- loaded buffer names
--       },
--       import_all_scan_buffers = 100,
--       import_all_select_source = false,
--       -- if false will avoid organizing imports
--       always_organize_imports = true,
--
--       -- filter diagnostics
--       filter_out_diagnostics_by_severity = {},
--       filter_out_diagnostics_by_code = {},
--
--       -- inlay hints
--       -- inlay_hints = {
--       --   only_current_line = false,
--       --   include_parameter_name_hints = "literals",
--       --   include_parameter_name_hints_when_argument_matches_name = true,
--       --   include_function_parameter_type_hints = true,
--       --   include_variable_type_hints = true,
--       --   include_variable_type_hints_when_type_matches_name = true,
--       --   include_property_declaration_type_hints = true,
--       --   include_function_like_return_type_hints = true,
--       --   include_enum_member_value_hints = true,
--       -- },
--       auto_inlay_hints = true,
--       inlay_hints_highlight = "Comment",
--       inlay_hints_priority = 200, -- priority of the hint extmarks
--       inlay_hints_throttle = 150, -- throttle the inlay hint request
--       inlay_hints_format = { -- format options for individual hint kind
--         Type = {},
--         Parameter = {},
--         Enum = {},
--         -- Example format customization for `Type` kind:
--         -- Type = {
--         --     highlight = "Comment",
--         --     text = function(text)
--         --         return "->" .. text:sub(2)
--         --     end,
--         -- },
--       },
--
--       -- update imports on file move
--       update_imports_on_move = true,
--       require_confirmation_on_move = true,
--       watch_dir = nil,
--     }
--
--     -- required to fix code action ranges and filter diagnostics
--     ts_utils.setup_client(client)
--
--     -- no default maps, so you may want to define some here
--     local opts = { silent = true }
--     vim.api.nvim_buf_set_keymap(bufnr, "n", "org", ":TSLspOrganize<CR>", opts)
--     vim.api.nvim_buf_set_keymap(bufnr, "n", "rem", ":TSLspRenameFile<CR>", opts)
--     vim.api.nvim_buf_set_keymap(bufnr, "n", "imp", ":TSLspImportAll<CR>", opts)
--   end,
--   -- capabilities = capabilities,
-- }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config {
  virtual_text = {
    prefix = "●",
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
}
