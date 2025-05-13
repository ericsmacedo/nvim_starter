require "nvchad.options"

-- Vim has 3 kinds of options: global, buffer-local and window-local
local o = vim.o  	-- Global options
local wo = vim.wo	-- window-local options

-- o.wildignore = "+=*/tmp/*,*.so,*.swp,*.zip,"   -- MacOSX/Linux
o.scrolloff = 5       -- Show at least 5 lines
o.cursorlineopt ='both' -- to enable cursorline!

-- window-local options
wo.relativenumber = true	-- use relative numbers
wo.colorcolumn = "88"		  -- columnt to indicate end of 80 characters
wo.conceallevel = 0       -- Determine how text with the "conceal" syntax attribute :syn-conceal is shown
wo.foldmethod = 'marker'

-- buffer local options
o.softtabstop = 4         -- number of spaces in tab when editing.
o.tabstop = 4             -- number of spaces in tab when editing
o.expandtab = true        -- tabs are spaces
o.shiftwidth = 4          -- number of spaces used for >> and << 

-- -- To prevent errors with the Shada (shared data) file, I added the line below
-- vim.cmd[[ "set viminfo+=n~/vim/viminfo"]]
-- 
-- Specify which python environment is to be used with neovim
vim.g.loaded_python3_provider = 1
vim.g.python3_host_prog = vim.call("expand", "~/.config/nvim/env/bin/python")

-- "===================================================================
-- " CUSTOM INDENTATION
-- "===================================================================
local set_ident = function()
    vim.o.tabstop = 3          -- number of spaces in tab when editing
    vim.o.softtabstop = 3      -- number of spaces in tab when editing.
    vim.o.shiftwidth = 3       -- number of spaces used for >> and <<
    vim.o.expandtab = true     -- tabs are spaces
end

local set_yml_ident = function()
    vim.o.tabstop = 2          -- number of spaces in tab when editing
    vim.o.softtabstop = 2      -- number of spaces in tab when editing.
    vim.o.shiftwidth = 2       -- number of spaces used for >> and <<
end

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"},
                            {pattern = {"*.py", "*.sv", "*.cpp"},
                             callback = set_ident
                            })

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"},
                            {pattern = {"*.yml"},
                             callback = set_yml_ident
                            })
