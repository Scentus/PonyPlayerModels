
 
$cd "C:\gmodDev\ponyMod\CurrentVersion\modelsrc_pony\pony"
$scale 0.42 //0.375 //invert: 2,380952380952381
$modelname "ppm/player_default_base_ragdoll.mdl"
$model "default" "meshes\pony_default\skeleton.smd" {
//ABS MAX 9,463 -34,975 96,466
//ABS MDL 3,97446 -14,6895  40,51572
//WARNING! ARGUMENTS_POS = ABSOLUTE_COORDINATES * $scale
    	eyeball righteye LrigScull  -3,97446 -14,6895  41,31572 eye_r  8  13.000 eye_r 8
     	eyeball lefteye LrigScull  3,97446 -14,6895  41,31572 eye_l  8  -13.000 eye_r 8
		flexcontroller eyes range -45 45 eyes_updown
		flexcontroller eyes range -45 45 eyes_rightleft
} 
   
$include "../skeleton/pony_default/phycreate.qci"   

//$include "../macro/toolbox.qci" 
//$include "../skeleton/pony_default/main.qci"   
$bodygroup Body
{
	studio "meshes\pony_default\ref_body_01.smd" 
	studio "meshes\pony_default\ref_body_m.smd"  
}         
$bodygroup Horn
{
	studio "meshes\pony_default\ref_horn_01.smd" 
	blank
}     
$bodygroup Wings
{
	studio "meshes\pony_default\ref_wings_folded.smd" 
	blank
}
$bodygroup ManeHigh
{
	studio "meshes\pony_default\parts\uppermane_01.smd"  
	studio "meshes\pony_default\parts\uppermane_02.smd"  
	studio "meshes\pony_default\parts\uppermane_03.smd"  
	studio "meshes\pony_default\parts\uppermane_04.smd"  
	studio "meshes\pony_default\parts\uppermane_05.smd"  
	studio "meshes\pony_default\parts\uppermane_06.smd"  
	studio "meshes\pony_default\parts\uppermane_07.smd"  
	studio "meshes\pony_default\parts\uppermane_08.smd"  
	studio "meshes\pony_default\parts\uppermane_09.smd"  
	studio "meshes\pony_default\parts\uppermane_10.smd"  
	studio "meshes\pony_default\parts\uppermane_11.smd"  
	studio "meshes\pony_default\parts\uppermane_12.smd"  
	studio "meshes\pony_default\parts\uppermane_13.smd"  
	studio "meshes\pony_default\parts\uppermane_14.smd"  
	studio "meshes\pony_default\parts\uppermane_15.smd"  
	blank
}
$bodygroup ManeLow
{
	studio "meshes\pony_default\parts\lowermane_01.smd"   
	studio "meshes\pony_default\parts\lowermane_02.smd"  
	studio "meshes\pony_default\parts\lowermane_03.smd"  
	studio "meshes\pony_default\parts\lowermane_04.smd"  
	studio "meshes\pony_default\parts\lowermane_05.smd"  
	studio "meshes\pony_default\parts\lowermane_06.smd"  
	studio "meshes\pony_default\parts\lowermane_07.smd"
	studio "meshes\pony_default\parts\lowermane_08.smd"    
	studio "meshes\pony_default\parts\lowermane_09.smd"    
	studio "meshes\pony_default\parts\lowermane_10.smd"    
	studio "meshes\pony_default\parts\lowermane_11.smd"       
	studio "meshes\pony_default\parts\lowermane_12.smd"   
	blank
}
$bodygroup Tail
{
	studio "meshes\pony_default\parts\tail_01.smd"  
	studio "meshes\pony_default\parts\tail_02.smd" 
	studio "meshes\pony_default\parts\tail_03.smd" 
	studio "meshes\pony_default\parts\tail_04.smd" 
	studio "meshes\pony_default\parts\tail_05.smd" 
	studio "meshes\pony_default\parts\tail_06.smd" 
	studio "meshes\pony_default\parts\tail_07.smd" 
	studio "meshes\pony_default\parts\tail_08.smd" 
	studio "meshes\pony_default\parts\tail_09.smd" 
	studio "meshes\pony_default\parts\tail_10.smd" 
	studio "meshes\pony_default\parts\tail_11.smd" 
	studio "meshes\pony_default\parts\tail_12.smd" 
	studio "meshes\pony_default\parts\tail_13.smd" 
	studio "meshes\pony_default\parts\tail_14.smd" 
	blank
}
      
$bodygroup Cmark
{
	studio "meshes\pony_default\ref_cmark_host.smd" 
	blank
}   
$bodygroup Eyelashes
{
	studio "meshes\pony_default\parts\eyelashes_uppatch.smd" 
	studio "meshes\pony_default\parts\eyelashes_doublepatch.smd" 
	studio "meshes\pony_default\parts\eyelashes_doubleshypatch.smd" 
	studio "meshes\pony_default\parts\eyelashes_full.smd" 
	studio "meshes\pony_default\parts\eyelashes_mess.smd" 
	blank
}              
 
$cdmaterials "models\ppm\base\"
$cdmaterials "models\ppm\mane6\"
$cdmaterials "models\ppm\custom\"
$cdmaterials "models\ppm\clothes\"

$eyeposition -0.000 0.000 70.000 
$surfaceprop "flesh" 
$illumposition -9.026 1.285 92.326 
$attachment "forward" "LrigScull" 0.00 0.00 0.00 rotate 0 -10 90
$attachment "anim_attachment_RH" "LrigRibcage" 70.00 0.00 -10.00 rotate -90.00 -90.00 0.00
$attachment "anim_attachment_LH" "LrigRibcage" 70.00 0.00 10.00 rotate -90.00 -90.00 0.00
$attachment "eyes" "LrigScull" 15 0 -0.00 rotate 0 -10 90
$attachment "righteye" LrigScull 11.90476 0 -9.52380 rotate 0 -10 90
$attachment "lefteye" LrigScull 11.90476 0 9.52380 rotate 0 -10 90

 
 
$sequence ref.smd "meshes\pony_default\ref_body_01.smd" fps 30.000000 
 
//root
$jigglebone "Mane01" {
	is_flexible {
		yaw_stiffness 80
		yaw_damping 9
		pitch_stiffness 80
		pitch_damping 9
		angle_constraint 27
		length 20 
		tip_mass 5
	}
}
//root
$jigglebone "Mane02" {
	is_flexible {
		yaw_stiffness 80
		yaw_damping 9
		pitch_stiffness 80
		pitch_damping 9
		angle_constraint 27
		length 20 
		tip_mass 5
	}
}
$jigglebone "Mane03" {
	is_flexible {
		yaw_stiffness 80
		yaw_damping 5
		pitch_stiffness 80
		pitch_damping 9
		angle_constraint 40
		length 20 
		tip_mass 5
	}
}
$jigglebone "Mane03_tip" {
	is_flexible {
		yaw_stiffness 80
		yaw_damping 5
		pitch_stiffness 80
		pitch_damping 9
		angle_constraint 40
		length 20 
		tip_mass 5
	}
}

//root
$jigglebone "Mane04" {
	is_flexible {
		yaw_stiffness 80
		yaw_damping 9
		pitch_stiffness 80
		pitch_damping 9
		angle_constraint 27
		length 20 
		tip_mass 5
	}
}
$jigglebone "Mane05" {
	is_flexible {
		yaw_stiffness 80
		yaw_damping 5
		pitch_stiffness 80
		pitch_damping 9
		angle_constraint 40
		length 20 
		tip_mass 5
	}
}
//root
$jigglebone "Mane06" {
	is_flexible {
		yaw_stiffness 80
		yaw_damping 9
		pitch_stiffness 80
		pitch_damping 9
		angle_constraint 27
		length 20 
		tip_mass 5
	}
}
$jigglebone "Mane07" {
	is_flexible {
		yaw_stiffness 80
		yaw_damping 5
		pitch_stiffness 80
		pitch_damping 9
		angle_constraint 40
		length 20 
		tip_mass 5
	}
}
//root
$jigglebone "Tail01" {
	is_flexible {
		yaw_stiffness 80
		yaw_damping 9
		pitch_stiffness 80
		pitch_damping 9
		angle_constraint 27
		length 20 
		tip_mass 5
	}
}
$jigglebone "Tail02" {
	is_flexible {
		yaw_stiffness 80
		yaw_damping 5
		pitch_stiffness 80
		pitch_damping 9
		angle_constraint 40
		length 20 
		tip_mass 5
	}
}
$jigglebone "Tail03" {
	is_flexible {
		yaw_stiffness 80
		yaw_damping 9
		pitch_stiffness 80
		pitch_damping 9
		angle_constraint 30
		length 20 
		tip_mass 5
	}
} 
 
 