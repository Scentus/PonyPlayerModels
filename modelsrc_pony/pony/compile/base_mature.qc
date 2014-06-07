
 
$cd "C:\gmodDev\ponyMod\CurrentVersion\modelsrc_pony\pony"
$scale 0.42 //0.375 //invert: 2,380952380952381
$modelname "ppm/player_mature_base.mdl"
$model "default" "meshes\pony_mature\body.smd" {
//ABS MAX 9,463 -34,975 96,466
//ABS MDL 3,97446 -14,6895  40,51572
//WARNING! ARGUMENTS_POS = ABSOLUTE_COORDINATES * $scale
     eyeball righteye LrigScull  -3,80436 -19,11588 58,47534  eye_r  8  15.000 eye_r 9
     eyeball lefteye LrigScull  3,80436 -19,11588 58,47534 eye_l  8  -15.000 eye_r 9
	flexcontroller eyes range -45 45 eyes_updown
	flexcontroller eyes range -45 45 eyes_rightleft
} 

//$include "../macro/toolbox.qci" 
//$include "../skeleton/pony_default/main.qci"   
$include "../skeleton/pony_mature/phycreate.qci"  

$scale 0.42 
 
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



 
$scale 1
  
//root
$jigglebone "Mane01" {
	is_flexible {
		yaw_stiffness 40
		yaw_damping 9
		pitch_stiffness 40
		pitch_damping 9
		angle_constraint 27
		length 20 
		tip_mass 5
	}
}
//root
$jigglebone "Mane02" {
	is_flexible {
		yaw_stiffness 40
		yaw_damping 9
		pitch_stiffness 40
		pitch_damping 9
		angle_constraint 27
		length 20 
		tip_mass 5
	}
}
$jigglebone "Mane03" {
	is_flexible {
		yaw_stiffness 40
		yaw_damping 5
		pitch_stiffness 40
		pitch_damping 9
		angle_constraint 40
		length 20 
		tip_mass 5
	}
}
$jigglebone "Mane03_tip" {
	is_flexible {
		yaw_stiffness 40
		yaw_damping 5
		pitch_stiffness 40
		pitch_damping 9
		angle_constraint 40
		length 20 
		tip_mass 5
	}
}

//root
$jigglebone "Mane04" {
	is_flexible {
		yaw_stiffness 40
		yaw_damping 9
		pitch_stiffness 40
		pitch_damping 9
		angle_constraint 27
		length 20 
		tip_mass 5
	}
}
$jigglebone "Mane05" {
	is_flexible {
		yaw_stiffness 40
		yaw_damping 5
		pitch_stiffness 40
		pitch_damping 9
		angle_constraint 40
		length 20 
		tip_mass 5
	}
}
//root
$jigglebone "Mane06" {
	is_flexible {
		yaw_stiffness 40
		yaw_damping 9
		pitch_stiffness 40
		pitch_damping 9
		angle_constraint 27
		length 20 
		tip_mass 5
	}
}
$jigglebone "Mane07" {
	is_flexible {
		yaw_stiffness 40
		yaw_damping 5
		pitch_stiffness 40
		pitch_damping 9
		angle_constraint 40
		length 20 
		tip_mass 5
	}
}
//root
$jigglebone "Tail01" {
	is_flexible {
		yaw_stiffness 40
		yaw_damping 9
		pitch_stiffness 40
		pitch_damping 9
		angle_constraint 27
		length 20 
		tip_mass 5
	}
}
$jigglebone "Tail02" {
	is_flexible {
		yaw_stiffness 40
		yaw_damping 5
		pitch_stiffness 40
		pitch_damping 9
		angle_constraint 40
		length 20 
		tip_mass 5
	}
}
$jigglebone "Tail03" {
	is_flexible {
		yaw_stiffness 40
		yaw_damping 9
		pitch_stiffness 40
		pitch_damping 9
		angle_constraint 30
		length 20 
		tip_mass 5
	}
}
$includemodel "ppm/pony_anims.mdl"
 
 