--- nvim-tree.lua
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  hl("NvimTreeNormal", { fg = p.fg, bg = p.bg_alt })
  hl("NvimTreeNormalNC", { fg = p.fg, bg = p.bg_alt })
  hl("NvimTreeWinSeparator", { fg = p.border, bg = p.bg_alt })
  hl("NvimTreeRootFolder", { fg = p.purple, bold = true })

  hl("NvimTreeFolderName", { fg = p.blue })
  hl("NvimTreeOpenedFolderName", { fg = p.blue, bold = true })
  hl("NvimTreeEmptyFolderName", { fg = p.fg_muted })
  hl("NvimTreeFolderIcon", { fg = p.blue })
  hl("NvimTreeFileIcon", { fg = p.fg_muted })
  hl("NvimTreeFileName", { fg = p.fg })
  hl("NvimTreeOpenedFile", { fg = p.green, bold = true })
  hl("NvimTreeSpecialFile", { fg = p.yellow, underline = true })
  hl("NvimTreeSymlink", { fg = p.cyan })
  hl("NvimTreeSymlinkIcon", { fg = p.cyan })
  hl("NvimTreeExecFile", { fg = p.green })
  hl("NvimTreeImageFile", { fg = p.pink })

  hl("NvimTreeIndentMarker", { fg = p.border })
  hl("NvimTreeCursorLine", { bg = p.cursorline })
  hl("NvimTreeCursorColumn", { bg = p.cursorline })
  hl("NvimTreeWindowPicker", { fg = p.bg, bg = p.blue, bold = true })
  hl("NvimTreeLiveFilterPrefix", { fg = p.orange, bold = true })
  hl("NvimTreeLiveFilterValue", { fg = p.fg })

  local git = {
    Dirty = p.orange,
    New = p.green,
    Deleted = p.red,
    Renamed = p.purple,
    Merge = p.cyan,
    Ignored = p.fg_muted,
  }

  for status, color in pairs(git) do
    hl("NvimTreeGit" .. status, { fg = color })
    hl("NvimTreeGit" .. status .. "Icon", { fg = color })
  end
end

return M
