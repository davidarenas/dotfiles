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
  { "rebelot/kanagawa.nvim", name = "kanagawa", lazy = true },
  { "EdenEast/nightfox.nvim", name = "nightfox", lazy = true },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    opts = { variant = "moon", disable_italics = true },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "glacambre/firenvim",

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn["firenvim#install"](0)
    end,
    config = function()
      vim.g.firenvim_config = {
        globalSettings = { alt = "all" },
        localSettings = {
          [".*"] = {
            cmdline = "none",
            content = "text",
            priority = 0,
            selector = "textarea",
            takeover = "never",
          },
        },
      }
      vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
        nested = true,
        command = "write",
      })
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = "leetcode.com_*.txt",
        command = "set filetype=javascript",
      })
    end,
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
        "tsx",
      })
    end,
  },
  { import = "lazyvim.plugins.extras.lang.typescript" },
}
