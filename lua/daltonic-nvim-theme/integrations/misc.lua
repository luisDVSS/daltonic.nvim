--- Integraciones menores: flash, treesitter-context, navic, illuminate,
--- rainbow-delimiters y todo-comments.
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  -- ── flash.nvim ────────────────────────────────────────────────────────
  hl("FlashBackdrop", { fg = p.fg_muted })
  hl("FlashLabel", { fg = p.bg, bg = p.red, bold = true })
  hl("FlashMatch", { fg = p.fg, bg = b:blend(p.blue, 0.25) })
  hl("FlashCurrent", { fg = p.fg, bg = p.selection })
  hl("FlashCursor", { fg = p.bg, bg = p.blue })

  -- ── nvim-treesitter-context ───────────────────────────────────────────
  hl("TreesitterContext", { bg = p.bg_alt })
  hl("TreesitterContextLineNumber", { fg = p.linenr, bg = p.bg_alt })
  hl("TreesitterContextBottom", { sp = p.border, underline = true })
  hl("TreesitterContextSeparator", { fg = p.border })

  -- ── nvim-navic ────────────────────────────────────────────────────────
  hl("NavicText", { fg = p.fg })
  hl("NavicSeparator", { fg = p.fg_muted })

  -- ── vim-illuminate ────────────────────────────────────────────────────
  hl("IlluminatedWordText", { bg = b:blend(p.blue, 0.15) })
  hl("IlluminatedWordRead", { bg = b:blend(p.blue, 0.15) })
  hl("IlluminatedWordWrite", { bg = b:blend(p.orange, 0.15) })

  -- ── rainbow-delimiters ────────────────────────────────────────────────
  hl("RainbowDelimiterRed", { fg = p.red })
  hl("RainbowDelimiterYellow", { fg = p.yellow })
  hl("RainbowDelimiterBlue", { fg = p.blue })
  hl("RainbowDelimiterOrange", { fg = p.orange })
  hl("RainbowDelimiterGreen", { fg = p.green })
  hl("RainbowDelimiterViolet", { fg = p.purple })
  hl("RainbowDelimiterCyan", { fg = p.cyan })

  -- ── todo-comments.nvim ────────────────────────────────────────────────
  hl("TodoBgTODO", { fg = p.bg, bg = p.blue, bold = true })
  hl("TodoFgTODO", { fg = p.blue })
  hl("TodoSignTODO", { fg = p.blue })
  hl("TodoBgFIX", { fg = p.bg, bg = p.red, bold = true })
  hl("TodoFgFIX", { fg = p.red })
  hl("TodoSignFIX", { fg = p.red })
  hl("TodoBgHACK", { fg = p.bg, bg = p.orange, bold = true })
  hl("TodoFgHACK", { fg = p.orange })
  hl("TodoSignHACK", { fg = p.orange })
  hl("TodoBgWARN", { fg = p.bg, bg = p.yellow, bold = true })
  hl("TodoFgWARN", { fg = p.yellow })
  hl("TodoSignWARN", { fg = p.yellow })
  hl("TodoBgPERF", { fg = p.bg, bg = p.purple, bold = true })
  hl("TodoFgPERF", { fg = p.purple })
  hl("TodoSignPERF", { fg = p.purple })
  hl("TodoBgNOTE", { fg = p.bg, bg = p.cyan, bold = true })
  hl("TodoFgNOTE", { fg = p.cyan })
  hl("TodoSignNOTE", { fg = p.cyan })
  hl("TodoBgTEST", { fg = p.bg, bg = p.green, bold = true })
  hl("TodoFgTEST", { fg = p.green })
  hl("TodoSignTEST", { fg = p.green })
end

return M
