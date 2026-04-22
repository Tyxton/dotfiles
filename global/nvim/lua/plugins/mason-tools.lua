return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Formatters
        "prettier",
        "shfmt",
        
        -- Linters
        "shellcheck",
        "ruff",

        -- DAPs 
        "debugpy",
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 3000,
    },
  },
}
