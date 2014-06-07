
if CLIENT then
	function PPM.setupBones(ent)
		if !PPM.isValidPonyLight(ent) then return end 
	
	end
	PPM.skeletons= {}
	function PPM.parseSkeleton(skn,str)
		local sceleton = {}
		local lines = string.Split(str,"\n")
		
		//MsgN("scel decomp")
		for i=1,table.Count( lines) do
			local arms = string.Split(lines[i]," ") 
			if table.Count( arms)==15 then
				local bone = {}
				bone.name = string.Replace(arms[2],"\"","") 
				bone.id = i
				bone.parent = string.Replace(arms[3],"\"","") 
				bone.localpos = Vector(tonumber(arms[4]),tonumber(arms[5]),tonumber(arms[6]))
				bone.localang = Angle(tonumber(arms[7]),tonumber(arms[8]),tonumber(arms[9]))
				bone.scelname = skn
				//bone.fixupang = Angle(tonumber(arms[10]),tonumber(arms[11]),tonumber(arms[12]))
				sceleton[bone.name] = bone 
			end 
		end
		PPM.skeletons[skn]=sceleton
		//PrintTable(sceleton)
	end
	function PPM.parseSmdSkel(skn,str)
		local sceleton = {}
		local lines = string.Split(str,"\n")
		//print("hai")
		 
		//print("lcount:",table.Count( lines))
		for i=1,table.Count( lines) do
			local args = string.Split(lines[i]," ") 
			//print("acount:",table.Count( args))
			if args!=nil then
				local bone = {} 
				bone.id = tonumber(args[1]) 
				bone.localpos = Vector(tonumber(args[2]),tonumber(args[3]),tonumber(args[4]))
				bone.localang = Angle(tonumber(args[5]),tonumber(args[6]),tonumber(args[7])) 
				//bone.fixupang = Angle(tonumber(arms[10]),tonumber(arms[11]),tonumber(arms[12]))
				sceleton[bone.id] = bone 
				//print("acount:",bone.id ) 
			end 
		end
		PPM.skeletons[skn]=sceleton
		//PrintTable(sceleton) 
	end
	function PPM.bones_getParent(bone)
		if bone.parent!="" then
			return PPM.skeletons[bone.scelname][bone.parent]
		end
		return nil
	end
	function PPM.bones_recursiveAbsolute(bone)
		local parent =PPM.bones_getParent(bone)
		if parent==nil then
			bone.absolutepos =bone.localpos
			bone.absoluteang =bone.localang
		else
			PPM.bones_recursiveAbsolute(parent)
			bone.absolutepos,bone.absoluteang =
				LocalToWorld(bone.localpos,bone.localang,parent.absolutepos,parent.absoluteang)
		end
	end 
	function PPM.bones_testDraw(skn) 
	 /*
		cam.Start3D(EyePos(),EyeAngles())
		//render.SetMaterial(  Material( "sprites/splodesprite" ) ) 
		render.SetMaterial(  Material( "trails/laser" ) );
		for k,v in pairs( PPM.skeletons[skn]) do
			PPM.bones_recursiveAbsolute(v)
			
			render.DrawSprite( v.absolutepos*5 , 20, 20, Color(255,255,255,255) )
			
			local parent =PPM.bones_getParent(v) 
			if parent!=nil then
				drawline(parent.absolutepos*5 or Vector(0,0,0),v.absolutepos*5)
			end
		end
		 
		
		cam.End3D()
	*/
	end
	function toWorld(  localpos,  localang,  worldpos,  worldang ) 
		//return LocalToWorld(localpos,localang,worldpos,worldang)
		//local pos, ang = 
	end

	function drawline(start_pos,end_pos)   
			  
		render.SetMaterial(  Material( "trails/laser" ) );
		  
		render.StartBeam( 2 );
			  
		render.AddBeam(
			start_pos,				 
			32,					 
			CurTime(),				 
			Color( 64, 255, 64, 255 )		 
		); 
		render.AddBeam(
			end_pos,
			32,
			CurTime() + 1,
			Color( 64, 255, 64, 255 )
		); 
		render.EndBeam();
	end
PPM.parseSmdSkel("pony_default",
"0 -0.000008 7.942368 67.036255 1.570796 3.104589 1.570796\n"..
"1 -8.684093 6.019775 9.241291 -0.022286 -3.087297 -1.566837\n"..
"2 20.912643 0.000013 0.000006 0.015823 -0.227812 -1.072160\n"..
"3 11.342150 0.000019 0.000008 0.144346 0.216788 0.914569\n"..
"4 23.406166 0.000000 -0.000002 -0.204317 -0.022940 0.742618\n"..
"5 8.513845 0.588924 -0.053814 -0.000361 0.000710 -0.470300\n"..
"6 -8.684092 6.019779 -9.241289 0.022356 3.087548 -1.566864\n"..
"7 20.912647 0.000013 -0.000004 -0.015668 0.227395 -1.072153\n"..
"8 11.342144 0.000015 -0.000008 -0.144134 -0.216331 0.914612\n"..
"9 23.406162 0.000000 -0.000002 0.204080 0.021698 0.742413\n"..
"10 8.513845 0.588923 0.053812 -0.000096 0.000188 -0.470425\n"..
"11 0.000000 0.000000 0.000000 0.000000 -0.000000 -0.149762\n"..
"12 12.797683 0.000000 -0.000000 -0.000000 0.000000 -0.080410\n"..
"13 12.797682 0.000000 -0.000001 0.000000 0.000000 0.199532\n"..
"14 -3.235820 -1.195740 6.529404 -2.845952 -0.000378 1.544659\n"..
"15 20.133060 0.000003 -0.000001 -0.154042 -0.170916 -0.552396\n"..
"16 12.923561 -0.000007 0.000000 -0.017280 0.151501 0.645034\n"..
"17 14.823462 0.000007 0.000003 -0.020036 0.022465 -0.067666\n"..
"18 14.402988 0.000001 0.000000 -0.061887 -0.090150 0.407779\n"..
"19 8.232018 -0.769563 -0.072920 -0.026280 -0.011118 -0.474829\n"..
"20 -3.235820 -1.195740 -6.529404 2.845952 0.000378 1.544659\n"..
"21 20.133060 0.000001 0.000003 0.153919 0.171196 -0.552265\n"..
"22 12.923561 -0.000008 -0.000002 0.017287 -0.151971 0.644939\n"..
"23 14.823463 0.000007 -0.000003 0.020005 -0.022565 -0.067385\n"..
"24 14.402987 0.000001 0.000000 0.061883 0.090642 0.406972\n"..
"25 8.232018 -0.769564 0.072921 0.026381 0.010923 -0.474272\n"..
"26 0.000000 0.000000 0.000000 -0.004709 0.009383 -1.051288\n"..
"27 9.411018 -0.000002 0.000000 -0.001072 0.012585 -0.534921\n"..
"28 9.194023 0.000000 -0.000000 -0.011768 0.002484 0.951130\n"..
"29 8.358566 0.000008 -0.000001 -0.013856 -0.001347 0.773523\n"..
"30 13.350672 11.601013 0.000002 -0.000000 0.000000 -0.000000\n"..
"31 -4.470415 -24.462242 0.339081 -0.001529 -0.015597 0.160254\n"..
"32 -17.635868 -8.022026 0.149231 -0.016481 -0.343940 1.498133\n"..
"33 20.090080 0.000032 0.000000 0.000000 0.000000 -0.280427\n"..
"34 18.368122 0.000002 -0.000004 -0.044887 0.338939 0.146149\n"..
"35 -14.493567 -22.292397 0.184410 0.004636 0.480628 -0.200721\n"..
"36 24.479212 0.000008 0.000001 0.000000 -0.000000 1.389815\n"..
"37 -4.771093 -21.276482 -13.895004 -0.015939 0.230560 1.489124\n"..
"38 23.499176 -0.000031 0.000000 0.047412 -0.257535 -0.251418\n"..
"39 -16.302101 -1.011261 0.000000 -0.000000 0.000000 -3.027080\n"..
"40 25.726456 -0.000069 0.000001 0.000000 -0.000000 -1.602836\n"..
"41 40.078480 0.000000 0.000002 0.000000 -0.000000 0.000000")
PPM.parseSkeleton("pony_mature",
"$definebone \"LrigPelvis\" \"\" -0.000003 1.830602 37.145847 2.120154 -90.000017 -90.000017 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000\n"..
"$definebone \"LrigSpine1\" \"LrigPelvis\" 0.000000 0.000000 0.000000 -0.000000 -8.107068 0.000000 -0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000\n"..
"$definebone \"LrigSpine2\" \"LrigSpine1\" 5.362306 0.000000 0.000000 -0.000000 -4.425125 0.000000 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000\n"..
"$definebone \"LrigRibcage\" \"LrigSpine2\" 5.362306 -0.000004 -0.000000 -0.000000 10.776649 -0.000000 0.000000 0.000000 0.000000 -0.000000 0.000000 -0.000000\n"..
"$definebone \"LrigNeck1\" \"LrigRibcage\" 0.000000 0.000000 0.000000 -0.025497 -54.854353 0.084339 0.000000 0.000000 0.000000 0.000000 -0.000000 0.000000\n"..
"$definebone \"LrigNeck2\" \"LrigNeck1\" 8.008854 0.000002 0.000000 0.072938 -26.680014 0.420322 0.000004 -0.000000 -0.000000 -0.000000 -0.000003 0.000000\n"..
"$definebone \"LrigNeck3\" \"LrigNeck2\" 7.824184 -0.000003 -0.000001 0.116024 -8.832207 0.343431 0.000000 -0.000001 0.000000 -0.000000 -0.000006 0.000000\n"..
"$definebone \"LrigScull\" \"LrigNeck3\" 7.113201 -0.000002 -0.000000 0.877198 108.674110 0.000057 0.000000 0.000000 0.000000 0.000000 0.000003 -0.000000\n"..
"$definebone \"Lrig_LEG_BR_Femur\" \"LrigPelvis\" -6.748742 4.002026 -4.430604 4.281923 90.184344 -178.938773 -0.000004 -0.000001 0.000000 0.000000 -0.000000 -0.000000\n"..
"$definebone \"Lrig_LEG_BR_Tibia\" \"Lrig_LEG_BR_Femur\" 9.149282 0.000006 0.000001 2.206059 -72.858749 -0.404337 -0.000000 0.000000 0.000000 -0.000000 -0.000002 0.000000\n"..
"$definebone \"Lrig_LEG_BR_LargeCannon\" \"Lrig_LEG_BR_Tibia\" 5.826587 0.000002 -0.000001 -0.655865 63.541080 -5.210192 0.000000 0.000000 0.000000 0.000000 -0.000003 -0.000001\n"..
"$definebone \"Lrig_LEG_BR_PhalanxPrima\" \"Lrig_LEG_BR_LargeCannon\" 17.801519 -0.000002 0.000002 -4.322050 41.442327 13.281390 0.000001 -0.000001 0.000000 0.000001 0.000004 0.000000\n"..
"$definebone \"Lrig_LEG_BR_RearHoof\" \"Lrig_LEG_BR_PhalanxPrima\" 3.575815 0.247350 0.022603 -0.003436 -26.997940 0.001777 0.000000 0.000000 0.000000 0.000001 0.000004 -0.000001\n"..
"$definebone \"Lrig_LEG_BL_Femur\" \"LrigPelvis\" -6.748740 4.002033 4.430604 -4.281923 90.184405 178.938773 0.000000 0.000000 0.000000 -0.000000 -0.000000 0.000000\n"..
"$definebone \"Lrig_LEG_BL_Tibia\" \"Lrig_LEG_BL_Femur\" 9.149277 0.000004 0.000000 -2.206059 -72.858804 0.404336 -0.000000 0.000000 0.000000 0.000000 -0.000003 -0.000000\n"..
"$definebone \"Lrig_LEG_BL_LargeCannon\" \"Lrig_LEG_BL_Tibia\" 5.826587 0.000004 0.000001 0.655350 63.543020 5.210478 0.000000 0.000000 0.000000 -0.000000 -0.000008 -0.000001\n"..
"$definebone \"Lrig_LEG_BL_PhalanxPrima\" \"Lrig_LEG_BL_LargeCannon\" 17.801516 -0.000002 -0.000001 4.321822 41.420501 -13.282937 0.000000 0.000000 0.000000 -0.000000 0.000009 0.000003\n"..
"$definebone \"Lrig_LEG_BL_RearHoof\" \"Lrig_LEG_BL_PhalanxPrima\" 3.575814 0.247349 -0.022602 0.000001 -26.978576 0.000003 0.000000 0.000000 -0.000001 0.000001 -0.000001 0.000003\n"..
"$definebone \"Lrig_LEG_FL_Scapula\" \"LrigRibcage\" -1.359044 -0.502213 2.742350 -13.329753 71.996499 -162.098819 0.000000 0.000000 0.000000 0.000005 0.000001 0.000002\n"..
"$definebone \"Lrig_LEG_FL_Humerus\" \"Lrig_LEG_FL_Scapula\" 9.263971 -0.000001 -0.000002 -27.869932 -53.948335 6.289414 0.000000 0.000001 -0.000000 -0.000003 -0.000000 0.000002\n"..
"$definebone \"Lrig_LEG_FL_Radius\" \"Lrig_LEG_FL_Humerus\" 6.653765 -0.000003 0.000001 6.049000 44.471717 0.595417 0.000000 -0.000001 0.000000 -0.000003 -0.000008 -0.000001\n"..
"$definebone \"Lrig_LEG_FL_Metacarpus\" \"Lrig_LEG_FL_Radius\" 9.232680 -0.000001 0.000004 4.850544 -3.646370 -1.592365 0.000000 0.000000 0.000000 -0.000002 -0.000009 -0.000002\n"..
"$definebone \"Lrig_LEG_FL_PhalangesManus\" \"Lrig_LEG_FL_Metacarpus\" 11.202320 -0.000001 -0.000003 -3.018229 21.965194 0.032599 0.000000 0.000000 0.000000 -0.000001 -0.000004 -0.000002\n"..
"$definebone \"Lrig_LEG_FL_FrontHoof\" \"Lrig_LEG_FL_PhalangesManus\" 3.457447 -0.323215 -0.030626 -0.621662 -27.215331 -1.513641 0.000000 0.000000 0.000000 -0.000002 -0.000008 -0.000001\n"..
"$definebone \"Lrig_LEG_FR_Scapula\" \"LrigRibcage\" -1.359046 -0.502213 -2.742349 13.329751 71.996560 162.098819 -0.000004 0.000000 0.000000 -0.000002 -0.000001 -0.000002\n"..
"$definebone \"Lrig_LEG_FR_Humerus\" \"Lrig_LEG_FR_Scapula\" 9.263969 -0.000001 -0.000002 27.872734 -53.946272 -6.290389 0.000000 0.000000 0.000000 0.000000 0.000000 -0.000000\n"..
"$definebone \"Lrig_LEG_FR_Radius\" \"Lrig_LEG_FR_Humerus\" 6.653772 -0.000001 -0.000001 -6.055420 44.485299 -0.597767 -0.000002 0.000000 0.000000 0.000000 -0.000004 0.000000\n"..
"$definebone \"Lrig_LEG_FR_Metacarpus\" \"Lrig_LEG_FR_Radius\" 9.232681 0.000000 -0.000003 -4.839201 -3.673752 1.599183 0.000000 -0.000000 0.000000 -0.000000 -0.000003 0.000001\n"..
"$definebone \"Lrig_LEG_FR_PhalangesManus\" \"Lrig_LEG_FR_Metacarpus\" 11.202322 -0.000002 -0.000000 2.996111 21.967084 -0.041367 0.000000 0.000000 0.000000 0.000000 -0.000006 0.000001\n"..
"$definebone \"Lrig_LEG_FR_FrontHoof\" \"Lrig_LEG_FR_PhalangesManus\" 3.457447 -0.323215 0.030627 0.637015 -27.205701 1.505791 0.000000 0.000000 0.000000 0.000000 0.000002 0.000001\n"..
"$definebone \"LrigScullBone001\" \"LrigScull\" 5.607285 4.872429 0.000001 0.000000 0.000003 -0.000000 0.000001 0.000000 0.000000 0.000000 0.000003 -0.000000\n"..
"$definebone \"LrigLWingCollarbone\" \"LrigRibcage\" -5.179138 0.827900 1.788659 -25.306804 -103.927900 87.515071 -0.000004 -0.000001 0.000000 -0.000001 0.000002 0.000000\n"..
"$definebone \"LrigLWing1\" \"LrigLWingCollarbone\" 2.940838 0.000002 0.000001 -33.141595 2.124244 -115.167960 0.000002 0.000000 0.000000 -0.000005 -0.000000 0.000000\n"..
"$definebone \"LrigLWing2\" \"LrigLWing1\" 8.136320 -0.000004 0.000001 -9.359840 56.225151 10.918108 0.000000 0.000000 0.000000 -0.000003 -0.000002 -0.000002\n"..
"$definebone \"LrigLWingPalm\" \"LrigLWing2\" 14.508144 -0.000001 0.000000 3.928139 -55.041531 -7.189989 0.000000 0.000004 0.000001 -0.000003 0.000002 0.000000\n"..
"$definebone \"LrigRWingCollarbone\" \"LrigRibcage\" -5.179137 0.827904 -1.788659 25.306804 -103.927900 -87.515071 0.000000 -0.000001 0.000000 -0.000000 0.000005 0.000000\n"..
"$definebone \"LrigRWing1\" \"LrigRWingCollarbone\" 2.940842 -0.000001 -0.000001 33.141598 2.124246 115.167960 0.000000 0.000004 -0.000000 0.000005 0.000001 0.000001\n"..
"$definebone \"LrigRWing2\" \"LrigRWing1\" 8.136320 0.000000 -0.000000 9.359840 56.225090 -10.918163 0.000000 0.000000 0.000000 0.000003 -0.000001 0.000006\n"..
"$definebone \"LrigRWingPalm\" \"LrigRWing2\" 14.508141 0.000001 0.000000 -3.928136 -55.041531 7.189992 0.000000 0.000000 0.000000 0.000007 -0.000000 0.000002\n") 
end