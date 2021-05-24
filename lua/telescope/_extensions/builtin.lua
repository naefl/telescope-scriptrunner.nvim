local actions = require'telescope.actions'
local action_set = require'telescope.actions.set'
local conf = require'telescope.config'.values
local finders = require'telescope.finders'
local pickers = require'telescope.pickers'
local previewers = require'telescope.previewers.term_previewer'
local utils = require'telescope.utils'

local M = {}

M.list = function(opts)
  opts = opts or {scriptdir = vim.loop.os_homedir() .. "/scripts/"}
  pickers.new({
    prompt_title = 'Visited directories from z',
    finder = finders.new_table{
      results = utils.get_os_command_output({"ls", opts.scriptdir}),
    },
    sorter = conf.file_sorter(opts),
    previewer = previewers.cat.new(opts),
    attach_mappings = function(buf, map)
      map('i', '<CR>', actions.file_edit)
      map('n', '<CR>', actions.file_edit)
      map('n', '<tab>', function() return action_set.edit(buf, "FloatermNew bash") end)
      map('i', '<tab>', function() return action_set.edit(buf, "FloatermNew bash") end)
      return true
    end,
  }):find()
end

return M
