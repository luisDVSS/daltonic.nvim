--- Utilidades de color para protanomalia, protanopia-deuteranopia y deuteranomalia
local M = {}

local function clamp(value, min, max)
  if value < min then
    return min
  elseif value > max then
    return max
  end
  return value
end

--- Convierte "#rrggbb" (o "#rgb") a tres componentes 0-255.
function M.hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  if #hex == 3 then
    hex = hex:gsub("(.)", "%1%1")
  end
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

--- Convierte componentes 0-255 a "#rrggbb".
function M.rgb_to_hex(r, g, b)
  return string.format(
    "#%02x%02x%02x",
    clamp(math.floor(r + 0.5), 0, 255),
    clamp(math.floor(g + 0.5), 0, 255),
    clamp(math.floor(b + 0.5), 0, 255)
  )
end

--- Mezcla `fg` sobre `bg`. alpha = 0 devuelve `bg`, alpha = 1 devuelve `fg`.
function M.blend(fg, bg, alpha)
  local fr, fg_g, fb = M.hex_to_rgb(fg)
  local br, bg_g, bb = M.hex_to_rgb(bg)
  return M.rgb_to_hex(
    fr * alpha + br * (1 - alpha),
    fg_g * alpha + bg_g * (1 - alpha),
    fb * alpha + bb * (1 - alpha)
  )
end

--- Mezcla lineal entre `a` y `b` (t = 0 -> a, t = 1 -> b).
function M.mix(a, b, t)
  return M.blend(b, a, t)
end

function M.darken(hex, amount)
  return M.blend("#000000", hex, amount)
end

function M.lighten(hex, amount)
  return M.blend("#ffffff", hex, amount)
end

--- Luminancia relativa según WCAG 2.x.
function M.luminance(hex)
  local r, g, b = M.hex_to_rgb(hex)
  local function channel(c)
    c = c / 255
    if c <= 0.04045 then
      return c / 12.92
    end
    return ((c + 0.055) / 1.055) ^ 2.4
  end
  return 0.2126 * channel(r) + 0.7152 * channel(g) + 0.0722 * channel(b)
end

--- Ratio de contraste WCAG entre dos colores (1:1 a 21:1).
function M.contrast(fg, bg)
  local l1, l2 = M.luminance(fg), M.luminance(bg)
  if l1 < l2 then
    l1, l2 = l2, l1
  end
  return (l1 + 0.05) / (l2 + 0.05)
end

--- Distancia perceptual aproximada entre dos colores.
function M.distance(a, b)
  local ar, ag, ab = M.hex_to_rgb(a)
  local br, bg, bb = M.hex_to_rgb(b)
  local rmean = (ar + br) / 2
  local dr, dg, db = ar - br, ag - bg, ab - bb
  return math.sqrt((2 + rmean / 256) * dr * dr + 4 * dg * dg + (2 + (255 - rmean) / 256) * db * db)
end

return M
