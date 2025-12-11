------- TERMINAL -------
-- Make terminal start in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert",
})

-- Make terminal always be in insert mode unless pressing esc
vim.api.nvim_create_autocmd({"TermOpen", "BufEnter"},{
	pattern = "term://*",
	command = "startinsert",
})

-- Make terminal switch to normal with esc key
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.cmd("startinsert")
    -- Allow <Esc> to switch to Normal mode
    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { buffer = 0 })
  end,
})


