--- oil.nvim
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  hl("OilDir", { fg = p.blue, bold = true })
  hl("OilDirIcon", { fg = p.blue })
  hl("OilFile", { fg = p.fg })
  hl("OilFileIcon", { fg = p.fg_muted })
  hl("OilExecutable", { fg = p.green })
  hl("OilSocket", { fg = p.pink })
  hl("OilLink", { fg = p.cyan, underline = true })
  hl("OilLinkTarget", { fg = p.fg_muted })
  hl("OilCreate", { fg = p.green })
  hl("OilDelete", { fg = p.red })
  hl("OilMove", { fg = p.orange })
  hl("OilCopy", { fg = p.cyan })
  hl("OilChange", { fg = p.purple })
  hl("OilRestore", { fg = p.yellow })
  hl("OilPermissionRead", { fg = p.green })
  hl("OilPermissionWrite", { fg = p.orange })
  hl("OilPermissionExecute", { fg = p.red })
  hl("OilHidden", { fg = p.fg_muted })
  hl("OilTruncatedHead", { fg = p.fg_muted })
  hl("OilTruncatedTail", { fg = p.fg_muted })
  hl("OilEntry", { fg = p.fg })
end

return M
