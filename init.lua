-- Resources
-- * https://www.youtube.com/watch?v=-esgEOqwzVg
-- * https://equk.co.uk/2021/09/15/converting-neovim-config-to-lua
-- * https://benfrain.com/refactor-your-neovim-init-lua-single-file-to-modules-with-packer/

-- force vim to use utf-8 as file encoding
vim.opt.fileencoding = "utf-8"
vim.opt.relativenumber = true
vim.opt.confirm = true -- confirm exiting
vim.opt.hlsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.wildmode = "longest,list"
vim.opt.cc = "88"
vim.opt.cursorline = true
vim.opt.mouse = "a"
-- default (4000ms) sucks
vim.opt.updatetime = 100
vim.opt.signcolumn = 'yes'
vim.opt.shortmess[#vim.opt.shortmess+1] = 'c'
-- make the default copy/paste buffer the system clipboard
vim.opt.clipboard = "unnamedplus"
-- render whitespace
vim.opt.listchars = 'tab:▷ ,trail:·,extends:◣,precedes:◢,nbsp:○'
vim.opt.list = true
-- always showtabline
vim.opt.showtabline = 2
-- Add highlight on yank
vim.cmd [[
    augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
]]

require('plugins')

-- syntax coloring
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- autocmd to set ocaml indent to 2
vim.api.nvim_exec([[autocmd FileType ocaml setlocal shiftwidth=2 softtabstop=2 expandtab]], false)

-- autocmd to delete trailling whitespace
vim.api.nvim_exec([[autocmd BufWritePre * :%s/\s\+$//e]], false)

-- autocmd to set ocaml indent to 2
vim.api.nvim_exec([[autocmd FileType ocaml setlocal shiftwidth=2 softtabstop=2 expandtab]], false)
vim.api.nvim_exec([[autocmd CursorHold * silent call CocActionAsync('highlight')]], false)
vim.api.nvim_exec([[autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()]], false)

local map = vim.api.nvim_set_keymap

-- Misc
-- Using curly-brackets on mac is awful
-- https://vi.stackexchange.com/a/21425
map('n', '[', '{', {})
map('n', ']', '}', {})
map('n', '<leader>nt', ':tabnext<CR>', {noremap = true})
map('n', '<leader>pt', ':tabprevious<CR>', {noremap = true})
map('n', '<leader>|', ':vsplit<CR>', {noremap = true})
map('n', '<leader>-', ':split<CR>', {noremap = true})

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<cr>', {noremap = true})
map('n', '<leader>fg', ':Telescope live_grep<CR>', {noremap = true})
map('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true})
map('n', '<leader>fh', ':Telescope help_tags<CR>', {noremap = true})

-- Coc Settings
-- Show Documentation with K
vim.cmd [[
    function! ShowDocumentation()
      if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
      else
        call feedkeys('K', 'in')
      endif
    endfunction
]]
map('n', 'K', ':call ShowDocumentation()<CR>', {noremap = true})
-- Definition and friends
map('n', 'gd', '<Plug>(coc-definition)', {})
map('n', 'gy', '<Plug>(coc-type-definition)', {})
map('n', 'gi', '<Plug>(coc-implementation)', {})
map('n', 'gr', '<Plug>(coc-references)', {})
map('n', '<c-space>', 'coc#refresh()', {})
-- rename
map('n', '<leader>rn', '<Plug>(coc-rename)', {})

-- Add `:Format` command to format current buffer.
vim.cmd [[ command! -nargs=0 Format :call CocActionAsync('format') ]]

-- -- Mappings for CoCList
-- -- Show all diagnostics.
-- map('n', '<silent><nowait> <leader>la', ':<C-u>CocList diagnostics<cr>', {noremap = true})
-- -- Manage extensions.
-- map('n', '<silent><nowait> <leader>le', ':<C-u>CocList extensions<cr>', {noremap = true})
-- -- Show commands.
-- map('n', '<silent><nowait> <leader>lc', ':<C-u>CocList commands<cr>', {noremap = true})
-- -- Find symbol of current document.
-- map('n', '<silent><nowait> <leader>lo', ':<C-u>CocList outline<cr>', {noremap = true})
-- -- Search workspace symbols.
-- map('n', '<silent><nowait> <leader>ls', ':<C-u>CocList -I symbols<cr>', {noremap = true})
-- -- Do default action for next item.
-- map('n', '<silent><nowait> <leader>lj', ':<C-u>CocNext<CR>', {noremap = true})
-- -- Do default action for previous item.
-- map('n', '<silent><nowait> <leader>lk', ':<C-u>CocPrev<CR>', {noremap = true})
-- -- Resume latest coc list.
-- map('n', '<silent><nowait> <leader>lp', ':<C-u>CocListResume<CR>', {noremap = true})
