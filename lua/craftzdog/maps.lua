local keymap = vim.keymap
vim.g.mapleader = " "

keymap.set('n', 'x', '"_x')

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set('i', 'jj', '<Esc>', { noremap = true })

-- para mover asi arriba o hacia abajo cuando está en visual mode
-- apretando mayusculas J o V para mover hacia arriba o abajo
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')
keymap.set('n', 'cw', 'vb"_c')

-- Select all
-- keymap.set('n', '<leader>a', 'gg<S-v>G')


-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})
-- para borrar el coloreado en las busquedas despues de terminar la busquedas

keymap.set('n', '<F5>', ':noh<CR>', { noremap = true, silent = true })

-- New tab
keymap.set('n', 'te', ':tabedit<CR>')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
-- Buscar en los archivos (tipo grep)
keymap.set('n', '<leader>rg', ':Rg<CR>', { noremap = true, silent = true })
-- Buscar buffers abiertos
keymap.set('n', '<leader>b', ':Buffers<CR>', { noremap = true, silent = true })
-- Buscar comandos recientes
keymap.set('n', '<leader>h', ':History<CR>', { noremap = true, silent = true })
-- Abrir/cerrar terminal
vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>')
-- Enviar comandos desde modo visual
vim.keymap.set('v', '<leader>tt', ':ToggleTermSendVisualSelection<CR>')
