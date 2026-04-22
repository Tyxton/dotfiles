return {
  {
    "oncomouse/lushwal.nvim",
    cmd = { "LushwalCompile" },
    dependencies = {
        { "rktjmp/lush.nvim" },
        { "rktjmp/shipwright.nvim" },
    },
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd("colorscheme lushwal")
    
        require("lushwal").add_reload_hook({
        vim.cmd("LushwalCompile"),
        })
    end,
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },

    {
        "echasnovski/mini.nvim",
        config = function()
        require("mini.ai").setup()
        require("mini.surround").setup()
        require("mini.comment").setup()
        require("mini.icons").setup()
        require("mini.animate").setup()

        local statusline = require("mini.statusline")
        statusline.setup({
            content = {
            active = function()
                local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
                local git           = statusline.section_git({ trunc_width = 75 })
                local diagnostics   = statusline.section_diagnostics({ trunc_width = 75 })
                local filename      = statusline.section_filename({ trunc_width = 140 })
                local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
                local location      = statusline.section_location({ trunc_width = 75 })

                local lsp_active = function()
                    local clients = vim.lsp.get_clients({ bufnr = 0 })
                    if #clients == 0 then return "󰂭 OFFLINE" end
                    return "󰒄 " .. clients[1].name
                end

                return statusline.combine_groups({
                { hl = mode_hl,                  strings = { mode } },
                { hl = 'MiniStatuslineDevinfo',  strings = { git, diagnostics } },
                "%<",
                { hl = 'MiniStatuslineFilename', strings = { filename } },
                "%=", 
                { hl = 'MiniStatuslineDevinfo',  strings = { lsp_active() } },
                { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                { hl = mode_hl,                  strings = { location } },
                })
            end
           }
        })
     end,
   },

  {
    "stevearc/oil.nvim",
    opts = { columns = { "icon" }, view_options = { show_hidden = true } },
    keys = { { "-", "<CMD>Oil<CR>", desc = "Open parent directory" } },
  },

  { "lewis6991/gitsigns.nvim", opts = {} },
}
