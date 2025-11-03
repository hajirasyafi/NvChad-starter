-- lua/plugins/init.lua
return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    filesystem_watchers = {
      ignore_dirs = {
        "node_modules",
      },
    },
    log = {
      enable = true,
      truncate = true,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        dev = false,
        diagnostics = true,
        git = true,
        profile = true,
        watcher = true,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
    cmd = { "ConformInfo" },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "scss",
        "typescript",
        "tsx",
        "javascript",
        "jsdoc",
        "json",
        "toml",
        "yaml",
        "xml",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "php",
        "prisma",
        "python",
        "cpp",
        "templ",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },
  {
    import = "nvchad.blink.lazyspec",
    version = "1.*",
    opts = {
      keymap = {
        preset = "default",
      },
      completion = {
        documentation = {
          auto_show = true,
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
      appearance = {
        highlight_ns = vim.api.nvim_create_namespace "blink_cmp",
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = false,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
        kind_icons = {
          Text = "󰉿",
          Method = "󰊕",
          Function = "󰊕",
          Constructor = "󰒓",
          Field = "󰜢",
          Variable = "󰆦",
          Property = "󰖷",
          Class = "󱡠",
          Interface = "󱡠",
          Struct = "󱡠",
          Module = "󰅩",
          Unit = "󰪚",
          Value = "󰦨",
          Enum = "󰦨",
          EnumMember = "󰦨",
          Keyword = "󰻾",
          Constant = "󰏿",
          Snippet = "󱄽",
          Color = "󰏘",
          File = "󰈔",
          Reference = "󰬲",
          Folder = "󰉋",
          Event = "󱐋",
          Operator = "󰪚",
          TypeParameter = "󰬛",
        },
      },
      term = {
        enabled = false,
        keymap = {
          preset = "inherit",
        }, -- Inherits from top level `keymap` config when not set
        sources = {},
        completion = {
          trigger = {
            show_on_blocked_trigger_characters = {},
            show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
          },
          -- Inherits from top level config options when not set
          list = {
            selection = {
              -- When `true`, will automatically select the first item in the completion list
              preselect = true,
              -- When `true`, inserts the completion item automatically when selecting it
              auto_insert = true,
            },
          },
          -- Whether to automatically show the window when new completion items are available
          menu = {
            auto_show = true,
          },
          -- Displays a preview of the selected item on the current line
          ghost_text = {
            enabled = true,
          },
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "single",
          show_documentation = true,
        },
      },
    },
    opts_extend = { "sources.default" },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "solid"
      }
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "html-lsp",
        "css-lsp",
        "eslint-lsp",
        "gopls",
        "tailwindcss-language-server",
        "templ",
        "phpactor",
        "clangd",
        "prismals",
        "pyright",
        "lemminx",
        "prettier",
        "stylua",
        "gofumpt",
        "goimports",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim" },
    },
  },
  { 'nvim-mini/mini.nvim', version = false },
}
