local status, matchup = pcall(require, "vim-matchup")
if (not status) then return end

require'vim-matchup'.setup {
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    -- [options]
  },
}
