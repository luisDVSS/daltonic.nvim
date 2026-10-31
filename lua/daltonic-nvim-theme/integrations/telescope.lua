--- telescope.nvim
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  local selection = b:blend(p.blue, 0.2)

  hl("TelescopeNormal", { fg = p.fg, bg = p.bg_float })
  hl("TelescopeBorder", { fg = p.border, bg = p.bg_float })
  hl("TelescopeTitle", { fg = p.fg, bg = p.bg_float, bold = true })

  hl("TelescopePromptNormal", { fg = p.fg, bg = p.bg_float })
  hl("TelescopePromptBorder", { fg = p.border, bg = p.bg_float })
  hl("TelescopePromptTitle", { fg = p.bg, bg = p.blue, bold = true })
  hl("TelescopePromptPrefix", { fg = p.blue, bg = p.bg_float })

  hl("TelescopeResultsTitle", { fg = p.bg, bg = p.green, bold = true })
  hl("TelescopeResultsNormal", { fg = p.fg, bg = p.bg_float })
  hl("TelescopeResultsBorder", { fg = p.border, bg = p.bg_float })
  hl("TelescopeResultsComment", { fg = p.fg_muted })
  hl("TelescopeResultsNumber", { fg = p.orange })
  hl("TelescopeResultsIdentifier", { fg = p.pink })
  hl("TelescopeResultsSpecialComment", { fg = p.fg_muted })
  hl("TelescopeResultsLineNr", { fg = p.linenr })
  hl("TelescopeResultsDiffAdd", { fg = p.green })
  hl("TelescopeResultsDiffChange", { fg = p.orange })
  hl("TelescopeResultsDiffDelete", { fg = p.red })
  hl("TelescopeResultsDiffUntracked", { fg = p.fg_muted })
  hl("TelescopeResultsClass", { fg = p.cyan })
  hl("TelescopeResultsFunction", { fg = p.blue })
  hl("TelescopeResultsMethod", { fg = p.blue })
  hl("TelescopeResultsField", { fg = p.pink })
  hl("TelescopeResultsVariable", { fg = p.fg })
  hl("TelescopeResultsModule", { fg = p.cyan })
  hl("TelescopeResultsConstant", { fg = p.orange })
  hl("TelescopeResultsOperator", { fg = p.fg })
  hl("TelescopeResultsStruct", { fg = p.cyan })

  hl("TelescopePreviewTitle", { fg = p.bg, bg = p.purple, bold = true })
  hl("TelescopePreviewNormal", { fg = p.fg, bg = p.bg_float })
  hl("TelescopePreviewBorder", { fg = p.border, bg = p.bg_float })
  hl("TelescopePreviewLine", { bg = p.cursorline })
  hl("TelescopePreviewMatch", { fg = p.green })
  hl("TelescopePreviewPipe", { fg = p.orange })
  hl("TelescopePreviewHyphen", { fg = p.fg_muted })
  hl("TelescopePreviewDirectory", { fg = p.blue })
  hl("TelescopePreviewMessage", { fg = p.fg_muted })
  hl("TelescopePreviewMessageFillchar", { fg = p.fg_muted })
  hl("TelescopePreviewDate", { fg = p.fg_muted })
  hl("TelescopePreviewSize", { fg = p.orange })
  hl("TelescopePreviewUser", { fg = p.pink })
  hl("TelescopePreviewGroup", { fg = p.cyan })
  hl("TelescopePreviewLinkTo", { fg = p.cyan })

  hl("TelescopeSelection", { fg = p.fg, bg = selection })
  hl("TelescopeSelectionCaret", { fg = p.blue, bg = selection })
  hl("TelescopeMultiSelection", { fg = p.orange })
  hl("TelescopeMultiIcon", { fg = p.orange })
  hl("TelescopeMatching", { fg = p.green, bold = true })

  hl("TelescopeResultsAppend", { fg = p.green })
  hl("TelescopeResultsNew", { fg = p.green })
  hl("TelescopeResultsModified", { fg = p.orange })
  hl("TelescopeResultsDeleted", { fg = p.red })
  hl("TelescopeResultsRenamed", { fg = p.purple })
  hl("TelescopeResultsUntracked", { fg = p.fg_muted })

  hl("TelescopeResultsOp", { fg = p.fg_muted })
  hl("TelescopeResultsID", { fg = p.cyan })

  -- ── Permisos del preview y contador del picker ───────────────────────
  hl("TelescopePromptCounter", { fg = p.fg_muted })
  hl("TelescopePreviewRead", { fg = p.green })
  hl("TelescopePreviewWrite", { fg = p.orange })
  hl("TelescopePreviewExecute", { fg = p.red })
  hl("TelescopePreviewLink", { fg = p.cyan })
  hl("TelescopePreviewSocket", { fg = p.purple })
  hl("TelescopePreviewBlock", { fg = p.yellow })
  hl("TelescopePreviewCharDev", { fg = p.yellow })
  hl("TelescopePreviewSticky", { fg = p.red, bold = true })
end

return M
