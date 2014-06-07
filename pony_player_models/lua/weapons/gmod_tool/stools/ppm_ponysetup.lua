TOOL.Category		= "CPPM"
TOOL.Name			= "Ragdoll/NPC Setup"
TOOL.Command		= nil
TOOL.ConfigName		= ""
TOOL.Tab			= "Options"

if ( CLIENT ) then
	language.Add( "Tool.ppm_ponysetup.name", "Pony setup tool" )
	language.Add( "Tool.ppm_ponysetup.desc", "Setup Pony Ragdoll or NPC with your settings." )
	language.Add( "Tool.ppm_ponysetup.0", "Left: Paste settings.   Right: Copy settings.   Reload: Paste player settings" )
end

function TOOL:LeftClick(trace)
	local ent = trace.Entity
	if (!ent) then return false end 
	if (CLIENT) then return true end
    local ply = self:GetOwner()
	if not ply.tool_ponydatapasterTarget then return false end
    ply.tool_ponydatapaster= ply.tool_ponydatapaster or {}
	PPM.setupPony(ply.tool_ponydatapaster,true)
    if (ent:IsNPC()) or (ent:GetClass()=="prop_ragdoll") then 
        if PPM.isValidPonyLight(ent) then
            ent.ponyCacheTarget = ply.tool_ponydatapasterTarget
            PPM.copyLocalPonyTo( ply.tool_ponydatapaster, ent )
            PPM.setupPony(ent)
            PPM.setPonyValues(ent)
            PPM.setBodygroups(ent)
            return true  
        end
    elseif (ent:IsPlayer()) then 
        if (ply:IsAdmin() and PPM.isValidPonyLight(ent)) then
            --ent.ponyCacheTarget = ply.tool_ponydatapasterTarget
            if ply.tool_ponydatapaster.ponydata.custom_mark then
                local markdata = PPM.LoadFromCache( PPM.CacheGroups.PONY_MARK, ply.tool_ponydatapasterTarget, ply.tool_ponydatapaster.ponydata.custom_mark )
                if markdata then
                    PPM.SaveToCache( PPM.CacheGroups.PONY_MARK, ent, PPM.GetResolvedName( ply.tool_ponydatapaster.ponydata.custom_mark ), markdata, true )
                    PPM.MarkData[ent] = { ply.tool_ponydatapaster.ponydata.custom_mark, markdata }
                end
            end
            PPM.copyLocalPonyTo( ply.tool_ponydatapaster, ent )
            PPM.setupPony(ent)
            PPM.setPonyValues(ent)
            PPM.setBodygroups(ent)
            return true
        end
    end
	return false 
end

function TOOL:RightClick(trace)
	local ent = trace.Entity
	if (!ent) then return false end 
	if (CLIENT) then return true end
	local ply = self:GetOwner()
	ply.tool_ponydatapaster = ply.tool_ponydatapaster or {}
	PPM.setupPony( ply.tool_ponydatapaster, true )
	if (ent:IsNPC()) or ( ent:GetClass() == "prop_ragdoll" ) then 
		if PPM.isValidPonyLight(ent) then 
            ply.tool_ponydatapasterTarget = ent.ponyCacheTarget
			PPM.copyPonyTo( ent, ply.tool_ponydatapaster )
			return true 
		end
	elseif ( ent:IsPlayer() ) then 
		if ( ply:IsAdmin() and PPM.isValidPonyLight( ent ) ) then
			ply.tool_ponydatapasterTarget = ent:SteamID64()
            PPM.copyPonyTo( ent, ply.tool_ponydatapaster )  
			return true 
		end
	end
	return false 
end

function TOOL:Reload(trace)
	local ent = trace.Entity
	if (!ent) then return false end 
	if (CLIENT) then return true end
	local ply = self:GetOwner()
	if (ent:IsNPC()) or (ent:GetClass()=="prop_ragdoll") then
		if PPM.isValidPonyLight(ent) then
            ent.ponyCacheTarget = ply:SteamID64()
            PPM.copyPonyTo(ply,ent)
            PPM.setupPony(ent)
            PPM.setPonyValues(ent)
            PPM.setBodygroups(ent)
			return true
		end
	elseif(ent:IsPlayer()) then
		if(ply:IsAdmin() and PPM.isValidPonyLight(ent)) then
            --ent.ponyCacheTarget = ply:SteamID64()
			//PPM.copyLocalPonyTo(ply.tool_ponydatapaster,ent)
            if PPM.MarkData[ply] then
                PPM.SaveToCache( PPM.CacheGroups.PONY_MARK, ent, PPM.GetResolvedName( PPM.MarkData[ply][1] ), PPM.MarkData[ply][2], true )
                PPM.MarkData[ent] = PPM.MarkData[ply]
            end
			PPM.copyPonyTo(ply,ent)
            PPM.setupPony(ent)
            PPM.setPonyValues(ent)
			PPM.setBodygroups(ent)
			return true 
		end
	end
	return false 
end

function TOOL.BuildCPanel(panel) 
	panel:AddControl("Header", { Text = "#Tool.ppm_ponysetup.name", Description = "#Tool.ppm_ponysetup.desc" })
	panel:Button(
		"Spawn Pony Base Ragdoll",
		"ppm_spawn_pragdoll"
	)
	panel:Button(
		"Spawn Pony Base NPC",
		"ppm_spawn_pnpc"
	)
	 
end