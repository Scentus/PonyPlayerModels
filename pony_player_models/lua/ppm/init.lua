
PPM = PPM or {}
PPM.serverPonydata = PPM.serverPonydata or {}
PPM.isLoaded =false

include("cache.lua")
include("items.lua")
include("variables.lua")
include("pony_player.lua")
include("resources.lua")
include("preset.lua")
--include("net.lua")
--include("ccmark_sys.lua")
if CLIENT then   
    include("render_texture.lua")
    include("render.lua")
    include("bonesystem.lua")
    include("editor3.lua")
    include("editor3_body.lua")
    include("editor3_presets.lua")
    include("presets_base.lua")
    include("gui_toolpanel.lua")
end

if SERVER then 
    include("serverside.lua")
end
