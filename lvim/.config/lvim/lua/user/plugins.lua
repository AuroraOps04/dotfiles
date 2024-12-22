lvim.plugins = {
  "craftzdog/solarized-osaka.nvim",
  {

    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup()
    end
  },
  {
    'ggandor/leap.nvim',
    config = function()
      -- vim.cmd [[ highlight default  LeapBackdrop guifg='#908caa' ]]
      require("leap").create_default_mappings()
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd [[ highlight default link gitblame SpecialComment ]]
      vim.g.gitblame_enabled         = 0
      vim.g.gitblame_highlight_group = "gitblame"
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },
  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command("augroup user_plugin_cursorword")
      vim.api.nvim_command("autocmd!")
      vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
      vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
      vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
      vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
      vim.api.nvim_command("augroup END")
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        --  enable virtual_text
        require("copilot").setup({

        })                             -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    -- red
    config = function()
      require("colorizer").setup()
    end
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          -- enable = false
        }
      })

      -- override default keymap
      -- lvim.builtin.project
      lvim.lsp.buffer_mappings.normal_mode["K"] = { ":Lspsaga hover_doc<CR>", "Show documentation by lspsaga" }
      lvim.lsp.buffer_mappings.normal_mode["gd"] = { ":Lspsaga goto_definition<CR>", "Goto definition" }
      lvim.lsp.buffer_mappings.normal_mode["gD"] = { ":Lspsaga goto_type_definition<CR>", "Goto type definition" }

      lvim.builtin.which_key.mappings['lr'] = {
        "<cmd>Lspsaga rename<CR>", "Rename"
      }
      lvim.builtin.which_key.mappings["la"] = {
        "<cmd>Lspsaga code_action<CR>", "Code Action Lspsaga"
      }
      lvim.builtin.which_key.mappings["lp"] = {
        "<cmd>Lspsaga peek_definition<CR>", "Peek Definition Saga"
      }
      lvim.builtin.which_key.mappings["lP"] =
      { "<cmd>Lspsaga peek_type_definition<CR>", "Peek Type Definition Saga" }
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "voldikss/vim-translator",
    config = function()
      vim.g.translator_proxy_url = 'socks5://127.0.0.1:7890'
    end
  },
  {
    "tpope/vim-surround",

  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  --  smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
  },
  -- open url with gx
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  {
    -- TODO: don't forget change the default mappings
    "gbprod/substitute.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      on_substitute = nil,
      yank_substituted_text = false,
      preserve_cursor_position = false,
      modifiers = nil,
      highlight_substituted_text = {
        enabled = true,
        timer = 500,
      },
      range = {
        prefix = "r",
        prompt_current_text = false,
        confirm = false,
        complete_word = false,
        subject = nil,
        range = nil,
        suffix = "",
        auto_apply = false,
        cursor_position = "end",
      },
      exchange = {
        motion = false,
        use_esc_to_cancel = true,
        preserve_cursor_position = false,
      },
    }
  }
}
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.cmp.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter
}

-- null ls
local linter = require("lvim.lsp.null-ls.linters")
local formattter = require("lvim.lsp.null-ls.formatters")
local code_actions = require("lvim.lsp.null-ls.code_actions")
linter.setup({
  { name = "eslint_d" },
  { name = "jsonlint" }
})


formattter.setup({
  { name = "prettier" },
  { name = "black" },
  { name = "clang_format" }
})

code_actions.setup({
  { name = "eslint_d" }
})
