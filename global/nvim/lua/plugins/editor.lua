return {
  { "chrishrb/gx.nvim", keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } }, opts = {} },
  {
    "gbprod/substitute.nvim",
    opts = {},
    keys = {
      { "s", function() require("substitute").operator() end, desc = "Substitute" },
      { "ss", function() require("substitute").line() end, desc = "Substitute line" },
    },
  },
}
