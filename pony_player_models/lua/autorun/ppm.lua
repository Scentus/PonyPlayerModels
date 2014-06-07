
player_manager.AddValidModel( "pony", "models/ppm/player_default_base.mdl" ) 
player_manager.AddValidModel( "ponynj", "models/ppm/player_default_base_nj.mdl" )   
 
if SERVER then		

	AddCSLuaFile("ppm.lua")
	local function add_files(dir)
		local files, folders = file.Find(dir .. "*", "LUA")
		
		for key, file_name in pairs(files) do
			AddCSLuaFile(dir .. file_name)
		end
		
		for key, folder_name in pairs(folders) do
			add_files(dir .. folder_name .. "/")
		end
	end
	
	add_files("ppm/") 
end
if CLIENT then
	list.Set( "PlayerOptionsModel", "pony", "models/ppm/player_default_base.mdl" ) 
	list.Set( "PlayerOptionsModel", "ponynj", "models/ppm/player_default_base_nj.mdl" ) 
 
end

include("ppm/init.lua")
print("Loaded pony_player_models")
