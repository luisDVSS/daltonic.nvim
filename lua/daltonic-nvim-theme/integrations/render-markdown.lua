--- render-markdown.nvim
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  -- ── Encabezados ───────────────────────────────────────────────────────
  local headings = {
    { p.red, 0.16 },
    { p.orange, 0.14 },
    { p.yellow, 0.13 },
    { p.green, 0.12 },
    { p.blue, 0.12 },
    { p.purple, 0.12 },
  }

  for level, entry in ipairs(headings) do
    local color, alpha = entry[1], entry[2]
    hl("RenderMarkdownH" .. level, { fg = color, bold = true })
    hl("RenderMarkdownH" .. level .. "Bg", { bg = b:blend(color, alpha) })
  end

  -- ── Bloques de código ─────────────────────────────────────────────────
  hl("RenderMarkdownCode", { bg = p.bg_alt })
  hl("RenderMarkdownCodeBorder", { fg = p.border, bg = p.bg_alt })
  hl("RenderMarkdownCodeFallback", { fg = p.fg, bg = p.bg_alt })
  hl("RenderMarkdownCodeInfo", { fg = p.fg_muted, bg = p.bg_alt })
  hl("RenderMarkdownCodeInline", { fg = p.green, bg = p.bg_alt })
  hl("RenderMarkdownPadding", { bg = p.bg_alt })
  hl("RenderMarkdownInlineHighlight", { fg = p.yellow, bg = b:blend(p.yellow, 0.15) })

  -- ── Citas ─────────────────────────────────────────────────────────────
  hl("RenderMarkdownQuote", { fg = p.fg_muted, italic = true })
  for level = 1, 6 do
    hl("RenderMarkdownQuote" .. level, { fg = p.fg_muted, italic = true })
  end

  -- ── Listas, checkboxes y tablas ───────────────────────────────────────
  hl("RenderMarkdownBullet", { fg = p.blue })
  hl("RenderMarkdownDash", { fg = p.linenr })
  hl("RenderMarkdownSign", { fg = p.fg_muted, bg = p.bg })
  hl("RenderMarkdownIndent", { fg = b:blend(p.border, 0.4) })
  hl("RenderMarkdownUnchecked", { fg = p.fg_muted })
  hl("RenderMarkdownChecked", { fg = p.green })
  hl("RenderMarkdownTodo", { fg = p.yellow, bold = true })
  hl("RenderMarkdownTableHead", { fg = p.blue, bold = true })
  hl("RenderMarkdownTableRow", { fg = p.fg })

  -- ── Enlaces y matemáticas ─────────────────────────────────────────────
  hl("RenderMarkdownLink", { fg = p.cyan })
  hl("RenderMarkdownLinkTitle", { fg = p.fg_muted })
  hl("RenderMarkdownWikiLink", { fg = p.blue, underline = true })
  hl("RenderMarkdownMath", { fg = p.purple })
  hl("RenderMarkdownHtmlComment", { fg = p.fg_muted, italic = true })

  -- ── Callouts ──────────────────────────────────────────────────────────
  hl("RenderMarkdownSuccess", { fg = p.green })
  hl("RenderMarkdownInfo", { fg = p.cyan })
  hl("RenderMarkdownHint", { fg = p.blue })
  hl("RenderMarkdownWarn", { fg = p.orange })
  hl("RenderMarkdownError", { fg = p.red })
end

return M
