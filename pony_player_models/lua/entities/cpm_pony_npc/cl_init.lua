
include('shared.lua')
 
ENT.RenderGroup = RENDERGROUP_BOTH
 
/*---------------------------------------------------------
   Name: Draw
   Desc: Draw it!
---------------------------------------------------------*/
function ENT:Draw()
	self:DrawModel()
end
 
/*---------------------------------------------------------
   Name: DrawTranslucent
   Desc: Draw translucent
---------------------------------------------------------*/
function ENT:DrawTranslucent()
  
	self:Draw()
 
end
 
/*---------------------------------------------------------
   Name: BuildBonePositions
   Desc: 
---------------------------------------------------------*/
function ENT:BuildBonePositions( NumBones, NumPhysBones )
 
 
end
 
 
 
/*---------------------------------------------------------
   Name: SetRagdollBones
   Desc: 
---------------------------------------------------------*/
function ENT:SetRagdollBones( bIn )
 
 
	self.m_bRagdollSetup = bIn
 
end
 
 
/*---------------------------------------------------------
   Name: DoRagdollBone
   Desc: 
---------------------------------------------------------*/
function ENT:DoRagdollBone( PhysBoneNum, BoneNum )
 
	// self:SetBonePosition( BoneNum, Pos, Angle )
 
end