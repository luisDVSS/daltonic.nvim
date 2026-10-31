# daltonic.nvim

Temas oscuros para Neovim pensados para personas con deficiencia en la visión del color (daltonismo). Cada variante ajusta la paleta a un tipo de deficiencia, en vez de usar una sola paleta "para todos".

La idea central: en estas condiciones el rojo y el verde se confunden, así que los colores se separan por **luminosidad** y por el eje **azul-amarillo**, que no se ve afectado. Además, el diff y los signos de git evitan la pareja rojo-verde, y los diagnósticos se distinguen también por la **forma del subrayado**, no solo por color.

## Variantes

| `:colorscheme` | Pensado para | Notas |
| --- | --- | --- |
| `protanopia-deuteranopia` | Protanopia y deuteranopia (dicromacia: falta un tipo de cono) | Rojo en salmón claro; diff y git sin verde ni rojo |
| `protanomalia` | Protanomalia (tricromacia anómala: "rojo débil") | Tonos más reconocibles que la variante anterior |
| `deuteranomalia` | Deuteranomalia (tricromacia anómala: "verde débil") | Paleta más cercana a un tema oscuro convencional |

Las anomalías son deficiencias **parciales**; las dicromacias son **totales** para un tipo de cono. Si dudas cuál elegir, prueba la que mejor se lea para ti: la percepción varía entre personas.

## Requisitos

- Neovim 0.9 o superior (se recomienda 0.10+ para los subrayados `underdashed` y `underdotted`).
- Una terminal con colores de 24 bits (`termguicolors`). Si tu terminal no los soporta, el tema aproxima a los 16 colores ANSI de la paleta, con menos precisión.

## Instalación

Con [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "luisDVSS/daltonic.nvim", lazy = false,
  priority = 1000,
  config = function()
    require("daltonic-nvim-theme").setup({
      -- opciones (ver más abajo)
    })
    vim.cmd.colorscheme("protanopia-deuteranopia")
  end,
}
```

Sin gestor de plugins, clona el repositorio en una carpeta del `runtimepath`:

```bash
git clone https://github.com/luisDVSS/daltonic.nvim \
  ~/.local/share/nvim/site/pack/themes/start/daltonic.nvim
```

Y en tu `init.lua`:

```lua
vim.cmd.colorscheme("protanopia-deuteranopia")
```

## Uso

```vim
:colorscheme protanopia-deuteranopia
:colorscheme protanomalia
:colorscheme deuteranomalia
```

Llama a `setup()` **antes** de `:colorscheme` si quieres cambiar opciones.

## Configuración

Valores por defecto:

```lua
require("daltonic-nvim-theme").setup({
  dim_inactive = true,        -- atenúa el fondo de las ventanas sin foco
  styles = {
    comments  = { italic = true },
    keywords  = { italic = false },
    functions = { bold = false },
    types     = {},           -- admite cualquier clave de nvim_set_hl
    variables = {},
    headings  = { bold = true },
  },
  overrides = {},             -- ver "Personalizar colores"
})
```

`types`, `variables` y `headings` aceptan cualquier atributo de [`nvim_set_hl`](https://neovim.io/doc/user/api.html#nvim_set_hl()) (por ejemplo `{ italic = true }`).

### Personalizar colores

`overrides` se indexa por el nombre de la paleta y reemplaza las claves que indiques:

```lua
require("daltonic-nvim-theme").setup({
  overrides = {
    ["protanopia-deuteranopia"] = {
      bg = "#0d1117",
      yellow = "#F0E060",
    },
    deuteranomalia = {
      cursorline = "#222B3A",
    },
  },
})
```

El reemplazo es **superficial**: si cambias `terminal` o `git`, debes dar la tabla completa.

#### Claves de la paleta

| Grupo | Claves |
| --- | --- |
| Base | `bg`, `bg_alt`, `bg_float`, `fg`, `fg_muted`, `border` |
| Acentos | `red`, `orange`, `yellow`, `green`, `cyan`, `blue`, `purple`, `pink` |
| UI | `cursor`, `selection`, `cursorline`, `search_bg`, `search_fg`, `linenr`, `linenr_active`, `statusline_bg`, `statusline_fg` |
| Diff | `diff_add`, `diff_del`, `diff_change` |
| Git (opcional) | `git = { add, change, delete }` (si falta, usa `green`, `orange` y `red`) |
| Terminal | `terminal` (16 colores ANSI, índices 0-15) |

## lualine

Cada variante incluye su tema de lualine, con el mismo nombre:

```lua
require("lualine").setup({
  options = { theme = "protanopia-deuteranopia" },
})
```

## Integraciones

Treesitter, LSP y diagnósticos, Telescope, gitsigns, nvim-cmp y blink.cmp, bufferline, which-key, snacks, oil, neo-tree, nvim-tree, mini.nvim, trouble, indent-blankline, lazy, mason, nvim-dap, nvim-notify, noice, render-markdown y alpha, además de otros grupos varios.

## Decisiones de diseño

- **Contraste:** los acentos de las variantes de protanopia y protanomalia mantienen un contraste de al menos 7:1 contra el fondo.
- **Separación entre colores:** se midió con las matrices de simulación de [Machado et al. (2009)](https://www.inf.ufrgs.br/~oliveira/pubs_files/CVD_Simulation/CVD_Simulation.html), buscando que la distancia perceptual entre acentos sea lo mayor posible bajo simulación.
- **Diff y git:** añadido en azul, borrado en ámbar o rosa, nunca en la pareja verde/rojo (en las variantes de protanopia y protanomalia).
- **Diagnósticos:** además del color, `Error` usa subrayado ondulado, `Warn` discontinuo e `Info`/`Hint` punteado.


