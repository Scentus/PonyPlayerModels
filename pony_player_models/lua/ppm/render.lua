

if CLIENT then

function PPM:RescaleRIGPART(ent,part,scale)
	for k , v in pairs(part) do 
		ent:ManipulateBoneScale( v,scale )  
	end
end
function PPM:RescaleMRIGPART(ent,part,scale)
	for k , v in pairs(part) do 
		//ent:ManipulateBoneScale( v,scale ) 
		ent:ManipulateBonePosition( v, scale )
	end
end
function PPM:RescaleOFFCETRIGPART(ent,part,scale)
	for k , v in pairs(part) do 
		//ent:ManipulateBoneScale( v,scale ) 
		local thispos = PPM.skeletons.pony_default[v+1].localpos 
		ent:ManipulateBonePosition( v, thispos *(scale-Vector(1,1,1)) )
	end
end

	function PPM.PrePonyDraw(ent, localvals)
	  
		if !PPM.isValidPonyLight( ent ) then return end 
		//if true then return end 
		local pony = PPM.getPonyValues( ent, localvals )  
		if( table.Count( pony ) == 0 ) then return end
		//{//rigscalething
        local SCALEVAL0 = math.Clamp( pony.bodyweight or 1, 0.8, 1.2 )//(1+math.sin(time)/4)
        local SCALEVAL1 = math.Clamp( pony.gender - 1, 0, 1 )
        //local SCALEVAL2 =PPM.test_buffness;
        PPM:RescaleRIGPART(ent,PPM.rig.leg_FL,Vector( 1,1,1 )*SCALEVAL0)
        PPM:RescaleRIGPART(ent,PPM.rig.leg_FR,Vector( 1,1,1 )*SCALEVAL0)
        PPM:RescaleRIGPART(ent,PPM.rig.leg_BL,Vector( 1,1,1 )*SCALEVAL0)
        PPM:RescaleRIGPART(ent,PPM.rig.leg_BR,Vector( 1,1,1 )*SCALEVAL0)
        PPM:RescaleRIGPART(ent,PPM.rig.rear,Vector( 1,1,1 )*(SCALEVAL0-(SCALEVAL1)*0.2))
        //PPM:RescaleRIGPART(self.Entity,{1},Vector( 0,1,1 )*(SCALEVAL0+SCALEVAL1*0.2)+Vector( 1,0,0 ))
        //PPM:RescaleRIGPART(self.Entity,{2},Vector( 0,1,1 )*(SCALEVAL0+SCALEVAL1*0.4)+Vector( 1,0,0 ))
        //PPM:RescaleRIGPART(self.Entity,{3},Vector( 0,1,1 )*(SCALEVAL0+SCALEVAL1*0.8)+Vector( 1,0,0 ))
        PPM:RescaleRIGPART(ent,PPM.rig.neck,Vector( 1,1,1 )*SCALEVAL0)
        PPM:RescaleRIGPART(ent,{3},Vector( 1,1,0 )*((SCALEVAL0-1)+SCALEVAL1*0.1+0.9)+Vector( 0,0,1 ))
         
        
        PPM:RescaleMRIGPART(ent,{18},Vector(0,0,SCALEVAL1/2))
        PPM:RescaleMRIGPART(ent,{24},Vector(0,0,-SCALEVAL1/2))
        //tailscale
        local SCALEVAL_tail = math.Clamp( pony.tailsize or 1, 0.8, 1.2 )
        local svts = (SCALEVAL_tail-1)*2+1
        local svtc = (SCALEVAL_tail-1)/2+1
        PPM:RescaleOFFCETRIGPART(ent,{38},Vector(svtc,svtc,svtc))
        PPM:RescaleRIGPART(ent,{38},Vector(svts,svts,svts))
        
        PPM:RescaleOFFCETRIGPART(ent,{39,40},Vector(SCALEVAL_tail,SCALEVAL_tail,SCALEVAL_tail))
        PPM:RescaleRIGPART(ent,{39,40},Vector(svts,svts,svts))
			
			
		//}
		if PPM.m_hair1 == nil then return end
		PPM.m_hair1:SetVector( "$color2", pony.haircolor1 ) 
		PPM.m_hair2:SetVector( "$color2", pony.haircolor2 )  
		
		PPM.m_wings:SetVector( "$color2", pony.coatcolor ) 
		PPM.m_horn:SetVector( "$color2", pony.coatcolor ) 
		
		  
		PPM.m_eyel:SetFloat( "$ParallaxStrength", 0.2) 
		PPM.m_eyer:SetFloat( "$ParallaxStrength", 0.1) 
		
		
		if ent.ponydata_tex !=nil then
			for k ,v in pairs(PPM.rendertargettasks) do 
				if ent.ponydata_tex[k] !=nil and ent.ponydata_tex[k] !=NULL and 
				  ent.ponydata_tex[k.."_draw"] and
				type(ent.ponydata_tex[k])=="ITexture" and !ent.ponydata_tex[k]:IsError( ) then 
					v.renderTrue(ent,pony)
				else
					v.renderFalse(ent,pony)
				end
			end
		end
	end 
	
	function PonyPropDraw(ent)
	end
	
	function HOOK_PrePlayerDraw( PLY )
        if PLY.ponydata !=nil then
            if PLY.ponydata.clothes1!=nil then
                if IsValid(PLY.ponydata.clothes1) then
                    PLY.ponydata.clothes1:SetNoDraw(!PLY:Alive() ) 
                end
            end
        end
        PPM.PrePonyDraw(PLY,false)  
		return !PLY:Alive()
	end    
	function HOOK_PostPlayerDraw( PLY)
		if PLY==nil then return end  
		if !IsValid(PLY) then return end  
		
		if(PPM.isLoaded) then 
			if !PPM.isValidPonyLight(PLY) then return end 
			if PPM.m_hair1 == nil then return end
            
			PPM.m_hair1:SetVector( "$color2", Vector(0,0,0) ) 
			PPM.m_hair2:SetVector( "$color2", Vector(0,0,0) )  
			 
			PPM.m_body:SetVector( "$color2", Vector(1,1,1) ) 
			PPM.m_wings:SetVector( "$color2", Vector(1,1,1) ) 
			PPM.m_horn:SetVector( "$color2", Vector(1,1,1) ) 
			
			PPM.m_eyel:SetFloat( "$ParallaxStrength", 0.1) 
			PPM.m_eyer:SetFloat( "$ParallaxStrength", 0.1) 
			
            local textureTest = PPM.t_eyes[1][1]:GetTexture("$basetexture")
            if textureTest == nil then return end
			PPM.m_eyel:SetTexture( "$Iris", textureTest )
			PPM.m_eyer:SetTexture( "$Iris", PPM.t_eyes[1][1]:GetTexture("$detail") )
			
			PPM.m_cmark:SetTexture("$basetexture",PPM.m_cmarks[1][2]:GetTexture("$basetexture")) 
			PPM.m_body:SetTexture("$basetexture",PPM.m_bodyf:GetTexture("$basetexture")) 
		end
	end
	function HOOK_PostDrawOpaqueRenderables()
	//PPM.bones_testDraw("pony_mature") 	
					//			MsgN("Ponies:")
		////////////////////STRARTUPHOOK
		//if true then return end
		if(!PPM.isLoaded) then
			PPM.LOAD()
		end 
		//if true then return end
		////////////////////RENDER
		for name, ent in pairs(ents.GetAll()) do
			if(IsValid(ent) )then//and ent:Visible( LocalPlayer() )
			
				if(!ent:IsPlayer())then 
						if(PPM.isValidPonyLight(ent))then
							if(ent:IsNPC()) then
                                ent:SetNoDraw(true)
                                PPM.PrePonyDraw(ent,false)
                                ent:DrawModel()
							elseif(table.HasValue(PPM.VALIDPONY_CLASSES,ent:GetClass()) or 
									string.match(ent:GetClass(),"^(npc_)")!=nil)then
								if(!ent.isEditorPony)then
									--if(!PPM.isValidPony(ent)) then
										//PPM.randomizePony(ent)
									--end
									ent:SetNoDraw(true)
									if(ent.ponydata!=nil and ent.ponydata.useLocalData ) then
										PPM.PrePonyDraw(ent,true)
									else 
										PPM.PrePonyDraw(ent,false)
									end
									//ent:SetupBones( )
									ent:DrawModel()  
								end
							end
						end 
				else/////////////PONY IS PLAYER
					local plyrag = ent:GetRagdollEntity()
					if ( plyrag != nil )then 
						if PPM.isValidPonyLight(plyrag) then
							if(!PPM.isValidPony(plyrag)) then
                                plyrag.ponyCacheTarget = ent
                                PPM.MarkData[plyrag] = PPM.MarkData[ent]
								PPM.setupPony(plyrag)
								PPM.copyPonyTo(ent,plyrag) 
								PPM.copyLocalTextureDataTo(ent,plyrag) 
								plyrag.ponydata.useLocalData = true
								PPM.setBodygroups( plyrag, true )
								plyrag:SetNoDraw(true)
								if ent.ponydata!= nil then 
									if plyrag.clothes1 == nil then 
										plyrag.clothes1=ClientsideModel("models/ppm/player_default_clothes1.mdl", 
										RENDERGROUP_TRANSLUCENT)
										plyrag.clothes1:SetParent(plyrag)
										plyrag.clothes1:AddEffects(EF_BONEMERGE) 
										if IsValid( ent.ponydata.clothes1) then
											for I=1 ,14 do
												
												//MsgN(I,ent.ponydata.clothes1:GetBodygroup( I ))
												PPM.setBodygroupSafe(plyrag.clothes1,I,
												ent.ponydata.clothes1:GetBodygroup( I ))
											end
										end  
										plyrag:CallOnRemove( "clothing del", function()
											plyrag.clothes1:Remove()
										end)
									end
								end
							else
								PPM.PrePonyDraw(plyrag,true)
								
								plyrag:DrawModel()
							end
						end  
					else
						if ent.ponydata==nil then PPM.setupPony(ent) end
						if ent.ponydata.clothes1== nil or ent.ponydata.clothes1==NULL then
							ent.ponydata.clothes1 = ent:GetNetworkedEntity("pny_clothing")
							
						end
					end
				end
			end
		end
	end
	
    function HOOK_PostDrawTranslucentRenderables()
	end
    
	function OnReloaded( ) 
	end
	hook.Add("PostDrawOpaqueRenderables","test_Redraw",HOOK_PostDrawOpaqueRenderables)
	hook.Add("PrePlayerDraw","pony_draw",HOOK_PrePlayerDraw) 
	hook.Add("PostPlayerDraw","pony_postdraw",HOOK_PostPlayerDraw)
	hook.Add("OnReloaded", "pony_reload", OnReloaded)
	CreateClientConVar("ppm_oldeyes", "0", true, false)
end
