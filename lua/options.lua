require "nvchad.options"

vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.lazyredraw = true

vim.opt.display:append('lastline')
vim.opt.encoding = 'utf-8'
vim.opt.linebreak = true
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 5
vim.opt.wrap = true

vim.opt.ruler = true
-- vim.opt.wildmenu = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.title = true
vim.opt.timeoutlen = 0
vim.opt.autochdir = true

vim.opt.clipboard = 'unnamedplus'
vim.opt.history = 1000
vim.opt.termguicolors = true

-- Neovide settings
vim.g.neovide_scale_factor = 0.90
function ChangeScaleFactor(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

vim.api.nvim_set_keymap('n', '<C-=>', '<cmd>lua ChangeScaleFactor(1.25)<CR>', { noremap = true, expr = false })
vim.api.nvim_set_keymap('n', '<C-->', '<cmd>lua ChangeScaleFactor(1/1.25)<CR>', { noremap = true, expr = false })

vim.opt.guifont = 'JetBrainsMono Nerd Font Mono:h14'

-- just cmp things
local cmp = require'cmp'

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
cmp.setup({
  -- other settings
  sources = {
    -- other sources
    {
      name = "dictionary",
      keyword_length = 2,
    },
  }
})
vim.keymap.set('c', '<Tab>', '<C-z>', { silent = false })
