return {
  -- kanagawa.nvim
  {
    "rebelot/kanagawa.nvim",
    opts = {
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
      variablebuiltinStyle = { italic = true },
      specialReturn = true, -- special highlight for the return keyword
      specialException = true, -- special highlight for exception handling keywords
      transparent = false, -- transparency comes with picom
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      globalStatus = false, -- adjust window separators highlight for laststatus=3
      theme = "wave",
      overrides = function(colors) -- add/modify highlights
        local custom_bg_color = "#242631"
        local custom_bg_color_2 = "#1d1f21"
        return {
          Normal = { bg = custom_bg_color },
          NormalNC = { bg = custom_bg_color },
          -- LineNr = { link = "Normal" },
          NormalFloat = { bg = custom_bg_color },
          FloatBorder = { bg = custom_bg_color_2 },
          FloatTitle = { bg = custom_bg_color_2 },

          TelescopePromptBorder = { bg = custom_bg_color },
          TelescopePreviewBorder = { bg = custom_bg_color },
          TelescopeResultsBorder = { bg = custom_bg_color },
        }
      end,
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
      colorscheme = "kanagawa",
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },
}
