-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "storm" },
  },
  { "rose-pine/neovim", name = "rose-pine", lazy = false, opts = { variant = "moon", disable_italics = true } },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "clojure",
        "ocaml",
        "typescript",
        "tsx"
      })
    end,
  },
  { import = "lazyvim.plugins.extras.lang.typescript" },
}
