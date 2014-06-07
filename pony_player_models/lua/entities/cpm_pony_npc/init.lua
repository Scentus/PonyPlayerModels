AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
 
 
local schdChase = ai_schedule.New( "AIFighter Chase" ) //creates the schedule used for this npc
 
 
	// Run away randomly (first objective in task)
	schdChase:EngTask( "TASK_GET_PATH_TO_RANDOM_NODE", 	128 )
	schdChase:EngTask( "TASK_RUN_PATH", 				0 )
	schdChase:EngTask( "TASK_WAIT_FOR_MOVEMENT", 	0 ) 
 
	// Find an enemy and run to it (second objectives in task)
	schdChase:AddTask( "FindEnemy", 		{ Class = "player", Radius = 2000 } )
	schdChase:EngTask( "TASK_GET_PATH_TO_RANGE_ENEMY_LKP_LOS", 	0 )
	schdChase:EngTask( "TASK_RUN_PATH", 				0 )
	schdChase:EngTask( "TASK_WAIT_FOR_MOVEMENT", 	0 )
 
	// Shoot it (third objective in task)
	schdChase:EngTask( "TASK_STOP_MOVING", 			0 )
	schdChase:EngTask( "TASK_FACE_ENEMY", 			0 )
	schdChase:EngTask( "TASK_ANNOUNCE_ATTACK", 		0 ) 
	//schedule is looped till you give it a different schedule
 
 
function ENT:Initialize()
 
	self:SetModel( "models/ppm/player_default_base.mdl" )
 
	self:SetHullType( HULL_HUMAN );
	self:SetHullSizeNormal();
 
	self:SetSolid( SOLID_BBOX ) 
	self:SetMoveType( MOVETYPE_STEP )
 
	self:CapabilitiesAdd( CAP_MOVE_GROUND )
	self:CapabilitiesAdd(CAP_OPEN_DOORS)
	self:CapabilitiesAdd(CAP_TURN_HEAD)
	self:SetMaxYawSpeed( 5000 )
 
	//don't touch stuff above here
	self:SetHealth(100) 
	PPM.setupPony(self)
end

function ENT:SpawnFunction( ply, tr )
if ( !tr.Hit ) then return end
local ent = ents.Create("cpm_pony_npc" )
ent:SetPos( tr.HitPos + tr.HitNormal * 16 ) 
ent:Spawn()
ent:Activate()
undo.Create( "npc" )
 undo.AddEntity( ent )
 undo.SetPlayer( ply )
undo.Finish()
return ent
end

CreateConVar("ppm_restrict_spawns", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "Restricts npc and ragdoll spawning via tool to admins only.")

concommand.Add("ppm_spawn_pnpc",function(ply, tr)
    if ( !IsValid( ply ) ) then return end
    if ( tobool( GetConVarNumber( "ppm_restrict_spawns" ) ) and !ply:IsAdmin() ) then
		ply:PrintMessage( HUD_PRINTTALK, "You need to be an admin to do that on this server." )
		return
	end
	print( ply:Nick() .. " (" .. ply:SteamID() .. ") attempted to spawn a pony npc." )
    local ent = scripted_ents.GetStored("cpm_pony_npc")
    ent.t:SpawnFunction(ply, ply:GetEyeTrace())
end)

concommand.Add("ppm_spawn_pragdoll",function(ply, tr)
    if ( !IsValid( ply ) ) then return end
    if ( tobool( GetConVarNumber( "ppm_restrict_spawns" ) ) and !ply:IsAdmin() ) then
		ply:PrintMessage( HUD_PRINTTALK, "You need to be an admin to do that on this server." )
		return
	end
	print( ply:Nick() .. " (" .. ply:SteamID() .. ") attempted to spawn a pony ragdoll." )
	tr = ply:GetEyeTrace()
	if ( !tr.Hit ) then return end
	local ent = ents.Create("prop_ragdoll" )
	ent:SetPos( tr.HitPos + tr.HitNormal * 16 ) 
	ent:SetModel( "models/ppm/player_default_base_ragdoll.mdl" )
	ent:Spawn()
	PPM.setupPony(ent)
	ent:Activate()
	undo.Create( "ragdoll" )
	 undo.AddEntity( ent )
	 undo.SetPlayer( ply )
	undo.Finish() 
end)

 function ENT:OnTakeDamage(dmg)
  self:SetHealth(self:Health() - dmg:GetDamage())
  if self:Health() <= 0 then //run on death
  self:SetSchedule( SCHED_FALL_TO_GROUND ) //because it's given a new schedule, the old one will end.
  end
 end 
 
 
/*---------------------------------------------------------
   Name: SelectSchedule
---------------------------------------------------------*/
function ENT:SelectSchedule()
 
		self:SetSchedule(SCHED_IDLE_WANDER)
	//self:StartSchedule( schdChase ) //run the schedule we created earlier
 
end