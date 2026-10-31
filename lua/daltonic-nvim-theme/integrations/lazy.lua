--- lazy.nvim
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  hl("LazyNormal", { fg = p.fg, bg = p.bg_float })
  hl("LazyButton", { fg = p.fg, bg = p.bg_alt })
  hl("LazyButtonActive", { fg = p.bg, bg = p.blue, bold = true })
  hl("LazyComment", { fg = p.fg_muted })
  hl("LazyCommit", { fg = p.purple })
  hl("LazyCommitIssue", { fg = p.pink })
  hl("LazyDimmed", { fg = p.fg_muted })
  hl("LazyDir", { fg = p.blue })
  hl("LazyH1", { fg = p.bg, bg = p.blue, bold = true })
  hl("LazyH2", { fg = p.purple, bold = true })
  hl("LazyLocal", { fg = p.orange })
  hl("LazyNoCond", { fg = p.red })
  hl("LazyProgressDone", { fg = p.green })
  hl("LazyProgressTodo", { fg = p.border })
  hl("LazyProp", { fg = p.cyan })
  hl("LazySpecial", { fg = p.pink })
  hl("LazyUrl", { fg = p.blue, underline = true })
  hl("LazyValue", { fg = p.yellow })

  local reasons = {
    Cmd = p.green,
    Event = p.orange,
    Ft = p.cyan,
    Import = p.purple,
    Keys = p.pink,
    Lazy = p.blue,
    Load = p.yellow,
    Plugin = p.purple,
    Runtime = p.orange,
    Source = p.cyan,
    Start = p.green,
  }

  for reason, color in pairs(reasons) do
    hl("LazyReason" .. reason, { fg = color })
  end
end

return M
