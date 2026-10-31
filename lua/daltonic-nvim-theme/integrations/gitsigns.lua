--- gitsigns.nvim
local M = {}

function M.setup(b)
  local p = b.p
  local g = b.git
  local function hl(group, spec)
    b:hl(group, spec)
  end

  local signs = {
    Add = { fg = g.add, bg = p.diff_add },
    Change = { fg = g.change, bg = p.diff_change },
    Delete = { fg = g.delete, bg = p.diff_del },
    Topdelete = { fg = g.delete, bg = p.diff_del },
    Changedelete = { fg = g.change, bg = p.diff_change },
    Untracked = { fg = p.fg_muted, bg = p.bg },
  }

  for name, colors in pairs(signs) do
    hl("GitSigns" .. name, { fg = colors.fg, bg = p.bg })
    hl("GitSigns" .. name .. "Nr", { fg = colors.fg, bg = p.bg })
    hl("GitSigns" .. name .. "Ln", { bg = colors.bg })
    hl("GitSigns" .. name .. "Inline", { bg = colors.bg })
    hl("GitSigns" .. name .. "Cul", { bg = b:blend(colors.fg, 0.12) })
  end

  -- Cambios ya preparados (staged): mismos colores, atenuados.
  for name, colors in pairs(signs) do
    local fg = b:blend(colors.fg, 0.6)
    hl("GitSignsStaged" .. name, { fg = fg, bg = p.bg })
    hl("GitSignsStaged" .. name .. "Nr", { fg = fg, bg = p.bg })
    hl("GitSignsStaged" .. name .. "Ln", { bg = b:blend(colors.fg, 0.15) })
    hl("GitSignsStaged" .. name .. "Cul", { bg = b:blend(colors.fg, 0.08) })
  end

  hl("GitSignsCurrentLineBlame", { fg = b:blend(p.fg_muted, 0.7), italic = true })
  hl("GitSignsAddPreview", { fg = p.fg, bg = p.diff_add })
  hl("GitSignsDeletePreview", { fg = p.fg, bg = p.diff_del })
  hl("GitSignsAddInline", { bg = b:blend(g.add, 0.3) })
  hl("GitSignsChangeInline", { bg = b:blend(g.change, 0.3) })
  hl("GitSignsDeleteInline", { bg = b:blend(g.delete, 0.3) })

  -- Word-diff y previews de líneas borradas.
  hl("GitSignsAddLnInline", { bg = b:blend(g.add, 0.3) })
  hl("GitSignsChangeLnInline", { bg = b:blend(g.change, 0.3) })
  hl("GitSignsDeleteLnInline", { bg = b:blend(g.delete, 0.3) })
  hl("GitSignsAddVirtLnInline", { bg = b:blend(g.add, 0.3) })
  hl("GitSignsChangeVirtLnInline", { bg = b:blend(g.change, 0.3) })
  hl("GitSignsDeleteVirtLnInline", { bg = b:blend(g.delete, 0.3) })
  hl("GitSignsAddLnVirtLn", { bg = p.diff_add })
  hl("GitSignsAddLnVirtLnInLine", { bg = b:blend(g.add, 0.3) })
  hl("GitSignsChangeVirtLn", { bg = p.diff_change })
  hl("GitSignsChangeVirtLnInLine", { bg = b:blend(g.change, 0.3) })
  hl("GitSignsDeleteVirtLn", { bg = p.diff_del })
  hl("GitSignsDeleteVirtLnInLine", { bg = b:blend(g.delete, 0.3) })
  hl("GitSignsVirtLnum", { fg = p.fg_muted, bg = p.diff_del })
  hl("GitSignsDiffStaged", { fg = b:blend(p.fg, 0.8) })
  hl("GitSignsNoEOLPreview", { fg = p.orange })
end

return M
