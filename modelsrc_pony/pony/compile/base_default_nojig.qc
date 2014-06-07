
 
$cd "C:\gmodDev\ponyMod\CurrentVersion\modelsrc_pony\pony"
$scale 0.42 //0.375 //invert: 2,380952380952381
$modelname "ppm/player_default_base_nj.mdl"
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

$Weightlist NoheadBlend {
	"LrigNeck1" 0.5
	"LrigNeck2" 0.2
	"LrigNeck3" 0.1
	"LrigScull" 0
}

$animation delta.smd "meshes\pony_default\delta.smd" fps 30.000000 
$animation ref.smd "meshes\pony_default\ref_body_01.smd" fps 30.000000 
$animation DECL "meshes\pony_default\ref_body_01.smd" fps 30.000000 subtract delta.smd 0
$animation ZERO "meshes\pony_default\delta.smd" fps 30.000000 subtract delta.smd 0 weightlist NoheadBlend 
$sequence DECLs { 
	delta 
	DECL ZERO 
	autoplay 
	blend height_test 0 1
	fps 30.00 
	hidden
} 


$scale 1
   
$includemodel "ppm/pony_anims.mdl" 
 
 