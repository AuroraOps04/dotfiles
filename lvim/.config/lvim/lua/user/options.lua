local conf_dir                  = vim.fn.stdpath("config")

lvim.transparent_window         = true
lvim.colorscheme                = 'solarized-osaka'
vim.opt.relativenumber          = true
vim.opt.spell                   = true
vim.opt.spellfile               = conf_dir .. "/spell/en.utf-8.add"
-- unnamed == '*' unnamedplus == '+'
vim.opt.clipboard               = 'unnamedplus'

-- ignore other pattern
lvim.builtin.project.patterns   = { ".git" }
-- lvim.format_on_save             = true

-- use Lspsaga for breadcrumbs
lvim.builtin.breadcrumbs.active = false


lvim.builtin.lualine.on_config_done = function(lualine)
  local config = lualine.get_config()
  table.insert(config.sections.lualine_x, "encoding")
  lualine.setup(config)
end
