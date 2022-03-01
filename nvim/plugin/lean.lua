require('lean').setup{
  -- Enable the Lean language server(s)?
  --
  -- false to disable, otherwise should be a table of options to pass to
  --  `leanls` and/or `lean3ls`.
  --
  -- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#leanls for details.

  -- Lean 4  (on_attach is as above, your LSP handler)
  lsp = { on_attach = on_attach },

  -- Lean 3  (on_attach is as above, your LSP handler)
  lsp3 = { on_attach = on_attach },

  -- mouse_events = true will simulate mouse events in the Lean 3 infoview, this is buggy at the moment
  -- so you can use the I/i keybindings to manually trigger these
  lean3 = { mouse_events = false },

  ft = {
    -- What filetype should be associated with standalone Lean files?
    -- Can be set to "lean3" if you prefer that default.
    -- Having a leanpkg.toml or lean-toolchain file should always mean
    -- autodetection works correctly.
    default = "lean3",

    -- A list of patterns which will be used to protect any matching
    -- Lean file paths from being accidentally modified (by marking the
    -- buffer as `nomodifiable`).
    nomodifiable = {
        -- by default, this list includes the Lean standard libraries,
        -- as well as files within dependency directories (e.g. `_target`)
        -- Set this to an empty table to disable.
    }
  },

  -- Abbreviation support
  abbreviations = {
    -- Set one of the following to true to enable abbreviations
    builtin = true, -- built-in expander
    compe = false, -- nvim-compe source
    -- additional abbreviations:
    extra = {
      -- Add a \wknight abbreviation to insert ♘
      --
      -- Note that the backslash is implied, and that you of
      -- course may also use a snippet engine directly to do
      -- this if so desired.
      wknight = '♘',
    },
    -- Change if you don't like the backslash
    -- (comma is a popular choice on French keyboards)
    leader = '\\',
  },

  -- Enable suggested mappings?
  --
  -- false by default, true to enable
  mappings = true,

  -- Infoview support
  infoview = {
    -- Automatically open an infoview on entering a Lean buffer?
    autoopen = true,

    -- Set infoview windows' starting dimensions.
    -- Windows are opened horizontally or vertically depending on spacing.
    width = 50,
    height = 20,

    -- Show indicators for pin locations when entering an infoview window?
    -- always | never | auto (= only when there are multiple pins)
    indicators = "auto",
  },

  -- Progress bar support
  progress_bars = {
    -- Enable the progress bars?
    enable = true,
    -- Use a different priority for the signs
    priority = 10,
  },

  -- Print Lean's stderr messages to a vim buffer
  stderr = { enable = true },
}

-- Update error messages even while you're typing in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    update_in_insert = true,
    sign = true,
  }
)

