lvim.plugins = {
  "craftzdog/solarized-osaka.nvim",
  {

    "rose-pine/neovim",
    name = "rose-pine",
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
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
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
  }
}

lvim.builtin.cmp.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter
}

-- null ls
local linter = require("lvim.lsp.null-ls.linters")
local formattter = require("lvim.lsp.null-ls.formatters")
local code_actions = require("lvim.lsp.null-ls.code_actions")
linter.setup({
  { name = "eslint_d" },
})


formattter.setup({
  { name = "prettier" },
  { name = "black" }
})

code_actions.setup({
  { name = "eslint_d" }
})
