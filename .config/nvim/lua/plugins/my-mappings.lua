return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- normal‑mode block
        n = {
          ["<leader>ss"] = { ":'<,'>sort<CR>", desc = "Sort visual selection" },
        },
        -- visual‑mode block
        v = {
          ["<leader>ss"] = { ":sort<CR>", desc = "Sort selection A→Z" },
        },
      },
    },
  },
}
