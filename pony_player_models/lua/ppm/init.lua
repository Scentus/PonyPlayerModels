
PPM = PPM or {}
PPM.serverPonydata = PPM.serverPonydata or {}
PPM.isLoaded =false

-- shared files
include("shared/libraries/von.lua")
include("shared/libraries/netstream.lua")
include("shared/cache.lua")
include("shared/items.lua")
include("shared/variables.lua")
include("shared/pony_player.lua")
include("shared/resources.lua")
include("shared/preset.lua")

if SERVER then
	include("server/serverside.lua")
else
    include("client/libraries/urltex.lua")
    include("client/render_texture.lua")
    include("client/render.lua")
    include("client/editor3.lua")
    include("client/editor3_body.lua")
    include("client/editor3_presets.lua")
    include("client/gui_toolpanel.lua")
end
