-- installs:
--11  sudo apt install git
--31  sudo apt-get install neovim
--75  sudo apt-get install ripgrep
--88  sudo apt install build-essential
--90  sudo apt-get install cmake
--92  sudo apt-get install gettext
--94  sudo make install
--109  sudo apt install python3.10-venv
--124  sudo apt install nodejs
--128  sudo apt install npm
--149  sudo apt-get install ca-certificates curl gnupg
--150  sudo install -m 0755 -d /etc/apt/keyrings
--156  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
--273  sudo apt install htop
--274  sudo apt install fzf
--278  history |grep install

require("josean.plugins-setup")
require("josean.core.options")
require("josean.core.keymaps")
require("josean.core.colorscheme")
require("josean.plugins.comment")
require("josean.plugins.nvim-tree")
require("josean.plugins.lualine")
require("josean.plugins.telescope")
require("josean.plugins.nvim-cmp")
require("josean.plugins.lsp.mason")
require("josean.plugins.lsp.lspsaga")
require("josean.plugins.lsp.lspconfig")
require("josean.plugins.lsp.null-ls")
require("josean.plugins.autopairs")
require("josean.plugins.treesitter")
require("josean.plugins.gitsigns")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
  require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})
