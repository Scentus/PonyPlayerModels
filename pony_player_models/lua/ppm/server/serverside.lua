if(SERVER) then  
	util.AddNetworkString( "player_equip_item" )
	util.AddNetworkString( "player_pony_cm_send" )
	//util.AddNetworkString( "player_pony_set_charpars" )
	
	net.Receive( "player_equip_item", function(len, ply)    
		local id =net.ReadFloat()
		local item =PPM:pi_GetItemById(id)
		if(item!=nil)then
			PPM.setupPony(ply,false)
			PPM:pi_SetupItem(item,ply)  
		end
	end)  
	
	function PlayerSetModel( ply )
	
		local newmodel =ply:GetInfo( "cl_playermodel" )
		
		if(table.HasValue(ponyarray_temp ,newmodel))then
			//ply:DrawWorldModel(false)
			//MsgN("HIDE!")
		end
		
		if newmodel!=ply.pi_prevplmodel then
			//MsgN("MODELCHANGED")
			PPM:pi_UnequipAll(ply)
			
			
			if(newmodel=="pony") or (newmodel=="ponynj")then
				if ply.ponydata==nil then
				PPM.setupPony(ply) end
				PPM.setPonyValues(ply) 
				PPM.setBodygroups(ply)
				
				if PPM.camoffcetenabled!=nil and PPM.camoffcetenabled:GetBool( ) then 
					ply:SetViewOffset(Vector(0,0,42))
					ply:SetViewOffsetDucked(Vector(0,0,32))
				end
			else
				if(table.HasValue(ponyarray_temp ,ply.pi_prevplmodel))then
					//if PPM.camoffcetenabled!=nil and PPM.camoffcetenabled:GetBool( ) then 
						ply:SetViewOffset(Vector(0,0,64)) 
						ply:SetViewOffsetDucked(Vector(0,0,28)) 
					//end
				end
			end
			
			ply.pi_prevplmodel=newmodel
		end
	end 
	function HOOK_PlayerSwitchWeapon(ply,oldwep,newwep)
		if(table.HasValue(ponyarray_temp ,ply:GetInfo( "cl_playermodel" ))) then 
			newwep:SetMaterial("Models/effects/vol_light001") 
		end
	end
	function HOOK_PlayerLeaveVehicle(  ply,  ent )
		if(table.HasValue(ponyarray_temp,ply:GetInfo( "cl_playermodel" ))) then
			if ply.ponydata!=nil and IsValid(ply.ponydata.clothes1) then
				local bdata = {}  
				for i=0, 14 do
					bdata[i] = ply.ponydata.clothes1:GetBodygroup(i)
					ply.ponydata.clothes1:SetBodygroup(i,0) 
				end    
				timer.Simple(0.2,function()
                    for i=0, 14 do 
                        ply.ponydata.clothes1:SetBodygroup(i,bdata[i]) 
                    end
                end) 
			end 
		end 
	end
	ponyarray_temp = {"pony","ponynj"}
	PPM.camoffcetenabled =CreateConVar( "ppm_enable_camerashift", "1" ,{ FCVAR_REPLICATED, FCVAR_ARCHIVE } , "Enables ViewOffset Setup"  )
	hook.Add("PlayerSetModel","items_Flush",PlayerSetModel)
	hook.Add("PlayerSwitchWeapon", "pony_weapons_autohide", HOOK_PlayerSwitchWeapon)
	hook.Add("PlayerLeaveVehicle", "pony_fixclothes", HOOK_PlayerLeaveVehicle)
 end