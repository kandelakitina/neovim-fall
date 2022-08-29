local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.load_extension("file_browser")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
      },  
    },
  },
  extensions = {
    file_browser = {
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

vim.keymap.set('n', '<leader>o',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)

vim.keymap.set('n', '<leader>p', function()
  builtin.builtin()
end)

vim.keymap.set('n', '<leader>s', function()
  builtin.current_buffer_fuzzy_find()
end)

vim.keymap.set('n', '<leader>fr', function()
  builtin.oldfiles()
end)

vim.keymap.set('n', '<leader>h', function()
  builtin.help_tags()
end)

vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)

vim.keymap.set("n", "<leader>e", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)

vim.keymap.set('n', '<leader><space>', function()
  builtin.resume()
end)

vim.keymap.set('n', '<leader>fg', function()
  builtin.live_grep()
end)

vim.keymap.set('n', '<leader>fd', function()
  builtin.diagnostics()
end)

vim.keymap.set('n', '<leader>fc', function()
  builtin.commands()
end)

vim.keymap.set('n', '<leader>fhc', function()
  builtin.command_history()
end)

vim.keymap.set('n', '<leader>fhs', function()
  builtin.search_history()
end)

vim.keymap.set('n', '<leader>fhq', function()
  builtin.quickfixhistory()
end)

vim.keymap.set('n', '<leader>fm', function()
  builtin.marks()
end)

vim.keymap.set('n', '<leader>fq', function()
  builtin.quickfix()
end)

vim.keymap.set('n', '<leader>ft', function()
  builtin.tags()
end)

vim.keymap.set('n', '<leader>fl', function()
  builtin.loclist()
end)

vim.keymap.set('n', '<leader>fj', function()
  builtin.jumplist()
end)

vim.keymap.set('n', '<leader>fk', function()
  builtin.keymaps()
end)

vim.keymap.set('n', '<leader>ft', function()
  builtin.treesitter()
end)