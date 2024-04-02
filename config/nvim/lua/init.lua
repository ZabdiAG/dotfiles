local vim = vim
local Plug = vim.fn['plug#']

-- https://github.com/junegunn/vim-plug
vim.call('plug#begin') -- $HOME/.local/share/nvim/plugged

-- Shorthand notation for GitHub; translates to https://github.com/junegunn/vim-easy-align
-- Plug('junegunn/vim-easy-align')


 -- MUST LIST
  Plug('tpope/vim-fugitive')
  Plug('easymotion/vim-easymotion')
  Plug('https://github.com/github/copilot.vim.git')


  -- Experimenting...
  Plug('junegunn/fzf')

  -- This dependency is required by nvim-ufo. Still figuring out how to nest install
  Plug('kevinhwang91/promise-async')
  Plug('kevinhwang91/nvim-ufo')


  -- Colorscheme
  Plug('rebelot/kanagawa.nvim')

  -- Code related
  Plug('https://github.com/lifepillar/pgsql.vim.git')
  Plug('vim-nix') -- Does this works?

vim.call('plug#end')


-- Some nasty old vim code
vim.g.mapleader = " "


vim.wo.number = 1
vim.wo.relativenumber = 1


-- Chosing colorscheme
vim.cmd("colorscheme kanagawa")


-- enable SQL files with pgsql
vim.g.sql_type_default = 'pgsql'


-- -- Configure nvim-ufo
-- vim.o.foldcolumn = '1'
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
-- 
-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
-- 
-- -- Tell the server the capability of foldingRange,
-- -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }
-- 
-- local language_servers = require("lspconfig").util.available_servers()
-- 
-- for _, ls in ipairs(language_servers) do
--     require('lspconfig')[ls].setup({
--         capabilities = capabilities
--         -- you can add other fields for setting up lsp server in this table
--     })
-- end
-- require('ufo').setup()
