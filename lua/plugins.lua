local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- NVim Lua optimizations
    use 'lewis6991/impatient.nvim'

    -- fuzzy finder file browser
    use {
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.0',
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope-ui-select.nvim',
                'telescope-fzf-native.nvim',
            },
            config = function ()
                require('telescope').setup {
                    defaults = {
                        file_ignore_patterns = {".git", "target"}
                    }
                }
            end
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make',
        },
    }

    -- while neovim has builtin lsp support
    -- coc just makes everything easier to use
    use {
        'neoclide/coc.nvim',
        branch='release'
    }

    -- treesitter provides decent syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "rust", "python", "lua" },
                sync_install = false,
                highlight = {enable = true}
            }
        end
    }

    -- git
    use {
        {
            'tpope/vim-fugitive',
            requires = {
                'junegunn/fzf',
                'junegunn/fzf.vim',
            }
        },
        'mhinz/vim-signify'
    }

    -- syntax checking hacks
    use 'dense-analysis/ale'

    -- status line
    use {
        'itchyny/lightline.vim',
        {
            'maximbaz/lightline-ale',
            requires = {
                'itchyny/lightline.vim',
                'dense-analysis/ale'
            }
        }
    }

    use 'mbbill/undotree'

    -- rust support, even though i dont know how helpful this one is
    use 'rust-lang/rust.vim'

    -- surround things
    use 'machakann/vim-sandwich'

    -- comment things
    use {
        'numToStr/Comment.nvim',
        config = function()
          require('Comment').setup()
        end,
    }

    -- formatter
    use 'sbdchd/neoformat'

    -- themes
    use 'sainnhe/gruvbox-material'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
