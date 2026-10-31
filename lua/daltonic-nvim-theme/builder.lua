local util = require("daltonic-nvim-theme.util")

local Builder = {}
Builder.__index = Builder

function Builder.new(palette, opts)
  local self = setmetatable({}, Builder)
  self.p = palette
  self.o = opts
  self.groups = {}
  self._ansi = palette.terminal
  return self
end

--- Índice ANSI (0-15) más cercano a un color, para terminales sin truecolor.
function Builder:cterm(hex)
  if not hex or not self._ansi then
    return nil
  end

  local r, g, b = util.hex_to_rgb(hex)
  local spread = math.max(r, g, b) - math.min(r, g, b)

  -- Los grises se comparan solo contra los grises de la paleta ANSI: con la
  -- distancia perceptual el verde queda demasiado cerca de un gris neutro.
  local candidates = nil
  if spread <= 20 then
    candidates = { 1, 8, 9, 16 } -- índices 1-based de ANSI 0, 7, 8 y 15
  end

  local best, best_distance = 0, math.huge
  local ansi = self._ansi
  local function check(index)
    local color = ansi[index]
    if not color then
      return
    end
    local distance = util.distance(hex, color)
    if distance < best_distance then
      best, best_distance = index - 1, distance
    end
  end

  if candidates then
    for _, index in ipairs(candidates) do
      check(index)
    end
  else
    for index = 1, #ansi do
      check(index)
    end
  end

  return best
end

--- Mezcla `color` sobre el fondo del tema.
function Builder:blend(color, alpha)
  return util.blend(color, self.p.bg, alpha)
end

--- Mezcla lineal entre dos colores.
function Builder:mix(a, b, t)
  return util.mix(a, b, t)
end

--- Define un grupo. `spec` acepta las claves de nvim_set_hl o `link`.
function Builder:hl(group, spec)
  if type(spec) ~= "table" then
    return
  end
  if spec.link then
    self.groups[group] = { link = spec.link }
    return
  end
  local out = {}
  for key, value in pairs(spec) do
    if key ~= "link" then
      out[key] = value
    end
  end
  if out.fg and out.ctermfg == nil then
    out.ctermfg = self:cterm(out.fg)
  end
  if out.bg and out.ctermbg == nil then
    out.ctermbg = self:cterm(out.bg)
  end
  self.groups[group] = out
end

--- Crea un link entre grupos.
function Builder:link(from, to)
  self.groups[from] = { link = to }
end

--- Crea varios links hacia el mismo destino.
function Builder:links(froms, to)
  for _, from in ipairs(froms) do
    self:link(from, to)
  end
end

--- Aplica todos los grupos acumulados.
function Builder:apply()
  for group, spec in pairs(self.groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

return Builder
