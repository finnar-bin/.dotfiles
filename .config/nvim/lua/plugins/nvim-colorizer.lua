return {
  "norcalli/nvim-colorizer.lua",
  opts = function()
    return {
      "*",
      javascript = {
        css = true,
      },
      typescript = {
        css = true,
      },
      css = {
        css = true,
      },
      html = {
        css = true,
      },
    }
  end,
}
