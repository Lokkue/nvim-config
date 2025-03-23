vim.g.mapleader = " "

local keymap = vim.keymap

--插入模式-- 
keymap.set("i","jk","<ESC>")

-- 视觉模式 --
keymap.set("v","J",":m '>+1<CR>gv")--单行移动
keymap.set("v","K",":m'<-2<CR>gv=gv")--多行移动


-- 正常模式---
-- 窗口操作
keymap.set("n","<leader>sv","<C-w>v")--水平新增窗口
keymap.set("n","<leader>sh","<C-w>s")--垂直新增窗口
--取消高亮
--
keymap.set("n","<leader>nh",":nohl<CR>")
---------------------------------------------------plugins-------
---telescope
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Find help tags' })
---buffer
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Prev buffer' })
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLinePick<CR>', { desc = 'Pick buffer' })
vim.keymap.set('n', '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', { desc = 'Close others' })
