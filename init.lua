require('craftzdog.base')
require('craftzdog.highlights')
require('craftzdog.maps')
require('craftzdog.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_wsl = has "wsl"
local keymap = vim.keymap


if is_mac == 1 then
  require('craftzdog.macos')
end
if is_win == 1 then
  require('craftzdog.windows')
end
if is_wsl == 1 then
  require('craftzdog.wsl')
end


--[[
--Resumen de lo que hace tu código:

    Asignaciones de teclas en modo normal:

        x: Borra el carácter bajo el cursor sin afectar el portapapeles.

        <leader>pv: Abre el explorador de archivos con vim.cmd.Ex.

        + y -: Incrementa y decrementa el número bajo el cursor.

        dw y cw: Elimina o cambia una palabra.

        <C-a>: Selecciona todo el contenido del archivo.

        <F5>: Elimina el resaltado de búsqueda.

    Teclas en modo de inserción:

        jj: Sale del modo de inserción y vuelve al modo normal.

    En modo visual:

        J y K: Mueve el bloque seleccionado hacia abajo o arriba.

    Ventanas y pestañas:

        te: Abre una nueva pestaña.

        ss y sv: Divide la ventana horizontal o verticalmente.

        sh, sk, sj, sl: Mueve el cursor entre ventanas.

        Redimensiona las ventanas con las combinaciones <C-w><left>, <C-w><right>, <C-w><up>, <C-w><down>.
--]]
