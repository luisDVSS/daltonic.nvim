--- LSP: diagnósticos, referencias y tokens semánticos.
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  local diagnostics = {
    Error = p.red,
    Warn = p.orange,
    Info = p.cyan,
    Hint = p.blue,
    Ok = p.green,
  }

  for kind, color in pairs(diagnostics) do
    hl("Diagnostic" .. kind, { fg = color })
    hl("DiagnosticSign" .. kind, { fg = color })
    hl("DiagnosticVirtualText" .. kind, { fg = color, bg = b:blend(color, 0.12) })
    hl("DiagnosticFloating" .. kind, { fg = color, bg = p.bg_float })
    hl("DiagnosticUnderline" .. kind, { sp = color, undercurl = true })
  end

  hl("DiagnosticDeprecated", { fg = p.fg_muted, strikethrough = true })
  hl("DiagnosticUnnecessary", { fg = p.fg_muted })
  hl("DiagnosticVirtualLines", { fg = p.fg_muted })
  hl("DiagnosticVirtualLinesCurrent", { fg = p.fg })
  hl("DiagnosticVirtualLinesError", { fg = p.red })
  hl("DiagnosticVirtualLinesWarn", { fg = p.orange })
  hl("DiagnosticVirtualLinesInfo", { fg = p.cyan })
  hl("DiagnosticVirtualLinesHint", { fg = p.blue })
  hl("DiagnosticVirtualLinesOk", { fg = p.green })
  hl("DiagnosticVirtualLinesCurrentError", { fg = p.red })
  hl("DiagnosticVirtualLinesCurrentWarn", { fg = p.orange })

  hl("LspReferenceText", { bg = b:blend(p.blue, 0.15) })
  hl("LspReferenceRead", { bg = b:blend(p.blue, 0.15) })
  hl("LspReferenceWrite", { bg = b:blend(p.orange, 0.18) })
  hl("LspSignatureActiveParameter", { fg = p.orange, bold = true })
  hl("LspCodeLens", { fg = p.fg_muted })
  hl("LspCodeLensSeparator", { fg = p.border })
  hl("LspInlayHint", { fg = p.fg_muted, bg = p.bg_alt })

  -- Tokens semánticos: reutilizan los grupos de Treesitter.
  local map = {
    class = "@type",
    enum = "@type",
    enumMember = "@constant",
    ["function"] = "@function",
    interface = "@type",
    keyword = "@keyword",
    method = "@function.method",
    namespace = "@module",
    number = "@number",
    operator = "@operator",
    parameter = "@variable.parameter",
    property = "@property",
    struct = "@type",
    type = "@type",
    typeParameter = "@typeParameter",
    variable = "@variable",
    macro = "@macro",
    modifier = "@keyword",
    comment = "@comment",
    decorator = "@attribute",
    regexp = "@string.regexp",
    event = "@constant",
  }

  for token, target in pairs(map) do
    b:link("@lsp.type." .. token, target)
  end

  local modifiers = {
    declaration = {},
    definition = {},
    readonly = { italic = true },
    ["static"] = { italic = true },
    deprecated = { strikethrough = true },
    abstract = { italic = true },
    async = { italic = true },
    modification = {},
    documentation = {},
    defaultLibrary = { bold = true },
  }

  for modifier, spec in pairs(modifiers) do
    hl("@lsp.mod." .. modifier, spec)
  end

  hl("@lsp.typemod.variable.readonly", { italic = true })
  hl("@lsp.typemod.property.readonly", { italic = true })
  hl("@lsp.typemod.parameter.readonly", { italic = true })
end

return M
