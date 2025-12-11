--local builtin = require('telescope.builtin')

--vim.keymap.set('n', '<c-p>', builtin.find_files, {})
--vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
--vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})


local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', function() builtin.find_files() end, {})
vim.keymap.set('n', '<Space><Space>', function() builtin.oldfiles() end, {})
vim.keymap.set('n', '<Space>fg', function() builtin.live_grep() end, {})
vim.keymap.set('n', '<Space>fh', function() builtin.help_tags() end, {})

