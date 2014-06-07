
 
$cd "C:\gmodDev\ponyMod\CurrentVersion\modelsrc_pony\pony"
$scale 0.42 //0.375 //invert: 2,380952380952381
$modelname "ppm/pony_anims.mdl"

$include "../macro/toolbox.qci" 
$include "../skeleton/pony_mature/main.qci"   
 
$poseparameter move_y -1.000000 1.000000
$poseparameter move_x -1.000000 1.000000
$poseparameter body_yaw -29.73 29.73
$poseparameter spine_yaw -30.71 30.71
$poseparameter head_yaw -90 90
$poseparameter head_pitch -20.00 23.00
$poseparameter head_roll -10.93 10.85
$poseparameter aim_yaw -78.77 77.56
$poseparameter aim_pitch -76.65 82.84
$poseparameter vertical_velocity -1.00 1.00
$poseparameter vehicle_steer -1.00 1.00
 
 
///////////////////////////////////////////////////////////
////////////////////////ANIMATIONS/////////////////////////
/////////////////////////////////////////////////////////// 
$animation mdldecompiler_delta.smd "anims\delta.smd" fps 30

 

$animation ZERO "anims\delta.smd" fps 30.000000 subtract mdldecompiler_delta.smd 0
$sequence ragdoll "anims\delta.smd" ACT_DIERAGDOLL 1 fps 30.00

$animation a_body_rot_z_lt "anims\pony_body_left" fps 30.000000 subtract mdldecompiler_delta.smd 0
$animation a_body_rot_z_rt "anims\pony_body_right" fps 30.000000 subtract mdldecompiler_delta.smd 0

$sequence body_rot_z {
  a_body_rot_z_lt ZERO a_body_rot_z_rt
  blendwidth 3
  blend body_yaw -20 20
  delta
  autoplay
  fps 30.00 
}


$animation a_head_rot_lt "anims\pony_head_lft2" fps 30.000000 subtract mdldecompiler_delta.smd 0
$animation a_head_rot_rt "anims\pony_head_rgt2" fps 30.000000 subtract mdldecompiler_delta.smd 0

$sequence head_rot_x {
  a_head_rot_rt ZERO a_head_rot_lt
  blendwidth 3
  blend head_yaw -90.0000 90.000000
  delta
  autoplay
  fps 30.00 
}

$animation a_head_rot_dwn "anims\pony_head_dwn" fps 30.000000 subtract mdldecompiler_delta.smd 0
$animation a_head_rot_up "anims\pony_head_up" fps 30.000000 subtract mdldecompiler_delta.smd 0

$sequence head_rot_y {
  a_head_rot_up ZERO a_head_rot_dwn
  blendwidth 3
  blend head_pitch -30.999992 40.000011
  delta
  autoplay
  fps 30.00 
}




//
$sequence idle_all_01 "anims\pony_idle" loop ACT_HL2MP_IDLE 2 fps 30.00 
$sequence idle_all_angry "anims\pony_idle_alarm" loop ACT_HL2MP_IDLE_ANGRY 1 fps 25.00
$sequence idle_all_cower "anims\pony_idle" loop ACT_HL2MP_IDLE_COWER 1 fps 1.00
$sequence idle_all_scared "anims\pony_idle" loop ACT_HL2MP_IDLE_SCARED 1 fps 25.00
//$sequence cidle_all "anims\pony_cidle" loop ACT_HL2MP_IDLE_CROUCH 1 fps 20.00
//$sequence swim_idle_all "anims\pony_swim_idle" loop ACT_HL2MP_IDLE_SWIM 1 fps 40.00
//$sequence sit "anims\pony_sit" loop ACT_HL2MP_SIT 1 fps 30.00
 
$animation pony_walk_sw "anims\walkframed/pony_trot_sw" walkframe 20 LX LY loop  fps 15.000000
$animation pony_walk_w "anims\walkframed/pony_trot_w" walkframe 20 LX LY loop  fps 15.000000
$animation pony_walk_nw "anims\walkframed/pony_trot_nw" walkframe 20 LX LY loop  fps 15.000000
$animation pony_walk_s "anims\walkframed/pony_trot_s" walkframe 20 LX LY loop  fps 15.000000
$animation pony_walk_n "anims\walkframed/pony_trot_n" walkframe 20 LX LY loop fps 15.000000
$animation pony_walk_se "anims\walkframed/pony_trot_se" walkframe 20 LX LY loop  fps 15.000000
$animation pony_walk_e "anims\walkframed/pony_trot_e" walkframe 20 LX LY loop  fps 15.000000
$animation pony_walk_ne "anims\walkframed/pony_trot_ne" walkframe 20 LX LY loop  fps 15.000000 
$animation pony_walk_c "anims\pony_trot_idle" walkframe 20 LX LY loop  fps 15.000000 

$animation pony_cwalk_sw "anims\walkframed/pony_cwalk_sw" walkframe 50 LX LY loop fps 30.000000
$animation pony_cwalk_w "anims\walkframed/pony_cwalk_w" walkframe 50 LX LY loop fps 30.000000
$animation pony_cwalk_nw "anims\walkframed/pony_cwalk_nw" walkframe 50 LX LY loop fps 30.000000
$animation pony_cwalk_s "anims\walkframed/pony_cwalk_s" walkframe 50 LX LY loop fps 30.000000
$animation pony_cwalk_n "anims\walkframed/pony_cwalk_n" walkframe 50 LX LY loop fps 30.000000
$animation pony_cwalk_se "anims\walkframed/pony_cwalk_se" walkframe 50 LX LY loop fps 30.000000
$animation pony_cwalk_e "anims\walkframed/pony_cwalk_e" walkframe 50 LX LY loop fps 30.000000
$animation pony_cwalk_ne "anims\walkframed/pony_cwalk_ne" walkframe 50 LX LY loop fps 30.000000 
$animation pony_cwalk_c "anims\pony_cidle" walkframe 50 LX LY loop fps 30.000000  

//$animation moveN "anims\anims/moveN" loop fps 20.000000

$animation pony_run_sw "anims\walkframed/pony_run_sw" loop LX LY fps 20.000000
$animation pony_run_w "anims\walkframed/pony_run_w" loop LX LY fps 20.000000
$animation pony_run_nw "anims\walkframed/pony_run_nw" loop LX LY fps 20.000000
$animation pony_run_s "anims\walkframed/pony_run_s" loop LX LY fps 20.000000
$animation pony_run_n "anims\walkframed/pony_run_n" loop LX LY fps 20.000000 
$animation pony_run_se "anims\walkframed/pony_run_se" loop LX LY fps 20.000000
$animation pony_run_e "anims\walkframed/pony_run_e" loop LX LY fps 20.000000
$animation pony_run_ne "anims\walkframed/pony_run_ne" loop LX LY fps 20.000000
$animation pony_run_c "anims\pony_idle" loop LX LY fps 20.000000 

$animation pony_swim_sw "anims\pony_swim_idle" loop fps 30.000000
$animation pony_swim_w "anims\pony_swim_idle" loop fps 30.000000
$animation pony_swim_nw "anims\pony_swim_nw" loop fps 30.000000
$animation pony_swim_s "anims\pony_swim_idle" loop fps 30.000000
$animation pony_swim_n "anims\pony_swim_n" loop fps 30.000000
$animation pony_swim_se "anims\pony_swim_idle" loop fps 30.000000
$animation pony_swim_e "anims\pony_swim_idle" loop fps 30.000000
$animation pony_swim_ne "anims\pony_swim_ne" loop fps 30.000000
$animation pony_swim_c "anims\pony_swim_idle" loop fps 30.000000 

//
$sequence gmod_breath_layer "anims\pony_idle" loop fps 25.00
$sequence gmod_breath_noclip_layer "anims\pony_swim_idle" loop ACT_GMOD_NOCLIP_LAYER 1 fps 25.00
$scale 0.6
$sequence gmod_jump_delta "anims\pony_fly_idle" fps 30.00
$scale 0.42
$sequence jump_land "anims\pony_jump_land_new" ACT_LAND 1 fps 70.00

//
  



///////////////////////////////////////////////////////////
/////////////////////////SEQUENCES/////////////////////////
///////////////////////////////////////////////////////////
////CONTAINS////
//IDLE SEQ	(ACT_HL2MP_IDLE_*)
//IDLE CROUCH SEQ	(ACT_HL2MP_IDLE_CROUCH_*)
//JUMP SEQ	(ACT_HL2MP_JUMP_*)
//WALK SEQ	(ACT_HL2MP_WALK_*)
//WALK CROUCH SEQ	(ACT_HL2MP_WALK_CROUCH_*)
//RUN SEQ	(ACT_HL2MP_RUN_*)
//SWIM IDLE SEQ	(ACT_HL2MP_SWIM_IDLE_*)
//SWIM SEQ	(ACT_HL2MP_SWIM_*)
//SIT SEQ	(ACT_HL2MP_SIT_*)






/////////////////////////////////////////////////////////////////////////////////////
//IDLE SEQ	(ACT_HL2MP_IDLE_*)
$crtidlers idle_mp "anims/pony_idle" ACT_HL2MP_IDLE 30.00
$crtidlers idle "anims/pony_idle" ACT_IDLE 30.00
 
 
/////////////////////////////////////////////////////////////////////////////////////
//IDLE CROUCH SEQ	(ACT_HL2MP_IDLE_CROUCH_*)
$crtidlers cidle_mp anims/pony_cidle ACT_HL2MP_IDLE_CROUCH 30.00
$crtidlers cidle anims/pony_cidle ACT_IDLE_CROUCH 30.00
  
/////////////////////////////////////////////////////////////////////////////////////
//SWIM IDLE SEQ	(ACT_HL2MP_SWIM_IDLE_*)
 
$crtidlers swim_idle_mp anims/pony_swim_idle ACT_HL2MP_SWIM_IDLE 30.00
$crtidlers swim_idle anims/pony_swim_idle ACT_SWIM_IDLE 30.00
 
/////////////////////////////////////////////////////////////////////////////////////
//JUMP SEQ	(ACT_HL2MP_JUMP_*)
$crtidlers jump_mp anims/pony_jump ACT_HL2MP_JUMP 30.00
$crtidlers jump anims/pony_jump ACT_JUMP 30.00
 
/////////////////////////////////////////////////////////////////////////////////////
//SIT SEQ	(ACT_HL2MP_SIT_*)

$crtidlers sit_mp anims/pony_sit ACT_HL2MP_SIT 30.00
$crtidlers sit anims/pony_sit ACT_SIT 30.00
 
/////////////////////////////////////////////////////////////////////////////////////
//WALK SEQ	(ACT_HL2MP_WALK_*)
 
$crtmoves walk_mp pony_walk ACT_HL2MP_WALK 15.00
$crtmoves walk pony_walk ACT_WALK 15.00
 
/////////////////////////////////////////////////////////////////////////////////////
//WALK CROUCH SEQ	(ACT_HL2MP_WALK_CROUCH_*)

$crtmoves cwalk_mp pony_cwalk ACT_HL2MP_WALK_CROUCH 15.00
$crtmoves cwalk pony_cwalk ACT_WALK_CROUCH 15.00
 
/////////////////////////////////////////////////////////////////////////////////////
//RUN SEQ	(ACT_HL2MP_RUN_*)

$crtmoves run_mp pony_run ACT_HL2MP_RUN 20.00
$crtmoves run pony_run ACT_RUN 20.00

/////////////////////////////////////////////////////////////////////////////////////
//SWIM SEQ	(ACT_HL2MP_SWIM_*)

$crtmoves swim_mp pony_swim ACT_HL2MP_SWIM 30.00
$crtmoves swim pony_swim ACT_SWIM 30.00
 

$animation pony_sit "anims/pony_sit"

$sequence sit_rollercoaster  {
	pony_sit pony_sit pony_sit
	blendwidth 3
	ACT_GMOD_SIT_ROLLERCOASTER 1 
	fps 30.00
	blend vertical_velocity -1.000000 1.000000
	blend vertical_velocity -1.000000 1.000000
}
//$animation drive_airboat_left "drive_airboat_left" loop fps 30.000000
//$animation drive_airboat_center "drive_airboat_center" loop fps 30.000000
//$animation drive_airboat_right "drive_airboat_right" loop fps 30.000000
 
$sequence drive_airboat  {
	pony_sit pony_sit pony_sit
	blendwidth 3
	ACT_DRIVE_AIRBOAT 1 
	fps 30.00
	blend vehicle_steer -1.000000 1.000000
	blend vehicle_steer -1.000000 1.000000
}
//$animation drive_jeep_left "drive_jeep_left" loop fps 30.000000
//$animation drive_jeep_center "drive_jeep_center" loop fps 30.000000
//$animation drive_jeep_right "drive_jeep_right" loop fps 30.000000
$sequence drive_jeep  {
	pony_sit pony_sit pony_sit
	blendwidth 3
	ACT_DRIVE_JEEP 1 
	fps 30.00
	blend vehicle_steer -1.000000 1.000000
	blend vehicle_steer -1.000000 1.000000
} 
/////////////////////////////////////////////////////////////////////////////////////

 