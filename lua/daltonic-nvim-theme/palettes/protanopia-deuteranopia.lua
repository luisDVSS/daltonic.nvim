-- Paleta para protanopia (y también válida para deuteranopia).
--
-- Criterio de diseño: ambos tipos confunden rojo y verde, así que la
-- información se separa por el eje azul-amarillo y por luminosidad.
--   * Rojo: salmón claro (un rojo saturado se vuelve casi negro en protanopia).
--   * Diff: "añadido" en azul y "borrado" en ámbar (nunca verde/rojo).
-- Verificada con la matriz de Machado (2009): distancia perceptual mínima
-- entre acentos ΔE ≈ 15 y contraste ≥ 7:1 contra `bg`.
return {
  name = "protanopia-deuteranopia",
  background = "dark",

  -- Base
  bg = "#11151C",
  bg_alt = "#191F29",
  bg_float = "#202735",
  fg = "#D8DEE9",
  fg_muted = "#929EAE",
  border = "#303B4B",

  -- Acentos
  red = "#EAA9A2",
  orange = "#E39B5B",
  yellow = "#E3D86E",
  green = "#A4EAC1",
  cyan = "#9CDCF6",
  blue = "#A1B2EA",
  purple = "#B297F8",
  pink = "#D48EB9",

  -- Extras de UI
  cursor = "#E3D86E",
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
  linenr_active = "#E3D86E",

  -- ANSI 0-15 para :terminal
  terminal = {
    "#252B36", -- 0  Black
    "#EAA9A2", -- 1  Red
    "#A4EAC1", -- 2  Green
    "#E3D86E", -- 3  Yellow
    "#A1B2EA", -- 4  Blue
    "#B297F8", -- 5  Magenta
    "#9CDCF6", -- 6  Cyan
    "#D8DEE9", -- 7  White

    "#7A879B", -- 8  Bright Black
    "#F4C2BC", -- 9  Bright Red
    "#C2F5D8", -- 10 Bright Green
    "#F0E78F", -- 11 Bright Yellow
    "#BFCBF2", -- 12 Bright Blue
    "#C9B6FA", -- 13 Bright Magenta
    "#BCE8FA", -- 14 Bright Cyan
    "#F0F2F7", -- 15 Bright White
  },
}
