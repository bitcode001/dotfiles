local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  print(" telescope not found! ")
  return
end

local telescope_actions, actions = pcall(require, "telescope.actions")
if not telescope_actions then
  print(" telescope.actions not found! ")
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quick fix list
      }
    }
  }
})

telescope.load_extension("fzf")
