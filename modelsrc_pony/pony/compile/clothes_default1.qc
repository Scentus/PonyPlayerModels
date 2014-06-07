
 
$cd "C:\gmodDev\ponyMod\CurrentVersion\modelsrc_pony\pony"
$scale 0.42 //0.375 //invert: 2,380952380952381
$modelname "ppm/player_default_clothes1.mdl"
$model "default" "meshes\pony_default\ragdoll.smd"
   
///clothes
$bodygroup sHead
{
	blank
	studio "meshes\clothes\hat_aj.smd" 
	studio "meshes\clothes\hat_brae.smd" 
	studio "meshes\clothes\hat_trix.smd" 
	studio "meshes\clothes\headphones.smd" 
} 
$bodygroup sNeck
{
	blank 
	studio "meshes\clothes\scarf.smd" 
	studio "meshes\clothes\cape_trix.smd" 
	studio "meshes\clothes\tie.smd" 
	studio "meshes\clothes\bowtie.smd" 
}  
$bodygroup sBodyf
{
	blank
	studio "meshes\clothes\vest.smd" 
	studio "meshes\clothes\shirt.smd" 
	studio "meshes\clothes\hoodie.smd" 
	studio "meshes\clothes\badge_vba.smd" 
} 
$bodygroup sLegFL
{
	blank 
}
$bodygroup sLegFR
{
	blank 
}
$bodygroup sHoofFL
{
	blank 
}
$bodygroup sHoofFR
{
	blank 
} 
$bodygroup sEyes
{
	blank
	studio "meshes\clothes\googles_f.smd"  
	studio "meshes\clothes\googles_m.smd"  
	studio "meshes\clothes\shades_f.smd"  
	studio "meshes\clothes\shades_m.smd"  
	studio "meshes\clothes\mono_l.smd"  
	studio "meshes\clothes\mono_r.smd"  
	studio "meshes\clothes\eyepatch_l.smd"  
	studio "meshes\clothes\eyepatch_r.smd"  
}  

$scale 0.42 
  
$cdmaterials "models\ppm\clothes\" 
 
 
$sequence _noref "meshes\pony_default\ref_body_01.smd" fps 30.000000 
  
 