--- Treesitter y tokens semánticos de sintaxis.
local M = {}

function M.setup(b)
  local p, o = b.p, b.o
  local function hl(group, spec)
    b:hl(group, spec)
  end

  local comment = { fg = p.fg_muted }
  if o.styles.comments.italic then
    comment.italic = true
  end

  local keyword = { fg = p.purple }
  if o.styles.keywords.italic then
    keyword.italic = true
  end

  local func = { fg = p.blue }
  if o.styles.functions.bold then
    func.bold = true
  end

  -- ── Comentarios ───────────────────────────────────────────────────────
  hl("@comment", comment)
  hl("@comment.documentation", comment)
  hl("@comment.error", { fg = p.bg, bg = p.red, bold = true })
  hl("@comment.warning", { fg = p.bg, bg = p.orange, bold = true })
  hl("@comment.todo", { fg = p.bg, bg = p.yellow, bold = true })
  hl("@comment.note", { fg = p.bg, bg = p.cyan, bold = true })

  -- ── Constantes ───────────────────────────────────────────────────────
  hl("@constant", { fg = p.orange })
  hl("@constant.builtin", { fg = p.orange })
  hl("@constant.macro", { fg = p.pink })

  -- ── Strings ──────────────────────────────────────────────────────────
  hl("@string", { fg = p.yellow })
  hl("@string.documentation", { fg = p.yellow })
  hl("@string.escape", { fg = p.pink })
  hl("@string.regexp", { fg = p.orange })
  hl("@string.special", { fg = p.green })
  hl("@string.special.symbol", { fg = p.pink })
  hl("@string.special.url", { fg = p.blue, underline = true })
  hl("@string.special.path", { fg = p.green })

  hl("@character", { fg = p.yellow })
  hl("@character.special", { fg = p.pink })
  hl("@number", { fg = p.orange })
  hl("@boolean", { fg = p.orange })
  hl("@float", { fg = p.orange })

  -- ── Variables ────────────────────────────────────────────────────────
  local variable = { fg = p.fg }
  for key, value in pairs(o.styles.variables or {}) do
    variable[key] = value
  end
  hl("@variable", variable)
  hl("@variable.builtin", { fg = p.pink, italic = true })
  hl("@variable.parameter", { fg = p.orange })
  hl("@variable.member", { fg = p.pink })

  -- ── Funciones ────────────────────────────────────────────────────────
  hl("@function", func)
  hl("@function.builtin", { fg = p.blue })
  hl("@function.call", { fg = p.blue })
  hl("@function.macro", { fg = p.pink })
  hl("@function.method", { fg = p.blue })
  hl("@function.method.call", { fg = p.blue })

  -- ── Tipos ────────────────────────────────────────────────────────────
  hl("@constructor", { fg = p.cyan })
  hl("@type", { fg = p.cyan })
  hl("@type.builtin", { fg = p.cyan, italic = true })
  hl("@type.definition", { fg = p.cyan })
  hl("@type.qualifier", keyword)

  -- ── Keywords ─────────────────────────────────────────────────────────
  hl("@keyword", keyword)
  for _, sub in ipairs({
    "conditional",
    "conditional.ternary",
    "repeat",
    "import",
    "export",
    "exception",
    "return",
    "debug",
    "directive",
    "directive.define",
    "function",
    "operator",
    "storage",
    "type",
    "coroutine",
    "modifier",
  }) do
    hl("@keyword." .. sub, keyword)
  end

  hl("@operator", { fg = p.fg })
  hl("@punctuation.delimiter", { fg = p.fg_muted })
  hl("@punctuation.bracket", { fg = p.cyan })
  hl("@punctuation.special", { fg = p.pink })
  hl("@delimiter", { fg = p.fg_muted })

  -- ── HTML / XML ───────────────────────────────────────────────────────
  hl("@tag", { fg = p.pink })
  hl("@tag.builtin", { fg = p.pink })
  hl("@tag.attribute", { fg = p.orange })
  hl("@tag.delimiter", { fg = p.fg_muted })

  -- ── Otros ────────────────────────────────────────────────────────────
  hl("@attribute", { fg = p.orange })
  hl("@property", { fg = p.pink })
  hl("@field", { fg = p.pink })
  hl("@label", { fg = p.purple })
  hl("@namespace", { fg = p.cyan })
  hl("@module", { fg = p.cyan })
  hl("@include", { fg = p.purple })
  hl("@define", { fg = p.purple })
  hl("@macro", { fg = p.pink })
  hl("@preproc", { fg = p.purple })

  -- ── Markup ───────────────────────────────────────────────────────────
  local heading = { fg = p.blue }
  for key, value in pairs(o.styles.headings or {}) do
    heading[key] = value
  end
  hl("@markup.heading", heading)
  hl("@markup.heading.1", { fg = p.red, bold = true })
  hl("@markup.heading.2", { fg = p.orange, bold = true })
  hl("@markup.heading.3", { fg = p.yellow, bold = true })
  hl("@markup.heading.4", { fg = p.green, bold = true })
  hl("@markup.heading.5", { fg = p.blue, bold = true })
  hl("@markup.heading.6", { fg = p.purple, bold = true })
  hl("@markup.italic", { italic = true })
  hl("@markup.strong", { bold = true })
  hl("@markup.strikethrough", { strikethrough = true })
  hl("@markup.underline", { underline = true })
  hl("@markup.link", { fg = p.blue })
  hl("@markup.link.url", { fg = p.blue, underline = true })
  hl("@markup.link.label", { fg = p.cyan })
  hl("@markup.raw", { fg = p.green })
  hl("@markup.raw.block", { fg = p.green })
  hl("@markup.raw.markdown_inline", { fg = p.green })
  hl("@markup.list", { fg = p.orange })
  hl("@markup.list.checked", { fg = p.green })
  hl("@markup.list.unchecked", { fg = p.fg_muted })
  hl("@markup.quote", { fg = p.fg_muted, italic = true })
  hl("@markup.math", { fg = p.cyan })
  hl("@markup.environment", { fg = p.purple })
  hl("@markup.environment.name", { fg = p.cyan })

  hl("@diff.plus", { fg = p.green })
  hl("@diff.minus", { fg = p.red })
  hl("@diff.delta", { fg = p.orange })

  -- ── Texto (alias heredados) ──────────────────────────────────────────
  hl("@text.literal", { fg = p.green })
  hl("@text.reference", { fg = p.blue })
  hl("@text.title", { fg = p.blue, bold = true })
  hl("@text.uri", { fg = p.blue, underline = true })
  hl("@text.underline", { underline = true })
  hl("@text.todo", { fg = p.bg, bg = p.yellow, bold = true })
  hl("@text.note", { fg = p.cyan })
  hl("@text.warning", { fg = p.orange })
  hl("@text.danger", { fg = p.red })
  hl("@text.diff.add", { fg = p.green })
  hl("@text.diff.delete", { fg = p.red })
  hl("@text.diff.change", { fg = p.orange })
  hl("@text.emphasis", { italic = true })
  hl("@text.strong", { bold = true })
  hl("@text.strike", { strikethrough = true })
  hl("@text.math", { fg = p.cyan })

  hl("@conceal", { fg = p.fg_muted })
end

return M
