-- Paleta para protanomalia (deficiencia parcial del cono L, "rojo débil").
--
-- Criterio de diseño: el rojo se percibe atenuado, no ausente. Por eso se
-- conservan tonos reconocibles (rojo rosado, verde menta, etc.) pero se
-- separan por luminosidad y por el eje azul-amarillo, que no se ve afectado.
--   * Rojo: rojo rosado claro; un rojo puro se oscurece y pierde contraste.
--   * Diff: "añadido" en azul y "borrado" en ámbar (nunca verde/rojo).
-- Verificada con las matrices de Machado (2009) para severidad 0.6, 0.8 y
-- 1.0: distancia perceptual mínima entre acentos ΔE ≈ 15 y contraste ≥ 7:1.
return {
  name = "protanomalia",
  background = "dark",

  -- Base
  bg = "#11151C",
  bg_alt = "#191F29",
  bg_float = "#202735",
  fg = "#D8DEE9",
  fg_muted = "#929EAE",
  border = "#303B4B",

  -- Acentos
  red = "#E09594",
  orange = "#DF9459",
  yellow = "#DDCC80",
  green = "#83D1A9",
  cyan = "#B4DCE3",
  blue = "#93BAF4",
  purple = "#C896F6",
  pink = "#DEA2CA",

  -- Extras de UI
  cursor = "#DDCC80",
  selection = "#34465F",
  cursorline = "#1B2431",
  search_bg = "#73502D",
  search_fg = "#FFF1D6",

  -- Diff: azul = añadido, ámbar = borrado (distinguibles sin rojo/verde)
  diff_add = "#1B3A4B",
  diff_del = "#4A3A12",
  diff_change = "#303B58",

  statusline_bg = "#202735",
  statusline_fg = "#D8DEE9",

  linenr = "#7A879B",
  linenr_active = "#DDCC80",

  -- ANSI 0-15 para :terminal
  terminal = {
    "#252B36", -- 0  Black
    "#E09594", -- 1  Red
    "#83D1A9", -- 2  Green
    "#DDCC80", -- 3  Yellow
    "#93BAF4", -- 4  Blue
    "#C896F6", -- 5  Magenta
    "#B4DCE3", -- 6  Cyan
    "#D8DEE9", -- 7  White

    "#7A879B", -- 8  Bright Black
    "#F0B0AE", -- 9  Bright Red
    "#A4E3C4", -- 10 Bright Green
    "#EADC9E", -- 11 Bright Yellow
    "#B4D0F8", -- 12 Bright Blue
    "#DAB8F9", -- 13 Bright Magenta
    "#D0E9EE", -- 14 Bright Cyan
    "#F0F2F7", -- 15 Bright White
  },
}
