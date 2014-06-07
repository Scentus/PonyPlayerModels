
ENT.Base = "base_ai" 
ENT.Type = "ai"
 
ENT.PrintName = "Pony NPC"
ENT.Author = "Scentus" 
ENT.Information		= "Base Pony NPC"
ENT.Category		= "Pony"

ENT.Purpose = "Base for pony NPCS"
ENT.Instructions = ""

ENT.Spawnable = true
ENT.AdminOnly = false
   
ENT.AutomaticFrameAdvance = true


/*---------------------------------------------------------
   Name: OnRemove 
---------------------------------------------------------*/
function ENT:OnRemove()
end
 
 
/*---------------------------------------------------------
   Name: PhysicsCollide 
---------------------------------------------------------*/
function ENT:PhysicsCollide( data, physobj )
end
 
 
/*---------------------------------------------------------
   Name: PhysicsUpdate 
---------------------------------------------------------*/
function ENT:PhysicsUpdate( physobj )
end
 
/*---------------------------------------------------------
   Name: SetAutomaticFrameAdvance 
---------------------------------------------------------*/
function ENT:SetAutomaticFrameAdvance( bUsingAnim )
 
	self.AutomaticFrameAdvance = bUsingAnim
 
end
 