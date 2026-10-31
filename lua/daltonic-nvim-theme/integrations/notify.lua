--- nvim-notify y fidget.nvim
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  -- ── nvim-notify ───────────────────────────────────────────────────────
  local levels = {
    ERROR = p.red,
    WARN = p.orange,
    INFO = p.cyan,
    DEBUG = p.purple,
    TRACE = p.fg_muted,
  }

  for level, color in pairs(levels) do
    hl("Notify" .. level .. "Border", { fg = color, bg = p.bg_float })
    hl("Notify" .. level .. "Icon", { fg = color })
    hl("Notify" .. level .. "Title", { fg = color, bold = true })
    hl("Notify" .. level .. "Body", { fg = p.fg, bg = p.bg_float })
  end

  hl("NotifyBackground", { bg = p.bg_float })

  -- ── fidget.nvim ───────────────────────────────────────────────────────
  hl("FidgetTitle", { fg = p.blue, bold = true })
  hl("FidgetTask", { fg = p.fg_muted })
end

return M
