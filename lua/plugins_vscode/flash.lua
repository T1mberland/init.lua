return
{
  "folke/flash.nvim",
  keys = {
    -- disable the default flash keymaps
    { "r",     mode = { "n", "x", "o" }, false },
    { "s",     mode = { "n", "x", "o" }, false },
    { "S",     mode = { "n", "x", "o" }, false },
    { "<C-s>", mode = { "n", "x", "o" }, false },

    {
      "e",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "E",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<C-e>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
