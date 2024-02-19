if vim.g.vscode then
  -- VS Code config
  -- Keybinds
  vim.g.mapleader = " "

  -- Tab navigation
  vim.keymap.set("n", "H", ":tabprevious<CR>", {remap = true})
  vim.keymap.set("n", "L", ":tabnext<CR>", {remap = true})

  -- Comment line
  vim.keymap.set("n", "gc", "<Cmd>call VSCodeNotify('editor.action.commentLine')<CR>")
  vim.keymap.set("v", "gc", "<Cmd>call VSCodeNotify('editor.action.commentLine')<CR>")

  -- Open global search
  -- vim.keymap.set("n", "<leader>/", "<Cmd>call VSCodeNotify('workbench.view.search')<CR>")

  -- Open fuzzy file picker
  -- vim.keymap.set("n", "<leader>f", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")

  -- Open file picker
  -- vim.keymap.set("n", "<leader>e", "<Cmd>call VSCodeNotify('workbench.view.explorer')<CR>")

  -- Find and replace
  -- vim.keymap.set("n", "<leader>r", "<Cmd>call VSCodeNotify('actions.find')<CR>")

  print("Loaded vscode neovim")
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
end
