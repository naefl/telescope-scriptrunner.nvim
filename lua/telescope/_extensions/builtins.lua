local actions = require'telescope.actions'
local action_set = require'telescope.actions.set'
local conf = require'telescope.config'.values
local finders = require'telescope.finders'
local pickers = require'telescope.pickers'
local previewers = require'telescope.previewers.term_previewer'
local utils = require'telescope.utils'

local M = {}

local home = os.getenv("HOME")

local function append_home(tbl, base)
    for i, _ in ipairs(tbl) do
        tbl[i] = base .. tbl[i]
    end
    return tbl
end

M.list = function(opts)
  if #opts == 0 then
      opts = {scriptdir = home .. "/scripts/"}
  end
  pickers.new({
    prompt_title = 'Available scripts',
    finder = finders.new_table{
      results = append_home(utils.get_os_command_output({"ls", "-t", opts.scriptdir}), opts.scriptdir),
    },
    sorter = conf.file_sorter(opts),
    previewer = conf.file_previewer(opts),
    attach_mappings = function(buf, map)
      map('i', '<CR>', actions.file_edit)
      map('n', '<CR>', actions.file_edit)
      map('n', '<tab>', function() return action_set.edit(buf, "FloatermNew bash ") end)
      map('i', '<tab>', function() return action_set.edit(buf, "FloatermNew bash ") end)
      return true
    end,
  }):find()
end

return M

--results = append_home(utils.get_os_command_output({"ls", "tr", opts.scriptdir}), opts.scriptdir)
