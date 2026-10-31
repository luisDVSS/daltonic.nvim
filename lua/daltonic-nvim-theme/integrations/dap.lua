--- nvim-dap y nvim-dap-ui
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  hl("DapBreakpoint", { fg = p.red })
  hl("DapBreakpointCondition", { fg = p.orange })
  hl("DapBreakpointRejected", { fg = p.fg_muted })
  hl("DapLogPoint", { fg = p.cyan })
  hl("DapStopped", { fg = p.yellow, bold = true })

  hl("DapUIBreakpointsCurrentLine", { fg = p.yellow, bold = true })
  hl("DapUIBreakpointsDisabledLine", { fg = p.fg_muted })
  hl("DapUIBreakpointsInfo", { fg = p.cyan })
  hl("DapUIBreakpointsPath", { fg = p.blue })
  hl("DapUIFrameName", { fg = p.fg })
  hl("DapUIScope", { fg = p.cyan })
  hl("DapUIType", { fg = p.purple })
  hl("DapUIDecoration", { fg = p.border })
  hl("DapUIVariable", { fg = p.fg })
  hl("DapUIValue", { fg = p.yellow })
  hl("DapUIModifiedValue", { fg = p.orange, bold = true })
  hl("DapUIPlayPause", { fg = p.green })
  hl("DapUIRestart", { fg = p.green })
  hl("DapUIStop", { fg = p.red })
  hl("DapUIUnavailable", { fg = p.fg_muted })
  hl("DapUISource", { fg = p.purple })
  hl("DapUILineNumber", { fg = p.fg_muted })
  hl("DapUIWatchesEmpty", { fg = p.fg_muted })
  hl("DapUIWatchesError", { fg = p.red })
  hl("DapUIWatchesValue", { fg = p.yellow })
  hl("DapUIStoppedThread", { fg = p.purple })
  hl("DapUIThread", { fg = p.green })
  hl("DapUIThreadAlt", { fg = p.fg_muted })
end

return M
