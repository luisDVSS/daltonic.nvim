local config = require("daltonic-nvim-theme.config")
local Builder = require("daltonic-nvim-theme.builder")

local M = {}

--- El orden importa: `cmp` define los grupos que `los grupos de blink.cmp estan en cmp.lua` reutiliza.
M.integrations = {
  "treesitter",
  "lsp",
  "telescope",
  "gitsigns",
  "cmp",
  "bufferline",
  "which-key",
  "snacks",
  "oil",
  "neo-tree",
  "nvim-tree",
  "mini",
  "trouble",
  "indent-blankline",
  "lazy",
  "mason",
  "dap",
  "notify",
  "noice",
  "render-markdown",
  "alpha",
  "misc",
}

--- Configuración global (afecta a ambos temas).
function M.setup(opts)
  config.setup(opts)
  return M
end

--- Devuelve la paleta de un tema, aplicando `overrides` si existen.
function M.palette(name)
  local ok, palette = pcall(require, "daltonic-nvim-theme.palettes." .. name)
  if not ok then
    error(("[daltonic-nvim-theme] paleta desconocida: %s"):format(name))
  end
  local override = config.options.overrides and config.options.overrides[name]
  if override then
    palette = vim.tbl_extend("force", palette, override)
  end
  return palette
end

--- Carga un tema. Lo usan `colors/deuteranomalia.lua` , `colors/protanomalia.lua` y 'protanopia-deuteranopia.lua'.
function M.load(name)
  local palette = M.palette(name)

  vim.o.background = palette.background

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  local builder = Builder.new(palette, config.options)

  require("daltonic-nvim-theme.groups").setup(builder)

  for _, integration in ipairs(M.integrations) do
    local ok, module = pcall(require, "daltonic-nvim-theme.integrations." .. integration)
    if ok and type(module.setup) == "function" then
      module.setup(builder)
    else
      vim.notify(("[daltonic-nvim-theme] no se pudo cargar la integración %q"):format(integration), vim.log.levels.WARN)
    end
  end

  builder:apply()

  for index, color in ipairs(palette.terminal or {}) do
    vim.g["terminal_color_" .. (index - 1)] = color
  end

  vim.g.colors_name = palette.name
end

--- Tema de lualine a partir de una paleta.
function M.lualine(name)
  local p = M.palette(name)

  local function mode(accent)
    return {
      a = { fg = p.bg, bg = accent, gui = "bold" },
      b = { fg = p.statusline_fg, bg = p.statusline_bg },
      c = { fg = p.fg_muted, bg = p.statusline_bg },
    }
  end

  return {
    normal = mode(p.blue),
    insert = mode(p.green),
    visual = mode(p.purple),
    replace = mode(p.red),
    command = mode(p.yellow),
    terminal = mode(p.cyan),
    inactive = {
      a = { fg = p.fg_muted, bg = p.bg_alt, gui = "bold" },
      b = { fg = p.fg_muted, bg = p.bg_alt },
      c = { fg = p.linenr, bg = p.bg_alt },
    },
  }
end

return M
