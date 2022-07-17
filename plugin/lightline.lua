
-- LightlineFilename
-- https://github.com/itchyny/lightline.vim/issues/293
vim.api.nvim_exec([[
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
]], false)

-- lightline config
vim.g.lightline = {
    colorscheme = 'gruvbox_material';
    active = {
        left = {
            {'mode', 'paste'},
            {'gitbranch', 'readonly', 'gitfilename', 'modified'}
        };
        right = {{
            'linter_checking',
            'linter_infos',
            'linter_warnings',
            'linter_errors',
            'linter_ok'
        }, {'lineinfo'}, {'percent'}, {'fileformat', 'fileencoding', 'filetype' }}
    };
    tabline = {
        left = {
            {'tabs'}
        };
        right = {
            {'close'}
        };
    };
    tab = {
        active = {'tabnum', 'filename', 'modified'};
        inactive = {'tabnum', 'filename', 'modified'};
    };
    component_function = {
        gitbranch = 'FugitiveHead'; -- requires tpope/vim-fugitive
        gitfilename = 'LightlineFilename'; -- requires tpope/vim-fugitive
    };
    component_expand = {
        linter_checking = 'lightline#ale#checking';
        linter_infos = 'lightline#ale#infos';
        linter_warnings = 'lightline#ale#warnings';
        linter_errors = 'lightline#ale#errors';
        linter_ok = 'lightline#ale#ok';
    };
    component_type = {
        linter_checking = 'right';
        linter_infos = 'right';
        linter_warnings = 'warning';
        linter_errors = 'error';
        linter_ok = 'right';
    }
}

