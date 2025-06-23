
vim.keymap.set('n', '<C-_>', '<Plug>(comment_toggle_linewise_current)')
vim.keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)')
vim.keymap.set('n', '<F5>', function()
  require('dap').continue()
end, { desc = 'Start/Continue Debugging' })
vim.keymap.set('n', '<F10>', function()
  require('dap').step_over()
end, { desc = 'Step Over' })
vim.keymap.set('n', '<F11>', function()
  require('dap').step_into()
end, { desc = 'Step Into' })
vim.keymap.set('n', '<F12>', function()
  require('dap').step_out()
end, { desc = 'Step Out' })
vim.keymap.set('n', '<Leader>b', function()
  require('dap').toggle_breakpoint()
end, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<Leader>dr', function()
  require('dap').repl.open()
end, { desc = 'Open REPL' })
vim.keymap.set('n', '<Leader>dl', function()
  require('dap').run_last()
end, { desc = 'Run Last' })

-- -- Delete previous word with Ctrl + Backspace
-- vim.api.nvim_set_keymap('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })
--
-- -- Delete next word with Ctrl + Delete
-- vim.api.nvim_set_keymap('i', '<C-Del>', '<Esc>diw', { noremap = true, silent = true })

function CompileAndRun()
  -- Get the current file and its extension
  local file = vim.fn.expand '%'
  local file_extension = vim.fn.expand '%:e'
  local output = vim.fn.getcwd() .. '/a.out' -- Default output for compiled languages

  -- Define commands based on file type
  local cmd
  if file_extension == 'c' then
    cmd = string.format('clang %s -o %s && %s', file, output, output)
  elseif file_extension == 'cpp' then
    cmd = string.format('clang++ %s -o %s && %s', file, output, output)
  elseif file_extension == 'py' then
    cmd = string.format('python3 %s', file)
  else
    print 'Unsupported file type!'
    return
  end

  -- Run the command in a terminal split
  vim.cmd('botright split | resize 10 | term ' .. cmd)
end

-- function CompileAndRun()
--   -- Get the current file and set the output path
--   local file = vim.fn.expand('%')
--   local output = vim.fn.getcwd() .. '/a.out' -- Output executable

--   -- Compile the file
--   local compile_cmd = string.format("clang %s -o %s", file, output)
--   vim.fn.jobstart(compile_cmd, {
--       on_exit = function(_, exit_code)
--           if exit_code == 0 then
--               -- Open a terminal split to show the output if compilation is successful
--               vim.cmd("botright split | resize 10 | term " .. output)
--           else
--               print("Compilation failed!")
--           end
--       end,
--       on_stderr = function(_, data)
--           print(table.concat(data, "\n"))
--       end
--   })
-- end

vim.keymap.set('n', '<F6>', CompileAndRun, { noremap = true, silent = true, desc = 'Compile and Run' })

-- Global indentation settings
vim.o.tabstop = 4 -- Number of spaces a tab counts for
vim.o.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
-- vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.expandtab = false-- Use spaces instead of tabs

-- File type specific settings
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    -- vim.bo.expandtab = true
  end,
})

-- File type specific settings
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'py' },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    -- vim.bo.expandtab = true
  end,
})

-- For markdown preview
vim.api.nvim_set_keymap('n', '<leader>mp', ':terminal env GIT_CONFIG_NOSYSTEM=1 mdless %<CR>', { noremap = true, silent = true })
--
vim.api.nvim_set_keymap('n', '<leader>ar', ':!as % -o %<.o && ld %<.o -o %< && ./%<<CR>', { noremap = true, silent = true })

-- " Custom fold settings for assembly
-- autocmd FileType asm setlocal foldmethod=indent foldlevel=1
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'asm',
  callback = function()
    vim.opt_local.foldmethod = 'indent'
    vim.opt_local.foldlevel = 1
  end,
})

-- # nvim-dap* plugin configuration is yet to be done



vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

