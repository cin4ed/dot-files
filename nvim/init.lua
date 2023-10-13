-- Set the textwidth to 80
vim.opt.textwidth = 80

-- Set no wrapping
vim.wo.wrap = false

-- Set tabstop, shiftwidth, and softtabstop to 2, and use expandtab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Disable shiftround
vim.opt.shiftround = false

-- Enable line numbers
vim.opt.number = true

-- Copy to system's clipboard by default
vim.cmd('set clipboard=unnamedplus')

-- Set leader key to space
vim.g.mapleader = ' '

-- Create split with Space + (h or v)
vim.api.nvim_set_keymap('n', '<leader>v', ':vsp<CR><C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':sp<CR><C-w>j', { noremap = true })

-- Remap to change between splits
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

plugins = {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function() 
      vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
    end,
  },
  {
    'numToStr/Comment.nvim',
    lazy = false,
    config = {
      toggler = {
        line = '<leader>/',
      },
      opleader = {
        line = '<leader>/',
      },
    },
    init = function()
      vim.api.nvim_set_keymap('x', '<leader>/', 'gc', { noremap = true, silent = true })
    end,
  },
  {
    'karb94/neoscroll.nvim',
    lazy = false,
    config = function()
      require('neoscroll').setup()
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = true,
        },
      })
    end,
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  }
}

require("lazy").setup(plugins, opts)
