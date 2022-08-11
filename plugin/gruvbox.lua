vim.opt.background = "dark"

if vim.opt.termguicolors then
    vim.opt.termguicolors = true
end

vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_foreground = 'original'
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_ui_contrast = 'high'
vim.g.gruvbox_material_statusline_style = 'original'
vim.cmd('colorscheme gruvbox-material')
