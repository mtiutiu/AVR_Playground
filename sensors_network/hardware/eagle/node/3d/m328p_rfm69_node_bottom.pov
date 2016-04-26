//POVRay-File created by 3d41.ulp v20110101
///home/mtiutiu/Work/AVR_Playground/sensors_network/hardware/eagle/node/m328p_rfm69_node.brd
//4/26/16 6:05 PM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 3;
#declare pin_short = on;

#declare e3d_environment = on;

#local cam_x = 0;
#local cam_y = 209;
#local cam_z = -95;
#local cam_a = 25;
#local cam_look_x = 0;
#local cam_look_y = -4;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 45;
#local pcb_rotate_z = 180;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 24;
#local lgt1_pos_y = 37;
#local lgt1_pos_z = 22;
#local lgt1_intense = 0.738997;
#local lgt2_pos_x = -24;
#local lgt2_pos_y = 37;
#local lgt2_pos_z = 22;
#local lgt2_intense = 0.738997;
#local lgt3_pos_x = 24;
#local lgt3_pos_y = 37;
#local lgt3_pos_z = -14;
#local lgt3_intense = 0.738997;
#local lgt4_pos_x = -24;
#local lgt4_pos_y = 37;
#local lgt4_pos_z = -14;
#local lgt4_intense = 0.738997;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 65.532000;
#declare pcb_y_size = 41.656000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(1001);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_table.inc"
#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-32.766000,0,-20.828000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro M328P_RFM69_NODE(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
//Board
box{<65.532000,0,41.656000><0.000000,-1.500000,0.000000> texture{col_brd}}

//Holes(real)/Parts
//Holes(real)/Board
cylinder{<2.032000,1,39.624000><2.032000,-5,39.624000>1.500000 texture{col_hls}}
cylinder{<2.032000,1,2.032000><2.032000,-5,2.032000>1.500000 texture{col_hls}}
cylinder{<63.500000,1,2.032000><63.500000,-5,2.032000>1.500000 texture{col_hls}}
cylinder{<63.500000,1,39.624000><63.500000,-5,39.624000>1.500000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<21.336000,0.000000,16.764000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C1 100n 0805
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<48.768000,0.000000,16.256000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C2 10uF EIA3528
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<23.876000,0.000000,11.938000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C4 100n 0805
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<52.832000,0.000000,33.528000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C5 100n 0805
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<52.578000,0.000000,36.576000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C6 10uF EIA3528
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<39.624000,0.000000,11.430000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C7 100n 0805
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<7.366000,0.000000,18.542000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C8 47uF EIA3528
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<18.034000,0.000000,16.256000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C9 47uF EIA3528
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<39.624000,0.000000,13.716000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C10 100n 0805
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<13.462000,0.000000,13.970000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C11 100n 0805
#ifndef(pack_C12) #declare global_pack_C12=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<23.876000,0.000000,13.970000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C12 100n 0805
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_LED_SMD_SIDE(Green,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<43.434000,0.000000,16.002000>}#end		//Diskrete 3MM LED D1 ACTIVITY LED-0603
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_SMD_TSSOP8("L6920","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.462000,0.000000,19.304000>translate<0,0.035000,0> }#end		//TSSOP8 IC2 L6920 TSSOP8
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<21.082000,0.000000,4.064000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP2 HTU21D 1X04
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_PH_2X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<18.288000,0.000000,31.242000>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) JP3 ISP 2X3-NS
#ifndef(pack_JP4) #declare global_pack_JP4=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<21.082000,0.000000,6.858000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP4 OTHER 1X04
#ifndef(pack_JP5) #declare global_pack_JP5=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<42.164000,0.000000,6.858000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP5 OTHER 1X04
#ifndef(pack_JP6) #declare global_pack_JP6=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<42.164000,0.000000,4.064000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP6 OTHER 1X04
#ifndef(pack_JP7) #declare global_pack_JP7=yes; object {CON_PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<6.858000,0.000000,22.606000>}#end		//Header 2,54mm Grid 2Pin 1Row (jumper.lib) JP7 Ammeter probe 1X02
#ifndef(pack_L1) #declare global_pack_L1=yes; object {SPC_L_MURATA_2012_LQH3C("10uH",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<7.112000,0.000000,13.716000>}#end		//Inductor MURATA Chip Coil L1 10uH DLJ-4018
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<50.546000,0.000000,23.622000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 100K 0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<50.546000,0.000000,20.320000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R2 100K 0805
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<20.066000,0.000000,24.384000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R3 10K 0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<31.750000,0.000000,3.556000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 10K 0805
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0805("681",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<43.434000,0.000000,12.446000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R5 680 0805
#ifndef(pack_RB1) #declare global_pack_RB1=yes; object {RES_SMD_CHIP_0805("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<53.594000,0.000000,16.510000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB1 470 0805
#ifndef(pack_RB2) #declare global_pack_RB2=yes; object {RES_SMD_CHIP_0805("331",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<53.594000,0.000000,23.114000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB2 330 0805
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ2 VB_EN_DIS
#ifndef(pack_U1) #declare global_pack_U1=yes; object {QFP_TQFP_32_080MM("M328P","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<31.496000,0.000000,11.176000>translate<0,0.035000,0> }#end		//TQFP-32 U1 M328P TQFP32-08
#ifndef(pack_U2) #declare global_pack_U2=yes; object {RFM69HW_SMD("RFM69W",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<34.798000,0.000000,28.956000>}#end		//RFM69HW SMD U2 RFM69W RFM69W
#ifndef(pack_Y1) #declare global_pack_Y1=yes; object {RESONATOR_SMD("8MHz",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<37.338000,0.000000,17.780000>}#end		//RESONATOR SMD Y1 8MHz RESONATOR-SMD_MED
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<56.388000,0,33.274000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<49.276000,0,33.274000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<6.096000,0,33.274000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.208000,0,33.274000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<6.096000,0,8.382000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<13.208000,0,8.382000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<56.388000,0,8.382000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<49.276000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.336000,0.000000,17.664000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.336000,0.000000,15.864000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<50.418000,0.000000,16.256000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<47.118000,0.000000,16.256000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.976000,0.000000,11.938000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<24.776000,0.000000,11.938000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.932000,0.000000,33.528000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<53.732000,0.000000,33.528000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<50.928000,0.000000,36.576000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<54.228000,0.000000,36.576000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<40.524000,0.000000,11.430000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.724000,0.000000,11.430000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<5.716000,0.000000,18.542000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<9.016000,0.000000,18.542000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.034000,0.000000,17.906000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.034000,0.000000,14.606000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<40.524000,0.000000,13.716000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.724000,0.000000,13.716000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<13.462000,0.000000,14.870000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<13.462000,0.000000,13.070000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.976000,0.000000,13.970000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<24.776000,0.000000,13.970000>}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<61.722000,0,27.482000> texture{col_thl}}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<61.722000,0,14.682000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,30) rotate<0,-0.000000,0> texture{col_pds} translate<43.434000,0.000000,15.125000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,30) rotate<0,-0.000000,0> texture{col_pds} translate<43.434000,0.000000,16.879000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.487000,0.000000,16.404000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.137000,0.000000,16.404000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.787000,0.000000,16.404000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.437000,0.000000,16.404000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.437000,0.000000,22.204000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.787000,0.000000,22.204000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.137000,0.000000,22.204000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.487000,0.000000,22.204000>}
object{TOOLS_PCB_SMD(3.900000,2.400000,0.037000,25) rotate<0,-0.000000,0> texture{col_pds} translate<9.398000,0.000000,39.370000>}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<17.272000,0,4.064000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<19.812000,0,4.064000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<22.352000,0,4.064000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<24.892000,0,4.064000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<19.558000,0,28.702000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.018000,0,28.702000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<19.558000,0,31.242000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.018000,0,31.242000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<19.558000,0,33.782000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.018000,0,33.782000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<17.272000,0,6.858000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<19.812000,0,6.858000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<22.352000,0,6.858000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<24.892000,0,6.858000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<38.354000,0,6.858000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<40.894000,0,6.858000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<43.434000,0,6.858000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<45.974000,0,6.858000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<38.354000,0,4.064000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<40.894000,0,4.064000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<43.434000,0,4.064000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<45.974000,0,4.064000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-270.000000,0>translate<8.128000,0,22.606000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-270.000000,0>translate<5.588000,0,22.606000> texture{col_thl}}
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.612000,0.000000,13.716000>}
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.612000,0.000000,13.716000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<51.446000,0.000000,23.622000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<49.646000,0.000000,23.622000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<49.646000,0.000000,20.320000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.446000,0.000000,20.320000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.966000,0.000000,24.384000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.166000,0.000000,24.384000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<31.750000,0.000000,4.456000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<31.750000,0.000000,2.656000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.434000,0.000000,11.546000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.434000,0.000000,13.346000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.594000,0.000000,15.610000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.594000,0.000000,17.410000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.594000,0.000000,22.214000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.594000,0.000000,24.014000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.050000,0.000000,21.590000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.526000,0.000000,21.590000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<39.751000,-1.537000,17.128000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<38.481000,-1.537000,17.128000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<37.211000,-1.537000,17.128000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.941000,-1.537000,17.128000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<34.671000,-1.537000,17.128000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<33.401000,-1.537000,17.128000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.131000,-1.537000,17.128000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<30.861000,-1.537000,17.128000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<30.861000,-1.537000,24.528000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.131000,-1.537000,24.528000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<33.401000,-1.537000,24.528000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<34.671000,-1.537000,24.528000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.941000,-1.537000,24.528000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<37.211000,-1.537000,24.528000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<38.481000,-1.537000,24.528000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<39.751000,-1.537000,24.528000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.788600,0.000000,8.376000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.788600,0.000000,9.176000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.788600,0.000000,9.976000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.788600,0.000000,10.776000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.788600,0.000000,11.576000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.788600,0.000000,12.376000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.788600,0.000000,13.176000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.788600,0.000000,13.976000>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.296000,0.000000,15.468600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.496000,0.000000,15.468600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.696000,0.000000,15.468600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.896000,0.000000,15.468600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.096000,0.000000,15.468600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.296000,0.000000,15.468600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.496000,0.000000,15.468600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.696000,0.000000,15.468600>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.203400,0.000000,13.976000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.203400,0.000000,13.176000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.203400,0.000000,12.376000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.203400,0.000000,11.576000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.203400,0.000000,10.776000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.203400,0.000000,9.976000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.203400,0.000000,9.176000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.203400,0.000000,8.376000>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.696000,0.000000,6.883400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.496000,0.000000,6.883400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.296000,0.000000,6.883400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.096000,0.000000,6.883400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.896000,0.000000,6.883400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.696000,0.000000,6.883400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.496000,0.000000,6.883400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.296000,0.000000,6.883400>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.648000,0.000000,21.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.648000,0.000000,23.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.648000,0.000000,25.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.648000,0.000000,27.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.648000,0.000000,29.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.648000,0.000000,31.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.648000,0.000000,33.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.648000,0.000000,35.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.948000,0.000000,35.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.948000,0.000000,33.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.948000,0.000000,31.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.948000,0.000000,29.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.948000,0.000000,27.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.948000,0.000000,25.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.948000,0.000000,23.956000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.948000,0.000000,21.956000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.838000,0.000000,17.780000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.338000,0.000000,17.780000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.838000,0.000000,17.780000>}
//Pads/Vias
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<28.956000,0,12.192000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<16.510000,0,23.876000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<26.924000,0,6.858000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<28.956000,0,9.652000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<28.702000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<34.544000,0,21.844000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<34.290000,0,13.970000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<33.020000,0,13.462000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<31.750000,0,13.462000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<30.480000,0,13.970000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<30.734000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<43.434000,0,10.160000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<36.068000,0,27.178000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<36.068000,0,6.858000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<48.006000,0,23.876000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<28.188000,0,20.072000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<28.194000,0,27.940000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<29.242000,0,21.812000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<29.210000,0,25.908000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<32.004000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<32.004000,0,21.844000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<27.178000,0,15.748000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.794000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.794000,0.000000,33.020000>}
box{<0,0,-0.304800><25.908000,0.035000,0.304800> rotate<0,90.000000,0> translate<2.794000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.794000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.826000,0.000000,35.814000>}
box{<0,0,-0.304800><3.454774,0.035000,0.304800> rotate<0,-53.969065,0> translate<2.794000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.794000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.588000,0.000000,4.318000>}
box{<0,0,-0.304800><3.951313,0.035000,0.304800> rotate<0,44.997030,0> translate<2.794000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<5.588000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<5.588000,0.000000,32.766000>}
box{<0,0,-0.635000><10.160000,0.035000,0.635000> rotate<0,90.000000,0> translate<5.588000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.612000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.716000,0.000000,18.542000>}
box{<0,0,-0.406400><4.827120,0.035000,0.406400> rotate<0,-88.759612,0> translate<5.612000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.716000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.716000,0.000000,20.194000>}
box{<0,0,-0.406400><1.652000,0.035000,0.406400> rotate<0,90.000000,0> translate<5.716000,0.000000,20.194000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<5.588000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<6.096000,0.000000,33.274000>}
box{<0,0,-0.635000><0.718420,0.035000,0.635000> rotate<0,-44.997030,0> translate<5.588000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<7.620000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<7.620000,0.000000,14.708000>}
box{<0,0,-0.228600><5.358000,0.035000,0.228600> rotate<0,-90.000000,0> translate<7.620000,0.000000,14.708000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.716000,0.000000,20.194000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.128000,0.000000,22.606000>}
box{<0,0,-0.406400><3.411083,0.035000,0.406400> rotate<0,-44.997030,0> translate<5.716000,0.000000,20.194000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.096000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.382000,0.000000,8.382000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,0.000000,0> translate<6.096000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<7.620000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<8.565000,0.000000,21.011000>}
box{<0,0,-0.228600><1.336432,0.035000,0.228600> rotate<0,-44.997030,0> translate<7.620000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<7.620000,0.000000,14.708000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<8.612000,0.000000,13.716000>}
box{<0,0,-0.228600><1.402900,0.035000,0.228600> rotate<0,44.997030,0> translate<7.620000,0.000000,14.708000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.128000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.398000,-1.535000,23.876000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.128000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<9.016000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<11.176000,0.000000,18.542000>}
box{<0,0,-0.228600><2.160000,0.035000,0.228600> rotate<0,0.000000,0> translate<9.016000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.176000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.176000,0.000000,18.542000>}
box{<0,0,-0.304800><4.064000,0.035000,0.304800> rotate<0,90.000000,0> translate<11.176000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<11.176000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<11.938000,0.000000,18.542000>}
box{<0,0,-0.228600><0.762000,0.035000,0.228600> rotate<0,0.000000,0> translate<11.176000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.487000,0.000000,16.404000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.487000,0.000000,17.567000>}
box{<0,0,-0.203200><1.163000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.487000,0.000000,17.567000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.487000,0.000000,22.204000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.487000,0.000000,23.155000>}
box{<0,0,-0.203200><0.951000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.487000,0.000000,23.155000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.176000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.584000,0.000000,13.070000>}
box{<0,0,-0.304800><1.991213,0.035000,0.304800> rotate<0,44.997030,0> translate<11.176000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.487000,0.000000,17.567000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,17.780000>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.487000,0.000000,17.567000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.487000,0.000000,23.155000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,23.368000>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.487000,0.000000,23.155000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.382000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.816000,0.000000,12.816000>}
box{<0,0,-0.406400><6.270623,0.035000,0.406400> rotate<0,-44.997030,0> translate<8.382000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.816000,0.000000,13.070000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.816000,0.000000,12.816000>}
box{<0,0,-0.406400><0.254000,0.035000,0.406400> rotate<0,-90.000000,0> translate<12.816000,0.000000,12.816000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.584000,0.000000,13.070000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.816000,0.000000,13.070000>}
box{<0,0,-0.406400><0.232000,0.035000,0.406400> rotate<0,0.000000,0> translate<12.584000,0.000000,13.070000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<8.565000,0.000000,21.011000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<13.137000,0.000000,21.011000>}
box{<0,0,-0.228600><4.572000,0.035000,0.228600> rotate<0,0.000000,0> translate<8.565000,0.000000,21.011000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<13.137000,0.000000,22.204000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<13.137000,0.000000,21.011000>}
box{<0,0,-0.228600><1.193000,0.035000,0.228600> rotate<0,-90.000000,0> translate<13.137000,0.000000,21.011000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.816000,0.000000,13.070000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.462000,0.000000,13.070000>}
box{<0,0,-0.406400><0.646000,0.035000,0.406400> rotate<0,0.000000,0> translate<12.816000,0.000000,13.070000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.462000,0.000000,14.870000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.578000,0.000000,14.986000>}
box{<0,0,-0.203200><0.164049,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.462000,0.000000,14.870000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<11.938000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<13.787000,0.000000,20.391000>}
box{<0,0,-0.228600><2.614881,0.035000,0.228600> rotate<0,-44.997030,0> translate<11.938000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<13.787000,0.000000,22.204000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<13.787000,0.000000,20.391000>}
box{<0,0,-0.228600><1.813000,0.035000,0.228600> rotate<0,-90.000000,0> translate<13.787000,0.000000,20.391000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.578000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,14.986000>}
box{<0,0,-0.203200><0.646000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.578000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,23.368000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.700000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.437000,0.000000,15.199000>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.224000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.437000,0.000000,16.404000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.437000,0.000000,15.199000>}
box{<0,0,-0.203200><1.205000,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.437000,0.000000,15.199000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.437000,0.000000,23.155000>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,44.997030,0> translate<14.224000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.437000,0.000000,22.204000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.437000,0.000000,23.155000>}
box{<0,0,-0.203200><0.951000,0.035000,0.203200> rotate<0,90.000000,0> translate<14.437000,0.000000,23.155000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.437000,0.000000,26.629000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.437000,0.000000,23.155000>}
box{<0,0,-0.304800><3.474000,0.035000,0.304800> rotate<0,-90.000000,0> translate<14.437000,0.000000,23.155000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.826000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.732000,0.000000,35.814000>}
box{<0,0,-0.304800><9.906000,0.035000,0.304800> rotate<0,0.000000,0> translate<4.826000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.494000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.494000,0.000000,29.972000>}
box{<0,0,-0.304800><3.048000,0.035000,0.304800> rotate<0,-90.000000,0> translate<15.494000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.732000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.494000,0.000000,33.020000>}
box{<0,0,-0.304800><2.896046,0.035000,0.304800> rotate<0,74.739948,0> translate<14.732000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.462000,0.000000,13.070000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.736000,0.000000,13.070000>}
box{<0,0,-0.406400><2.274000,0.035000,0.406400> rotate<0,0.000000,0> translate<13.462000,0.000000,13.070000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.398000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,23.876000>}
box{<0,0,-0.304800><7.112000,0.035000,0.304800> rotate<0,0.000000,0> translate<9.398000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.398000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,39.370000>}
box{<0,0,-0.203200><7.366000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.398000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.588000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.018000,0.000000,4.318000>}
box{<0,0,-0.304800><11.430000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.588000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.437000,0.000000,26.629000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.018000,0.000000,28.702000>}
box{<0,0,-0.304800><3.310421,0.035000,0.304800> rotate<0,-38.768073,0> translate<14.437000,0.000000,26.629000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.494000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.018000,0.000000,28.702000>}
box{<0,0,-0.304800><1.983803,0.035000,0.304800> rotate<0,39.802944,0> translate<15.494000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.018000,0.000000,25.516000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.018000,0.000000,28.702000>}
box{<0,0,-0.304800><3.186000,0.035000,0.304800> rotate<0,90.000000,0> translate<17.018000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,2.794000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.272000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.018000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,4.064000>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,44.997030,0> translate<17.018000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,6.858000>}
box{<0,0,-0.304800><2.794000,0.035000,0.304800> rotate<0,90.000000,0> translate<17.272000,0.000000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.018000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.272000,0.000000,29.210000>}
box{<0,0,-0.203200><0.567961,0.035000,0.203200> rotate<0,-63.430762,0> translate<17.018000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.526000,0.000000,22.860000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<16.510000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.526000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.526000,0.000000,22.860000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<17.526000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.908000,0.000000,17.780000>}
box{<0,0,-0.203200><5.208000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.700000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.034000,0.000000,2.032000>}
box{<0,0,-0.304800><1.077631,0.035000,0.304800> rotate<0,44.997030,0> translate<17.272000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.736000,0.000000,13.070000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.034000,0.000000,14.606000>}
box{<0,0,-0.406400><2.764073,0.035000,0.406400> rotate<0,-33.756829,0> translate<15.736000,0.000000,13.070000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.908000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,0.000000,17.906000>}
box{<0,0,-0.203200><0.178191,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.908000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.034000,0.000000,17.906000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.288000,0.000000,17.652000>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,44.997030,0> translate<18.034000,0.000000,17.906000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.288000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.288000,0.000000,27.178000>}
box{<0,0,-0.152400><2.794000,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.288000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.018000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.288000,0.000000,29.972000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<17.018000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.018000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.288000,0.000000,32.512000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<17.018000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.034000,0.000000,17.906000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,0.000000,18.922000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,-44.997030,0> translate<18.034000,0.000000,17.906000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,0.000000,18.922000>}
box{<0,0,-0.304800><2.668000,0.035000,0.304800> rotate<0,-90.000000,0> translate<19.050000,0.000000,18.922000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.166000,0.000000,21.706000>}
box{<0,0,-0.304800><0.164049,0.035000,0.304800> rotate<0,-44.997030,0> translate<19.050000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.166000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.166000,0.000000,21.706000>}
box{<0,0,-0.304800><2.678000,0.035000,0.304800> rotate<0,-90.000000,0> translate<19.166000,0.000000,21.706000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.018000,0.000000,25.516000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.166000,0.000000,24.384000>}
box{<0,0,-0.304800><2.428030,0.035000,0.304800> rotate<0,27.787480,0> translate<17.018000,0.000000,25.516000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.812000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.812000,0.000000,4.064000>}
box{<0,0,-0.406400><2.794000,0.035000,0.406400> rotate<0,-90.000000,0> translate<19.812000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.288000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.828000,0.000000,25.908000>}
box{<0,0,-0.152400><2.839806,0.035000,0.152400> rotate<0,26.563298,0> translate<18.288000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.288000,0.000000,17.652000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.094000,0.000000,17.652000>}
box{<0,0,-0.304800><2.806000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.288000,0.000000,17.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.966000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.220000,0.000000,23.956000>}
box{<0,0,-0.203200><0.497695,0.035000,0.203200> rotate<0,59.308737,0> translate<20.966000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.558000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.320000,0.000000,27.956000>}
box{<0,0,-0.203200><1.913416,0.035000,0.203200> rotate<0,22.945436,0> translate<19.558000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.336000,0.000000,15.864000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.336000,0.000000,14.860000>}
box{<0,0,-0.406400><1.004000,0.035000,0.406400> rotate<0,-90.000000,0> translate<21.336000,0.000000,14.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.094000,0.000000,17.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,0.000000,17.664000>}
box{<0,0,-0.203200><0.242297,0.035000,0.203200> rotate<0,-2.838600,0> translate<21.094000,0.000000,17.652000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.336000,0.000000,17.664000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.452000,0.000000,17.780000>}
box{<0,0,-0.304800><0.164049,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.336000,0.000000,17.664000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.034000,0.000000,14.606000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,0.000000,14.606000>}
box{<0,0,-0.406400><3.556000,0.035000,0.406400> rotate<0,0.000000,0> translate<18.034000,0.000000,14.606000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,0.000000,14.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,14.606000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<21.336000,0.000000,14.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.558000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,0.000000,29.972000>}
box{<0,0,-0.203200><2.615090,0.035000,0.203200> rotate<0,29.052687,0> translate<19.558000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.288000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.844000,0.000000,32.512000>}
box{<0,0,-0.152400><3.556000,0.035000,0.152400> rotate<0,0.000000,0> translate<18.288000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.178000,0.000000,33.956000>}
box{<0,0,-0.203200><7.656552,0.035000,0.203200> rotate<0,44.997030,0> translate<16.764000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.452000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.606000,0.000000,17.780000>}
box{<0,0,-0.304800><1.154000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.452000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.664000,0.000000,14.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.664000,0.000000,14.536000>}
box{<0,0,-0.203200><0.070000,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.664000,0.000000,14.536000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,0.000000,14.606000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.664000,0.000000,14.606000>}
box{<0,0,-0.406400><1.074000,0.035000,0.406400> rotate<0,0.000000,0> translate<21.590000,0.000000,14.606000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,6.858000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.352000,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.844000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,0.000000,32.004000>}
box{<0,0,-0.152400><1.135923,0.035000,0.152400> rotate<0,26.563298,0> translate<21.844000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.812000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.976000,0.000000,10.022000>}
box{<0,0,-0.406400><4.474572,0.035000,0.406400> rotate<0,-44.997030,0> translate<19.812000,0.000000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.976000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.976000,0.000000,10.022000>}
box{<0,0,-0.406400><0.138000,0.035000,0.406400> rotate<0,-90.000000,0> translate<22.976000,0.000000,10.022000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.976000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.976000,0.000000,10.160000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,-90.000000,0> translate<22.976000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.976000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.976000,0.000000,11.938000>}
box{<0,0,-0.406400><2.032000,0.035000,0.406400> rotate<0,-90.000000,0> translate<22.976000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.664000,0.000000,14.536000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.976000,0.000000,14.224000>}
box{<0,0,-0.406400><0.441235,0.035000,0.406400> rotate<0,44.997030,0> translate<22.664000,0.000000,14.536000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.976000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.976000,0.000000,14.224000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.976000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,0.000000,5.334000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.352000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,5.588000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<22.860000,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.606000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.776000,0.000000,15.610000>}
box{<0,0,-0.304800><3.068843,0.035000,0.304800> rotate<0,44.997030,0> translate<22.606000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.776000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.776000,0.000000,15.610000>}
box{<0,0,-0.304800><1.640000,0.035000,0.304800> rotate<0,90.000000,0> translate<24.776000,0.000000,15.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,0.000000,6.858000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.892000,0.000000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.828000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.900000,0.000000,25.908000>}
box{<0,0,-0.152400><4.072000,0.035000,0.152400> rotate<0,0.000000,0> translate<20.828000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.900000,0.000000,32.004000>}
box{<0,0,-0.152400><2.040000,0.035000,0.152400> rotate<0,0.000000,0> translate<22.860000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.932000,0.000000,29.972000>}
box{<0,0,-0.203200><3.088000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.844000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.220000,0.000000,23.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.948000,0.000000,23.956000>}
box{<0,0,-0.203200><3.728000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.220000,0.000000,23.956000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.900000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.948000,0.000000,25.956000>}
box{<0,0,-0.152400><0.067882,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.900000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.320000,0.000000,27.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.948000,0.000000,27.956000>}
box{<0,0,-0.203200><3.628000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.320000,0.000000,27.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.932000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.948000,0.000000,29.956000>}
box{<0,0,-0.203200><0.022627,0.035000,0.203200> rotate<0,44.997030,0> translate<24.932000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.900000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.948000,0.000000,31.956000>}
box{<0,0,-0.152400><0.067882,0.035000,0.152400> rotate<0,44.997030,0> translate<24.900000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.178000,0.000000,33.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.948000,0.000000,33.956000>}
box{<0,0,-0.203200><2.770000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.178000,0.000000,33.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.948000,0.000000,27.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.964000,0.000000,27.940000>}
box{<0,0,-0.203200><0.022627,0.035000,0.203200> rotate<0,44.997030,0> translate<24.948000,0.000000,27.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.948000,0.000000,25.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.996000,0.000000,25.908000>}
box{<0,0,-0.203200><0.067882,0.035000,0.203200> rotate<0,44.997030,0> translate<24.948000,0.000000,25.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.948000,0.000000,31.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.996000,0.000000,32.004000>}
box{<0,0,-0.203200><0.067882,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.948000,0.000000,31.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.948000,0.000000,23.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.028000,0.000000,23.876000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,44.997030,0> translate<24.948000,0.000000,23.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.776000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.138000,0.000000,11.576000>}
box{<0,0,-0.203200><0.511945,0.035000,0.203200> rotate<0,44.997030,0> translate<24.776000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.976000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.146000,0.000000,10.160000>}
box{<0,0,-0.304800><2.170000,0.035000,0.304800> rotate<0,0.000000,0> translate<22.976000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.776000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.570000,0.000000,13.176000>}
box{<0,0,-0.304800><1.122886,0.035000,0.304800> rotate<0,44.997030,0> translate<24.776000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.146000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.762000,0.000000,10.776000>}
box{<0,0,-0.304800><0.871156,0.035000,0.304800> rotate<0,-44.997030,0> translate<25.146000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.232000,0.000000,9.976000>}
box{<0,0,-0.203200><1.895046,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.892000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.644600,-1.535000,7.391400>}
box{<0,0,-0.304800><19.350766,0.035000,0.304800> rotate<0,58.413277,0> translate<16.510000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.644600,-1.535000,7.391400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.924000,-1.535000,6.858000>}
box{<0,0,-0.304800><0.602146,0.035000,0.304800> rotate<0,62.349910,0> translate<26.644600,-1.535000,7.391400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.924000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.949400,0.000000,6.883400>}
box{<0,0,-0.304800><0.035921,0.035000,0.304800> rotate<0,-44.997030,0> translate<26.924000,0.000000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,14.001400>}
box{<0,0,-0.203200><1.746600,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.178000,0.000000,14.001400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.232000,0.000000,9.976000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.203400,0.000000,9.976000>}
box{<0,0,-0.203200><0.971400,0.035000,0.203200> rotate<0,0.000000,0> translate<26.232000,0.000000,9.976000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.762000,0.000000,10.776000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.203400,0.000000,10.776000>}
box{<0,0,-0.304800><1.441400,0.035000,0.304800> rotate<0,0.000000,0> translate<25.762000,0.000000,10.776000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.138000,0.000000,11.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.203400,0.000000,11.576000>}
box{<0,0,-0.203200><2.065400,0.035000,0.203200> rotate<0,0.000000,0> translate<25.138000,0.000000,11.576000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.570000,0.000000,13.176000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.203400,0.000000,13.176000>}
box{<0,0,-0.304800><1.633400,0.035000,0.304800> rotate<0,0.000000,0> translate<25.570000,0.000000,13.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,14.001400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.203400,0.000000,13.976000>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,44.997030,0> translate<27.178000,0.000000,14.001400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.203400,0.000000,13.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.235400,0.000000,13.208000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.203400,0.000000,13.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,5.588000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.130000,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,10.668000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.432000,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,6.096000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.432000,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,7.366000>}
box{<0,0,-0.203200><0.915810,0.035000,0.203200> rotate<0,56.306216,0> translate<27.432000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,7.366000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.940000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.203400,0.000000,9.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,9.176000>}
box{<0,0,-0.203200><0.768600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.203400,0.000000,9.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.948000,0.000000,35.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.052000,0.000000,35.956000>}
box{<0,0,-0.203200><3.104000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.948000,0.000000,35.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.188000,-1.535000,20.072000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.188000,-1.535000,27.934000>}
box{<0,0,-0.203200><7.862000,0.035000,0.203200> rotate<0,90.000000,0> translate<28.188000,-1.535000,27.934000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.964000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,27.940000>}
box{<0,0,-0.203200><3.230000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.964000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.188000,-1.535000,27.934000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,-1.535000,27.940000>}
box{<0,0,-0.203200><0.008485,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.188000,-1.535000,27.934000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,9.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,9.652000>}
box{<0,0,-0.203200><0.673166,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.972000,0.000000,9.176000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.949400,0.000000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.696000,0.000000,6.883400>}
box{<0,0,-0.304800><1.746600,0.035000,0.304800> rotate<0,0.000000,0> translate<26.949400,0.000000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.203400,0.000000,8.376000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.696000,0.000000,8.376000>}
box{<0,0,-0.203200><1.492600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.203400,0.000000,8.376000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.188000,0.000000,20.072000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.696000,0.000000,19.310000>}
box{<0,0,-0.203200><0.915810,0.035000,0.203200> rotate<0,56.306216,0> translate<28.188000,0.000000,20.072000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.696000,0.000000,15.468600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.696000,0.000000,19.310000>}
box{<0,0,-0.203200><3.841400,0.035000,0.203200> rotate<0,90.000000,0> translate<28.696000,0.000000,19.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.696000,0.000000,8.376000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.702000,0.000000,8.382000>}
box{<0,0,-0.203200><0.008485,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.696000,0.000000,8.376000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.996000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.702000,0.000000,32.004000>}
box{<0,0,-0.203200><3.706000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.996000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.948000,0.000000,29.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.718000,0.000000,29.956000>}
box{<0,0,-0.203200><3.770000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.948000,0.000000,29.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.203400,0.000000,12.376000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.772000,0.000000,12.376000>}
box{<0,0,-0.203200><1.568600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.203400,0.000000,12.376000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,0.000000,9.652000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.448000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,-1.535000,12.192000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.432000,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.772000,0.000000,12.376000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,0.000000,12.192000>}
box{<0,0,-0.203200><0.260215,0.035000,0.203200> rotate<0,44.997030,0> translate<28.772000,0.000000,12.376000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.702000,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,8.382000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.702000,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,9.652000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.956000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,21.844000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.210000,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.028000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,23.876000>}
box{<0,0,-0.203200><4.182000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.028000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.996000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,25.908000>}
box{<0,0,-0.203200><4.214000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.996000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.702000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,32.512000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.702000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,32.512000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.210000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.052000,0.000000,35.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,34.798000>}
box{<0,0,-0.203200><1.637659,0.035000,0.203200> rotate<0,44.997030,0> translate<28.052000,0.000000,35.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.242000,-1.535000,21.812000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,44.997030,0> translate<29.210000,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,4.064000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.892000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,6.915400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,7.620000>}
box{<0,0,-0.203200><0.704600,0.035000,0.203200> rotate<0,90.000000,0> translate<29.464000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.235400,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,13.208000>}
box{<0,0,-0.203200><2.228600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.235400,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,6.915400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.496000,0.000000,6.883400>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,44.997030,0> translate<29.464000,0.000000,6.915400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.242000,0.000000,21.812000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.496000,0.000000,21.558000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<29.242000,0.000000,21.812000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.496000,0.000000,15.468600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.496000,0.000000,21.558000>}
box{<0,0,-0.203200><6.089400,0.035000,0.203200> rotate<0,90.000000,0> translate<29.496000,0.000000,21.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,5.334000>}
box{<0,0,-0.203200><6.096000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.622000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,8.382000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.464000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.296000,0.000000,5.912000>}
box{<0,0,-0.203200><0.817415,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.718000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.296000,0.000000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.296000,0.000000,5.912000>}
box{<0,0,-0.203200><0.971400,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.296000,0.000000,5.912000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.296000,0.000000,22.790000>}
box{<0,0,-0.203200><1.535836,0.035000,0.203200> rotate<0,44.997030,0> translate<29.210000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.296000,0.000000,15.468600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.296000,0.000000,22.790000>}
box{<0,0,-0.203200><7.321400,0.035000,0.203200> rotate<0,90.000000,0> translate<30.296000,0.000000,22.790000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.203400,0.000000,10.776000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.372000,0.000000,10.776000>}
box{<0,0,-0.203200><3.168600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.203400,0.000000,10.776000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.550000,0.000000,12.376000>}
box{<0,0,-0.203200><1.368072,0.035000,0.203200> rotate<0,37.453766,0> translate<29.464000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.734000,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.734000,-1.535000,7.366000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.734000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.734000,0.000000,8.382000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.226000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.096000,0.000000,5.696000>}
box{<0,0,-0.203200><2.307997,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.464000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.096000,0.000000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.096000,0.000000,5.696000>}
box{<0,0,-0.203200><1.187400,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.096000,0.000000,5.696000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.096000,0.000000,14.586000>}
box{<0,0,-0.203200><0.871156,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.480000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.096000,0.000000,15.468600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.096000,0.000000,14.586000>}
box{<0,0,-0.203200><0.882600,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.096000,0.000000,14.586000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.372000,0.000000,10.776000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.172000,0.000000,11.576000>}
box{<0,0,-0.203200><1.131371,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.372000,0.000000,10.776000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.372000,0.000000,10.776000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.242000,0.000000,9.906000>}
box{<0,0,-0.203200><1.230366,0.035000,0.203200> rotate<0,44.997030,0> translate<30.372000,0.000000,10.776000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.242000,-1.535000,10.414000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.210000,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.034000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,0.000000,2.032000>}
box{<0,0,-0.304800><13.716000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.034000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,0.000000,2.656000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,0.000000,2.032000>}
box{<0,0,-0.304800><0.624000,0.035000,0.304800> rotate<0,-90.000000,0> translate<31.750000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,12.192000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.210000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,4.456000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.866000,0.000000,4.572000>}
box{<0,0,-0.203200><0.164049,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.750000,0.000000,4.456000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.866000,0.000000,6.853400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.866000,0.000000,4.572000>}
box{<0,0,-0.203200><2.281400,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.866000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.866000,0.000000,6.853400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.896000,0.000000,6.883400>}
box{<0,0,-0.203200><0.042426,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.866000,0.000000,6.853400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.896000,0.000000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.896000,0.000000,8.274000>}
box{<0,0,-0.203200><1.390600,0.035000,0.203200> rotate<0,90.000000,0> translate<31.896000,0.000000,8.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.896000,0.000000,13.608000>}
box{<0,0,-0.203200><0.206475,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.750000,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.896000,-1.535000,13.608000>}
box{<0,0,-0.203200><0.206475,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.750000,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.896000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.896000,-1.535000,13.608000>}
box{<0,0,-0.203200><0.616000,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.896000,-1.535000,13.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.896000,0.000000,15.468600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.896000,0.000000,13.608000>}
box{<0,0,-0.203200><1.860600,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.896000,0.000000,13.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.896000,0.000000,8.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,8.382000>}
box{<0,0,-0.203200><0.152735,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.896000,0.000000,8.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,21.844000>}
box{<0,0,-0.203200><7.775056,0.035000,0.203200> rotate<0,-51.629107,0> translate<27.178000,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.718000,0.000000,29.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,26.670000>}
box{<0,0,-0.203200><4.647106,0.035000,0.203200> rotate<0,44.997030,0> translate<28.718000,0.000000,29.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,26.670000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,90.000000,0> translate<32.004000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.131000,-1.535000,15.621000>}
box{<0,0,-0.203200><2.334867,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.480000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.131000,-1.535000,17.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.131000,-1.535000,15.621000>}
box{<0,0,-0.203200><1.507000,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.131000,-1.535000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.861000,-1.535000,24.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.131000,-1.535000,24.528000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.861000,-1.535000,24.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.696000,0.000000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.696000,0.000000,5.658000>}
box{<0,0,-0.203200><1.225400,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.696000,0.000000,5.658000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.696000,0.000000,15.468600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.696000,0.000000,14.294000>}
box{<0,0,-0.203200><1.174600,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.696000,0.000000,14.294000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,13.462000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.020000,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,13.462000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.020000,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.696000,0.000000,14.294000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,13.970000>}
box{<0,0,-0.203200><0.458205,0.035000,0.203200> rotate<0,44.997030,0> translate<32.696000,0.000000,14.294000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.558000,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,33.782000>}
box{<0,0,-0.203200><13.462000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.558000,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.896000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.401000,-1.535000,15.729000>}
box{<0,0,-0.203200><2.128391,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.896000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.401000,-1.535000,17.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.401000,-1.535000,15.729000>}
box{<0,0,-0.203200><1.399000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.401000,-1.535000,15.729000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.131000,-1.535000,24.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.401000,-1.535000,24.528000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.131000,-1.535000,24.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.496000,0.000000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.496000,0.000000,5.874000>}
box{<0,0,-0.203200><1.009400,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.496000,0.000000,5.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.496000,0.000000,15.468600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.496000,0.000000,14.764000>}
box{<0,0,-0.203200><0.704600,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.496000,0.000000,14.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.696000,0.000000,5.658000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,4.572000>}
box{<0,0,-0.203200><1.535836,0.035000,0.203200> rotate<0,44.997030,0> translate<32.696000,0.000000,5.658000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.496000,0.000000,5.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,5.588000>}
box{<0,0,-0.203200><0.404465,0.035000,0.203200> rotate<0,44.997030,0> translate<33.496000,0.000000,5.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.496000,0.000000,14.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,0.000000,13.970000>}
box{<0,0,-0.203200><1.122886,0.035000,0.203200> rotate<0,44.997030,0> translate<33.496000,0.000000,14.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.296000,0.000000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.296000,0.000000,6.852000>}
box{<0,0,-0.203200><0.031400,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.296000,0.000000,6.852000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.296000,0.000000,15.468600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.296000,0.000000,21.596000>}
box{<0,0,-0.203200><6.127400,0.035000,0.203200> rotate<0,90.000000,0> translate<34.296000,0.000000,21.596000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.296000,0.000000,21.596000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,21.844000>}
box{<0,0,-0.203200><0.350725,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.296000,0.000000,21.596000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.671000,-1.535000,15.875000>}
box{<0,0,-0.203200><2.334867,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.020000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.671000,-1.535000,17.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.671000,-1.535000,15.875000>}
box{<0,0,-0.203200><1.253000,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.671000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.401000,-1.535000,24.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.671000,-1.535000,24.528000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.401000,-1.535000,24.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,-1.535000,12.192000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.750000,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.242000,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,10.414000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.242000,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.306000,-1.535000,8.382000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.004000,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.242000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.718600,0.000000,9.906000>}
box{<0,0,-0.203200><4.476600,0.035000,0.203200> rotate<0,0.000000,0> translate<31.242000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.718600,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.788600,0.000000,9.976000>}
box{<0,0,-0.203200><0.098995,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.718600,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.172000,0.000000,11.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.788600,0.000000,11.576000>}
box{<0,0,-0.203200><4.616600,0.035000,0.203200> rotate<0,0.000000,0> translate<31.172000,0.000000,11.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.550000,0.000000,12.376000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.788600,0.000000,12.376000>}
box{<0,0,-0.203200><5.238600,0.035000,0.203200> rotate<0,0.000000,0> translate<30.550000,0.000000,12.376000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.788600,0.000000,13.976000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.788600,0.000000,17.730600>}
box{<0,0,-0.203200><3.754600,0.035000,0.203200> rotate<0,90.000000,0> translate<35.788600,0.000000,17.730600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.788600,0.000000,17.730600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.838000,0.000000,17.780000>}
box{<0,0,-0.203200><0.069862,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.788600,0.000000,17.730600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.941000,-1.535000,15.621000>}
box{<0,0,-0.203200><2.334867,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.290000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.941000,-1.535000,17.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.941000,-1.535000,15.621000>}
box{<0,0,-0.203200><1.507000,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.941000,-1.535000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.671000,-1.535000,24.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.941000,-1.535000,24.528000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.671000,-1.535000,24.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.941000,-1.535000,24.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.941000,-1.535000,27.051000>}
box{<0,0,-0.203200><2.523000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.941000,-1.535000,27.051000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.296000,0.000000,6.852000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.062000,0.000000,6.852000>}
box{<0,0,-0.203200><1.766000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.296000,0.000000,6.852000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.734000,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,-1.535000,2.032000>}
box{<0,0,-0.203200><7.543415,0.035000,0.203200> rotate<0,44.997030,0> translate<30.734000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.062000,0.000000,6.852000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,0.000000,6.858000>}
box{<0,0,-0.203200><0.008485,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.062000,0.000000,6.852000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.941000,-1.535000,27.051000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,-1.535000,27.178000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.941000,-1.535000,27.051000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.788600,0.000000,13.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.798000,0.000000,13.176000>}
box{<0,0,-0.203200><1.009400,0.035000,0.203200> rotate<0,0.000000,0> translate<35.788600,0.000000,13.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.788600,0.000000,8.376000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.836000,0.000000,8.376000>}
box{<0,0,-0.203200><1.047400,0.035000,0.203200> rotate<0,0.000000,0> translate<35.788600,0.000000,8.376000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.702000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084000,0.000000,32.004000>}
box{<0,0,-0.203200><8.382000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.702000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.211000,-1.535000,19.431000>}
box{<0,0,-0.203200><3.596590,0.035000,0.203200> rotate<0,42.134814,0> translate<34.544000,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.211000,-1.535000,17.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.211000,-1.535000,19.431000>}
box{<0,0,-0.203200><2.303000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.211000,-1.535000,19.431000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.941000,-1.535000,24.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.211000,-1.535000,24.528000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.941000,-1.535000,24.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.798000,0.000000,13.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,13.716000>}
box{<0,0,-0.203200><0.763675,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.798000,0.000000,13.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,15.240000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.338000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,27.178000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.068000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,27.178000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.338000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,31.750000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<37.084000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,31.750000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.338000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,36.068000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.338000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.788600,0.000000,12.376000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.384000,0.000000,12.376000>}
box{<0,0,-0.203200><1.595400,0.035000,0.203200> rotate<0,0.000000,0> translate<35.788600,0.000000,12.376000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.846000,0.000000,4.572000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.782000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.788600,0.000000,10.776000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.070000,0.000000,10.776000>}
box{<0,0,-0.203200><2.281400,0.035000,0.203200> rotate<0,0.000000,0> translate<35.788600,0.000000,10.776000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.846000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,4.064000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<37.846000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.836000,0.000000,8.376000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,6.858000>}
box{<0,0,-0.203200><2.146776,0.035000,0.203200> rotate<0,44.997030,0> translate<36.836000,0.000000,8.376000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,15.748000>}
box{<0,0,-0.203200><5.028943,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.798000,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,17.255000>}
box{<0,0,-0.203200><1.507000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.354000,-1.535000,17.255000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,17.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.481000,-1.535000,17.128000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<38.354000,-1.535000,17.255000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.211000,-1.535000,24.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.481000,-1.535000,24.528000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.211000,-1.535000,24.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.788600,0.000000,9.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.576000,0.000000,9.176000>}
box{<0,0,-0.203200><2.787400,0.035000,0.203200> rotate<0,0.000000,0> translate<35.788600,0.000000,9.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,6.858000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.354000,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.070000,0.000000,10.776000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.724000,0.000000,11.430000>}
box{<0,0,-0.203200><0.924896,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.070000,0.000000,10.776000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.724000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.724000,0.000000,11.430000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.724000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.724000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.724000,0.000000,13.324000>}
box{<0,0,-0.203200><0.392000,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.724000,0.000000,13.324000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.384000,0.000000,12.376000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.724000,0.000000,13.716000>}
box{<0,0,-0.203200><1.895046,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.384000,0.000000,12.376000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.724000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.724000,0.000000,14.086000>}
box{<0,0,-0.203200><0.370000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.724000,0.000000,14.086000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,0.000000,16.764000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.338000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.838000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,0.000000,17.756000>}
box{<0,0,-0.203200><0.033941,0.035000,0.203200> rotate<0,44.997030,0> translate<38.838000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,0.000000,17.756000>}
box{<0,0,-0.203200><0.992000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.862000,0.000000,17.756000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,5.588000>}
box{<0,0,-0.203200><5.588000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.782000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.788600,0.000000,9.976000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.440000,0.000000,9.976000>}
box{<0,0,-0.203200><3.651400,0.035000,0.203200> rotate<0,0.000000,0> translate<35.788600,0.000000,9.976000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.751000,-1.535000,15.113000>}
box{<0,0,-0.203200><6.645390,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.052000,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.751000,-1.535000,17.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.751000,-1.535000,15.113000>}
box{<0,0,-0.203200><2.015000,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.751000,-1.535000,15.113000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.481000,-1.535000,24.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.751000,-1.535000,24.528000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.481000,-1.535000,24.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,38.608000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.338000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.440000,0.000000,9.976000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.386000,0.000000,10.922000>}
box{<0,0,-0.203200><1.337846,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.440000,0.000000,9.976000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.386000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.386000,0.000000,11.292000>}
box{<0,0,-0.203200><0.370000,0.035000,0.203200> rotate<0,90.000000,0> translate<40.386000,0.000000,11.292000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.386000,0.000000,11.292000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.524000,0.000000,11.430000>}
box{<0,0,-0.203200><0.195161,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.386000,0.000000,11.292000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.524000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.524000,0.000000,11.430000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.524000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,0.000000,4.064000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<39.370000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.576000,0.000000,9.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,0.000000,6.858000>}
box{<0,0,-0.203200><3.278147,0.035000,0.203200> rotate<0,44.997030,0> translate<38.576000,0.000000,9.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.306000,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.402000,-1.535000,14.732000>}
box{<0,0,-0.203200><8.802484,0.035000,0.203200> rotate<0,-46.166092,0> translate<35.306000,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.402000,-1.535000,25.400000>}
box{<0,0,-0.203200><11.853938,0.035000,0.203200> rotate<0,44.997030,0> translate<33.020000,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.402000,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.402000,-1.535000,25.400000>}
box{<0,0,-0.203200><10.668000,0.035000,0.203200> rotate<0,90.000000,0> translate<41.402000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.656000,-1.535000,10.160000>}
box{<0,0,-0.203200><4.493719,0.035000,0.203200> rotate<0,-47.287489,0> translate<38.608000,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,0.000000,4.064000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.434000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.386000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,0.000000,7.874000>}
box{<0,0,-0.203200><4.310523,0.035000,0.203200> rotate<0,44.997030,0> translate<40.386000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,0.000000,7.874000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,90.000000,0> translate<43.434000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.656000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,-1.535000,10.160000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<41.656000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,0.000000,11.546000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,0.000000,10.160000>}
box{<0,0,-0.203200><1.386000,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.434000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,0.000000,15.125000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,0.000000,13.346000>}
box{<0,0,-0.203200><1.779000,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.434000,0.000000,13.346000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.724000,0.000000,14.086000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.450000,0.000000,19.812000>}
box{<0,0,-0.203200><8.097787,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.724000,0.000000,14.086000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.568000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.648000,0.000000,23.956000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.568000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.704000,0.000000,2.032000>}
box{<0,0,-0.304800><12.954000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.750000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.704000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.974000,0.000000,3.302000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.704000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.974000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.974000,0.000000,3.302000>}
box{<0,0,-0.304800><0.762000,0.035000,0.304800> rotate<0,-90.000000,0> translate<45.974000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.974000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.974000,0.000000,4.064000>}
box{<0,0,-0.304800><2.794000,0.035000,0.304800> rotate<0,-90.000000,0> translate<45.974000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.450000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.482000,0.000000,19.812000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.450000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,0.000000,16.879000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.495000,0.000000,16.879000>}
box{<0,0,-0.203200><3.061000,0.035000,0.203200> rotate<0,0.000000,0> translate<43.434000,0.000000,16.879000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.495000,0.000000,16.879000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.118000,0.000000,16.256000>}
box{<0,0,-0.203200><0.881055,0.035000,0.203200> rotate<0,44.997030,0> translate<46.495000,0.000000,16.879000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.244000,0.000000,10.668000>}
box{<0,0,-0.203200><5.388154,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.434000,0.000000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.244000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.244000,0.000000,10.922000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,90.000000,0> translate<47.244000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.118000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.244000,0.000000,16.130000>}
box{<0,0,-0.203200><0.178191,0.035000,0.203200> rotate<0,44.997030,0> translate<47.118000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.244000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.244000,0.000000,16.130000>}
box{<0,0,-0.203200><5.208000,0.035000,0.203200> rotate<0,90.000000,0> translate<47.244000,0.000000,16.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.244000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,11.176000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.244000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.648000,0.000000,23.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.926000,0.000000,23.956000>}
box{<0,0,-0.203200><3.278000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.648000,0.000000,23.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.006000,-1.535000,18.796000>}
box{<0,0,-0.203200><16.882882,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.068000,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.926000,0.000000,23.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.006000,0.000000,23.876000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,44.997030,0> translate<47.926000,0.000000,23.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.006000,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.006000,-1.535000,23.876000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,90.000000,0> translate<48.006000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.118000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.646000,0.000000,18.784000>}
box{<0,0,-0.203200><3.575132,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.118000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.646000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.646000,0.000000,18.784000>}
box{<0,0,-0.203200><1.536000,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.646000,0.000000,18.784000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.482000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.646000,0.000000,22.976000>}
box{<0,0,-0.203200><4.474572,0.035000,0.203200> rotate<0,-44.997030,0> translate<46.482000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.646000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.646000,0.000000,22.976000>}
box{<0,0,-0.203200><0.646000,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.646000,0.000000,22.976000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.646000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784000,0.000000,23.760000>}
box{<0,0,-0.203200><0.195161,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.646000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784000,0.000000,23.760000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784000,0.000000,29.718000>}
box{<0,0,-0.203200><5.958000,0.035000,0.203200> rotate<0,90.000000,0> translate<49.784000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.648000,0.000000,35.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.562000,0.000000,35.956000>}
box{<0,0,-0.203200><5.914000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.648000,0.000000,35.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.562000,0.000000,35.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.928000,0.000000,36.576000>}
box{<0,0,-0.203200><0.719969,0.035000,0.203200> rotate<0,-59.441764,0> translate<50.562000,0.000000,35.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.418000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.446000,0.000000,17.284000>}
box{<0,0,-0.203200><1.453812,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.418000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.446000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.446000,0.000000,17.284000>}
box{<0,0,-0.203200><3.036000,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.446000,0.000000,17.284000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.446000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.446000,0.000000,20.320000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.446000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.816000,0.000000,31.750000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.784000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.816000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.816000,0.000000,33.412000>}
box{<0,0,-0.203200><1.662000,0.035000,0.203200> rotate<0,90.000000,0> translate<51.816000,0.000000,33.412000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.446000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.838000,0.000000,24.014000>}
box{<0,0,-0.203200><0.554372,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.446000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.816000,0.000000,33.412000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.932000,0.000000,33.528000>}
box{<0,0,-0.203200><0.164049,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.816000,0.000000,33.412000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.928000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.932000,0.000000,35.064000>}
box{<0,0,-0.203200><1.814982,0.035000,0.203200> rotate<0,56.411275,0> translate<50.928000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.932000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.932000,0.000000,35.064000>}
box{<0,0,-0.203200><1.536000,0.035000,0.203200> rotate<0,90.000000,0> translate<51.932000,0.000000,35.064000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.594000,0.000000,22.214000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.594000,0.000000,17.410000>}
box{<0,0,-0.304800><4.804000,0.035000,0.304800> rotate<0,-90.000000,0> translate<53.594000,0.000000,17.410000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.838000,0.000000,24.014000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,0.000000,24.014000>}
box{<0,0,-0.203200><1.756000,0.035000,0.203200> rotate<0,0.000000,0> translate<51.838000,0.000000,24.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.732000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.732000,0.000000,36.080000>}
box{<0,0,-0.203200><2.552000,0.035000,0.203200> rotate<0,90.000000,0> translate<53.732000,0.000000,36.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.848000,0.000000,38.608000>}
box{<0,0,-0.203200><13.970000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.878000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.732000,0.000000,36.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,36.576000>}
box{<0,0,-0.203200><0.701450,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.732000,0.000000,36.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.848000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,38.482000>}
box{<0,0,-0.203200><0.400345,0.035000,0.203200> rotate<0,18.343224,0> translate<53.848000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,38.482000>}
box{<0,0,-0.203200><1.906000,0.035000,0.203200> rotate<0,90.000000,0> translate<54.228000,0.000000,38.482000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,-1.535000,2.032000>}
box{<0,0,-0.203200><18.288000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.068000,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.848000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,0.000000,38.608000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<53.848000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.388000,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.388000,-1.535000,8.382000>}
box{<0,0,-0.635000><24.892000,0.035000,0.635000> rotate<0,-90.000000,0> translate<56.388000,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.594000,0.000000,24.014000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.062000,0.000000,27.482000>}
box{<0,0,-0.304800><4.904493,0.035000,0.304800> rotate<0,-44.997030,0> translate<53.594000,0.000000,24.014000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.594000,0.000000,15.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.794000,0.000000,15.610000>}
box{<0,0,-0.304800><7.200000,0.035000,0.304800> rotate<0,0.000000,0> translate<53.594000,0.000000,15.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.722000,-1.535000,9.398000>}
box{<0,0,-0.203200><10.417097,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.356000,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.722000,-1.535000,14.682000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.722000,-1.535000,9.398000>}
box{<0,0,-0.203200><5.284000,0.035000,0.203200> rotate<0,-90.000000,0> translate<61.722000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.794000,0.000000,15.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.722000,0.000000,14.682000>}
box{<0,0,-0.304800><1.312390,0.035000,0.304800> rotate<0,44.997030,0> translate<60.794000,0.000000,15.610000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.062000,0.000000,27.482000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.722000,0.000000,27.482000>}
box{<0,0,-0.304800><4.660000,0.035000,0.304800> rotate<0,0.000000,0> translate<57.062000,0.000000,27.482000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.976000,0.000000,11.176000>}
box{<0,0,-0.203200><14.478000,0.035000,0.203200> rotate<0,0.000000,0> translate<47.498000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.976000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.516000,0.000000,13.716000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<61.976000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.516000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.516000,0.000000,13.716000>}
box{<0,0,-0.203200><16.256000,0.035000,0.203200> rotate<0,-90.000000,0> translate<64.516000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.516000,0.000000,29.972000>}
box{<0,0,-0.203200><12.213148,0.035000,0.203200> rotate<0,44.997030,0> translate<55.880000,0.000000,38.608000> }
//Text
//Rect
union{
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<37.338000,0.000000,16.730000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<37.338000,0.000000,18.830000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<38.838000,0.000000,16.730000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<38.838000,0.000000,18.830000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<35.838000,0.000000,16.730000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<35.838000,0.000000,18.830000>}
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,3.941413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,37.714584>}
box{<0,0,-0.203200><33.773172,0.035000,0.203200> rotate<0,90.000000,0> translate<0.863597,0.000000,37.714584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,3.941413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.592163,0.000000,4.243197>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,-22.498690,0> translate<0.863597,0.000000,3.941413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.159547,0.000000,4.064000>}
box{<0,0,-0.203200><0.295950,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.142441,0.000000,4.470400>}
box{<0,0,-0.203200><3.278844,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.736041,0.000000,4.876800>}
box{<0,0,-0.203200><2.872444,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.329641,0.000000,5.283200>}
box{<0,0,-0.203200><2.466044,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.923241,0.000000,5.689600>}
box{<0,0,-0.203200><2.059644,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.516841,0.000000,6.096000>}
box{<0,0,-0.203200><1.653244,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.110441,0.000000,6.502400>}
box{<0,0,-0.203200><1.246844,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.888425,0.000000,6.908800>}
box{<0,0,-0.203200><1.024828,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,7.315200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,7.721600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,8.128000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,8.534400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,8.940800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,9.347200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,9.753600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,10.160000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,10.566400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,10.972800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,11.379200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,11.785600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,12.192000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,12.598400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,13.004800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,13.411200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,13.817600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,14.224000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,14.630400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,15.036800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,15.443200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,15.849600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,16.256000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,16.662400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,17.068800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,17.475200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,17.881600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,18.288000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,18.694400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,19.100800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,19.507200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,19.913600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,20.320000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,20.726400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,21.132800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,21.539200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,21.945600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,22.352000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,22.758400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,23.164800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,23.571200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,23.977600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,24.384000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,24.790400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,25.196800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,25.603200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,26.009600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,26.416000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,26.822400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,27.228800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,27.635200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,28.041600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,28.448000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,28.854400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,29.260800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,29.667200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,30.073600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,30.480000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,30.886400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,31.292800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,31.699200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,32.105600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,32.512000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,32.918400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.926844,0.000000,33.324800>}
box{<0,0,-0.203200><1.063247,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.180588,0.000000,33.731200>}
box{<0,0,-0.203200><1.316991,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.476153,0.000000,34.137600>}
box{<0,0,-0.203200><1.612556,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.771716,0.000000,34.544000>}
box{<0,0,-0.203200><1.908119,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.067281,0.000000,34.950400>}
box{<0,0,-0.203200><2.203684,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.362844,0.000000,35.356800>}
box{<0,0,-0.203200><2.499247,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.658406,0.000000,35.763200>}
box{<0,0,-0.203200><2.794809,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.953972,0.000000,36.169600>}
box{<0,0,-0.203200><3.090375,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.294847,0.000000,36.576000>}
box{<0,0,-0.203200><3.431250,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.002125,0.000000,36.982400>}
box{<0,0,-0.203200><17.138528,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.595725,0.000000,37.388800>}
box{<0,0,-0.203200><16.732128,0.035000,0.203200> rotate<0,0.000000,0> translate<0.863597,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.863597,0.000000,37.714584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.592163,0.000000,37.412800>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,22.498690,0> translate<0.863597,0.000000,37.714584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.592163,0.000000,4.243197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.471834,0.000000,4.243197>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<1.592163,0.000000,4.243197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.592163,0.000000,37.412800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.471834,0.000000,37.412800>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<1.592163,0.000000,37.412800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.862422,0.000000,33.057047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,32.948256>}
box{<0,0,-0.203200><0.110138,0.035000,0.203200> rotate<0,81.021688,0> translate<1.862422,0.000000,33.057047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.862422,0.000000,33.057047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,33.128441>}
box{<0,0,-0.203200><0.073431,0.035000,0.203200> rotate<0,-76.466121,0> translate<1.862422,0.000000,33.057047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,6.930112>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.018809,0.000000,6.594031>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,67.495551,0> translate<1.879600,0.000000,6.930112> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,32.948256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,6.930112>}
box{<0,0,-0.203200><26.018144,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.879600,0.000000,6.930112> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,33.201884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,33.128441>}
box{<0,0,-0.203200><0.073444,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.879600,0.000000,33.128441> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.879600,0.000000,33.201884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.921753,0.000000,33.303647>}
box{<0,0,-0.203200><0.110148,0.035000,0.203200> rotate<0,-67.494720,0> translate<1.879600,0.000000,33.201884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.921753,0.000000,33.303647>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.947513,0.000000,33.410725>}
box{<0,0,-0.203200><0.110133,0.035000,0.203200> rotate<0,-76.468551,0> translate<1.921753,0.000000,33.303647> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.947513,0.000000,33.410725>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.990703,0.000000,33.470109>}
box{<0,0,-0.203200><0.073430,0.035000,0.203200> rotate<0,-53.967810,0> translate<1.947513,0.000000,33.410725> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.990703,0.000000,33.470109>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.018809,0.000000,33.537966>}
box{<0,0,-0.203200><0.073447,0.035000,0.203200> rotate<0,-67.496071,0> translate<1.990703,0.000000,33.470109> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.018809,0.000000,6.594031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.812809,0.000000,3.800031>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,44.997030,0> translate<2.018809,0.000000,6.594031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.018809,0.000000,33.537966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.096700,0.000000,33.615856>}
box{<0,0,-0.203200><0.110154,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.018809,0.000000,33.537966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.096700,0.000000,33.615856>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.022706,0.000000,36.264113>}
box{<0,0,-0.203200><3.274563,0.035000,0.203200> rotate<0,-53.969041,0> translate<2.096700,0.000000,33.615856> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.471834,0.000000,4.243197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.284544,0.000000,3.906563>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,22.498463,0> translate<2.471834,0.000000,4.243197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.471834,0.000000,37.412800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.284544,0.000000,37.749434>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-22.498463,0> translate<2.471834,0.000000,37.412800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.904456,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.548841,0.000000,4.064000>}
box{<0,0,-0.203200><1.644384,0.035000,0.203200> rotate<0,0.000000,0> translate<2.904456,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.284544,0.000000,3.906563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.906563,0.000000,3.284544>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<3.284544,0.000000,3.906563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.284544,0.000000,37.749434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.906563,0.000000,38.371453>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.284544,0.000000,37.749434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.330309,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.136431,0.000000,37.795200>}
box{<0,0,-0.203200><3.806122,0.035000,0.203200> rotate<0,0.000000,0> translate<3.330309,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.533506,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.955241,0.000000,3.657600>}
box{<0,0,-0.203200><1.421734,0.035000,0.203200> rotate<0,0.000000,0> translate<3.533506,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,7.490756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,32.722653>}
box{<0,0,-0.203200><25.231897,0.035000,0.203200> rotate<0,90.000000,0> translate<3.708397,0.000000,32.722653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,7.490756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.966756,0.000000,5.232397>}
box{<0,0,-0.203200><3.193802,0.035000,0.203200> rotate<0,44.997030,0> translate<3.708397,0.000000,7.490756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.207750,0.000000,7.721600>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.207750,0.000000,8.128000>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.207750,0.000000,8.534400>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.207750,0.000000,8.940800>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.344422,0.000000,9.347200>}
box{<0,0,-0.203200><7.636025,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.750822,0.000000,9.753600>}
box{<0,0,-0.203200><8.042425,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.157222,0.000000,10.160000>}
box{<0,0,-0.203200><8.448825,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.672928,0.000000,10.566400>}
box{<0,0,-0.203200><21.964531,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.879094,0.000000,10.972800>}
box{<0,0,-0.203200><20.170697,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.091678,0.000000,11.379200>}
box{<0,0,-0.203200><0.383281,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,11.785600>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,12.192000>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,12.598400>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,13.004800>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,13.411200>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,13.817600>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,14.224000>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,14.630400>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,15.036800>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,15.443200>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.007516,0.000000,15.849600>}
box{<0,0,-0.203200><0.299119,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.322722,0.000000,16.256000>}
box{<0,0,-0.203200><0.614325,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.659263,0.000000,16.662400>}
box{<0,0,-0.203200><0.950866,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.548625,0.000000,17.068800>}
box{<0,0,-0.203200><0.840228,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.506400,0.000000,17.475200>}
box{<0,0,-0.203200><0.798003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.506400,0.000000,17.881600>}
box{<0,0,-0.203200><0.798003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.506400,0.000000,18.288000>}
box{<0,0,-0.203200><0.798003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.506400,0.000000,18.694400>}
box{<0,0,-0.203200><0.798003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.506400,0.000000,19.100800>}
box{<0,0,-0.203200><0.798003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.506400,0.000000,19.507200>}
box{<0,0,-0.203200><0.798003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.506544,0.000000,19.913600>}
box{<0,0,-0.203200><0.798147,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.700000,0.000000,20.320000>}
box{<0,0,-0.203200><0.991603,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.836819,0.000000,20.726400>}
box{<0,0,-0.203200><1.128422,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.217963,0.000000,21.132800>}
box{<0,0,-0.203200><1.509566,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.715066,0.000000,21.539200>}
box{<0,0,-0.203200><1.006669,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.308666,0.000000,21.945600>}
box{<0,0,-0.203200><0.600269,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.216400,0.000000,22.352000>}
box{<0,0,-0.203200><0.508003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.216400,0.000000,22.758400>}
box{<0,0,-0.203200><0.508003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.216400,0.000000,23.164800>}
box{<0,0,-0.203200><0.508003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,23.571200>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,23.977600>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,24.384000>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,24.790400>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,25.196800>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,25.603200>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,26.009600>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,26.416000>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,26.822400>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,27.228800>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,27.635200>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,28.041600>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,28.448000>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,28.854400>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,29.260800>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,29.667200>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,30.073600>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,30.480000>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,30.886400>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,31.292800>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,31.699200>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,32.105600>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095750,0.000000,32.512000>}
box{<0,0,-0.203200><0.387353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.708397,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.708397,0.000000,32.722653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095750,0.000000,33.255269>}
box{<0,0,-0.203200><0.658576,0.035000,0.203200> rotate<0,-53.969324,0> translate<3.708397,0.000000,32.722653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.736709,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.874628,0.000000,38.201600>}
box{<0,0,-0.203200><3.137919,0.035000,0.203200> rotate<0,0.000000,0> translate<3.736709,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.850756,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095750,0.000000,32.918400>}
box{<0,0,-0.203200><0.244994,0.035000,0.203200> rotate<0,0.000000,0> translate<3.850756,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.883953,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.446019,0.000000,7.315200>}
box{<0,0,-0.203200><7.562066,0.035000,0.203200> rotate<0,0.000000,0> translate<3.883953,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.906563,0.000000,3.284544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.243197,0.000000,2.471834>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<3.906563,0.000000,3.284544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.906563,0.000000,38.371453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.243197,0.000000,39.184162>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<3.906563,0.000000,38.371453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.920375,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.145069,0.000000,3.251200>}
box{<0,0,-0.203200><12.224694,0.035000,0.203200> rotate<0,0.000000,0> translate<3.920375,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.941413,0.000000,0.863597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.243197,0.000000,1.592163>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,-67.495370,0> translate<3.941413,0.000000,0.863597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.941413,0.000000,0.863597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.590584,0.000000,0.863597>}
box{<0,0,-0.203200><57.649172,0.035000,0.203200> rotate<0,0.000000,0> translate<3.941413,0.000000,0.863597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.941413,0.000000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.243197,0.000000,40.063834>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,67.495370,0> translate<3.941413,0.000000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.941413,0.000000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.984038,0.000000,40.792400>}
box{<0,0,-0.203200><3.042625,0.035000,0.203200> rotate<0,0.000000,0> translate<3.941413,0.000000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,11.594741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095206,0.000000,11.370688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<4.002400,0.000000,11.594741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,15.837256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,11.594741>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.002400,0.000000,11.594741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,15.837256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095206,0.000000,16.061309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<4.002400,0.000000,15.837256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.004541,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.838400,0.000000,38.608000>}
box{<0,0,-0.203200><2.833859,0.035000,0.203200> rotate<0,0.000000,0> translate<4.004541,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.004541,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.916716,0.000000,40.640000>}
box{<0,0,-0.203200><2.912175,0.035000,0.203200> rotate<0,0.000000,0> translate<4.004541,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.022706,0.000000,36.264113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.050809,0.000000,36.331966>}
box{<0,0,-0.203200><0.073443,0.035000,0.203200> rotate<0,-67.497390,0> translate<4.022706,0.000000,36.264113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.050809,0.000000,36.331966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.128697,0.000000,36.409850>}
box{<0,0,-0.203200><0.110147,0.035000,0.203200> rotate<0,-44.995881,0> translate<4.050809,0.000000,36.331966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.088709,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.606828,0.000000,1.219200>}
box{<0,0,-0.203200><13.518119,0.035000,0.203200> rotate<0,0.000000,0> translate<4.088709,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.088713,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,2.844800>}
box{<0,0,-0.203200><12.268888,0.035000,0.203200> rotate<0,0.000000,0> translate<4.088713,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095206,0.000000,11.370688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.266688,0.000000,11.199206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<4.095206,0.000000,11.370688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095206,0.000000,16.061309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.266688,0.000000,16.232791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.095206,0.000000,16.061309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095750,0.000000,32.445469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,32.197819>}
box{<0,0,-0.203200><0.350230,0.035000,0.203200> rotate<0,44.997030,0> translate<4.095750,0.000000,32.445469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095750,0.000000,33.255269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095750,0.000000,32.445469>}
box{<0,0,-0.203200><0.809800,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.095750,0.000000,32.445469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.128697,0.000000,36.409850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.193472,0.000000,36.498919>}
box{<0,0,-0.203200><0.110132,0.035000,0.203200> rotate<0,-53.970021,0> translate<4.128697,0.000000,36.409850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.172878,0.000000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.838400,0.000000,39.014400>}
box{<0,0,-0.203200><2.665522,0.035000,0.203200> rotate<0,0.000000,0> translate<4.172878,0.000000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.172878,0.000000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.838400,0.000000,40.233600>}
box{<0,0,-0.203200><2.665522,0.035000,0.203200> rotate<0,0.000000,0> translate<4.172878,0.000000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.193472,0.000000,36.498919>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256103,0.000000,36.537256>}
box{<0,0,-0.203200><0.073433,0.035000,0.203200> rotate<0,-31.469330,0> translate<4.193472,0.000000,36.498919> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.216400,0.000000,22.037866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.019866,0.000000,21.234400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<4.216400,0.000000,22.037866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.216400,0.000000,23.174131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.216400,0.000000,22.037866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.216400,0.000000,22.037866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.216400,0.000000,23.174131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,23.301131>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.216400,0.000000,23.174131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.243197,0.000000,1.592163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.243197,0.000000,2.471834>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,90.000000,0> translate<4.243197,0.000000,2.471834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.243197,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.147241,0.000000,1.625600>}
box{<0,0,-0.203200><12.904044,0.035000,0.203200> rotate<0,0.000000,0> translate<4.243197,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.243197,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.740841,0.000000,2.032000>}
box{<0,0,-0.203200><12.497644,0.035000,0.203200> rotate<0,0.000000,0> translate<4.243197,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.243197,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.429553,0.000000,2.438400>}
box{<0,0,-0.203200><12.186356,0.035000,0.203200> rotate<0,0.000000,0> translate<4.243197,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.243197,0.000000,39.184162>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.243197,0.000000,40.063834>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,90.000000,0> translate<4.243197,0.000000,40.063834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.243197,0.000000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.838400,0.000000,39.420800>}
box{<0,0,-0.203200><2.595203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.243197,0.000000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.243197,0.000000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.838400,0.000000,39.827200>}
box{<0,0,-0.203200><2.595203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.243197,0.000000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256103,0.000000,36.537256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.308031,0.000000,36.589188>}
box{<0,0,-0.203200><0.073440,0.035000,0.203200> rotate<0,-44.998754,0> translate<4.256103,0.000000,36.537256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.266688,0.000000,11.199206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490741,0.000000,11.106400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<4.266688,0.000000,11.199206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.266688,0.000000,16.232791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490741,0.000000,16.325597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<4.266688,0.000000,16.232791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.290353,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.852419,0.000000,6.908800>}
box{<0,0,-0.203200><7.562066,0.035000,0.203200> rotate<0,0.000000,0> translate<4.290353,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.308031,0.000000,36.589188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.409788,0.000000,36.631334>}
box{<0,0,-0.203200><0.110139,0.035000,0.203200> rotate<0,-22.497581,0> translate<4.308031,0.000000,36.589188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,32.197819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343400,0.000000,23.301131>}
box{<0,0,-0.203200><8.896688,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.343400,0.000000,23.301131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.409788,0.000000,36.631334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.503725,0.000000,36.688841>}
box{<0,0,-0.203200><0.110142,0.035000,0.203200> rotate<0,-31.471876,0> translate<4.409788,0.000000,36.631334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490741,0.000000,11.106400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.733256,0.000000,11.106400>}
box{<0,0,-0.203200><2.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<4.490741,0.000000,11.106400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490741,0.000000,16.325597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.652003,0.000000,16.325597>}
box{<0,0,-0.203200><0.161263,0.035000,0.203200> rotate<0,0.000000,0> translate<4.490741,0.000000,16.325597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.503725,0.000000,36.688841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.576269,0.000000,36.700294>}
box{<0,0,-0.203200><0.073442,0.035000,0.203200> rotate<0,-8.971147,0> translate<4.503725,0.000000,36.688841> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.506400,0.000000,17.170741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.599206,0.000000,16.946687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<4.506400,0.000000,17.170741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.506400,0.000000,19.913256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.506400,0.000000,17.170741>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.506400,0.000000,17.170741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.506400,0.000000,19.913256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.599206,0.000000,20.137309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<4.506400,0.000000,19.913256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.576269,0.000000,36.700294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.644113,0.000000,36.728397>}
box{<0,0,-0.203200><0.073434,0.035000,0.203200> rotate<0,-22.499469,0> translate<4.576269,0.000000,36.700294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.599206,0.000000,16.946687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.663991,0.000000,16.881906>}
box{<0,0,-0.203200><0.091617,0.035000,0.203200> rotate<0,44.995648,0> translate<4.599206,0.000000,16.946687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.599206,0.000000,20.137309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.700000,0.000000,20.238103>}
box{<0,0,-0.203200><0.142544,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.599206,0.000000,20.137309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.644113,0.000000,36.728397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.754250,0.000000,36.728397>}
box{<0,0,-0.203200><0.110137,0.035000,0.203200> rotate<0,0.000000,0> translate<4.644113,0.000000,36.728397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.652003,0.000000,16.325597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.663991,0.000000,16.881906>}
box{<0,0,-0.203200><0.556439,0.035000,0.203200> rotate<0,-88.759708,0> translate<4.652003,0.000000,16.325597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.696753,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.258819,0.000000,6.502400>}
box{<0,0,-0.203200><7.562066,0.035000,0.203200> rotate<0,0.000000,0> translate<4.696753,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.700000,0.000000,20.396094>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.700000,0.000000,20.238103>}
box{<0,0,-0.203200><0.157991,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.700000,0.000000,20.238103> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.700000,0.000000,20.396094>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.854675,0.000000,20.769516>}
box{<0,0,-0.203200><0.404188,0.035000,0.203200> rotate<0,-67.495729,0> translate<4.700000,0.000000,20.396094> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.754250,0.000000,36.728397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.863047,0.000000,36.745575>}
box{<0,0,-0.203200><0.110145,0.035000,0.203200> rotate<0,-8.971865,0> translate<4.754250,0.000000,36.728397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.812809,0.000000,3.800031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.070031,0.000000,3.542809>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,44.997030,0> translate<4.812809,0.000000,3.800031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.854675,0.000000,20.769516>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.319562,0.000000,21.234400>}
box{<0,0,-0.203200><0.657448,0.035000,0.203200> rotate<0,-44.996838,0> translate<4.854675,0.000000,20.769516> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.863047,0.000000,36.745575>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.934447,0.000000,36.728397>}
box{<0,0,-0.203200><0.073437,0.035000,0.203200> rotate<0,13.526799,0> translate<4.863047,0.000000,36.745575> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.934447,0.000000,36.728397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.609544,0.000000,36.728397>}
box{<0,0,-0.203200><9.675097,0.035000,0.203200> rotate<0,0.000000,0> translate<4.934447,0.000000,36.728397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.019866,0.000000,21.234400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.319562,0.000000,21.234400>}
box{<0,0,-0.203200><0.299697,0.035000,0.203200> rotate<0,0.000000,0> translate<5.019866,0.000000,21.234400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.070031,0.000000,3.542809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.406112,0.000000,3.403600>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,22.498510,0> translate<5.070031,0.000000,3.542809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.103153,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.094266,0.000000,6.096000>}
box{<0,0,-0.203200><10.991113,0.035000,0.203200> rotate<0,0.000000,0> translate<5.103153,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.406112,0.000000,3.403600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.992669,0.000000,3.403600>}
box{<0,0,-0.203200><10.586556,0.035000,0.203200> rotate<0,0.000000,0> translate<5.406112,0.000000,3.403600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.509553,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,5.689600>}
box{<0,0,-0.203200><10.848047,0.035000,0.203200> rotate<0,0.000000,0> translate<5.509553,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.915953,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,5.283200>}
box{<0,0,-0.203200><10.441647,0.035000,0.203200> rotate<0,0.000000,0> translate<5.915953,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.966756,0.000000,5.232397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,5.232397>}
box{<0,0,-0.203200><10.390844,0.035000,0.203200> rotate<0,0.000000,0> translate<5.966756,0.000000,5.232397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.733256,0.000000,11.106400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.957309,0.000000,11.199206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<6.733256,0.000000,11.106400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.838400,0.000000,38.289066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.976878,0.000000,37.954753>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,67.495347,0> translate<6.838400,0.000000,38.289066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.838400,0.000000,40.450931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.838400,0.000000,38.289066>}
box{<0,0,-0.203200><2.161866,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.838400,0.000000,38.289066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.838400,0.000000,40.450931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.976878,0.000000,40.785244>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-67.495347,0> translate<6.838400,0.000000,40.450931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.957309,0.000000,11.199206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.112000,0.000000,11.353897>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.957309,0.000000,11.199206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.976878,0.000000,37.954753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.232753,0.000000,37.698878>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,44.997030,0> translate<6.976878,0.000000,37.954753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.976878,0.000000,40.785244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.984038,0.000000,40.792400>}
box{<0,0,-0.203200><0.010123,0.035000,0.203200> rotate<0,-44.984524,0> translate<6.976878,0.000000,40.785244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.112000,0.000000,11.353897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.266688,0.000000,11.199206>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.997609,0> translate<7.112000,0.000000,11.353897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.232753,0.000000,37.698878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.567066,0.000000,37.560400>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,22.498713,0> translate<7.232753,0.000000,37.698878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.266688,0.000000,11.199206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.490741,0.000000,11.106400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<7.266688,0.000000,11.199206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.490741,0.000000,11.106400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.733256,0.000000,11.106400>}
box{<0,0,-0.203200><2.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<7.490741,0.000000,11.106400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.567066,0.000000,37.560400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.228931,0.000000,37.560400>}
box{<0,0,-0.203200><3.661866,0.035000,0.203200> rotate<0,0.000000,0> translate<7.567066,0.000000,37.560400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458197,0.000000,16.325597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458197,0.000000,19.718806>}
box{<0,0,-0.203200><3.393209,0.035000,0.203200> rotate<0,90.000000,0> translate<8.458197,0.000000,19.718806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458197,0.000000,16.325597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.733256,0.000000,16.325597>}
box{<0,0,-0.203200><1.275059,0.035000,0.203200> rotate<0,0.000000,0> translate<8.458197,0.000000,16.325597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458197,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.674200,0.000000,16.662400>}
box{<0,0,-0.203200><3.216003,0.035000,0.203200> rotate<0,0.000000,0> translate<8.458197,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458197,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.674200,0.000000,17.068800>}
box{<0,0,-0.203200><3.216003,0.035000,0.203200> rotate<0,0.000000,0> translate<8.458197,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458197,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.674200,0.000000,17.475200>}
box{<0,0,-0.203200><3.216003,0.035000,0.203200> rotate<0,0.000000,0> translate<8.458197,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458197,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.737544,0.000000,17.881600>}
box{<0,0,-0.203200><3.279347,0.035000,0.203200> rotate<0,0.000000,0> translate<8.458197,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458197,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.058528,0.000000,18.288000>}
box{<0,0,-0.203200><3.600331,0.035000,0.203200> rotate<0,0.000000,0> translate<8.458197,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458197,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.202213,0.000000,18.694400>}
box{<0,0,-0.203200><7.744016,0.035000,0.203200> rotate<0,0.000000,0> translate<8.458197,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458197,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.627019,0.000000,19.100800>}
box{<0,0,-0.203200><8.168822,0.035000,0.203200> rotate<0,0.000000,0> translate<8.458197,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458197,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.135600,0.000000,19.507200>}
box{<0,0,-0.203200><9.677403,0.035000,0.203200> rotate<0,0.000000,0> translate<8.458197,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458197,0.000000,19.718806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.912191,0.000000,20.172800>}
box{<0,0,-0.203200><0.642044,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.458197,0.000000,19.718806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.652991,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.135600,0.000000,19.913600>}
box{<0,0,-0.203200><9.482609,0.035000,0.203200> rotate<0,0.000000,0> translate<8.652991,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.912191,0.000000,20.172800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.303728,0.000000,20.172800>}
box{<0,0,-0.203200><4.391538,0.035000,0.203200> rotate<0,0.000000,0> translate<8.912191,0.000000,20.172800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.733256,0.000000,11.106400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.957309,0.000000,11.199206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<9.733256,0.000000,11.106400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.733256,0.000000,16.325597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.957309,0.000000,16.232791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<9.733256,0.000000,16.325597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.901278,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.674200,0.000000,16.256000>}
box{<0,0,-0.203200><1.772922,0.035000,0.203200> rotate<0,0.000000,0> translate<9.901278,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.957309,0.000000,11.199206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.128791,0.000000,11.370688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.957309,0.000000,11.199206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.957309,0.000000,16.232791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.128791,0.000000,16.061309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<9.957309,0.000000,16.232791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.128791,0.000000,11.370688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,11.594741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<10.128791,0.000000,11.370688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.128791,0.000000,16.061309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,15.837256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<10.128791,0.000000,16.061309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.132316,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,11.379200>}
box{<0,0,-0.203200><13.634084,0.035000,0.203200> rotate<0,0.000000,0> translate<10.132316,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.216484,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.677400,0.000000,15.849600>}
box{<0,0,-0.203200><1.460916,0.035000,0.203200> rotate<0,0.000000,0> translate<10.216484,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,11.594741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,15.837256>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,90.000000,0> translate<10.221597,0.000000,15.837256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,11.785600>}
box{<0,0,-0.203200><13.544803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,12.192000>}
box{<0,0,-0.203200><13.544803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,12.598400>}
box{<0,0,-0.203200><13.544803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.879094,0.000000,13.004800>}
box{<0,0,-0.203200><13.657497,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,13.411200>}
box{<0,0,-0.203200><13.544803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,13.817600>}
box{<0,0,-0.203200><13.544803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304069,0.000000,14.224000>}
box{<0,0,-0.203200><2.082472,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.252400,0.000000,14.630400>}
box{<0,0,-0.203200><2.030803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.252400,0.000000,15.036800>}
box{<0,0,-0.203200><2.030803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.935694,0.000000,15.443200>}
box{<0,0,-0.203200><1.714097,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.207750,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.379469,0.000000,6.381750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<11.207750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.207750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.207750,0.000000,7.553469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.207750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.207750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.379469,0.000000,10.382247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.207750,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.228931,0.000000,37.560400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.563244,0.000000,37.698878>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-22.498713,0> translate<11.228931,0.000000,37.560400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.563244,0.000000,37.698878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.819119,0.000000,37.954753>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.563244,0.000000,37.698878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.659566,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.189325,0.000000,37.795200>}
box{<0,0,-0.203200><5.529759,0.035000,0.203200> rotate<0,0.000000,0> translate<11.659566,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.674200,0.000000,16.242322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.677400,0.000000,16.234597>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,67.494278,0> translate<11.674200,0.000000,16.242322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.674200,0.000000,17.728675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.674200,0.000000,16.242322>}
box{<0,0,-0.203200><1.486353,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.674200,0.000000,16.242322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.674200,0.000000,17.728675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.797941,0.000000,18.027413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<11.674200,0.000000,17.728675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.677400,0.000000,15.832741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.770206,0.000000,15.608688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<11.677400,0.000000,15.832741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.677400,0.000000,16.234597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.677400,0.000000,15.832741>}
box{<0,0,-0.203200><0.401856,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.677400,0.000000,15.832741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.770206,0.000000,15.608688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941688,0.000000,15.437206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<11.770206,0.000000,15.608688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.797941,0.000000,18.027413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.010941,0.000000,18.240413>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.797941,0.000000,18.027413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.811959,0.000000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.819119,0.000000,40.785244>}
box{<0,0,-0.203200><0.010123,0.035000,0.203200> rotate<0,44.984524,0> translate<11.811959,0.000000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.811959,0.000000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.590584,0.000000,40.792400>}
box{<0,0,-0.203200><49.778625,0.035000,0.203200> rotate<0,0.000000,0> translate<11.811959,0.000000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.819119,0.000000,37.954753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.957597,0.000000,38.289066>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-67.495347,0> translate<11.819119,0.000000,37.954753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.819119,0.000000,40.785244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.957597,0.000000,40.450931>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,67.495347,0> translate<11.819119,0.000000,40.785244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.879284,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.527459,0.000000,40.640000>}
box{<0,0,-0.203200><49.648175,0.035000,0.203200> rotate<0,0.000000,0> translate<11.879284,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.921366,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.782925,0.000000,38.201600>}
box{<0,0,-0.203200><4.861559,0.035000,0.203200> rotate<0,0.000000,0> translate<11.921366,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941688,0.000000,15.437206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.165741,0.000000,15.344400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<11.941688,0.000000,15.437206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.957597,0.000000,38.289066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.957597,0.000000,38.557200>}
box{<0,0,-0.203200><0.268134,0.035000,0.203200> rotate<0,90.000000,0> translate<11.957597,0.000000,38.557200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.957597,0.000000,38.557200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.427325,0.000000,38.557200>}
box{<0,0,-0.203200><4.469728,0.035000,0.203200> rotate<0,0.000000,0> translate<11.957597,0.000000,38.557200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.957597,0.000000,40.182797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.957597,0.000000,40.450931>}
box{<0,0,-0.203200><0.268134,0.035000,0.203200> rotate<0,90.000000,0> translate<11.957597,0.000000,40.450931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.957597,0.000000,40.182797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.925675,0.000000,40.182797>}
box{<0,0,-0.203200><4.968078,0.035000,0.203200> rotate<0,0.000000,0> translate<11.957597,0.000000,40.182797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.957597,0.000000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.359122,0.000000,40.233600>}
box{<0,0,-0.203200><49.401525,0.035000,0.203200> rotate<0,0.000000,0> translate<11.957597,0.000000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.010941,0.000000,18.240413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.239584,0.000000,18.469056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.010941,0.000000,18.240413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.165741,0.000000,15.344400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.252400,0.000000,15.344400>}
box{<0,0,-0.203200><0.086659,0.035000,0.203200> rotate<0,0.000000,0> translate<12.165741,0.000000,15.344400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.239584,0.000000,18.469056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.538322,0.000000,18.592797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<12.239584,0.000000,18.469056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.252400,0.000000,14.348741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.345206,0.000000,14.124688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<12.252400,0.000000,14.348741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.252400,0.000000,15.344400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.252400,0.000000,14.348741>}
box{<0,0,-0.203200><0.995659,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.252400,0.000000,14.348741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.345206,0.000000,14.124688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.516687,0.000000,13.953206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<12.345206,0.000000,14.124688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.379469,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.036528,0.000000,6.381750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<12.379469,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.379469,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.036528,0.000000,10.382247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<12.379469,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.516687,0.000000,13.953206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.740741,0.000000,13.860400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<12.516687,0.000000,13.953206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.538322,0.000000,18.592797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.174400,0.000000,18.592797>}
box{<0,0,-0.203200><3.636078,0.035000,0.203200> rotate<0,0.000000,0> translate<12.538322,0.000000,18.592797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.740741,0.000000,13.860400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.183256,0.000000,13.860400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<12.740741,0.000000,13.860400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.303728,0.000000,20.172800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.611800,0.000000,20.300409>}
box{<0,0,-0.203200><0.333455,0.035000,0.203200> rotate<0,-22.498805,0> translate<13.303728,0.000000,20.172800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.611800,0.000000,20.300409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.847588,0.000000,20.536197>}
box{<0,0,-0.203200><0.333454,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.611800,0.000000,20.300409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.631391,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.549594,0.000000,20.320000>}
box{<0,0,-0.203200><2.918203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.631391,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.847588,0.000000,20.536197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.975197,0.000000,20.844269>}
box{<0,0,-0.203200><0.333455,0.035000,0.203200> rotate<0,-67.495255,0> translate<13.847588,0.000000,20.536197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.926372,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.332200,0.000000,20.726400>}
box{<0,0,-0.203200><2.405828,0.035000,0.203200> rotate<0,0.000000,0> translate<13.926372,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.975197,0.000000,20.844269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.975197,0.000000,21.202616>}
box{<0,0,-0.203200><0.358347,0.035000,0.203200> rotate<0,90.000000,0> translate<13.975197,0.000000,21.202616> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.975197,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.332200,0.000000,21.132800>}
box{<0,0,-0.203200><2.357003,0.035000,0.203200> rotate<0,0.000000,0> translate<13.975197,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.975197,0.000000,21.202616>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.115741,0.000000,21.144400>}
box{<0,0,-0.203200><0.152124,0.035000,0.203200> rotate<0,22.498688,0> translate<13.975197,0.000000,21.202616> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.036528,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.208247,0.000000,7.553469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.036528,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.036528,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.208247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<14.036528,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.115741,0.000000,21.144400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.758256,0.000000,21.144400>}
box{<0,0,-0.203200><0.642516,0.035000,0.203200> rotate<0,0.000000,0> translate<14.115741,0.000000,21.144400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.157178,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.900400,0.000000,6.502400>}
box{<0,0,-0.203200><1.743222,0.035000,0.203200> rotate<0,0.000000,0> translate<14.157178,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.183256,0.000000,13.860400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.407309,0.000000,13.953206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<14.183256,0.000000,13.860400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.258775,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.266528,0.000000,10.160000>}
box{<0,0,-0.203200><11.007753,0.035000,0.203200> rotate<0,0.000000,0> translate<14.258775,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.407309,0.000000,13.953206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.578791,0.000000,14.124688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.407309,0.000000,13.953206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.563578,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.900400,0.000000,6.908800>}
box{<0,0,-0.203200><1.336822,0.035000,0.203200> rotate<0,0.000000,0> translate<14.563578,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.578791,0.000000,14.124688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.643041,0.000000,14.279806>}
box{<0,0,-0.203200><0.167898,0.035000,0.203200> rotate<0,-67.496267,0> translate<14.578791,0.000000,14.124688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.609544,0.000000,36.728397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.666878,0.000000,36.744034>}
box{<0,0,-0.203200><0.059429,0.035000,0.203200> rotate<0,-15.254905,0> translate<14.609544,0.000000,36.728397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.619925,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,14.224000>}
box{<0,0,-0.203200><9.146475,0.035000,0.203200> rotate<0,0.000000,0> translate<14.619925,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.643041,0.000000,14.279806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.684413,0.000000,14.296941>}
box{<0,0,-0.203200><0.044780,0.035000,0.203200> rotate<0,-22.495658,0> translate<14.643041,0.000000,14.279806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.665175,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.860128,0.000000,9.753600>}
box{<0,0,-0.203200><10.194953,0.035000,0.203200> rotate<0,0.000000,0> translate<14.665175,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.666878,0.000000,36.744034>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.789888,0.000000,36.728397>}
box{<0,0,-0.203200><0.123999,0.035000,0.203200> rotate<0,7.244356,0> translate<14.666878,0.000000,36.744034> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.684413,0.000000,14.296941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.913056,0.000000,14.525584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.684413,0.000000,14.296941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.758256,0.000000,21.144400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.982309,0.000000,21.237206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<14.758256,0.000000,21.144400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.789888,0.000000,36.728397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.913884,0.000000,36.728397>}
box{<0,0,-0.203200><0.123997,0.035000,0.203200> rotate<0,0.000000,0> translate<14.789888,0.000000,36.728397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.913056,0.000000,14.525584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.126056,0.000000,14.738584>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.913056,0.000000,14.525584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.913884,0.000000,36.728397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.968788,0.000000,36.705653>}
box{<0,0,-0.203200><0.059428,0.035000,0.203200> rotate<0,22.500413,0> translate<14.913884,0.000000,36.728397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.968788,0.000000,36.705653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.027747,0.000000,36.698159>}
box{<0,0,-0.203200><0.059434,0.035000,0.203200> rotate<0,7.242990,0> translate<14.968788,0.000000,36.705653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.969978,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.900400,0.000000,7.315200>}
box{<0,0,-0.203200><0.930422,0.035000,0.203200> rotate<0,0.000000,0> translate<14.969978,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.982309,0.000000,21.237206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.153791,0.000000,21.408688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.982309,0.000000,21.237206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.017872,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,14.630400>}
box{<0,0,-0.203200><8.748528,0.035000,0.203200> rotate<0,0.000000,0> translate<15.017872,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.027747,0.000000,36.698159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.135403,0.000000,36.636637>}
box{<0,0,-0.203200><0.123995,0.035000,0.203200> rotate<0,29.744530,0> translate<15.027747,0.000000,36.698159> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.071575,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.453728,0.000000,9.347200>}
box{<0,0,-0.203200><9.382153,0.035000,0.203200> rotate<0,0.000000,0> translate<15.071575,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.126056,0.000000,14.738584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249797,0.000000,15.037322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<15.126056,0.000000,14.738584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.135403,0.000000,36.636637>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249966,0.000000,36.589188>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,22.497089,0> translate<15.135403,0.000000,36.636637> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.153791,0.000000,21.408688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.246597,0.000000,21.632741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<15.153791,0.000000,21.408688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.207850,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.332200,0.000000,21.539200>}
box{<0,0,-0.203200><1.124350,0.035000,0.203200> rotate<0,0.000000,0> translate<15.207850,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.208247,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.208247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<15.208247,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.208247,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.195869,0.000000,7.721600>}
box{<0,0,-0.203200><0.987622,0.035000,0.203200> rotate<0,0.000000,0> translate<15.208247,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.208247,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.602269,0.000000,8.128000>}
box{<0,0,-0.203200><1.394022,0.035000,0.203200> rotate<0,0.000000,0> translate<15.208247,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.208247,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.079200,0.000000,8.534400>}
box{<0,0,-0.203200><8.870953,0.035000,0.203200> rotate<0,0.000000,0> translate<15.208247,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.208247,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.138484,0.000000,8.940800>}
box{<0,0,-0.203200><8.930238,0.035000,0.203200> rotate<0,0.000000,0> translate<15.208247,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.246597,0.000000,16.573400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.246597,0.000000,16.967200>}
box{<0,0,-0.203200><0.393800,0.035000,0.203200> rotate<0,90.000000,0> translate<15.246597,0.000000,16.967200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.246597,0.000000,16.573400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249797,0.000000,16.565675>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,67.494278,0> translate<15.246597,0.000000,16.573400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.246597,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.595425,0.000000,16.662400>}
box{<0,0,-0.203200><5.348828,0.035000,0.203200> rotate<0,0.000000,0> translate<15.246597,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.246597,0.000000,16.967200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.264509,0.000000,16.967200>}
box{<0,0,-0.203200><1.017912,0.035000,0.203200> rotate<0,0.000000,0> translate<15.246597,0.000000,16.967200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.246597,0.000000,21.632741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.246597,0.000000,22.034597>}
box{<0,0,-0.203200><0.401856,0.035000,0.203200> rotate<0,90.000000,0> translate<15.246597,0.000000,22.034597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.246597,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.332200,0.000000,21.945600>}
box{<0,0,-0.203200><1.085603,0.035000,0.203200> rotate<0,0.000000,0> translate<15.246597,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.246597,0.000000,22.034597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249797,0.000000,22.042322>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,-67.494278,0> translate<15.246597,0.000000,22.034597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249578,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.861600,0.000000,15.036800>}
box{<0,0,-0.203200><8.612022,0.035000,0.203200> rotate<0,0.000000,0> translate<15.249578,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249797,0.000000,15.037322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249797,0.000000,16.565675>}
box{<0,0,-0.203200><1.528353,0.035000,0.203200> rotate<0,90.000000,0> translate<15.249797,0.000000,16.565675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249797,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.649641,0.000000,15.443200>}
box{<0,0,-0.203200><8.399844,0.035000,0.203200> rotate<0,0.000000,0> translate<15.249797,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.243241,0.000000,15.849600>}
box{<0,0,-0.203200><7.993444,0.035000,0.203200> rotate<0,0.000000,0> translate<15.249797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249797,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.836841,0.000000,16.256000>}
box{<0,0,-0.203200><7.587044,0.035000,0.203200> rotate<0,0.000000,0> translate<15.249797,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249797,0.000000,22.042322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249797,0.000000,22.727831>}
box{<0,0,-0.203200><0.685509,0.035000,0.203200> rotate<0,90.000000,0> translate<15.249797,0.000000,22.727831> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249797,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.332200,0.000000,22.352000>}
box{<0,0,-0.203200><1.082403,0.035000,0.203200> rotate<0,0.000000,0> translate<15.249797,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249797,0.000000,22.727831>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.351397,0.000000,22.973113>}
box{<0,0,-0.203200><0.265491,0.035000,0.203200> rotate<0,-67.495310,0> translate<15.249797,0.000000,22.727831> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249966,0.000000,36.589188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.291991,0.000000,36.547159>}
box{<0,0,-0.203200><0.059435,0.035000,0.203200> rotate<0,44.999160,0> translate<15.249966,0.000000,36.589188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.262456,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.190756,0.000000,22.758400>}
box{<0,0,-0.203200><0.928300,0.035000,0.203200> rotate<0,0.000000,0> translate<15.262456,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.263153,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.408525,0.000000,36.576000>}
box{<0,0,-0.203200><3.145372,0.035000,0.203200> rotate<0,0.000000,0> translate<15.263153,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.291991,0.000000,36.547159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.343587,0.000000,36.517678>}
box{<0,0,-0.203200><0.059425,0.035000,0.203200> rotate<0,29.740676,0> translate<15.291991,0.000000,36.547159> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.343587,0.000000,36.517678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.419500,0.000000,36.419650>}
box{<0,0,-0.203200><0.123985,0.035000,0.203200> rotate<0,52.242527,0> translate<15.343587,0.000000,36.517678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.351397,0.000000,22.973113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.351397,0.000000,26.190603>}
box{<0,0,-0.203200><3.217491,0.035000,0.203200> rotate<0,90.000000,0> translate<15.351397,0.000000,26.190603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.351397,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.504969,0.000000,23.164800>}
box{<0,0,-0.203200><0.153572,0.035000,0.203200> rotate<0,0.000000,0> translate<15.351397,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.351397,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.448000,0.000000,23.571200>}
box{<0,0,-0.203200><0.096603,0.035000,0.203200> rotate<0,0.000000,0> translate<15.351397,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.351397,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.448000,0.000000,23.977600>}
box{<0,0,-0.203200><0.096603,0.035000,0.203200> rotate<0,0.000000,0> translate<15.351397,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.351397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.448000,0.000000,24.384000>}
box{<0,0,-0.203200><0.096603,0.035000,0.203200> rotate<0,0.000000,0> translate<15.351397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.351397,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.657497,0.000000,24.790400>}
box{<0,0,-0.203200><0.306100,0.035000,0.203200> rotate<0,0.000000,0> translate<15.351397,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.351397,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.159609,0.000000,25.196800>}
box{<0,0,-0.203200><0.808213,0.035000,0.203200> rotate<0,0.000000,0> translate<15.351397,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.351397,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,0.000000,25.603200>}
box{<0,0,-0.203200><0.752203,0.035000,0.203200> rotate<0,0.000000,0> translate<15.351397,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.351397,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,0.000000,26.009600>}
box{<0,0,-0.203200><0.752203,0.035000,0.203200> rotate<0,0.000000,0> translate<15.351397,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.351397,0.000000,26.190603>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,0.000000,26.794756>}
box{<0,0,-0.203200><0.964785,0.035000,0.203200> rotate<0,-38.768111,0> translate<15.351397,0.000000,26.190603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.419500,0.000000,36.419650>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.507188,0.000000,36.331966>}
box{<0,0,-0.203200><0.124007,0.035000,0.203200> rotate<0,44.996009,0> translate<15.419500,0.000000,36.419650> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.448000,0.000000,23.302341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.540806,0.000000,23.078288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<15.448000,0.000000,23.302341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.448000,0.000000,24.449656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.448000,0.000000,23.302341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.448000,0.000000,23.302341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.448000,0.000000,24.449656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.540806,0.000000,24.673709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<15.448000,0.000000,24.449656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.507188,0.000000,36.331966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.529931,0.000000,36.277050>}
box{<0,0,-0.203200><0.059439,0.035000,0.203200> rotate<0,67.498258,0> translate<15.507188,0.000000,36.331966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.529931,0.000000,36.277050>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.566319,0.000000,36.230069>}
box{<0,0,-0.203200><0.059425,0.035000,0.203200> rotate<0,52.238372,0> translate<15.529931,0.000000,36.277050> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.540806,0.000000,23.078288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.712288,0.000000,22.906806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<15.540806,0.000000,23.078288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.540806,0.000000,24.673709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.712288,0.000000,24.845191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.540806,0.000000,24.673709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.566319,0.000000,36.230069>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.598941,0.000000,36.110450>}
box{<0,0,-0.203200><0.123987,0.035000,0.203200> rotate<0,74.740582,0> translate<15.566319,0.000000,36.230069> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.582813,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.814925,0.000000,36.169600>}
box{<0,0,-0.203200><3.232113,0.035000,0.203200> rotate<0,0.000000,0> translate<15.582813,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.598941,0.000000,36.110450>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.646397,0.000000,35.995884>}
box{<0,0,-0.203200><0.124006,0.035000,0.203200> rotate<0,67.494856,0> translate<15.598941,0.000000,36.110450> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.632025,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,0.000000,26.416000>}
box{<0,0,-0.203200><0.471575,0.035000,0.203200> rotate<0,0.000000,0> translate<15.632025,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.646397,0.000000,35.936447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.646397,0.000000,35.995884>}
box{<0,0,-0.203200><0.059438,0.035000,0.203200> rotate<0,90.000000,0> translate<15.646397,0.000000,35.995884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.646397,0.000000,35.936447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.360944,0.000000,33.316444>}
box{<0,0,-0.203200><2.715694,0.035000,0.203200> rotate<0,74.739937,0> translate<15.646397,0.000000,35.936447> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.693647,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.221325,0.000000,35.763200>}
box{<0,0,-0.203200><3.527678,0.035000,0.203200> rotate<0,0.000000,0> translate<15.693647,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.712288,0.000000,22.906806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.936341,0.000000,22.814000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<15.712288,0.000000,22.906806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.712288,0.000000,24.845191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.936341,0.000000,24.937997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<15.712288,0.000000,24.845191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.804484,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.627725,0.000000,35.356800>}
box{<0,0,-0.203200><3.823241,0.035000,0.203200> rotate<0,0.000000,0> translate<15.804484,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.900400,0.000000,6.289866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,5.832666>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,44.997030,0> translate<15.900400,0.000000,6.289866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.900400,0.000000,7.426131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.900400,0.000000,6.289866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.900400,0.000000,6.289866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.900400,0.000000,7.426131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.703866,0.000000,8.229597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.900400,0.000000,7.426131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.915322,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.535222,0.000000,34.950400>}
box{<0,0,-0.203200><2.619900,0.035000,0.203200> rotate<0,0.000000,0> translate<15.915322,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.936341,0.000000,22.814000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.135156,0.000000,22.814000>}
box{<0,0,-0.203200><0.198816,0.035000,0.203200> rotate<0,0.000000,0> translate<15.936341,0.000000,22.814000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.936341,0.000000,24.937997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.302847,0.000000,24.937997>}
box{<0,0,-0.203200><0.366506,0.035000,0.203200> rotate<0,0.000000,0> translate<15.936341,0.000000,24.937997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.992669,0.000000,3.403600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,3.038669>}
box{<0,0,-0.203200><0.516091,0.035000,0.203200> rotate<0,44.997030,0> translate<15.992669,0.000000,3.403600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.026156,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.128822,0.000000,34.544000>}
box{<0,0,-0.203200><2.102666,0.035000,0.203200> rotate<0,0.000000,0> translate<16.026156,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.090725,0.000000,25.419181>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,0.000000,25.377619>}
box{<0,0,-0.203200><0.043511,0.035000,0.203200> rotate<0,72.783552,0> translate<16.090725,0.000000,25.419181> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.090725,0.000000,25.419181>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,0.000000,25.558250>}
box{<0,0,-0.203200><0.139663,0.035000,0.203200> rotate<0,-84.705037,0> translate<16.090725,0.000000,25.419181> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,0.000000,25.334112>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.157044,0.000000,25.205091>}
box{<0,0,-0.203200><0.139653,0.035000,0.203200> rotate<0,67.495113,0> translate<16.103600,0.000000,25.334112> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,0.000000,25.377619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,0.000000,25.334112>}
box{<0,0,-0.203200><0.043506,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.103600,0.000000,25.334112> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,0.000000,26.794756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,0.000000,25.558250>}
box{<0,0,-0.203200><1.236506,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.103600,0.000000,25.558250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.135156,0.000000,22.814000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.363131,0.000000,22.586028>}
box{<0,0,-0.203200><0.322403,0.035000,0.203200> rotate<0,44.996638,0> translate<16.135156,0.000000,22.814000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.136994,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.008600,0.000000,34.137600>}
box{<0,0,-0.203200><1.871606,0.035000,0.203200> rotate<0,0.000000,0> translate<16.136994,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.157044,0.000000,25.205091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.198363,0.000000,25.071700>}
box{<0,0,-0.203200><0.139643,0.035000,0.203200> rotate<0,72.784436,0> translate<16.157044,0.000000,25.205091> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.174400,0.000000,18.627256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.174400,0.000000,18.592797>}
box{<0,0,-0.203200><0.034459,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.174400,0.000000,18.592797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.174400,0.000000,18.627256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.267206,0.000000,18.851309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<16.174400,0.000000,18.627256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.198363,0.000000,25.071700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.226156,0.000000,25.038234>}
box{<0,0,-0.203200><0.043502,0.035000,0.203200> rotate<0,50.286494,0> translate<16.198363,0.000000,25.071700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.226156,0.000000,25.038234>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.242809,0.000000,24.998031>}
box{<0,0,-0.203200><0.043516,0.035000,0.203200> rotate<0,67.495004,0> translate<16.226156,0.000000,25.038234> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.242809,0.000000,24.998031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.302847,0.000000,24.937997>}
box{<0,0,-0.203200><0.084904,0.035000,0.203200> rotate<0,44.995539,0> translate<16.242809,0.000000,24.998031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.247831,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.008600,0.000000,33.731200>}
box{<0,0,-0.203200><1.760769,0.035000,0.203200> rotate<0,0.000000,0> translate<16.247831,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.264509,0.000000,16.967200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.267206,0.000000,16.960688>}
box{<0,0,-0.203200><0.007049,0.035000,0.203200> rotate<0,67.500733,0> translate<16.264509,0.000000,16.967200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.267206,0.000000,16.960688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.438688,0.000000,16.789206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<16.267206,0.000000,16.960688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.267206,0.000000,18.851309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.438688,0.000000,19.022791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.267206,0.000000,18.851309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.332200,0.000000,20.668641>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.425006,0.000000,20.444588>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<16.332200,0.000000,20.668641> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.332200,0.000000,22.511356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.332200,0.000000,20.668641>}
box{<0,0,-0.203200><1.842716,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.332200,0.000000,20.668641> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.332200,0.000000,22.511356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.363131,0.000000,22.586028>}
box{<0,0,-0.203200><0.080825,0.035000,0.203200> rotate<0,-67.494794,0> translate<16.332200,0.000000,22.511356> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,2.612113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.496809,0.000000,2.276031>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,67.495551,0> translate<16.357600,0.000000,2.612113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,3.038669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,2.612113>}
box{<0,0,-0.203200><0.426556,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.357600,0.000000,2.612113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,5.832666>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,5.232397>}
box{<0,0,-0.203200><0.600269,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.357600,0.000000,5.232397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.358666,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.008600,0.000000,33.324800>}
box{<0,0,-0.203200><1.649934,0.035000,0.203200> rotate<0,0.000000,0> translate<16.358666,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.360944,0.000000,33.316444>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,0.000000,33.201884>}
box{<0,0,-0.203200><0.123999,0.035000,0.203200> rotate<0,67.495085,0> translate<16.360944,0.000000,33.316444> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,0.000000,32.791397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,0.000000,32.962116>}
box{<0,0,-0.203200><0.170719,0.035000,0.203200> rotate<0,90.000000,0> translate<16.408397,0.000000,32.962116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,0.000000,32.791397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.659778,0.000000,32.791397>}
box{<0,0,-0.203200><1.251381,0.035000,0.203200> rotate<0,0.000000,0> translate<16.408397,0.000000,32.791397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.230419,0.000000,32.918400>}
box{<0,0,-0.203200><1.822022,0.035000,0.203200> rotate<0,0.000000,0> translate<16.408397,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,0.000000,32.962116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.424034,0.000000,33.085119>}
box{<0,0,-0.203200><0.123993,0.035000,0.203200> rotate<0,-82.749340,0> translate<16.408397,0.000000,32.962116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,0.000000,33.142450>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,0.000000,33.201884>}
box{<0,0,-0.203200><0.059434,0.035000,0.203200> rotate<0,90.000000,0> translate<16.408397,0.000000,33.201884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.408397,0.000000,33.142450>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.424034,0.000000,33.085119>}
box{<0,0,-0.203200><0.059426,0.035000,0.203200> rotate<0,74.738363,0> translate<16.408397,0.000000,33.142450> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.425006,0.000000,20.444588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.596488,0.000000,20.273106>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<16.425006,0.000000,20.444588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.427325,0.000000,38.557200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.653131,0.000000,35.331397>}
box{<0,0,-0.203200><4.561977,0.035000,0.203200> rotate<0,44.997002,0> translate<16.427325,0.000000,38.557200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.438688,0.000000,16.789206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662741,0.000000,16.696400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<16.438688,0.000000,16.789206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.438688,0.000000,19.022791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662741,0.000000,19.115597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<16.438688,0.000000,19.022791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.496809,0.000000,2.276031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.258809,0.000000,1.514034>}
box{<0,0,-0.203200><1.077629,0.035000,0.203200> rotate<0,44.996913,0> translate<16.496809,0.000000,2.276031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.596488,0.000000,20.273106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820541,0.000000,20.180300>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<16.596488,0.000000,20.273106> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662741,0.000000,16.696400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.405256,0.000000,16.696400>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,0.000000,0> translate<16.662741,0.000000,16.696400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662741,0.000000,19.115597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.950441,0.000000,19.115597>}
box{<0,0,-0.203200><1.287700,0.035000,0.203200> rotate<0,0.000000,0> translate<16.662741,0.000000,19.115597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.703866,0.000000,8.229597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.840131,0.000000,8.229597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<16.703866,0.000000,8.229597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820541,0.000000,20.180300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.135600,0.000000,20.180300>}
box{<0,0,-0.203200><1.315059,0.035000,0.203200> rotate<0,0.000000,0> translate<16.820541,0.000000,20.180300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.925675,0.000000,40.182797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.224412,0.000000,40.059056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<16.925675,0.000000,40.182797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.224412,0.000000,40.059056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.453056,0.000000,39.830413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<17.224412,0.000000,40.059056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.258809,0.000000,1.514031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.516031,0.000000,1.256809>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,44.997030,0> translate<17.258809,0.000000,1.514031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.258809,0.000000,1.514034>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.258809,0.000000,1.514031>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.258809,0.000000,1.514031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.453056,0.000000,39.830413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.387553,0.000000,34.895916>}
box{<0,0,-0.203200><6.978432,0.035000,0.203200> rotate<0,44.997030,0> translate<17.453056,0.000000,39.830413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.456269,0.000000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.288800,0.000000,39.827200>}
box{<0,0,-0.203200><43.832531,0.035000,0.203200> rotate<0,0.000000,0> translate<17.456269,0.000000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.516031,0.000000,1.256809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.852113,0.000000,1.117600>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,22.498510,0> translate<17.516031,0.000000,1.256809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.659778,0.000000,32.791397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,32.163175>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,44.997030,0> translate<17.659778,0.000000,32.791397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.840131,0.000000,8.229597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,7.426131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<17.840131,0.000000,8.229597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.852113,0.000000,1.117600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.885884,0.000000,1.117600>}
box{<0,0,-0.203200><27.033772,0.035000,0.203200> rotate<0,0.000000,0> translate<17.852113,0.000000,1.117600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.862669,0.000000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.288800,0.000000,39.420800>}
box{<0,0,-0.203200><43.426131,0.035000,0.203200> rotate<0,0.000000,0> translate<17.862669,0.000000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.939175,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.636819,0.000000,32.512000>}
box{<0,0,-0.203200><0.697644,0.035000,0.203200> rotate<0,0.000000,0> translate<17.939175,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.941728,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.682269,0.000000,8.128000>}
box{<0,0,-0.203200><3.740541,0.035000,0.203200> rotate<0,0.000000,0> translate<17.941728,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.950441,0.000000,19.115597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.135600,0.000000,19.300756>}
box{<0,0,-0.203200><0.261855,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.950441,0.000000,19.115597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.008600,0.000000,33.140219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.636822,0.000000,32.511997>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,44.997030,0> translate<18.008600,0.000000,33.140219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.008600,0.000000,34.423778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.008600,0.000000,33.140219>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.008600,0.000000,33.140219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.008600,0.000000,34.423778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.916219,0.000000,35.331397>}
box{<0,0,-0.203200><1.283567,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.008600,0.000000,34.423778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.135600,0.000000,20.180300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.135600,0.000000,19.300756>}
box{<0,0,-0.203200><0.879544,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.135600,0.000000,19.300756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.186397,0.000000,5.089328>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.186397,0.000000,5.832666>}
box{<0,0,-0.203200><0.743337,0.035000,0.203200> rotate<0,90.000000,0> translate<18.186397,0.000000,5.832666> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.186397,0.000000,5.089328>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,4.632131>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.996834,0> translate<18.186397,0.000000,5.089328> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.186397,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.631469,0.000000,5.283200>}
box{<0,0,-0.203200><3.445072,0.035000,0.203200> rotate<0,0.000000,0> translate<18.186397,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.186397,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.580666,0.000000,5.689600>}
box{<0,0,-0.203200><3.394269,0.035000,0.203200> rotate<0,0.000000,0> translate<18.186397,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.186397,0.000000,5.832666>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,6.289866>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.186397,0.000000,5.832666> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.253441,0.000000,3.105713>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.412753,0.000000,2.946397>}
box{<0,0,-0.203200><0.225304,0.035000,0.203200> rotate<0,44.997592,0> translate<18.253441,0.000000,3.105713> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.253441,0.000000,3.105713>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,3.495866>}
box{<0,0,-0.203200><0.551762,0.035000,0.203200> rotate<0,-44.996801,0> translate<18.253441,0.000000,3.105713> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.269069,0.000000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.359116,0.000000,39.014400>}
box{<0,0,-0.203200><43.090047,0.035000,0.203200> rotate<0,0.000000,0> translate<18.269069,0.000000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,32.163175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.636822,0.000000,32.511997>}
box{<0,0,-0.203200><0.493309,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.288000,0.000000,32.163175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.348128,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.275869,0.000000,7.721600>}
box{<0,0,-0.203200><2.927741,0.035000,0.203200> rotate<0,0.000000,0> translate<18.348128,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.398928,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.225066,0.000000,3.251200>}
box{<0,0,-0.203200><2.826138,0.035000,0.203200> rotate<0,0.000000,0> translate<18.398928,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.398928,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.225069,0.000000,4.876800>}
box{<0,0,-0.203200><2.826141,0.035000,0.203200> rotate<0,0.000000,0> translate<18.398928,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.412753,0.000000,2.946397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.529872,0.000000,2.946397>}
box{<0,0,-0.203200><3.117119,0.035000,0.203200> rotate<0,0.000000,0> translate<18.412753,0.000000,2.946397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.449731,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.174266,0.000000,6.096000>}
box{<0,0,-0.203200><2.724534,0.035000,0.203200> rotate<0,0.000000,0> translate<18.449731,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,3.495866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,4.632131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<18.643597,0.000000,4.632131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,3.657600>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.643597,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,4.064000>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.643597,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,4.470400>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.643597,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,6.289866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,7.426131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<18.643597,0.000000,7.426131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,6.502400>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.643597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,6.908800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.643597,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.643597,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,7.315200>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.643597,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.675469,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.527453,0.000000,38.608000>}
box{<0,0,-0.203200><42.851984,0.035000,0.203200> rotate<0,0.000000,0> translate<18.675469,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.916219,0.000000,35.331397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.653131,0.000000,35.331397>}
box{<0,0,-0.203200><0.736912,0.035000,0.203200> rotate<0,0.000000,0> translate<18.916219,0.000000,35.331397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.081869,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.841497,0.000000,38.201600>}
box{<0,0,-0.203200><30.759628,0.035000,0.203200> rotate<0,0.000000,0> translate<19.081869,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.405256,0.000000,16.696400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.504722,0.000000,16.737600>}
box{<0,0,-0.203200><0.107661,0.035000,0.203200> rotate<0,-22.498510,0> translate<19.405256,0.000000,16.696400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.488269,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,37.795200>}
box{<0,0,-0.203200><30.230131,0.035000,0.203200> rotate<0,0.000000,0> translate<19.488269,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.504722,0.000000,16.737600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.413878,0.000000,16.737600>}
box{<0,0,-0.203200><0.909156,0.035000,0.203200> rotate<0,0.000000,0> translate<19.504722,0.000000,16.737600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.894669,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,37.388800>}
box{<0,0,-0.203200><29.823731,0.035000,0.203200> rotate<0,0.000000,0> translate<19.894669,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.301069,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.123375,0.000000,36.982400>}
box{<0,0,-0.203200><21.822306,0.035000,0.203200> rotate<0,0.000000,0> translate<20.301069,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.413878,0.000000,16.737600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.614741,0.000000,16.654400>}
box{<0,0,-0.203200><0.217412,0.035000,0.203200> rotate<0,22.498522,0> translate<20.413878,0.000000,16.737600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.479175,0.000000,32.511997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.107397,0.000000,31.883778>}
box{<0,0,-0.203200><0.888438,0.035000,0.203200> rotate<0,44.996888,0> translate<20.479175,0.000000,32.511997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.479175,0.000000,32.511997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.107397,0.000000,33.140219>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.479175,0.000000,32.511997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.479178,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,32.512000>}
box{<0,0,-0.203200><21.559222,0.035000,0.203200> rotate<0,0.000000,0> translate<20.479178,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.614741,0.000000,16.654400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.057256,0.000000,16.654400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<20.614741,0.000000,16.654400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.707469,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,36.576000>}
box{<0,0,-0.203200><21.330931,0.035000,0.203200> rotate<0,0.000000,0> translate<20.707469,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.885575,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,32.105600>}
box{<0,0,-0.203200><21.152825,0.035000,0.203200> rotate<0,0.000000,0> translate<20.885575,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.885578,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.428009,0.000000,32.918400>}
box{<0,0,-0.203200><1.542431,0.035000,0.203200> rotate<0,0.000000,0> translate<20.885578,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,3.495866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.529872,0.000000,2.946397>}
box{<0,0,-0.203200><0.777068,0.035000,0.203200> rotate<0,44.996867,0> translate<20.980400,0.000000,3.495866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,4.632131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,3.495866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.980400,0.000000,3.495866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,4.632131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.783866,0.000000,5.435597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.980400,0.000000,4.632131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,6.289866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.783866,0.000000,5.486400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<20.980400,0.000000,6.289866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,7.426131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,6.289866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.980400,0.000000,6.289866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.980400,0.000000,7.426131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.783866,0.000000,8.229597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.980400,0.000000,7.426131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.107397,0.000000,31.311028>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.107397,0.000000,31.883778>}
box{<0,0,-0.203200><0.572750,0.035000,0.203200> rotate<0,90.000000,0> translate<21.107397,0.000000,31.883778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.107397,0.000000,31.311028>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.054616,0.000000,30.784797>}
box{<0,0,-0.203200><1.083579,0.035000,0.203200> rotate<0,29.052622,0> translate<21.107397,0.000000,31.311028> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.107397,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,31.699200>}
box{<0,0,-0.203200><20.931003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.107397,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.107397,0.000000,33.140219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.107397,0.000000,33.877131>}
box{<0,0,-0.203200><0.736913,0.035000,0.203200> rotate<0,90.000000,0> translate<21.107397,0.000000,33.877131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.107397,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659725,0.000000,33.324800>}
box{<0,0,-0.203200><0.552328,0.035000,0.203200> rotate<0,0.000000,0> translate<21.107397,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.107397,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.253325,0.000000,33.731200>}
box{<0,0,-0.203200><0.145928,0.035000,0.203200> rotate<0,0.000000,0> translate<21.107397,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.107397,0.000000,33.877131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.717584,0.000000,33.266941>}
box{<0,0,-0.203200><0.862938,0.035000,0.203200> rotate<0,44.997177,0> translate<21.107397,0.000000,33.877131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.113869,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,36.169600>}
box{<0,0,-0.203200><20.924531,0.035000,0.203200> rotate<0,0.000000,0> translate<21.113869,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.140209,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,31.292800>}
box{<0,0,-0.203200><20.898191,0.035000,0.203200> rotate<0,0.000000,0> translate<21.140209,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.520269,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,35.763200>}
box{<0,0,-0.203200><20.518131,0.035000,0.203200> rotate<0,0.000000,0> translate<21.520269,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.717584,0.000000,33.266941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.016322,0.000000,33.143200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<21.717584,0.000000,33.266941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.783866,0.000000,5.435597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.574125,0.000000,5.435597>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<21.783866,0.000000,5.435597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.783866,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.624931,0.000000,5.486400>}
box{<0,0,-0.203200><0.841066,0.035000,0.203200> rotate<0,0.000000,0> translate<21.783866,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.783866,0.000000,8.229597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.920131,0.000000,8.229597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<21.783866,0.000000,8.229597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.871731,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.383613,0.000000,30.886400>}
box{<0,0,-0.203200><0.511881,0.035000,0.203200> rotate<0,0.000000,0> translate<21.871731,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.926669,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,35.356800>}
box{<0,0,-0.203200><20.111731,0.035000,0.203200> rotate<0,0.000000,0> translate<21.926669,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.016322,0.000000,33.143200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.338400,0.000000,33.143200>}
box{<0,0,-0.203200><0.322078,0.035000,0.203200> rotate<0,0.000000,0> translate<22.016322,0.000000,33.143200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.054616,0.000000,30.784797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.341525,0.000000,30.784797>}
box{<0,0,-0.203200><0.286909,0.035000,0.203200> rotate<0,0.000000,0> translate<22.054616,0.000000,30.784797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.057256,0.000000,16.654400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.281309,0.000000,16.747206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<22.057256,0.000000,16.654400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.076569,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.430441,0.000000,16.662400>}
box{<0,0,-0.203200><0.353872,0.035000,0.203200> rotate<0,0.000000,0> translate<22.076569,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.281309,0.000000,16.747206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.313472,0.000000,16.779372>}
box{<0,0,-0.203200><0.045487,0.035000,0.203200> rotate<0,-44.999813,0> translate<22.281309,0.000000,16.747206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.313472,0.000000,16.779372>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.861600,0.000000,15.231241>}
box{<0,0,-0.203200><2.189386,0.035000,0.203200> rotate<0,44.997088,0> translate<22.313472,0.000000,16.779372> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.333069,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.410122,0.000000,34.950400>}
box{<0,0,-0.203200><0.077053,0.035000,0.203200> rotate<0,0.000000,0> translate<22.333069,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.338400,0.000000,33.134741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.431206,0.000000,32.910688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<22.338400,0.000000,33.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.338400,0.000000,33.143200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.338400,0.000000,33.134741>}
box{<0,0,-0.203200><0.008459,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.338400,0.000000,33.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.341525,0.000000,30.784797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.431206,0.000000,31.001309>}
box{<0,0,-0.203200><0.234351,0.035000,0.203200> rotate<0,-67.495808,0> translate<22.341525,0.000000,30.784797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.387553,0.000000,34.895916>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.431206,0.000000,35.001309>}
box{<0,0,-0.203200><0.114076,0.035000,0.203200> rotate<0,-67.496657,0> translate<22.387553,0.000000,34.895916> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.431206,0.000000,31.001309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.602688,0.000000,31.172791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.431206,0.000000,31.001309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.431206,0.000000,32.910688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.602688,0.000000,32.739206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<22.431206,0.000000,32.910688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.431206,0.000000,35.001309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.602688,0.000000,35.172791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.431206,0.000000,35.001309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.574125,0.000000,5.435597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.624931,0.000000,5.486400>}
box{<0,0,-0.203200><0.071849,0.035000,0.203200> rotate<0,-44.995268,0> translate<22.574125,0.000000,5.435597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.602688,0.000000,31.172791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.826741,0.000000,31.265597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<22.602688,0.000000,31.172791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.602688,0.000000,32.739206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.826741,0.000000,32.646400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<22.602688,0.000000,32.739206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.602688,0.000000,35.172791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.826741,0.000000,35.265597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<22.602688,0.000000,35.172791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.826741,0.000000,31.265597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.069256,0.000000,31.265597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<22.826741,0.000000,31.265597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.826741,0.000000,32.646400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.069256,0.000000,32.646400>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<22.826741,0.000000,32.646400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.826741,0.000000,35.265597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.069256,0.000000,35.265597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<22.826741,0.000000,35.265597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.920131,0.000000,8.229597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.621997,0.000000,7.527728>}
box{<0,0,-0.203200><0.992590,0.035000,0.203200> rotate<0,44.997158,0> translate<22.920131,0.000000,8.229597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.021728,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.079200,0.000000,8.128000>}
box{<0,0,-0.203200><1.057472,0.035000,0.203200> rotate<0,0.000000,0> translate<23.021728,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.428128,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.815869,0.000000,7.721600>}
box{<0,0,-0.203200><0.387741,0.035000,0.203200> rotate<0,0.000000,0> translate<23.428128,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.621997,0.000000,7.527728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.079200,0.000000,7.984931>}
box{<0,0,-0.203200><0.646583,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.621997,0.000000,7.527728> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,11.216741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.859206,0.000000,10.992688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<23.766400,0.000000,11.216741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,12.659256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,11.216741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.766400,0.000000,11.216741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,12.659256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.859206,0.000000,12.883309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<23.766400,0.000000,12.659256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,13.248741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.859206,0.000000,13.024688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<23.766400,0.000000,13.248741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,14.691256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,13.248741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.766400,0.000000,13.248741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.766400,0.000000,14.691256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.859206,0.000000,14.915309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<23.766400,0.000000,14.691256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.859206,0.000000,10.992688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.030688,0.000000,10.821206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<23.859206,0.000000,10.992688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.859206,0.000000,12.883309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.929897,0.000000,12.954000>}
box{<0,0,-0.203200><0.099972,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.859206,0.000000,12.883309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.859206,0.000000,13.024688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.929897,0.000000,12.954000>}
box{<0,0,-0.203200><0.099969,0.035000,0.203200> rotate<0,44.995764,0> translate<23.859206,0.000000,13.024688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.859206,0.000000,14.915309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.861600,0.000000,14.917703>}
box{<0,0,-0.203200><0.003385,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.859206,0.000000,14.915309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.861600,0.000000,15.231241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.861600,0.000000,14.917703>}
box{<0,0,-0.203200><0.313537,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.861600,0.000000,14.917703> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.030688,0.000000,10.821206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.254741,0.000000,10.728400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<24.030688,0.000000,10.821206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.079200,0.000000,8.797675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.079200,0.000000,7.984931>}
box{<0,0,-0.203200><0.812744,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.079200,0.000000,7.984931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.079200,0.000000,8.797675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.202941,0.000000,9.096412>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<24.079200,0.000000,8.797675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.202941,0.000000,9.096412>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.431584,0.000000,9.325056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.202941,0.000000,9.096412> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.254741,0.000000,10.728400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.297256,0.000000,10.728400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<24.254741,0.000000,10.728400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.431584,0.000000,9.325056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.771584,0.000000,10.665056>}
box{<0,0,-0.203200><1.895046,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.431584,0.000000,9.325056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.297256,0.000000,10.728400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.381269,0.000000,10.763200>}
box{<0,0,-0.203200><0.090935,0.035000,0.203200> rotate<0,-22.499029,0> translate<25.297256,0.000000,10.728400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.381269,0.000000,10.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.008531,0.000000,10.763200>}
box{<0,0,-0.203200><0.627263,0.035000,0.203200> rotate<0,0.000000,0> translate<25.381269,0.000000,10.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.771584,0.000000,10.665056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.008531,0.000000,10.763200>}
box{<0,0,-0.203200><0.256468,0.035000,0.203200> rotate<0,-22.497925,0> translate<25.771584,0.000000,10.665056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.069256,0.000000,31.265597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.293309,0.000000,31.172791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<27.069256,0.000000,31.265597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.069256,0.000000,32.646400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.293309,0.000000,32.739206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<27.069256,0.000000,32.646400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.069256,0.000000,35.265597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.293309,0.000000,35.172791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<27.069256,0.000000,35.265597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.293309,0.000000,31.172791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.464791,0.000000,31.001309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<27.293309,0.000000,31.172791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.293309,0.000000,32.739206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.464791,0.000000,32.910688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.293309,0.000000,32.739206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.293309,0.000000,35.172791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.464791,0.000000,35.001309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<27.293309,0.000000,35.172791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.464791,0.000000,31.001309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.557597,0.000000,30.777256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<27.464791,0.000000,31.001309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.464791,0.000000,32.910688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.557597,0.000000,33.134741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<27.464791,0.000000,32.910688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.464791,0.000000,35.001309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.557597,0.000000,34.777256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<27.464791,0.000000,35.001309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.467984,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.096869,0.000000,32.918400>}
box{<0,0,-0.203200><14.628884,0.035000,0.203200> rotate<0,0.000000,0> translate<27.467984,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.485878,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.110125,0.000000,34.950400>}
box{<0,0,-0.203200><14.624247,0.035000,0.203200> rotate<0,0.000000,0> translate<27.485878,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.512391,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.083613,0.000000,30.886400>}
box{<0,0,-0.203200><14.571222,0.035000,0.203200> rotate<0,0.000000,0> translate<27.512391,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.557597,0.000000,30.768797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.557597,0.000000,30.777256>}
box{<0,0,-0.203200><0.008459,0.035000,0.203200> rotate<0,90.000000,0> translate<27.557597,0.000000,30.777256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.557597,0.000000,30.768797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.879675,0.000000,30.768797>}
box{<0,0,-0.203200><1.322078,0.035000,0.203200> rotate<0,0.000000,0> translate<27.557597,0.000000,30.768797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.557597,0.000000,33.134741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.557597,0.000000,34.777256>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,90.000000,0> translate<27.557597,0.000000,34.777256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.557597,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,33.324800>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<27.557597,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.557597,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,33.731200>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<27.557597,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.557597,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,34.137600>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<27.557597,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.557597,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,34.544000>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<27.557597,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.174513,0.000000,10.776000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.183709,0.000000,10.772191>}
box{<0,0,-0.203200><0.009955,0.035000,0.203200> rotate<0,22.498008,0> translate<28.174513,0.000000,10.776000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.174513,0.000000,10.776000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.183709,0.000000,10.779806>}
box{<0,0,-0.203200><0.009953,0.035000,0.203200> rotate<0,-22.481390,0> translate<28.174513,0.000000,10.776000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.183709,0.000000,10.772191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.283038,0.000000,10.672863>}
box{<0,0,-0.203200><0.140471,0.035000,0.203200> rotate<0,44.997030,0> translate<28.183709,0.000000,10.772191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.183709,0.000000,10.779806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.355191,0.000000,10.951288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.183709,0.000000,10.779806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.283038,0.000000,10.672863>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.382341,0.000000,10.713997>}
box{<0,0,-0.203200><0.107486,0.035000,0.203200> rotate<0,-22.499339,0> translate<28.283038,0.000000,10.672863> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.355191,0.000000,10.951288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.429216,0.000000,11.130000>}
box{<0,0,-0.203200><0.193437,0.035000,0.203200> rotate<0,-67.495584,0> translate<28.355191,0.000000,10.951288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.364100,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,10.972800>}
box{<0,0,-0.203200><6.179900,0.035000,0.203200> rotate<0,0.000000,0> translate<28.364100,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.382341,0.000000,10.713997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.529656,0.000000,10.713997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<28.382341,0.000000,10.713997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.429216,0.000000,11.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.529656,0.000000,11.130000>}
box{<0,0,-0.203200><1.100441,0.035000,0.203200> rotate<0,0.000000,0> translate<28.429216,0.000000,11.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.879675,0.000000,30.768797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.178413,0.000000,30.645056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<28.879675,0.000000,30.768797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.178413,0.000000,30.645056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.693056,0.000000,27.130413>}
box{<0,0,-0.203200><4.970457,0.035000,0.203200> rotate<0,44.997030,0> translate<29.178413,0.000000,30.645056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.343469,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,30.480000>}
box{<0,0,-0.203200><12.694931,0.035000,0.203200> rotate<0,0.000000,0> translate<29.343469,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.529656,0.000000,10.713997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.753709,0.000000,10.621191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<29.529656,0.000000,10.713997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.529656,0.000000,11.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.753709,0.000000,11.222806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<29.529656,0.000000,11.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.749869,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,30.073600>}
box{<0,0,-0.203200><12.288531,0.035000,0.203200> rotate<0,0.000000,0> translate<29.749869,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.753709,0.000000,10.621191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.925191,0.000000,10.449709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<29.753709,0.000000,10.621191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.753709,0.000000,11.222806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.925191,0.000000,11.394288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.753709,0.000000,11.222806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.808500,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,10.566400>}
box{<0,0,-0.203200><4.735500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.808500,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.910103,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.627897,0.000000,11.379200>}
box{<0,0,-0.203200><4.717794,0.035000,0.203200> rotate<0,0.000000,0> translate<29.910103,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.925191,0.000000,10.449709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.017997,0.000000,10.225656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<29.925191,0.000000,10.449709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.925191,0.000000,11.394288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.017997,0.000000,11.618341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<29.925191,0.000000,11.394288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.017997,0.000000,9.385034>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.017997,0.000000,10.225656>}
box{<0,0,-0.203200><0.840622,0.035000,0.203200> rotate<0,90.000000,0> translate<30.017997,0.000000,10.225656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.017997,0.000000,9.385034>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.160341,0.000000,9.443997>}
box{<0,0,-0.203200><0.154072,0.035000,0.203200> rotate<0,-22.499129,0> translate<30.017997,0.000000,9.385034> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.017997,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.617294,0.000000,9.753600>}
box{<0,0,-0.203200><4.599297,0.035000,0.203200> rotate<0,0.000000,0> translate<30.017997,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.017997,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.633197,0.000000,10.160000>}
box{<0,0,-0.203200><4.615200,0.035000,0.203200> rotate<0,0.000000,0> translate<30.017997,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.017997,0.000000,11.618341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.017997,0.000000,11.758531>}
box{<0,0,-0.203200><0.140191,0.035000,0.203200> rotate<0,90.000000,0> translate<30.017997,0.000000,11.758531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.017997,0.000000,11.758531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.089584,0.000000,11.686941>}
box{<0,0,-0.203200><0.101242,0.035000,0.203200> rotate<0,44.998281,0> translate<30.017997,0.000000,11.758531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.089584,0.000000,11.686941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.140384,0.000000,11.665900>}
box{<0,0,-0.203200><0.054985,0.035000,0.203200> rotate<0,22.497144,0> translate<30.089584,0.000000,11.686941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.140384,0.000000,11.665900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.184031,0.000000,11.632459>}
box{<0,0,-0.203200><0.054985,0.035000,0.203200> rotate<0,37.455532,0> translate<30.140384,0.000000,11.665900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.156269,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,29.667200>}
box{<0,0,-0.203200><11.882131,0.035000,0.203200> rotate<0,0.000000,0> translate<30.156269,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.160341,0.000000,9.443997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.307656,0.000000,9.443997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<30.160341,0.000000,9.443997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.184031,0.000000,11.632459>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.288466,0.000000,11.604563>}
box{<0,0,-0.203200><0.108096,0.035000,0.203200> rotate<0,14.954864,0> translate<30.184031,0.000000,11.632459> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.288466,0.000000,11.604563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.388322,0.000000,11.563200>}
box{<0,0,-0.203200><0.108084,0.035000,0.203200> rotate<0,22.498852,0> translate<30.288466,0.000000,11.604563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.388322,0.000000,11.563200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.443306,0.000000,11.563200>}
box{<0,0,-0.203200><0.054984,0.035000,0.203200> rotate<0,0.000000,0> translate<30.388322,0.000000,11.563200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.443306,0.000000,11.563200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.496428,0.000000,11.549009>}
box{<0,0,-0.203200><0.054985,0.035000,0.203200> rotate<0,14.955392,0> translate<30.443306,0.000000,11.563200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.496428,0.000000,11.549009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.603587,0.000000,11.563200>}
box{<0,0,-0.203200><0.108095,0.035000,0.203200> rotate<0,-7.543028,0> translate<30.496428,0.000000,11.549009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.562669,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,29.260800>}
box{<0,0,-0.203200><11.475731,0.035000,0.203200> rotate<0,0.000000,0> translate<30.562669,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.603587,0.000000,11.563200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.799300,0.000000,11.563200>}
box{<0,0,-0.203200><4.195713,0.035000,0.203200> rotate<0,0.000000,0> translate<30.603587,0.000000,11.563200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.969069,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.070356,0.000000,28.854400>}
box{<0,0,-0.203200><11.101288,0.035000,0.203200> rotate<0,0.000000,0> translate<30.969069,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,16.713197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,20.972300>}
box{<0,0,-0.203200><4.259103,0.035000,0.203200> rotate<0,90.000000,0> translate<31.108797,0.000000,20.972300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,16.713197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,16.713197>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.108797,0.000000,16.713197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,17.068800>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.108797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,17.475200>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.108797,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,17.881600>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.108797,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,18.288000>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.108797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,18.694400>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.108797,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,19.100800>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.108797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,19.507200>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.108797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,19.913600>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.108797,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,20.320000>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.108797,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,20.726400>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.108797,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.108797,0.000000,20.972300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.206288,0.000000,20.874806>}
box{<0,0,-0.203200><0.137875,0.035000,0.203200> rotate<0,44.997948,0> translate<31.108797,0.000000,20.972300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.206288,0.000000,20.874806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.430341,0.000000,20.782000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<31.206288,0.000000,20.874806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.307656,0.000000,9.443997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.368997,0.000000,9.418588>}
box{<0,0,-0.203200><0.066395,0.035000,0.203200> rotate<0,22.499517,0> translate<31.307656,0.000000,9.443997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.368997,0.000000,9.418588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.430341,0.000000,9.443997>}
box{<0,0,-0.203200><0.066398,0.035000,0.203200> rotate<0,-22.498485,0> translate<31.368997,0.000000,9.418588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.375469,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,28.448000>}
box{<0,0,-0.203200><10.662931,0.035000,0.203200> rotate<0,0.000000,0> translate<31.375469,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.430341,0.000000,9.443997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.577656,0.000000,9.443997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<31.430341,0.000000,9.443997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.430341,0.000000,20.782000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.577656,0.000000,20.782000>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<31.430341,0.000000,20.782000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.781869,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,28.041600>}
box{<0,0,-0.203200><10.256531,0.035000,0.203200> rotate<0,0.000000,0> translate<31.781869,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.188269,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,27.635200>}
box{<0,0,-0.203200><9.850131,0.035000,0.203200> rotate<0,0.000000,0> translate<32.188269,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.577656,0.000000,9.443997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.801709,0.000000,9.351191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<32.577656,0.000000,9.443997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.577656,0.000000,20.782000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.801709,0.000000,20.874806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<32.577656,0.000000,20.782000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.594669,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,27.228800>}
box{<0,0,-0.203200><9.443731,0.035000,0.203200> rotate<0,0.000000,0> translate<32.594669,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.693056,0.000000,27.130413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,26.831675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<32.693056,0.000000,27.130413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.801709,0.000000,9.351191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.973191,0.000000,9.179709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<32.801709,0.000000,9.351191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.801709,0.000000,20.874806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.973191,0.000000,21.046288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.801709,0.000000,20.874806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.805700,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,9.347200>}
box{<0,0,-0.203200><1.738300,0.035000,0.203200> rotate<0,0.000000,0> translate<32.805700,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,22.798100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,26.831675>}
box{<0,0,-0.203200><4.033575,0.035000,0.203200> rotate<0,90.000000,0> translate<32.816797,0.000000,26.831675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,22.798100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.973191,0.000000,22.641709>}
box{<0,0,-0.203200><0.221172,0.035000,0.203200> rotate<0,44.996458,0> translate<32.816797,0.000000,22.798100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,23.164800>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,23.571200>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,23.977600>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,24.384000>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.043847,0.000000,24.790400>}
box{<0,0,-0.203200><9.227050,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,25.196800>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,25.603200>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,26.009600>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,26.416000>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.057103,0.000000,26.822400>}
box{<0,0,-0.203200><9.240306,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.856500,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.691497,0.000000,22.758400>}
box{<0,0,-0.203200><0.834997,0.035000,0.203200> rotate<0,0.000000,0> translate<32.856500,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.973191,0.000000,9.179709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,8.955656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<32.973191,0.000000,9.179709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.973191,0.000000,21.046288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,21.270341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<32.973191,0.000000,21.046288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.973191,0.000000,22.641709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,22.417656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<32.973191,0.000000,22.641709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.009025,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,21.132800>}
box{<0,0,-0.203200><0.474175,0.035000,0.203200> rotate<0,0.000000,0> translate<33.009025,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,8.127997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,8.955656>}
box{<0,0,-0.203200><0.827659,0.035000,0.203200> rotate<0,90.000000,0> translate<33.065997,0.000000,8.955656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,8.127997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.096656,0.000000,8.127997>}
box{<0,0,-0.203200><0.030659,0.035000,0.203200> rotate<0,0.000000,0> translate<33.065997,0.000000,8.127997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,8.128000>}
box{<0,0,-0.203200><1.478003,0.035000,0.203200> rotate<0,0.000000,0> translate<33.065997,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,8.534400>}
box{<0,0,-0.203200><1.478003,0.035000,0.203200> rotate<0,0.000000,0> translate<33.065997,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,8.940800>}
box{<0,0,-0.203200><1.478003,0.035000,0.203200> rotate<0,0.000000,0> translate<33.065997,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,21.270341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,22.417656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<33.065997,0.000000,22.417656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.482000,0.000000,21.539200>}
box{<0,0,-0.203200><0.416003,0.035000,0.203200> rotate<0,0.000000,0> translate<33.065997,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.482000,0.000000,21.945600>}
box{<0,0,-0.203200><0.416003,0.035000,0.203200> rotate<0,0.000000,0> translate<33.065997,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.065997,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.482000,0.000000,22.352000>}
box{<0,0,-0.203200><0.416003,0.035000,0.203200> rotate<0,0.000000,0> translate<33.065997,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.096656,0.000000,8.127997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.895341,0.000000,8.127997>}
box{<0,0,-0.203200><0.798684,0.035000,0.203200> rotate<0,0.000000,0> translate<33.096656,0.000000,8.127997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.482000,0.000000,21.270341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,21.267444>}
box{<0,0,-0.203200><0.003136,0.035000,0.203200> rotate<0,67.494278,0> translate<33.482000,0.000000,21.270341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.482000,0.000000,22.417656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.482000,0.000000,21.270341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.482000,0.000000,21.270341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.482000,0.000000,22.417656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.574806,0.000000,22.641709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<33.482000,0.000000,22.417656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,21.267444>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.483200,0.000000,16.713197>}
box{<0,0,-0.203200><4.554247,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.483200,0.000000,16.713197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.574806,0.000000,22.641709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.746288,0.000000,22.813191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.574806,0.000000,22.641709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.746288,0.000000,22.813191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.970341,0.000000,22.905997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<33.746288,0.000000,22.813191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.895341,0.000000,8.127997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,8.127997>}
box{<0,0,-0.203200><0.648659,0.035000,0.203200> rotate<0,0.000000,0> translate<33.895341,0.000000,8.127997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.970341,0.000000,22.905997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.117656,0.000000,22.905997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<33.970341,0.000000,22.905997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,9.576656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,8.127997>}
box{<0,0,-0.203200><1.448659,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.544000,0.000000,8.127997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,9.576656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.636806,0.000000,9.800709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<34.544000,0.000000,9.576656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,10.375341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.636806,0.000000,10.151288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<34.544000,0.000000,10.375341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,11.176656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,10.375341>}
box{<0,0,-0.203200><0.801316,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.544000,0.000000,10.375341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,11.176656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.636806,0.000000,11.400709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<34.544000,0.000000,11.176656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.636806,0.000000,9.800709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.808287,0.000000,9.972191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.636806,0.000000,9.800709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.636806,0.000000,10.151288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.808287,0.000000,9.979806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<34.636806,0.000000,10.151288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.636806,0.000000,11.400709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.799300,0.000000,11.563200>}
box{<0,0,-0.203200><0.229799,0.035000,0.203200> rotate<0,-44.996479,0> translate<34.636806,0.000000,11.400709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.808287,0.000000,9.972191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.817484,0.000000,9.975997>}
box{<0,0,-0.203200><0.009953,0.035000,0.203200> rotate<0,-22.481390,0> translate<34.808287,0.000000,9.972191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.808287,0.000000,9.979806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.817484,0.000000,9.975997>}
box{<0,0,-0.203200><0.009955,0.035000,0.203200> rotate<0,22.498008,0> translate<34.808287,0.000000,9.979806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.108797,0.000000,19.603463>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.108797,0.000000,20.782000>}
box{<0,0,-0.203200><1.178537,0.035000,0.203200> rotate<0,90.000000,0> translate<35.108797,0.000000,20.782000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.108797,0.000000,19.603463>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.316741,0.000000,19.689597>}
box{<0,0,-0.203200><0.225077,0.035000,0.203200> rotate<0,-22.498810,0> translate<35.108797,0.000000,19.603463> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.108797,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.402131,0.000000,19.913600>}
box{<0,0,-0.203200><8.293334,0.035000,0.203200> rotate<0,0.000000,0> translate<35.108797,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.108797,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.808528,0.000000,20.320000>}
box{<0,0,-0.203200><8.699731,0.035000,0.203200> rotate<0,0.000000,0> translate<35.108797,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.108797,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.333603,0.000000,20.726400>}
box{<0,0,-0.203200><7.224806,0.035000,0.203200> rotate<0,0.000000,0> translate<35.108797,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.108797,0.000000,20.782000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.117656,0.000000,20.782000>}
box{<0,0,-0.203200><0.008859,0.035000,0.203200> rotate<0,0.000000,0> translate<35.108797,0.000000,20.782000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.117656,0.000000,20.782000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.341709,0.000000,20.874806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<35.117656,0.000000,20.782000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.117656,0.000000,22.905997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.341709,0.000000,22.813191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<35.117656,0.000000,22.905997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.316741,0.000000,19.689597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.359256,0.000000,19.689597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<35.316741,0.000000,19.689597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.341709,0.000000,20.874806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.513191,0.000000,21.046288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.341709,0.000000,20.874806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.341709,0.000000,22.813191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.513191,0.000000,22.641709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<35.341709,0.000000,22.813191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.396500,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,22.758400>}
box{<0,0,-0.203200><6.641900,0.035000,0.203200> rotate<0,0.000000,0> translate<35.396500,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.513191,0.000000,21.046288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.605997,0.000000,21.270341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<35.513191,0.000000,21.046288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.513191,0.000000,22.641709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.605997,0.000000,22.417656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<35.513191,0.000000,22.641709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.549025,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.039203,0.000000,21.132800>}
box{<0,0,-0.203200><6.490178,0.035000,0.203200> rotate<0,0.000000,0> translate<35.549025,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.605997,0.000000,21.270341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.605997,0.000000,22.417656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<35.605997,0.000000,22.417656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.605997,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,21.539200>}
box{<0,0,-0.203200><6.432403,0.035000,0.203200> rotate<0,0.000000,0> translate<35.605997,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.605997,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,21.945600>}
box{<0,0,-0.203200><6.432403,0.035000,0.203200> rotate<0,0.000000,0> translate<35.605997,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.605997,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,22.352000>}
box{<0,0,-0.203200><6.432403,0.035000,0.203200> rotate<0,0.000000,0> translate<35.605997,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.359256,0.000000,19.689597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.583309,0.000000,19.596791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<36.359256,0.000000,19.689597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.583309,0.000000,19.596791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.588000,0.000000,19.592100>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,44.997030,0> translate<36.583309,0.000000,19.596791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.588000,0.000000,19.592100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.592688,0.000000,19.596791>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,-45.016121,0> translate<36.588000,0.000000,19.592100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.592688,0.000000,19.596791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.816741,0.000000,19.689597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<36.592688,0.000000,19.596791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.647597,0.000000,17.519534>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.647597,0.000000,17.610600>}
box{<0,0,-0.203200><0.091066,0.035000,0.203200> rotate<0,90.000000,0> translate<36.647597,0.000000,17.610600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.647597,0.000000,17.519534>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.816741,0.000000,17.589597>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,-22.498765,0> translate<36.647597,0.000000,17.519534> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.647597,0.000000,17.610600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.650797,0.000000,17.618322>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,-67.486080,0> translate<36.647597,0.000000,17.610600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.647597,0.000000,17.949397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.647597,0.000000,18.040463>}
box{<0,0,-0.203200><0.091066,0.035000,0.203200> rotate<0,90.000000,0> translate<36.647597,0.000000,18.040463> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.647597,0.000000,17.949397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.650797,0.000000,17.941675>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,67.486080,0> translate<36.647597,0.000000,17.949397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.647597,0.000000,18.040463>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.816741,0.000000,17.970400>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,22.498765,0> translate<36.647597,0.000000,18.040463> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.650797,0.000000,17.618322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.650797,0.000000,17.941675>}
box{<0,0,-0.203200><0.323353,0.035000,0.203200> rotate<0,90.000000,0> translate<36.650797,0.000000,17.941675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.650797,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.025200,0.000000,17.881600>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<36.650797,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.816741,0.000000,17.589597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.859256,0.000000,17.589597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<36.816741,0.000000,17.589597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.816741,0.000000,17.970400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.859256,0.000000,17.970400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<36.816741,0.000000,17.970400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.816741,0.000000,19.689597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.859256,0.000000,19.689597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<36.816741,0.000000,19.689597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.859256,0.000000,17.589597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.028400,0.000000,17.519534>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,22.498765,0> translate<37.859256,0.000000,17.589597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.859256,0.000000,17.970400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.028400,0.000000,18.040463>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,-22.498765,0> translate<37.859256,0.000000,17.970400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.859256,0.000000,19.689597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.083309,0.000000,19.596791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<37.859256,0.000000,19.689597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.025200,0.000000,17.618322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.028400,0.000000,17.610600>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,67.486080,0> translate<38.025200,0.000000,17.618322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.025200,0.000000,17.941675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.025200,0.000000,17.618322>}
box{<0,0,-0.203200><0.323353,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.025200,0.000000,17.618322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.025200,0.000000,17.941675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.028400,0.000000,17.949397>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,-67.486080,0> translate<38.025200,0.000000,17.941675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.028400,0.000000,17.610600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.028400,0.000000,17.519534>}
box{<0,0,-0.203200><0.091066,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.028400,0.000000,17.519534> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.028400,0.000000,18.040463>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.028400,0.000000,17.949397>}
box{<0,0,-0.203200><0.091066,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.028400,0.000000,17.949397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.083309,0.000000,19.596791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.087997,0.000000,19.592100>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,45.016121,0> translate<38.083309,0.000000,19.596791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.087997,0.000000,19.592100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.092688,0.000000,19.596791>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.087997,0.000000,19.592100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.092688,0.000000,19.596791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.316741,0.000000,19.689597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<38.092688,0.000000,19.596791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.293463,0.000000,9.988797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.530413,0.000000,10.086941>}
box{<0,0,-0.203200><0.256471,0.035000,0.203200> rotate<0,-22.497658,0> translate<38.293463,0.000000,9.988797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.293463,0.000000,9.988797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.737675,0.000000,9.988797>}
box{<0,0,-0.203200><0.444212,0.035000,0.203200> rotate<0,0.000000,0> translate<38.293463,0.000000,9.988797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.316741,0.000000,19.689597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.359256,0.000000,19.689597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<38.316741,0.000000,19.689597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.530413,0.000000,10.086941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.663869,0.000000,10.220400>}
box{<0,0,-0.203200><0.188738,0.035000,0.203200> rotate<0,-44.997701,0> translate<38.530413,0.000000,10.086941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.603469,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.372000,0.000000,10.160000>}
box{<0,0,-0.203200><3.768531,0.035000,0.203200> rotate<0,0.000000,0> translate<38.603469,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.663869,0.000000,10.220400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.245256,0.000000,10.220400>}
box{<0,0,-0.203200><0.581388,0.035000,0.203200> rotate<0,0.000000,0> translate<38.663869,0.000000,10.220400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.737675,0.000000,9.988797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.036413,0.000000,9.865056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<38.737675,0.000000,9.988797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.036413,0.000000,9.865056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.671872,0.000000,8.229597>}
box{<0,0,-0.203200><2.312889,0.035000,0.203200> rotate<0,44.997030,0> translate<39.036413,0.000000,9.865056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.147869,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.372000,0.000000,9.753600>}
box{<0,0,-0.203200><3.224131,0.035000,0.203200> rotate<0,0.000000,0> translate<39.147869,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.245256,0.000000,10.220400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.469309,0.000000,10.313206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<39.245256,0.000000,10.220400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.359256,0.000000,19.689597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.583309,0.000000,19.596791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<39.359256,0.000000,19.689597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.469309,0.000000,10.313206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.640791,0.000000,10.484687>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.469309,0.000000,10.313206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.536797,0.000000,12.479303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.536797,0.000000,12.666694>}
box{<0,0,-0.203200><0.187391,0.035000,0.203200> rotate<0,90.000000,0> translate<39.536797,0.000000,12.666694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.536797,0.000000,12.479303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.640791,0.000000,12.375309>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,44.997030,0> translate<39.536797,0.000000,12.479303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.536797,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.319494,0.000000,12.598400>}
box{<0,0,-0.203200><2.782697,0.035000,0.203200> rotate<0,0.000000,0> translate<39.536797,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.536797,0.000000,12.666694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.640791,0.000000,12.770688>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.536797,0.000000,12.666694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.554269,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.479894,0.000000,9.347200>}
box{<0,0,-0.203200><2.925625,0.035000,0.203200> rotate<0,0.000000,0> translate<39.554269,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.583309,0.000000,19.596791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.754791,0.000000,19.425309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<39.583309,0.000000,19.596791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.640791,0.000000,10.484687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,10.708741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<39.640791,0.000000,10.484687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.640791,0.000000,12.375309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,12.151256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<39.640791,0.000000,12.375309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.640791,0.000000,12.770688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,12.994741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<39.640791,0.000000,12.770688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.647597,0.000000,17.983341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.647597,0.000000,18.127494>}
box{<0,0,-0.203200><0.144153,0.035000,0.203200> rotate<0,90.000000,0> translate<39.647597,0.000000,18.127494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.647597,0.000000,17.983341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.674797,0.000000,17.917675>}
box{<0,0,-0.203200><0.071076,0.035000,0.203200> rotate<0,67.495242,0> translate<39.647597,0.000000,17.983341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.647597,0.000000,18.127494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.754791,0.000000,18.234687>}
box{<0,0,-0.203200><0.151595,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.647597,0.000000,18.127494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.672900,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.995731,0.000000,19.507200>}
box{<0,0,-0.203200><3.322831,0.035000,0.203200> rotate<0,0.000000,0> translate<39.672900,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.674634,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.372000,0.000000,10.566400>}
box{<0,0,-0.203200><2.697366,0.035000,0.203200> rotate<0,0.000000,0> translate<39.674634,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.674797,0.000000,17.405303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.674797,0.000000,17.917675>}
box{<0,0,-0.203200><0.512372,0.035000,0.203200> rotate<0,90.000000,0> translate<39.674797,0.000000,17.917675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.674797,0.000000,17.405303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.754791,0.000000,17.325309>}
box{<0,0,-0.203200><0.113128,0.035000,0.203200> rotate<0,44.997030,0> translate<39.674797,0.000000,17.405303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.674797,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.963731,0.000000,17.475200>}
box{<0,0,-0.203200><1.288934,0.035000,0.203200> rotate<0,0.000000,0> translate<39.674797,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.674797,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.370131,0.000000,17.881600>}
box{<0,0,-0.203200><1.695334,0.035000,0.203200> rotate<0,0.000000,0> translate<39.674797,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.716722,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.276072,0.000000,12.192000>}
box{<0,0,-0.203200><2.559350,0.035000,0.203200> rotate<0,0.000000,0> translate<39.716722,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,10.708741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,12.151256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<39.733597,0.000000,12.151256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.245913,0.000000,10.972800>}
box{<0,0,-0.203200><2.512316,0.035000,0.203200> rotate<0,0.000000,0> translate<39.733597,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224400,0.000000,11.379200>}
box{<0,0,-0.203200><2.490803,0.035000,0.203200> rotate<0,0.000000,0> translate<39.733597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224400,0.000000,11.785600>}
box{<0,0,-0.203200><2.490803,0.035000,0.203200> rotate<0,0.000000,0> translate<39.733597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,12.994741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,13.946125>}
box{<0,0,-0.203200><0.951384,0.035000,0.203200> rotate<0,90.000000,0> translate<39.733597,0.000000,13.946125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224400,0.000000,13.004800>}
box{<0,0,-0.203200><2.490803,0.035000,0.203200> rotate<0,0.000000,0> translate<39.733597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224400,0.000000,13.411200>}
box{<0,0,-0.203200><2.490803,0.035000,0.203200> rotate<0,0.000000,0> translate<39.733597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224400,0.000000,13.817600>}
box{<0,0,-0.203200><2.490803,0.035000,0.203200> rotate<0,0.000000,0> translate<39.733597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.733597,0.000000,13.946125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.786672,0.000000,18.999200>}
box{<0,0,-0.203200><7.146127,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.733597,0.000000,13.946125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.754791,0.000000,17.325309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.847597,0.000000,17.101256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<39.754791,0.000000,17.325309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.754791,0.000000,18.234687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.847597,0.000000,18.458741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<39.754791,0.000000,18.234687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.754791,0.000000,19.425309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.847597,0.000000,19.201256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<39.754791,0.000000,19.425309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.776872,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.776531,0.000000,18.288000>}
box{<0,0,-0.203200><1.999659,0.035000,0.203200> rotate<0,0.000000,0> translate<39.776872,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.847597,0.000000,16.359066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.847597,0.000000,17.101256>}
box{<0,0,-0.203200><0.742191,0.035000,0.203200> rotate<0,90.000000,0> translate<39.847597,0.000000,17.101256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.847597,0.000000,16.359066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.760941,0.000000,20.272409>}
box{<0,0,-0.203200><5.534304,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.847597,0.000000,16.359066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.847597,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.150931,0.000000,16.662400>}
box{<0,0,-0.203200><0.303334,0.035000,0.203200> rotate<0,0.000000,0> translate<39.847597,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.847597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.557331,0.000000,17.068800>}
box{<0,0,-0.203200><0.709734,0.035000,0.203200> rotate<0,0.000000,0> translate<39.847597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.847597,0.000000,18.458741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.847597,0.000000,19.201256>}
box{<0,0,-0.203200><0.742516,0.035000,0.203200> rotate<0,90.000000,0> translate<39.847597,0.000000,19.201256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.847597,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.182931,0.000000,18.694400>}
box{<0,0,-0.203200><2.335334,0.035000,0.203200> rotate<0,0.000000,0> translate<39.847597,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.847597,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.589331,0.000000,19.100800>}
box{<0,0,-0.203200><2.741734,0.035000,0.203200> rotate<0,0.000000,0> translate<39.847597,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.960669,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.275750,0.000000,8.940800>}
box{<0,0,-0.203200><7.315081,0.035000,0.203200> rotate<0,0.000000,0> translate<39.960669,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.011472,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.449897,0.000000,14.224000>}
box{<0,0,-0.203200><2.438425,0.035000,0.203200> rotate<0,0.000000,0> translate<40.011472,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.367069,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.275750,0.000000,8.534400>}
box{<0,0,-0.203200><6.908681,0.035000,0.203200> rotate<0,0.000000,0> translate<40.367069,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.417872,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.324400,0.000000,14.630400>}
box{<0,0,-0.203200><1.906528,0.035000,0.203200> rotate<0,0.000000,0> translate<40.417872,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.621066,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.671872,0.000000,5.435597>}
box{<0,0,-0.203200><0.071849,0.035000,0.203200> rotate<0,44.995268,0> translate<40.621066,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.621066,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.462131,0.000000,5.486400>}
box{<0,0,-0.203200><0.841066,0.035000,0.203200> rotate<0,0.000000,0> translate<40.621066,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.671872,0.000000,5.435597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.462131,0.000000,5.435597>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<40.671872,0.000000,5.435597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.671872,0.000000,8.229597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.462131,0.000000,8.229597>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<40.671872,0.000000,8.229597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.824272,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.324400,0.000000,15.036800>}
box{<0,0,-0.203200><1.500128,0.035000,0.203200> rotate<0,0.000000,0> translate<40.824272,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.230672,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.324400,0.000000,15.443200>}
box{<0,0,-0.203200><1.093728,0.035000,0.203200> rotate<0,0.000000,0> translate<41.230672,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.462131,0.000000,5.435597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,4.632131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<41.462131,0.000000,5.435597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.462131,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,6.289866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.462131,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.462131,0.000000,8.229597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,7.426131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<41.462131,0.000000,8.229597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.563728,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.304269,0.000000,8.128000>}
box{<0,0,-0.203200><3.740541,0.035000,0.203200> rotate<0,0.000000,0> translate<41.563728,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.614528,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.059600,0.000000,5.283200>}
box{<0,0,-0.203200><3.445072,0.035000,0.203200> rotate<0,0.000000,0> translate<41.614528,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.637072,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.416981,0.000000,15.849600>}
box{<0,0,-0.203200><0.779909,0.035000,0.203200> rotate<0,0.000000,0> translate<41.637072,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.665331,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.059600,0.000000,5.689600>}
box{<0,0,-0.203200><3.394269,0.035000,0.203200> rotate<0,0.000000,0> translate<41.665331,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.716125,0.000000,2.946397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,3.495866>}
box{<0,0,-0.203200><0.777068,0.035000,0.203200> rotate<0,-44.996867,0> translate<41.716125,0.000000,2.946397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.716125,0.000000,2.946397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.325244,0.000000,2.946397>}
box{<0,0,-0.203200><2.609119,0.035000,0.203200> rotate<0,0.000000,0> translate<41.716125,0.000000,2.946397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.970128,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897869,0.000000,7.721600>}
box{<0,0,-0.203200><2.927741,0.035000,0.203200> rotate<0,0.000000,0> translate<41.970128,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.020928,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.630047,0.000000,3.251200>}
box{<0,0,-0.203200><2.609119,0.035000,0.203200> rotate<0,0.000000,0> translate<42.020928,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.020928,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.847072,0.000000,4.876800>}
box{<0,0,-0.203200><2.826144,0.035000,0.203200> rotate<0,0.000000,0> translate<42.020928,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,21.134741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.131206,0.000000,20.910688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<42.038400,0.000000,21.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,22.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,21.134741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.038400,0.000000,21.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,22.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,22.955997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.038400,0.000000,22.777256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,23.134741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,22.955997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.038400,0.000000,23.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,24.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,23.134741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.038400,0.000000,23.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,24.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,24.955997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.038400,0.000000,24.777256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,25.134741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,24.955997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.038400,0.000000,25.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,26.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,25.134741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.038400,0.000000,25.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,26.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,26.955997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.038400,0.000000,26.777256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,27.134741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,26.955997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.038400,0.000000,27.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,28.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,27.134741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.038400,0.000000,27.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,28.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,28.955997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.038400,0.000000,28.777256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,29.134741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,28.955997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.038400,0.000000,29.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,30.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,29.134741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.038400,0.000000,29.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,30.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,30.955997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.038400,0.000000,30.777256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,31.134741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,30.955997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.038400,0.000000,31.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,32.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,31.134741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.038400,0.000000,31.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,32.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,32.955997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.038400,0.000000,32.777256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,33.134741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,32.955997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.038400,0.000000,33.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,34.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,33.134741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.038400,0.000000,33.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,34.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,34.955997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.038400,0.000000,34.777256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,35.134741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.112441,0.000000,34.955997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.038400,0.000000,35.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,36.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,35.134741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.038400,0.000000,35.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.038400,0.000000,36.777256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.131206,0.000000,37.001309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<42.038400,0.000000,36.777256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.043472,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.208400,0.000000,16.256000>}
box{<0,0,-0.203200><7.164928,0.035000,0.203200> rotate<0,0.000000,0> translate<42.043472,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.071731,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.796266,0.000000,6.096000>}
box{<0,0,-0.203200><2.724534,0.035000,0.203200> rotate<0,0.000000,0> translate<42.071731,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.131206,0.000000,20.910688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.302688,0.000000,20.739206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<42.131206,0.000000,20.910688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.131206,0.000000,37.001309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.302688,0.000000,37.172791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.131206,0.000000,37.001309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224400,0.000000,11.024741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.317206,0.000000,10.800688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<42.224400,0.000000,11.024741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224400,0.000000,12.067256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224400,0.000000,11.024741>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.224400,0.000000,11.024741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224400,0.000000,12.067256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.317206,0.000000,12.291309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<42.224400,0.000000,12.067256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224400,0.000000,12.824741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.317206,0.000000,12.600688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<42.224400,0.000000,12.824741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224400,0.000000,13.867256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224400,0.000000,12.824741>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.224400,0.000000,12.824741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224400,0.000000,13.867256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.317206,0.000000,14.091309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<42.224400,0.000000,13.867256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,3.495866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,4.632131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<42.265597,0.000000,4.632131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,3.657600>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<42.265597,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,4.064000>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<42.265597,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,4.470400>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<42.265597,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,6.289866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,7.426131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<42.265597,0.000000,7.426131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,6.502400>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<42.265597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,6.908800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<42.265597,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.265597,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,7.315200>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<42.265597,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.302688,0.000000,20.739206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.526741,0.000000,20.646400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<42.302688,0.000000,20.739206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.302688,0.000000,37.172791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.526741,0.000000,37.265597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<42.302688,0.000000,37.172791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.317206,0.000000,10.800688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.375588,0.000000,10.742309>}
box{<0,0,-0.203200><0.082561,0.035000,0.203200> rotate<0,44.995497,0> translate<42.317206,0.000000,10.800688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.317206,0.000000,12.291309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.471897,0.000000,12.445997>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,-44.996451,0> translate<42.317206,0.000000,12.291309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.317206,0.000000,12.600688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.471897,0.000000,12.445997>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,44.997030,0> translate<42.317206,0.000000,12.600688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.317206,0.000000,14.091309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.488688,0.000000,14.262791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.317206,0.000000,14.091309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.324400,0.000000,14.623903>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.440041,0.000000,14.344719>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,67.495778,0> translate<42.324400,0.000000,14.623903> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.324400,0.000000,15.626094>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.324400,0.000000,14.623903>}
box{<0,0,-0.203200><1.002191,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.324400,0.000000,14.623903> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.324400,0.000000,15.626094>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.440041,0.000000,15.905278>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,-67.495778,0> translate<42.324400,0.000000,15.626094> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.372000,0.000000,9.586341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.464806,0.000000,9.362288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<42.372000,0.000000,9.586341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.372000,0.000000,10.733656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.372000,0.000000,9.586341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.372000,0.000000,9.586341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.372000,0.000000,10.733656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.375588,0.000000,10.742309>}
box{<0,0,-0.203200><0.009367,0.035000,0.203200> rotate<0,-67.477134,0> translate<42.372000,0.000000,10.733656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.440041,0.000000,14.344719>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.512225,0.000000,14.272538>}
box{<0,0,-0.203200><0.102082,0.035000,0.203200> rotate<0,44.995790,0> translate<42.440041,0.000000,14.344719> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.440041,0.000000,15.905278>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.653719,0.000000,16.118956>}
box{<0,0,-0.203200><0.302187,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.440041,0.000000,15.905278> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.449872,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.208400,0.000000,16.662400>}
box{<0,0,-0.203200><6.758528,0.035000,0.203200> rotate<0,0.000000,0> translate<42.449872,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.464806,0.000000,9.362288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.636288,0.000000,9.190806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<42.464806,0.000000,9.362288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.488688,0.000000,14.262791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.512225,0.000000,14.272538>}
box{<0,0,-0.203200><0.025476,0.035000,0.203200> rotate<0,-22.492954,0> translate<42.488688,0.000000,14.262791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.526741,0.000000,20.646400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.166931,0.000000,20.646400>}
box{<0,0,-0.203200><3.640191,0.035000,0.203200> rotate<0,0.000000,0> translate<42.526741,0.000000,20.646400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.526741,0.000000,37.265597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.769256,0.000000,37.265597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<42.526741,0.000000,37.265597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.636288,0.000000,9.190806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.860341,0.000000,9.098000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<42.636288,0.000000,9.190806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.653719,0.000000,16.118956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.932903,0.000000,16.234597>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,-22.498282,0> translate<42.653719,0.000000,16.118956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.856272,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.208400,0.000000,17.068800>}
box{<0,0,-0.203200><6.352128,0.035000,0.203200> rotate<0,0.000000,0> translate<42.856272,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.860341,0.000000,9.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.007656,0.000000,9.098000>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<42.860341,0.000000,9.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.932903,0.000000,16.234597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.935094,0.000000,16.234597>}
box{<0,0,-0.203200><1.002191,0.035000,0.203200> rotate<0,0.000000,0> translate<42.932903,0.000000,16.234597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.262672,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.208400,0.000000,17.475200>}
box{<0,0,-0.203200><5.945728,0.035000,0.203200> rotate<0,0.000000,0> translate<43.262672,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.669072,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.331497,0.000000,17.881600>}
box{<0,0,-0.203200><5.662425,0.035000,0.203200> rotate<0,0.000000,0> translate<43.669072,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.760941,0.000000,20.272413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.760941,0.000000,20.272409>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.760941,0.000000,20.272409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.760941,0.000000,20.272413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.989584,0.000000,20.501056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.760941,0.000000,20.272413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.935094,0.000000,16.234597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.214278,0.000000,16.118956>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,22.498282,0> translate<43.935094,0.000000,16.234597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.989584,0.000000,20.501056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.288322,0.000000,20.624797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<43.989584,0.000000,20.501056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.007656,0.000000,9.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.231709,0.000000,9.190806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<44.007656,0.000000,9.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.075472,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,18.288000>}
box{<0,0,-0.203200><6.557728,0.035000,0.203200> rotate<0,0.000000,0> translate<44.075472,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.214278,0.000000,16.118956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.427956,0.000000,15.905278>}
box{<0,0,-0.203200><0.302187,0.035000,0.203200> rotate<0,44.997030,0> translate<44.214278,0.000000,16.118956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.231709,0.000000,9.190806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.403191,0.000000,9.362288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.231709,0.000000,9.190806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.288322,0.000000,20.624797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.145325,0.000000,20.624797>}
box{<0,0,-0.203200><1.857003,0.035000,0.203200> rotate<0,0.000000,0> translate<44.288322,0.000000,20.624797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.325244,0.000000,2.946397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.738556,0.000000,3.359713>}
box{<0,0,-0.203200><0.584514,0.035000,0.203200> rotate<0,-44.997247,0> translate<44.325244,0.000000,2.946397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.355772,0.000000,14.272538>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.379309,0.000000,14.262791>}
box{<0,0,-0.203200><0.025476,0.035000,0.203200> rotate<0,22.492954,0> translate<44.355772,0.000000,14.272538> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.355772,0.000000,14.272538>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.427956,0.000000,14.344719>}
box{<0,0,-0.203200><0.102082,0.035000,0.203200> rotate<0,-44.995790,0> translate<44.355772,0.000000,14.272538> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.379309,0.000000,14.262791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.550791,0.000000,14.091309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<44.379309,0.000000,14.262791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.388103,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.412422,0.000000,9.347200>}
box{<0,0,-0.203200><3.024319,0.035000,0.203200> rotate<0,0.000000,0> translate<44.388103,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.396100,0.000000,12.445997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.550791,0.000000,12.291309>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.996451,0> translate<44.396100,0.000000,12.445997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.396100,0.000000,12.445997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.550791,0.000000,12.600688>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.396100,0.000000,12.445997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.403191,0.000000,9.362288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.495997,0.000000,9.586341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<44.403191,0.000000,9.362288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.418100,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.223400,0.000000,14.224000>}
box{<0,0,-0.203200><15.805300,0.035000,0.203200> rotate<0,0.000000,0> translate<44.418100,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.427956,0.000000,14.344719>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.543597,0.000000,14.623903>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,-67.495778,0> translate<44.427956,0.000000,14.344719> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.427956,0.000000,15.905278>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.543597,0.000000,15.626094>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,67.495778,0> translate<44.427956,0.000000,15.905278> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.451019,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.208400,0.000000,15.849600>}
box{<0,0,-0.203200><4.757381,0.035000,0.203200> rotate<0,0.000000,0> translate<44.451019,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.481872,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,18.694400>}
box{<0,0,-0.203200><6.151328,0.035000,0.203200> rotate<0,0.000000,0> translate<44.481872,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.492409,0.000000,10.742309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.495997,0.000000,10.733656>}
box{<0,0,-0.203200><0.009367,0.035000,0.203200> rotate<0,67.477134,0> translate<44.492409,0.000000,10.742309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.492409,0.000000,10.742309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.550791,0.000000,10.800688>}
box{<0,0,-0.203200><0.082561,0.035000,0.203200> rotate<0,-44.995497,0> translate<44.492409,0.000000,10.742309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.495997,0.000000,9.586341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.495997,0.000000,10.733656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<44.495997,0.000000,10.733656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.495997,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.818822,0.000000,9.753600>}
box{<0,0,-0.203200><3.322825,0.035000,0.203200> rotate<0,0.000000,0> translate<44.495997,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.495997,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.225222,0.000000,10.160000>}
box{<0,0,-0.203200><3.729225,0.035000,0.203200> rotate<0,0.000000,0> translate<44.495997,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.495997,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,10.566400>}
box{<0,0,-0.203200><20.172403,0.035000,0.203200> rotate<0,0.000000,0> translate<44.495997,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.543597,0.000000,14.623903>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.543597,0.000000,15.626094>}
box{<0,0,-0.203200><1.002191,0.035000,0.203200> rotate<0,90.000000,0> translate<44.543597,0.000000,15.626094> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.543597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.331494,0.000000,14.630400>}
box{<0,0,-0.203200><4.787897,0.035000,0.203200> rotate<0,0.000000,0> translate<44.543597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.543597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.208400,0.000000,15.036800>}
box{<0,0,-0.203200><4.664803,0.035000,0.203200> rotate<0,0.000000,0> translate<44.543597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.543597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.208400,0.000000,15.443200>}
box{<0,0,-0.203200><4.664803,0.035000,0.203200> rotate<0,0.000000,0> translate<44.543597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.548503,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,12.598400>}
box{<0,0,-0.203200><20.119897,0.035000,0.203200> rotate<0,0.000000,0> translate<44.548503,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.550791,0.000000,10.800688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643597,0.000000,11.024741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<44.550791,0.000000,10.800688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.550791,0.000000,12.291309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643597,0.000000,12.067256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<44.550791,0.000000,12.291309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.550791,0.000000,12.600688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643597,0.000000,12.824741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<44.550791,0.000000,12.600688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.550791,0.000000,14.091309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643597,0.000000,13.867256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<44.550791,0.000000,14.091309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.591928,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,12.192000>}
box{<0,0,-0.203200><20.076472,0.035000,0.203200> rotate<0,0.000000,0> translate<44.591928,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,3.495866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.738556,0.000000,3.359713>}
box{<0,0,-0.203200><0.192552,0.035000,0.203200> rotate<0,44.996373,0> translate<44.602400,0.000000,3.495866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,4.632131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,3.495866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<44.602400,0.000000,3.495866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,4.632131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.059600,0.000000,5.089328>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.996834,0> translate<44.602400,0.000000,4.632131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,6.289866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.059600,0.000000,5.832669>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.996834,0> translate<44.602400,0.000000,6.289866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,7.426131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,6.289866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<44.602400,0.000000,6.289866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.602400,0.000000,7.426131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.405866,0.000000,8.229597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.602400,0.000000,7.426131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.622081,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,10.972800>}
box{<0,0,-0.203200><20.046319,0.035000,0.203200> rotate<0,0.000000,0> translate<44.622081,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643597,0.000000,11.024741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643597,0.000000,12.067256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<44.643597,0.000000,12.067256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,11.379200>}
box{<0,0,-0.203200><20.024803,0.035000,0.203200> rotate<0,0.000000,0> translate<44.643597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,11.785600>}
box{<0,0,-0.203200><20.024803,0.035000,0.203200> rotate<0,0.000000,0> translate<44.643597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643597,0.000000,12.824741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643597,0.000000,13.867256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<44.643597,0.000000,13.867256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,13.004800>}
box{<0,0,-0.203200><20.024803,0.035000,0.203200> rotate<0,0.000000,0> translate<44.643597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.873459,0.000000,13.411200>}
box{<0,0,-0.203200><16.229863,0.035000,0.203200> rotate<0,0.000000,0> translate<44.643597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.467059,0.000000,13.817600>}
box{<0,0,-0.203200><15.823463,0.035000,0.203200> rotate<0,0.000000,0> translate<44.643597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.786672,0.000000,18.999200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.643675,0.000000,18.999200>}
box{<0,0,-0.203200><1.857003,0.035000,0.203200> rotate<0,0.000000,0> translate<44.786672,0.000000,18.999200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.885884,0.000000,1.117600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.221966,0.000000,1.256809>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,-22.498510,0> translate<44.885884,0.000000,1.117600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.059600,0.000000,5.832669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.059600,0.000000,5.089328>}
box{<0,0,-0.203200><0.743341,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.059600,0.000000,5.089328> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.131166,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.443284,0.000000,1.219200>}
box{<0,0,-0.203200><16.312119,0.035000,0.203200> rotate<0,0.000000,0> translate<45.131166,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.221966,0.000000,1.256809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.479188,0.000000,1.514031>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.221966,0.000000,1.256809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.405866,0.000000,8.229597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.542131,0.000000,8.229597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<45.405866,0.000000,8.229597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.479188,0.000000,1.514031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.479188,0.000000,1.514034>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<45.479188,0.000000,1.514034> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.479188,0.000000,1.514034>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.749188,0.000000,2.784031>}
box{<0,0,-0.203200><1.796049,0.035000,0.203200> rotate<0,-44.996960,0> translate<45.479188,0.000000,1.514034> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.590753,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.288800,0.000000,1.625600>}
box{<0,0,-0.203200><15.698047,0.035000,0.203200> rotate<0,0.000000,0> translate<45.590753,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.997153,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.288800,0.000000,2.032000>}
box{<0,0,-0.203200><15.291647,0.035000,0.203200> rotate<0,0.000000,0> translate<45.997153,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.145325,0.000000,20.624797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.166931,0.000000,20.646400>}
box{<0,0,-0.203200><0.030554,0.035000,0.203200> rotate<0,-44.992887,0> translate<46.145325,0.000000,20.624797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.403553,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.288800,0.000000,2.438400>}
box{<0,0,-0.203200><14.885247,0.035000,0.203200> rotate<0,0.000000,0> translate<46.403553,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.542131,0.000000,8.229597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,7.426131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<46.542131,0.000000,8.229597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.643675,0.000000,18.999200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.942413,0.000000,19.122941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<46.643675,0.000000,18.999200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.643728,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.275750,0.000000,8.128000>}
box{<0,0,-0.203200><0.632022,0.035000,0.203200> rotate<0,0.000000,0> translate<46.643728,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.749188,0.000000,2.784031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.830803,0.000000,2.981075>}
box{<0,0,-0.203200><0.213278,0.035000,0.203200> rotate<0,-67.496183,0> translate<46.749188,0.000000,2.784031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.769256,0.000000,37.265597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.993309,0.000000,37.172791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<46.769256,0.000000,37.265597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.774356,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.443288,0.000000,2.844800>}
box{<0,0,-0.203200><14.668931,0.035000,0.203200> rotate<0,0.000000,0> translate<46.774356,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.830803,0.000000,2.981075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,3.495866>}
box{<0,0,-0.203200><0.728026,0.035000,0.203200> rotate<0,-44.996856,0> translate<46.830803,0.000000,2.981075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.888397,0.000000,5.089328>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.888397,0.000000,5.832669>}
box{<0,0,-0.203200><0.743341,0.035000,0.203200> rotate<0,90.000000,0> translate<46.888397,0.000000,5.832669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.888397,0.000000,5.089328>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,4.632131>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.996834,0> translate<46.888397,0.000000,5.089328> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.888397,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,5.283200>}
box{<0,0,-0.203200><17.780003,0.035000,0.203200> rotate<0,0.000000,0> translate<46.888397,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.888397,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,5.689600>}
box{<0,0,-0.203200><17.780003,0.035000,0.203200> rotate<0,0.000000,0> translate<46.888397,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.888397,0.000000,5.832669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,6.289866>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.996834,0> translate<46.888397,0.000000,5.832669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.888959,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,19.100800>}
box{<0,0,-0.203200><3.744241,0.035000,0.203200> rotate<0,0.000000,0> translate<46.888959,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.942413,0.000000,19.122941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.171056,0.000000,19.351584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<46.942413,0.000000,19.122941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.993309,0.000000,37.172791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.164791,0.000000,37.001309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<46.993309,0.000000,37.172791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.050128,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.275750,0.000000,7.721600>}
box{<0,0,-0.203200><0.225622,0.035000,0.203200> rotate<0,0.000000,0> translate<47.050128,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.100928,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.611625,0.000000,3.251200>}
box{<0,0,-0.203200><14.510697,0.035000,0.203200> rotate<0,0.000000,0> translate<47.100928,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.100928,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,4.876800>}
box{<0,0,-0.203200><17.567472,0.035000,0.203200> rotate<0,0.000000,0> translate<47.100928,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.151728,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,6.096000>}
box{<0,0,-0.203200><17.516672,0.035000,0.203200> rotate<0,0.000000,0> translate<47.151728,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.164791,0.000000,37.001309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.257597,0.000000,36.777256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<47.164791,0.000000,37.001309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.171056,0.000000,19.351584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.277563,0.000000,22.458091>}
box{<0,0,-0.203200><4.393263,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.171056,0.000000,19.351584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.172625,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,36.982400>}
box{<0,0,-0.203200><2.545775,0.035000,0.203200> rotate<0,0.000000,0> translate<47.172625,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.257597,0.000000,36.768797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.257597,0.000000,36.777256>}
box{<0,0,-0.203200><0.008459,0.035000,0.203200> rotate<0,90.000000,0> translate<47.257597,0.000000,36.777256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.257597,0.000000,36.768797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,36.768797>}
box{<0,0,-0.203200><2.460803,0.035000,0.203200> rotate<0,0.000000,0> translate<47.257597,0.000000,36.768797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.275750,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.447469,0.000000,6.381750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<47.275750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.275750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.275750,0.000000,7.553469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.275750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.275750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.447469,0.000000,10.382247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.275750,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.326672,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.474316,0.000000,19.507200>}
box{<0,0,-0.203200><3.147644,0.035000,0.203200> rotate<0,0.000000,0> translate<47.326672,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,3.495866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,4.632131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<47.345597,0.000000,4.632131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.998491,0.000000,3.657600>}
box{<0,0,-0.203200><14.652894,0.035000,0.203200> rotate<0,0.000000,0> translate<47.345597,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.627544,0.000000,4.064000>}
box{<0,0,-0.203200><15.281947,0.035000,0.203200> rotate<0,0.000000,0> translate<47.345597,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,4.470400>}
box{<0,0,-0.203200><17.322803,0.035000,0.203200> rotate<0,0.000000,0> translate<47.345597,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,6.289866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,7.426131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<47.345597,0.000000,7.426131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.326819,0.000000,6.502400>}
box{<0,0,-0.203200><0.981222,0.035000,0.203200> rotate<0,0.000000,0> translate<47.345597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.920419,0.000000,6.908800>}
box{<0,0,-0.203200><0.574822,0.035000,0.203200> rotate<0,0.000000,0> translate<47.345597,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345597,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.514019,0.000000,7.315200>}
box{<0,0,-0.203200><0.168422,0.035000,0.203200> rotate<0,0.000000,0> translate<47.345597,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.733072,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.436400,0.000000,19.913600>}
box{<0,0,-0.203200><2.703328,0.035000,0.203200> rotate<0,0.000000,0> translate<47.733072,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.139472,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.436400,0.000000,20.320000>}
box{<0,0,-0.203200><2.296928,0.035000,0.203200> rotate<0,0.000000,0> translate<48.139472,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.447469,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.104528,0.000000,6.381750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<48.447469,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.447469,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.104528,0.000000,10.382247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<48.447469,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.545872,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.436400,0.000000,20.726400>}
box{<0,0,-0.203200><1.890528,0.035000,0.203200> rotate<0,0.000000,0> translate<48.545872,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.952272,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.474322,0.000000,21.132800>}
box{<0,0,-0.203200><1.522050,0.035000,0.203200> rotate<0,0.000000,0> translate<48.952272,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.208400,0.000000,14.884741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.301206,0.000000,14.660687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<49.208400,0.000000,14.884741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.208400,0.000000,17.627256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.208400,0.000000,14.884741>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.208400,0.000000,14.884741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.208400,0.000000,17.627256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.301206,0.000000,17.851309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<49.208400,0.000000,17.627256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.301206,0.000000,14.660687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.472687,0.000000,14.489206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<49.301206,0.000000,14.660687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.301206,0.000000,17.851309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.472687,0.000000,18.022791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.301206,0.000000,17.851309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.358672,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,21.539200>}
box{<0,0,-0.203200><1.274528,0.035000,0.203200> rotate<0,0.000000,0> translate<49.358672,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.472687,0.000000,14.489206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.696741,0.000000,14.396400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<49.472687,0.000000,14.489206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.472687,0.000000,18.022791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.696741,0.000000,18.115597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<49.472687,0.000000,18.022791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.696741,0.000000,14.396400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.139256,0.000000,14.396400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<49.696741,0.000000,14.396400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.696741,0.000000,18.115597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,18.115597>}
box{<0,0,-0.203200><0.936459,0.035000,0.203200> rotate<0,0.000000,0> translate<49.696741,0.000000,18.115597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,37.947256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,36.768797>}
box{<0,0,-0.203200><1.178459,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.718400,0.000000,36.768797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,37.947256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.811206,0.000000,38.171309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<49.718400,0.000000,37.947256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.765072,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,21.945600>}
box{<0,0,-0.203200><0.868128,0.035000,0.203200> rotate<0,0.000000,0> translate<49.765072,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.811206,0.000000,38.171309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.982688,0.000000,38.342791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.811206,0.000000,38.171309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.982688,0.000000,38.342791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.206741,0.000000,38.435597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<49.982688,0.000000,38.342791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.104528,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.276247,0.000000,7.553469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.104528,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.104528,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.276247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<50.104528,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.171472,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,22.352000>}
box{<0,0,-0.203200><0.461728,0.035000,0.203200> rotate<0,0.000000,0> translate<50.171472,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.206741,0.000000,38.435597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.649256,0.000000,38.435597>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<50.206741,0.000000,38.435597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.225178,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.438819,0.000000,6.502400>}
box{<0,0,-0.203200><5.213641,0.035000,0.203200> rotate<0,0.000000,0> translate<50.225178,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.277563,0.000000,22.458091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.391309,0.000000,22.505206>}
box{<0,0,-0.203200><0.123119,0.035000,0.203200> rotate<0,-22.498570,0> translate<50.277563,0.000000,22.458091> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.326775,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.337222,0.000000,10.160000>}
box{<0,0,-0.203200><5.010447,0.035000,0.203200> rotate<0,0.000000,0> translate<50.326775,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.391309,0.000000,22.505206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.546000,0.000000,22.659897>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.391309,0.000000,22.505206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.436400,0.000000,19.598741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.529206,0.000000,19.374688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<50.436400,0.000000,19.598741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.436400,0.000000,21.041256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.436400,0.000000,19.598741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.436400,0.000000,19.598741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.436400,0.000000,21.041256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.529206,0.000000,21.265309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<50.436400,0.000000,21.041256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.529206,0.000000,19.374688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,19.270697>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,44.996169,0> translate<50.529206,0.000000,19.374688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.529206,0.000000,21.265309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,21.369300>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<50.529206,0.000000,21.265309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.546000,0.000000,22.659897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,22.572697>}
box{<0,0,-0.203200><0.123319,0.035000,0.203200> rotate<0,44.997030,0> translate<50.546000,0.000000,22.659897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,24.634897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,29.381325>}
box{<0,0,-0.203200><4.746428,0.035000,0.203200> rotate<0,90.000000,0> translate<50.596797,0.000000,29.381325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,24.634897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.700688,0.000000,24.738791>}
box{<0,0,-0.203200><0.146926,0.035000,0.203200> rotate<0,-44.997892,0> translate<50.596797,0.000000,24.634897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.825284,0.000000,24.790400>}
box{<0,0,-0.203200><0.228487,0.035000,0.203200> rotate<0,0.000000,0> translate<50.596797,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.483644,0.000000,25.196800>}
box{<0,0,-0.203200><2.886847,0.035000,0.203200> rotate<0,0.000000,0> translate<50.596797,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.890044,0.000000,25.603200>}
box{<0,0,-0.203200><3.293247,0.035000,0.203200> rotate<0,0.000000,0> translate<50.596797,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.296444,0.000000,26.009600>}
box{<0,0,-0.203200><3.699647,0.035000,0.203200> rotate<0,0.000000,0> translate<50.596797,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.702844,0.000000,26.416000>}
box{<0,0,-0.203200><4.106047,0.035000,0.203200> rotate<0,0.000000,0> translate<50.596797,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.109244,0.000000,26.822400>}
box{<0,0,-0.203200><4.512447,0.035000,0.203200> rotate<0,0.000000,0> translate<50.596797,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.515644,0.000000,27.228800>}
box{<0,0,-0.203200><4.918847,0.035000,0.203200> rotate<0,0.000000,0> translate<50.596797,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.922044,0.000000,27.635200>}
box{<0,0,-0.203200><5.325247,0.035000,0.203200> rotate<0,0.000000,0> translate<50.596797,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.328444,0.000000,28.041600>}
box{<0,0,-0.203200><5.731647,0.035000,0.203200> rotate<0,0.000000,0> translate<50.596797,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.568663,0.000000,28.448000>}
box{<0,0,-0.203200><9.971866,0.035000,0.203200> rotate<0,0.000000,0> translate<50.596797,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.975062,0.000000,28.854400>}
box{<0,0,-0.203200><10.378266,0.035000,0.203200> rotate<0,0.000000,0> translate<50.596797,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,29.260800>}
box{<0,0,-0.203200><14.071603,0.035000,0.203200> rotate<0,0.000000,0> translate<50.596797,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.596797,0.000000,29.381325>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.276412,0.000000,31.060941>}
box{<0,0,-0.203200><2.375335,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.596797,0.000000,29.381325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.631578,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.032419,0.000000,6.908800>}
box{<0,0,-0.203200><4.400841,0.035000,0.203200> rotate<0,0.000000,0> translate<50.631578,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,19.270697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,18.115597>}
box{<0,0,-0.203200><1.155100,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.633200,0.000000,18.115597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,22.572697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.633200,0.000000,21.369300>}
box{<0,0,-0.203200><1.203397,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.633200,0.000000,21.369300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.700688,0.000000,24.738791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.924741,0.000000,24.831597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<50.700688,0.000000,24.738791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.733175,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.930822,0.000000,9.753600>}
box{<0,0,-0.203200><4.197647,0.035000,0.203200> rotate<0,0.000000,0> translate<50.733175,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.882672,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,29.667200>}
box{<0,0,-0.203200><13.785728,0.035000,0.203200> rotate<0,0.000000,0> translate<50.882672,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.924741,0.000000,24.831597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.967256,0.000000,24.831597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<50.924741,0.000000,24.831597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.037978,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.626019,0.000000,7.315200>}
box{<0,0,-0.203200><3.588041,0.035000,0.203200> rotate<0,0.000000,0> translate<51.037978,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.139256,0.000000,14.396400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.363309,0.000000,14.489206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<51.139256,0.000000,14.396400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.139575,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.524422,0.000000,9.347200>}
box{<0,0,-0.203200><3.384847,0.035000,0.203200> rotate<0,0.000000,0> translate<51.139575,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.276247,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.276247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<51.276247,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.276247,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,7.721600>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<51.276247,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.276247,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,8.128000>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<51.276247,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.276247,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,8.534400>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<51.276247,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.276247,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,8.940800>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<51.276247,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.289072,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,30.073600>}
box{<0,0,-0.203200><13.379328,0.035000,0.203200> rotate<0,0.000000,0> translate<51.289072,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.363309,0.000000,14.489206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.534791,0.000000,14.660687>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.363309,0.000000,14.489206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.504503,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.800313,0.000000,14.630400>}
box{<0,0,-0.203200><1.295809,0.035000,0.203200> rotate<0,0.000000,0> translate<51.504503,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.534791,0.000000,14.660687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.627597,0.000000,14.884741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<51.534791,0.000000,14.660687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.627597,0.000000,14.884741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.627597,0.000000,16.316125>}
box{<0,0,-0.203200><1.431384,0.035000,0.203200> rotate<0,90.000000,0> translate<51.627597,0.000000,16.316125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.627597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.405912,0.000000,15.036800>}
box{<0,0,-0.203200><0.778316,0.035000,0.203200> rotate<0,0.000000,0> translate<51.627597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.627597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,15.443200>}
box{<0,0,-0.203200><0.756803,0.035000,0.203200> rotate<0,0.000000,0> translate<51.627597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.627597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,15.849600>}
box{<0,0,-0.203200><0.756803,0.035000,0.203200> rotate<0,0.000000,0> translate<51.627597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.627597,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.436072,0.000000,16.256000>}
box{<0,0,-0.203200><0.808475,0.035000,0.203200> rotate<0,0.000000,0> translate<51.627597,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.627597,0.000000,16.316125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.135056,0.000000,16.823584>}
box{<0,0,-0.203200><0.717656,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.627597,0.000000,16.316125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.649256,0.000000,38.435597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.873309,0.000000,38.342791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<51.649256,0.000000,38.435597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.695472,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,30.480000>}
box{<0,0,-0.203200><12.972928,0.035000,0.203200> rotate<0,0.000000,0> translate<51.695472,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.873309,0.000000,38.342791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.044791,0.000000,38.171309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<51.873309,0.000000,38.342791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.967256,0.000000,24.831597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.978841,0.000000,24.826797>}
box{<0,0,-0.203200><0.012539,0.035000,0.203200> rotate<0,22.505247,0> translate<51.967256,0.000000,24.831597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.973872,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.479494,0.000000,16.662400>}
box{<0,0,-0.203200><0.505622,0.035000,0.203200> rotate<0,0.000000,0> translate<51.973872,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.978841,0.000000,24.826797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.544697,0.000000,24.826797>}
box{<0,0,-0.203200><0.565856,0.035000,0.203200> rotate<0,0.000000,0> translate<51.978841,0.000000,24.826797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.014500,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.795288,0.000000,38.201600>}
box{<0,0,-0.203200><9.780787,0.035000,0.203200> rotate<0,0.000000,0> translate<52.014500,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.044791,0.000000,38.171309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,37.947256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<52.044791,0.000000,38.171309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.101872,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,30.886400>}
box{<0,0,-0.203200><12.566528,0.035000,0.203200> rotate<0,0.000000,0> translate<52.101872,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.135056,0.000000,16.823584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,17.122322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<52.135056,0.000000,16.823584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,36.223706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,37.947256>}
box{<0,0,-0.203200><1.723550,0.035000,0.203200> rotate<0,90.000000,0> translate<52.137597,0.000000,37.947256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,36.223706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.564172,0.000000,35.581297>}
box{<0,0,-0.203200><0.771139,0.035000,0.203200> rotate<0,56.411177,0> translate<52.137597,0.000000,36.223706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,36.576000>}
box{<0,0,-0.203200><12.530803,0.035000,0.203200> rotate<0,0.000000,0> translate<52.137597,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,36.982400>}
box{<0,0,-0.203200><12.530803,0.035000,0.203200> rotate<0,0.000000,0> translate<52.137597,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,37.388800>}
box{<0,0,-0.203200><12.530803,0.035000,0.203200> rotate<0,0.000000,0> translate<52.137597,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.201688,0.000000,37.795200>}
box{<0,0,-0.203200><10.064091,0.035000,0.203200> rotate<0,0.000000,0> translate<52.137597,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.173525,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,36.169600>}
box{<0,0,-0.203200><12.494875,0.035000,0.203200> rotate<0,0.000000,0> translate<52.173525,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.236625,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,17.068800>}
box{<0,0,-0.203200><0.147775,0.035000,0.203200> rotate<0,0.000000,0> translate<52.236625,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,17.122322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,19.270697>}
box{<0,0,-0.203200><2.148375,0.035000,0.203200> rotate<0,90.000000,0> translate<52.258797,0.000000,19.270697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,17.475200>}
box{<0,0,-0.203200><0.125603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.258797,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,17.881600>}
box{<0,0,-0.203200><0.125603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.258797,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.609897,0.000000,18.288000>}
box{<0,0,-0.203200><0.351100,0.035000,0.203200> rotate<0,0.000000,0> translate<52.258797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.679600,0.000000,18.694400>}
box{<0,0,-0.203200><0.420803,0.035000,0.203200> rotate<0,0.000000,0> translate<52.258797,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.679600,0.000000,19.100800>}
box{<0,0,-0.203200><0.420803,0.035000,0.203200> rotate<0,0.000000,0> translate<52.258797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,19.270697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.362791,0.000000,19.374688>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<52.258797,0.000000,19.270697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,21.369300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,22.572697>}
box{<0,0,-0.203200><1.203397,0.035000,0.203200> rotate<0,90.000000,0> translate<52.258797,0.000000,22.572697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,21.369300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.362791,0.000000,21.265309>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,44.996169,0> translate<52.258797,0.000000,21.369300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.447997,0.000000,21.539200>}
box{<0,0,-0.203200><0.189200,0.035000,0.203200> rotate<0,0.000000,0> translate<52.258797,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,21.945600>}
box{<0,0,-0.203200><0.125603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.258797,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,22.352000>}
box{<0,0,-0.203200><0.125603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.258797,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.258797,0.000000,22.572697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.362791,0.000000,22.676687>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<52.258797,0.000000,22.572697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.276412,0.000000,31.060941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.505056,0.000000,31.289584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.276412,0.000000,31.060941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.362791,0.000000,19.374688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.455597,0.000000,19.598741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<52.362791,0.000000,19.374688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.362791,0.000000,21.265309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.455597,0.000000,21.041256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<52.362791,0.000000,21.265309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.362791,0.000000,22.676687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,22.728866>}
box{<0,0,-0.203200><0.056476,0.035000,0.203200> rotate<0,-67.498837,0> translate<52.362791,0.000000,22.676687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,15.088741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.477206,0.000000,14.864688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<52.384400,0.000000,15.088741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,16.131256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,15.088741>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.384400,0.000000,15.088741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,16.131256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.477206,0.000000,16.355309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<52.384400,0.000000,16.131256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,16.888741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.477206,0.000000,16.664687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<52.384400,0.000000,16.888741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,17.931256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,16.888741>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.384400,0.000000,16.888741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,17.931256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.477206,0.000000,18.155309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<52.384400,0.000000,17.931256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,21.692741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.477206,0.000000,21.468688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<52.384400,0.000000,21.692741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,22.728866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.384400,0.000000,21.692741>}
box{<0,0,-0.203200><1.036125,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.384400,0.000000,21.692741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.417678,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.679600,0.000000,19.507200>}
box{<0,0,-0.203200><0.261922,0.035000,0.203200> rotate<0,0.000000,0> translate<52.417678,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.417678,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.679600,0.000000,21.132800>}
box{<0,0,-0.203200><0.261922,0.035000,0.203200> rotate<0,0.000000,0> translate<52.417678,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.443384,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,35.763200>}
box{<0,0,-0.203200><12.225016,0.035000,0.203200> rotate<0,0.000000,0> translate<52.443384,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.455597,0.000000,19.598741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.455597,0.000000,21.041256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<52.455597,0.000000,21.041256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.455597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.679600,0.000000,19.913600>}
box{<0,0,-0.203200><0.224003,0.035000,0.203200> rotate<0,0.000000,0> translate<52.455597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.455597,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.679600,0.000000,20.320000>}
box{<0,0,-0.203200><0.224003,0.035000,0.203200> rotate<0,0.000000,0> translate<52.455597,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.455597,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.679600,0.000000,20.726400>}
box{<0,0,-0.203200><0.224003,0.035000,0.203200> rotate<0,0.000000,0> translate<52.455597,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.477206,0.000000,14.864688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.648688,0.000000,14.693206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<52.477206,0.000000,14.864688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.477206,0.000000,16.355309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.631897,0.000000,16.509997>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,-44.996451,0> translate<52.477206,0.000000,16.355309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.477206,0.000000,16.664687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.631897,0.000000,16.509997>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,44.997030,0> translate<52.477206,0.000000,16.664687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.477206,0.000000,18.155309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.648688,0.000000,18.326791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.477206,0.000000,18.155309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.477206,0.000000,21.468688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.648688,0.000000,21.297206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<52.477206,0.000000,21.468688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.505056,0.000000,31.289584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.628797,0.000000,31.588322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<52.505056,0.000000,31.289584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.506388,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.540419,0.000000,31.292800>}
box{<0,0,-0.203200><3.034031,0.035000,0.203200> rotate<0,0.000000,0> translate<52.506388,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.544697,0.000000,24.826797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.648688,0.000000,24.930791>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.997891,0> translate<52.544697,0.000000,24.826797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.564172,0.000000,35.581297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.621056,0.000000,35.524413>}
box{<0,0,-0.203200><0.080447,0.035000,0.203200> rotate<0,44.997030,0> translate<52.564172,0.000000,35.581297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.621056,0.000000,35.524413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.652744,0.000000,35.447906>}
box{<0,0,-0.203200><0.082809,0.035000,0.203200> rotate<0,67.497096,0> translate<52.621056,0.000000,35.524413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.628797,0.000000,31.588322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.628797,0.000000,32.391112>}
box{<0,0,-0.203200><0.802791,0.035000,0.203200> rotate<0,90.000000,0> translate<52.628797,0.000000,32.391112> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.628797,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.134019,0.000000,31.699200>}
box{<0,0,-0.203200><2.505222,0.035000,0.203200> rotate<0,0.000000,0> translate<52.628797,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.628797,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.727619,0.000000,32.105600>}
box{<0,0,-0.203200><2.098822,0.035000,0.203200> rotate<0,0.000000,0> translate<52.628797,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.628797,0.000000,32.391112>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.677309,0.000000,32.411206>}
box{<0,0,-0.203200><0.052509,0.035000,0.203200> rotate<0,-22.497723,0> translate<52.628797,0.000000,32.391112> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.648688,0.000000,14.693206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.872741,0.000000,14.600400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<52.648688,0.000000,14.693206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.648688,0.000000,18.326791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.679600,0.000000,18.339594>}
box{<0,0,-0.203200><0.033459,0.035000,0.203200> rotate<0,-22.496535,0> translate<52.648688,0.000000,18.326791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.648688,0.000000,21.297206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.679600,0.000000,21.284403>}
box{<0,0,-0.203200><0.033459,0.035000,0.203200> rotate<0,22.496535,0> translate<52.648688,0.000000,21.297206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.648688,0.000000,24.930791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.872741,0.000000,25.023597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<52.648688,0.000000,24.930791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.652744,0.000000,35.447906>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.698547,0.000000,35.378931>}
box{<0,0,-0.203200><0.082798,0.035000,0.203200> rotate<0,56.409969,0> translate<52.652744,0.000000,35.447906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.677309,0.000000,32.411206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.848791,0.000000,32.582687>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.677309,0.000000,32.411206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.679600,0.000000,21.284403>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.679600,0.000000,18.339594>}
box{<0,0,-0.203200><2.944809,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.679600,0.000000,18.339594> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.698547,0.000000,35.378931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.714009,0.000000,35.299997>}
box{<0,0,-0.203200><0.080435,0.035000,0.203200> rotate<0,78.911434,0> translate<52.698547,0.000000,35.378931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.702884,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,35.356800>}
box{<0,0,-0.203200><11.965516,0.035000,0.203200> rotate<0,0.000000,0> translate<52.702884,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.714009,0.000000,35.299997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.744797,0.000000,35.225675>}
box{<0,0,-0.203200><0.080446,0.035000,0.203200> rotate<0,67.493985,0> translate<52.714009,0.000000,35.299997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.744797,0.000000,34.577303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.744797,0.000000,34.982766>}
box{<0,0,-0.203200><0.405462,0.035000,0.203200> rotate<0,90.000000,0> translate<52.744797,0.000000,34.982766> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.744797,0.000000,34.577303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.848791,0.000000,34.473309>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,44.997030,0> translate<52.744797,0.000000,34.577303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.744797,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.235622,0.000000,34.950400>}
box{<0,0,-0.203200><2.490825,0.035000,0.203200> rotate<0,0.000000,0> translate<52.744797,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.744797,0.000000,34.982766>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.760716,0.000000,35.061609>}
box{<0,0,-0.203200><0.080435,0.035000,0.203200> rotate<0,-78.580107,0> translate<52.744797,0.000000,34.982766> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.744797,0.000000,35.142862>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.744797,0.000000,35.225675>}
box{<0,0,-0.203200><0.082813,0.035000,0.203200> rotate<0,90.000000,0> translate<52.744797,0.000000,35.225675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.744797,0.000000,35.142862>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.760716,0.000000,35.061609>}
box{<0,0,-0.203200><0.082798,0.035000,0.203200> rotate<0,78.910057,0> translate<52.744797,0.000000,35.142862> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.778100,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.829222,0.000000,34.544000>}
box{<0,0,-0.203200><2.051122,0.035000,0.203200> rotate<0,0.000000,0> translate<52.778100,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.778103,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,32.512000>}
box{<0,0,-0.203200><1.609647,0.035000,0.203200> rotate<0,0.000000,0> translate<52.778103,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.848791,0.000000,32.582687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.941597,0.000000,32.806741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<52.848791,0.000000,32.582687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.848791,0.000000,34.473309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.941597,0.000000,34.249256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<52.848791,0.000000,34.473309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.872741,0.000000,14.600400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.315256,0.000000,14.600400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<52.872741,0.000000,14.600400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.872741,0.000000,25.023597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.310441,0.000000,25.023597>}
box{<0,0,-0.203200><0.437700,0.035000,0.203200> rotate<0,0.000000,0> translate<52.872741,0.000000,25.023597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.941597,0.000000,32.806741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.941597,0.000000,34.249256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<52.941597,0.000000,34.249256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.941597,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,32.918400>}
box{<0,0,-0.203200><1.446153,0.035000,0.203200> rotate<0,0.000000,0> translate<52.941597,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.941597,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,33.324800>}
box{<0,0,-0.203200><1.446153,0.035000,0.203200> rotate<0,0.000000,0> translate<52.941597,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.941597,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,33.731200>}
box{<0,0,-0.203200><1.446153,0.035000,0.203200> rotate<0,0.000000,0> translate<52.941597,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.941597,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.422822,0.000000,34.137600>}
box{<0,0,-0.203200><1.481225,0.035000,0.203200> rotate<0,0.000000,0> translate<52.941597,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.310441,0.000000,25.023597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286809,0.000000,27.999966>}
box{<0,0,-0.203200><4.209221,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.310441,0.000000,25.023597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.315256,0.000000,14.600400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.539309,0.000000,14.693206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<54.315256,0.000000,14.600400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387681,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.223400,0.000000,14.630400>}
box{<0,0,-0.203200><5.835719,0.035000,0.203200> rotate<0,0.000000,0> translate<54.387681,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.559469,0.000000,6.381750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<54.387750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,7.553469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<54.387750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.559469,0.000000,10.382247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.387750,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,32.445469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.559469,0.000000,31.273750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<54.387750,0.000000,32.445469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,34.102528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,32.445469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<54.387750,0.000000,32.445469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.387750,0.000000,34.102528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.559469,0.000000,35.274247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.387750,0.000000,34.102528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.508397,0.000000,18.339594>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.508397,0.000000,21.284403>}
box{<0,0,-0.203200><2.944809,0.035000,0.203200> rotate<0,90.000000,0> translate<54.508397,0.000000,21.284403> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.508397,0.000000,18.339594>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.539309,0.000000,18.326791>}
box{<0,0,-0.203200><0.033459,0.035000,0.203200> rotate<0,22.496535,0> translate<54.508397,0.000000,18.339594> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.508397,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,18.694400>}
box{<0,0,-0.203200><10.160003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.508397,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.508397,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,19.100800>}
box{<0,0,-0.203200><10.160003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.508397,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.508397,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,19.507200>}
box{<0,0,-0.203200><10.160003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.508397,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.508397,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,19.913600>}
box{<0,0,-0.203200><10.160003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.508397,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.508397,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,20.320000>}
box{<0,0,-0.203200><10.160003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.508397,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.508397,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,20.726400>}
box{<0,0,-0.203200><10.160003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.508397,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.508397,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,21.132800>}
box{<0,0,-0.203200><10.160003,0.035000,0.203200> rotate<0,0.000000,0> translate<54.508397,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.508397,0.000000,21.284403>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.539309,0.000000,21.297206>}
box{<0,0,-0.203200><0.033459,0.035000,0.203200> rotate<0,-22.496535,0> translate<54.508397,0.000000,21.284403> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.539309,0.000000,14.693206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.541700,0.000000,14.695600>}
box{<0,0,-0.203200><0.003383,0.035000,0.203200> rotate<0,-45.034451,0> translate<54.539309,0.000000,14.693206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.539309,0.000000,18.326791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.710791,0.000000,18.155309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<54.539309,0.000000,18.326791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.539309,0.000000,21.297206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.710791,0.000000,21.468688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.539309,0.000000,21.297206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.541700,0.000000,14.695600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.223400,0.000000,14.695600>}
box{<0,0,-0.203200><5.681700,0.035000,0.203200> rotate<0,0.000000,0> translate<54.541700,0.000000,14.695600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.556100,0.000000,23.113997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.710791,0.000000,22.959309>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.996451,0> translate<54.556100,0.000000,23.113997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.556100,0.000000,23.113997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.710791,0.000000,23.268688>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.556100,0.000000,23.113997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.570497,0.000000,16.524397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.710791,0.000000,16.664687>}
box{<0,0,-0.203200><0.198403,0.035000,0.203200> rotate<0,-44.996392,0> translate<54.570497,0.000000,16.524397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.570497,0.000000,16.524397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.975884,0.000000,16.524397>}
box{<0,0,-0.203200><6.405387,0.035000,0.203200> rotate<0,0.000000,0> translate<54.570497,0.000000,16.524397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.578100,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,18.288000>}
box{<0,0,-0.203200><10.090300,0.035000,0.203200> rotate<0,0.000000,0> translate<54.578100,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.606903,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,23.164800>}
box{<0,0,-0.203200><10.061497,0.035000,0.203200> rotate<0,0.000000,0> translate<54.606903,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.708500,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,16.662400>}
box{<0,0,-0.203200><9.959900,0.035000,0.203200> rotate<0,0.000000,0> translate<54.708500,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.710791,0.000000,16.664687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,16.888741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<54.710791,0.000000,16.664687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.710791,0.000000,18.155309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,17.931256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<54.710791,0.000000,18.155309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.710791,0.000000,21.468688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,21.692741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<54.710791,0.000000,21.468688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.710791,0.000000,22.959309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,22.735256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<54.710791,0.000000,22.959309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.710791,0.000000,23.268688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,23.492741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<54.710791,0.000000,23.268688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.739997,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,21.539200>}
box{<0,0,-0.203200><9.928403,0.035000,0.203200> rotate<0,0.000000,0> translate<54.739997,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.794013,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,22.758400>}
box{<0,0,-0.203200><9.874388,0.035000,0.203200> rotate<0,0.000000,0> translate<54.794013,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,16.888741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,17.931256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<54.803597,0.000000,17.931256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,17.068800>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<54.803597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,17.475200>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<54.803597,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,17.881600>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<54.803597,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,21.692741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,22.735256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<54.803597,0.000000,22.735256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,21.945600>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<54.803597,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,22.352000>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<54.803597,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,23.492741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,23.930441>}
box{<0,0,-0.203200><0.437700,0.035000,0.203200> rotate<0,90.000000,0> translate<54.803597,0.000000,23.930441> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,23.571200>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<54.803597,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.803597,0.000000,23.930441>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.440756,0.000000,26.567600>}
box{<0,0,-0.203200><3.729507,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.803597,0.000000,23.930441> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.850756,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,23.977600>}
box{<0,0,-0.203200><9.817644,0.035000,0.203200> rotate<0,0.000000,0> translate<54.850756,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.257156,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,24.384000>}
box{<0,0,-0.203200><9.411244,0.035000,0.203200> rotate<0,0.000000,0> translate<55.257156,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.559469,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.216528,0.000000,6.381750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<55.559469,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.559469,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.216528,0.000000,10.382247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<55.559469,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.559469,0.000000,31.273750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.216528,0.000000,31.273750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<55.559469,0.000000,31.273750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.559469,0.000000,35.274247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.216528,0.000000,35.274247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<55.559469,0.000000,35.274247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.663556,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,24.790400>}
box{<0,0,-0.203200><9.004844,0.035000,0.203200> rotate<0,0.000000,0> translate<55.663556,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.069956,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,25.196800>}
box{<0,0,-0.203200><8.598444,0.035000,0.203200> rotate<0,0.000000,0> translate<56.069956,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286809,0.000000,27.999966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.544031,0.000000,28.257188>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.286809,0.000000,27.999966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.476356,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,25.603200>}
box{<0,0,-0.203200><8.192044,0.035000,0.203200> rotate<0,0.000000,0> translate<56.476356,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.544031,0.000000,28.257188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.880113,0.000000,28.396397>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,-22.498510,0> translate<56.544031,0.000000,28.257188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.880113,0.000000,28.396397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.517059,0.000000,28.396397>}
box{<0,0,-0.203200><3.636947,0.035000,0.203200> rotate<0,0.000000,0> translate<56.880113,0.000000,28.396397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.882756,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.075059,0.000000,26.009600>}
box{<0,0,-0.203200><4.192303,0.035000,0.203200> rotate<0,0.000000,0> translate<56.882756,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.216528,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,7.553469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<57.216528,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.216528,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<57.216528,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.216528,0.000000,31.273750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,32.445469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<57.216528,0.000000,31.273750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.216528,0.000000,35.274247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,34.102528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<57.216528,0.000000,35.274247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.235578,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,31.292800>}
box{<0,0,-0.203200><7.432822,0.035000,0.203200> rotate<0,0.000000,0> translate<57.235578,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.289156,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.668659,0.000000,26.416000>}
box{<0,0,-0.203200><3.379503,0.035000,0.203200> rotate<0,0.000000,0> translate<57.289156,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.337178,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,6.502400>}
box{<0,0,-0.203200><7.331222,0.035000,0.203200> rotate<0,0.000000,0> translate<57.337178,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.438775,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,10.160000>}
box{<0,0,-0.203200><7.229625,0.035000,0.203200> rotate<0,0.000000,0> translate<57.438775,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.440756,0.000000,26.567600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.517059,0.000000,26.567600>}
box{<0,0,-0.203200><3.076303,0.035000,0.203200> rotate<0,0.000000,0> translate<57.440756,0.000000,26.567600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.540375,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,34.950400>}
box{<0,0,-0.203200><7.128025,0.035000,0.203200> rotate<0,0.000000,0> translate<57.540375,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.641978,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,31.699200>}
box{<0,0,-0.203200><7.026422,0.035000,0.203200> rotate<0,0.000000,0> translate<57.641978,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.743578,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,6.908800>}
box{<0,0,-0.203200><6.924822,0.035000,0.203200> rotate<0,0.000000,0> translate<57.743578,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.845175,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,9.753600>}
box{<0,0,-0.203200><6.823225,0.035000,0.203200> rotate<0,0.000000,0> translate<57.845175,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.946775,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,34.544000>}
box{<0,0,-0.203200><6.721625,0.035000,0.203200> rotate<0,0.000000,0> translate<57.946775,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.048378,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,32.105600>}
box{<0,0,-0.203200><6.620022,0.035000,0.203200> rotate<0,0.000000,0> translate<58.048378,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.149978,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,7.315200>}
box{<0,0,-0.203200><6.518422,0.035000,0.203200> rotate<0,0.000000,0> translate<58.149978,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.251575,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,9.347200>}
box{<0,0,-0.203200><6.416825,0.035000,0.203200> rotate<0,0.000000,0> translate<58.251575,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.353175,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,34.137600>}
box{<0,0,-0.203200><6.315225,0.035000,0.203200> rotate<0,0.000000,0> translate<58.353175,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<58.388247,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,7.721600>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.388247,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,8.128000>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.388247,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,8.534400>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.388247,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,8.940800>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.388247,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,32.445469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,34.102528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<58.388247,0.000000,34.102528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,32.512000>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.388247,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,32.918400>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.388247,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,33.324800>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.388247,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.388247,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,33.731200>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.388247,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.223400,0.000000,14.061259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.101259,0.000000,13.183400>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<60.223400,0.000000,14.061259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.223400,0.000000,14.695600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.223400,0.000000,14.061259>}
box{<0,0,-0.203200><0.634341,0.035000,0.203200> rotate<0,-90.000000,0> translate<60.223400,0.000000,14.061259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.517059,0.000000,26.567600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.101259,0.000000,25.983400>}
box{<0,0,-0.203200><0.826184,0.035000,0.203200> rotate<0,44.997030,0> translate<60.517059,0.000000,26.567600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.517059,0.000000,28.396397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.101259,0.000000,28.980597>}
box{<0,0,-0.203200><0.826184,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.517059,0.000000,28.396397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.975884,0.000000,16.524397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.311966,0.000000,16.385188>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,22.498510,0> translate<60.975884,0.000000,16.524397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.101259,0.000000,13.183400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.342738,0.000000,13.183400>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<61.101259,0.000000,13.183400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.101259,0.000000,25.983400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.342738,0.000000,25.983400>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<61.101259,0.000000,25.983400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.101259,0.000000,28.980597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.342738,0.000000,28.980597>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<61.101259,0.000000,28.980597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.288800,0.000000,1.592163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.590584,0.000000,0.863597>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,67.495370,0> translate<61.288800,0.000000,1.592163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.288800,0.000000,2.471834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.288800,0.000000,1.592163>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,-90.000000,0> translate<61.288800,0.000000,1.592163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.288800,0.000000,2.471834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.625434,0.000000,3.284544>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<61.288800,0.000000,2.471834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.288800,0.000000,39.184162>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.625434,0.000000,38.371453>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<61.288800,0.000000,39.184162> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.288800,0.000000,40.063834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.288800,0.000000,39.184162>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,-90.000000,0> translate<61.288800,0.000000,39.184162> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.288800,0.000000,40.063834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.590584,0.000000,40.792400>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,-67.495370,0> translate<61.288800,0.000000,40.063834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.311966,0.000000,16.385188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.516556,0.000000,16.180597>}
box{<0,0,-0.203200><0.289335,0.035000,0.203200> rotate<0,44.997030,0> translate<61.311966,0.000000,16.385188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.441153,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,16.256000>}
box{<0,0,-0.203200><3.227247,0.035000,0.203200> rotate<0,0.000000,0> translate<61.441153,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.516556,0.000000,16.180597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.342738,0.000000,16.180597>}
box{<0,0,-0.203200><0.826181,0.035000,0.203200> rotate<0,0.000000,0> translate<61.516556,0.000000,16.180597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.625434,0.000000,3.284544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.247453,0.000000,3.906563>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,-44.997030,0> translate<61.625434,0.000000,3.284544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.625434,0.000000,38.371453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.247453,0.000000,37.749434>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<61.625434,0.000000,38.371453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.247453,0.000000,3.906563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.060163,0.000000,4.243197>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-22.498463,0> translate<62.247453,0.000000,3.906563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.247453,0.000000,37.749434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.060163,0.000000,37.412800>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,22.498463,0> translate<62.247453,0.000000,37.749434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.342738,0.000000,13.183400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,14.061259>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,-44.997030,0> translate<62.342738,0.000000,13.183400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.342738,0.000000,16.180597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,15.302738>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<62.342738,0.000000,16.180597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.342738,0.000000,25.983400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,26.861259>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,-44.997030,0> translate<62.342738,0.000000,25.983400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.342738,0.000000,28.980597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,28.102737>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<62.342738,0.000000,28.980597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.368938,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,26.009600>}
box{<0,0,-0.203200><2.299463,0.035000,0.203200> rotate<0,0.000000,0> translate<62.368938,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.468934,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,28.854400>}
box{<0,0,-0.203200><2.199466,0.035000,0.203200> rotate<0,0.000000,0> translate<62.468934,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.570538,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,13.411200>}
box{<0,0,-0.203200><2.097863,0.035000,0.203200> rotate<0,0.000000,0> translate<62.570538,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.673734,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,15.849600>}
box{<0,0,-0.203200><1.994666,0.035000,0.203200> rotate<0,0.000000,0> translate<62.673734,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.775338,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,26.416000>}
box{<0,0,-0.203200><1.893062,0.035000,0.203200> rotate<0,0.000000,0> translate<62.775338,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.875334,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,28.448000>}
box{<0,0,-0.203200><1.793066,0.035000,0.203200> rotate<0,0.000000,0> translate<62.875334,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.976938,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,13.817600>}
box{<0,0,-0.203200><1.691463,0.035000,0.203200> rotate<0,0.000000,0> translate<62.976938,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.060163,0.000000,4.243197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.939834,0.000000,4.243197>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<63.060163,0.000000,4.243197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.060163,0.000000,37.412800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.939834,0.000000,37.412800>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<63.060163,0.000000,37.412800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.080134,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,15.443200>}
box{<0,0,-0.203200><1.588266,0.035000,0.203200> rotate<0,0.000000,0> translate<63.080134,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.181738,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,26.822400>}
box{<0,0,-0.203200><1.486663,0.035000,0.203200> rotate<0,0.000000,0> translate<63.181738,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,14.061259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,15.302738>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,90.000000,0> translate<63.220597,0.000000,15.302738> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,14.224000>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<63.220597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,14.630400>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<63.220597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,15.036800>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<63.220597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,26.861259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,28.102737>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,90.000000,0> translate<63.220597,0.000000,28.102737> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,27.228800>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<63.220597,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,27.635200>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<63.220597,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.220597,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,28.041600>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<63.220597,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.939834,0.000000,4.243197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,3.941413>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,22.498690,0> translate<63.939834,0.000000,4.243197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.939834,0.000000,37.412800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,37.714584>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,-22.498690,0> translate<63.939834,0.000000,37.412800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.372453,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,4.064000>}
box{<0,0,-0.203200><0.295947,0.035000,0.203200> rotate<0,0.000000,0> translate<64.372453,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,37.714584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.668400,0.000000,3.941413>}
box{<0,0,-0.203200><33.773172,0.035000,0.203200> rotate<0,-90.000000,0> translate<64.668400,0.000000,3.941413> }
texture{col_pol}
}
#end
union{
cylinder{<56.388000,0.038000,33.274000><56.388000,-1.538000,33.274000>0.927100}
cylinder{<49.276000,0.038000,33.274000><49.276000,-1.538000,33.274000>0.927100}
cylinder{<6.096000,0.038000,33.274000><6.096000,-1.538000,33.274000>0.927100}
cylinder{<13.208000,0.038000,33.274000><13.208000,-1.538000,33.274000>0.927100}
cylinder{<6.096000,0.038000,8.382000><6.096000,-1.538000,8.382000>0.927100}
cylinder{<13.208000,0.038000,8.382000><13.208000,-1.538000,8.382000>0.927100}
cylinder{<56.388000,0.038000,8.382000><56.388000,-1.538000,8.382000>0.927100}
cylinder{<49.276000,0.038000,8.382000><49.276000,-1.538000,8.382000>0.927100}
cylinder{<61.722000,0.038000,27.482000><61.722000,-1.538000,27.482000>0.508000}
cylinder{<61.722000,0.038000,14.682000><61.722000,-1.538000,14.682000>0.508000}
cylinder{<17.272000,0.038000,4.064000><17.272000,-1.538000,4.064000>0.508000}
cylinder{<19.812000,0.038000,4.064000><19.812000,-1.538000,4.064000>0.508000}
cylinder{<22.352000,0.038000,4.064000><22.352000,-1.538000,4.064000>0.508000}
cylinder{<24.892000,0.038000,4.064000><24.892000,-1.538000,4.064000>0.508000}
cylinder{<19.558000,0.038000,28.702000><19.558000,-1.538000,28.702000>0.508000}
cylinder{<17.018000,0.038000,28.702000><17.018000,-1.538000,28.702000>0.508000}
cylinder{<19.558000,0.038000,31.242000><19.558000,-1.538000,31.242000>0.508000}
cylinder{<17.018000,0.038000,31.242000><17.018000,-1.538000,31.242000>0.508000}
cylinder{<19.558000,0.038000,33.782000><19.558000,-1.538000,33.782000>0.508000}
cylinder{<17.018000,0.038000,33.782000><17.018000,-1.538000,33.782000>0.508000}
cylinder{<17.272000,0.038000,6.858000><17.272000,-1.538000,6.858000>0.508000}
cylinder{<19.812000,0.038000,6.858000><19.812000,-1.538000,6.858000>0.508000}
cylinder{<22.352000,0.038000,6.858000><22.352000,-1.538000,6.858000>0.508000}
cylinder{<24.892000,0.038000,6.858000><24.892000,-1.538000,6.858000>0.508000}
cylinder{<38.354000,0.038000,6.858000><38.354000,-1.538000,6.858000>0.508000}
cylinder{<40.894000,0.038000,6.858000><40.894000,-1.538000,6.858000>0.508000}
cylinder{<43.434000,0.038000,6.858000><43.434000,-1.538000,6.858000>0.508000}
cylinder{<45.974000,0.038000,6.858000><45.974000,-1.538000,6.858000>0.508000}
cylinder{<38.354000,0.038000,4.064000><38.354000,-1.538000,4.064000>0.508000}
cylinder{<40.894000,0.038000,4.064000><40.894000,-1.538000,4.064000>0.508000}
cylinder{<43.434000,0.038000,4.064000><43.434000,-1.538000,4.064000>0.508000}
cylinder{<45.974000,0.038000,4.064000><45.974000,-1.538000,4.064000>0.508000}
cylinder{<8.128000,0.038000,22.606000><8.128000,-1.538000,22.606000>0.508000}
cylinder{<5.588000,0.038000,22.606000><5.588000,-1.538000,22.606000>0.508000}
//Holes(fast)/Vias
cylinder{<28.956000,0.038000,12.192000><28.956000,-1.538000,12.192000>0.300000 }
cylinder{<16.510000,0.038000,23.876000><16.510000,-1.538000,23.876000>0.300000 }
cylinder{<26.924000,0.038000,6.858000><26.924000,-1.538000,6.858000>0.300000 }
cylinder{<28.956000,0.038000,9.652000><28.956000,-1.538000,9.652000>0.300000 }
cylinder{<28.702000,0.038000,8.382000><28.702000,-1.538000,8.382000>0.300000 }
cylinder{<34.544000,0.038000,21.844000><34.544000,-1.538000,21.844000>0.300000 }
cylinder{<34.290000,0.038000,13.970000><34.290000,-1.538000,13.970000>0.300000 }
cylinder{<33.020000,0.038000,13.462000><33.020000,-1.538000,13.462000>0.300000 }
cylinder{<31.750000,0.038000,13.462000><31.750000,-1.538000,13.462000>0.300000 }
cylinder{<30.480000,0.038000,13.970000><30.480000,-1.538000,13.970000>0.300000 }
cylinder{<30.734000,0.038000,8.382000><30.734000,-1.538000,8.382000>0.300000 }
cylinder{<43.434000,0.038000,10.160000><43.434000,-1.538000,10.160000>0.300000 }
cylinder{<36.068000,0.038000,27.178000><36.068000,-1.538000,27.178000>0.300000 }
cylinder{<36.068000,0.038000,6.858000><36.068000,-1.538000,6.858000>0.300000 }
cylinder{<48.006000,0.038000,23.876000><48.006000,-1.538000,23.876000>0.300000 }
cylinder{<28.188000,0.038000,20.072000><28.188000,-1.538000,20.072000>0.300000 }
cylinder{<28.194000,0.038000,27.940000><28.194000,-1.538000,27.940000>0.300000 }
cylinder{<29.242000,0.038000,21.812000><29.242000,-1.538000,21.812000>0.300000 }
cylinder{<29.210000,0.038000,25.908000><29.210000,-1.538000,25.908000>0.300000 }
cylinder{<32.004000,0.038000,8.382000><32.004000,-1.538000,8.382000>0.300000 }
cylinder{<32.004000,0.038000,21.844000><32.004000,-1.538000,21.844000>0.300000 }
cylinder{<27.178000,0.038000,15.748000><27.178000,-1.538000,15.748000>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.024100,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.146969,0.000000,2.299328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<15.024100,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.146969,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.392713,0.000000,2.299328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<15.146969,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.392713,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.515584,0.000000,2.176456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<15.392713,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.515584,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.515584,0.000000,2.053584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.515584,0.000000,2.053584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.515584,0.000000,2.053584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.392713,0.000000,1.930713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<15.392713,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.392713,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.269841,0.000000,1.930713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<15.269841,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.392713,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.515584,0.000000,1.807841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<15.392713,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.515584,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.515584,0.000000,1.684969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.515584,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.515584,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.392713,0.000000,1.562100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<15.392713,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.392713,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.146969,0.000000,1.562100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<15.146969,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.146969,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.024100,0.000000,1.684969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<15.024100,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.772516,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.772516,0.000000,1.807841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.772516,0.000000,1.807841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.772516,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.018256,0.000000,1.562100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<15.772516,0.000000,1.807841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.018256,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.264000,0.000000,1.807841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<16.018256,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.264000,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.264000,0.000000,2.299328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<16.264000,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.520931,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.643800,0.000000,2.299328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<16.520931,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.643800,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.889544,0.000000,2.299328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.643800,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.889544,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.012416,0.000000,2.176456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.889544,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.012416,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.012416,0.000000,2.053584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.012416,0.000000,2.053584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.012416,0.000000,2.053584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.889544,0.000000,1.930713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.889544,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.889544,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.766672,0.000000,1.930713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<16.766672,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.889544,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.012416,0.000000,1.807841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.889544,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.012416,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.012416,0.000000,1.684969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.012416,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.012416,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.889544,0.000000,1.562100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<16.889544,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.889544,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.643800,0.000000,1.562100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.643800,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.643800,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.520931,0.000000,1.684969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<16.520931,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.509247,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.386375,0.000000,2.299328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<18.386375,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.386375,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.140631,0.000000,2.299328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<18.140631,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.140631,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.017762,0.000000,2.176456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<18.017762,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.017762,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.017762,0.000000,1.684969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.017762,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.017762,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.140631,0.000000,1.562100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<18.017762,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.140631,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.386375,0.000000,1.562100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<18.140631,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.386375,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.509247,0.000000,1.684969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<18.386375,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.509247,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.509247,0.000000,1.930713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<18.509247,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.509247,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.263503,0.000000,1.930713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<18.263503,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.766178,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.766178,0.000000,2.299328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<18.766178,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.766178,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.257663,0.000000,1.562100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<18.766178,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.257663,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.257663,0.000000,2.299328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<19.257663,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.514594,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.514594,0.000000,1.562100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.514594,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.514594,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.883206,0.000000,1.562100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<19.514594,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.883206,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.006078,0.000000,1.684969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<19.883206,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.006078,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.006078,0.000000,2.176456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<20.006078,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.006078,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.883206,0.000000,2.299328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<19.883206,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.883206,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.514594,0.000000,2.299328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<19.514594,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.502909,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.380038,0.000000,2.299328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<21.380038,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.380038,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.134294,0.000000,2.299328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<21.134294,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.134294,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.011425,0.000000,2.176456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<21.011425,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.011425,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.011425,0.000000,2.053584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.011425,0.000000,2.053584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.011425,0.000000,2.053584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.134294,0.000000,1.930713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<21.011425,0.000000,2.053584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.134294,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.380038,0.000000,1.930713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<21.134294,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.380038,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.502909,0.000000,1.807841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<21.380038,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.502909,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.502909,0.000000,1.684969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.502909,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.502909,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.380038,0.000000,1.562100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<21.380038,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.380038,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.134294,0.000000,1.562100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<21.134294,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.134294,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.011425,0.000000,1.684969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<21.011425,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.759841,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.759841,0.000000,1.562100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.759841,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.759841,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.128453,0.000000,1.562100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<21.759841,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.128453,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.251325,0.000000,1.684969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<22.128453,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.251325,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.251325,0.000000,2.176456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<22.251325,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.251325,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.128453,0.000000,2.299328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<22.128453,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.128453,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.759841,0.000000,2.299328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<21.759841,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.508256,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.508256,0.000000,2.053584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<22.508256,0.000000,2.053584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.508256,0.000000,2.053584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.753997,0.000000,2.299328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<22.508256,0.000000,2.053584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.753997,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.999741,0.000000,2.053584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<22.753997,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.999741,0.000000,2.053584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.999741,0.000000,1.562100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.999741,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.508256,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.999741,0.000000,1.930713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<22.508256,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.496572,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.373700,0.000000,2.299328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<24.373700,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.373700,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.127956,0.000000,2.299328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<24.127956,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.127956,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.005088,0.000000,2.176456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<24.005088,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.005088,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.005088,0.000000,2.053584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.005088,0.000000,2.053584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.005088,0.000000,2.053584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.127956,0.000000,1.930713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<24.005088,0.000000,2.053584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.127956,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.373700,0.000000,1.930713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<24.127956,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.373700,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.496572,0.000000,1.807841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<24.373700,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.496572,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.496572,0.000000,1.684969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.496572,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.496572,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.373700,0.000000,1.562100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<24.373700,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.373700,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.127956,0.000000,1.562100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<24.127956,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.127956,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.005088,0.000000,1.684969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<24.005088,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.244988,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.122116,0.000000,2.299328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<25.122116,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.122116,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.876372,0.000000,2.299328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<24.876372,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.876372,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.753503,0.000000,2.176456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<24.753503,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.753503,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.753503,0.000000,1.684969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.753503,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.753503,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.876372,0.000000,1.562100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<24.753503,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.876372,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.122116,0.000000,1.562100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<24.876372,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.122116,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.244988,0.000000,1.684969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<25.122116,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.501919,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.501919,0.000000,1.562100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.501919,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.501919,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.993403,0.000000,1.562100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<25.501919,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.278100,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.400969,0.000000,9.411328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<15.278100,0.000000,9.288456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.400969,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,9.411328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<15.400969,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,9.288456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<15.646713,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,9.165584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.769584,0.000000,9.165584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,9.165584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,9.042713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<15.646713,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.523841,0.000000,9.042713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<15.523841,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,8.919841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<15.646713,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,8.919841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,8.796969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.769584,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,8.674100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<15.646713,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.400969,0.000000,8.674100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<15.400969,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.400969,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.278100,0.000000,8.796969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<15.278100,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.026516,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.026516,0.000000,8.919841>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.026516,0.000000,8.919841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.026516,0.000000,8.919841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.272256,0.000000,8.674100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<16.026516,0.000000,8.919841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.272256,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,8.919841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<16.272256,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,8.919841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,9.411328>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<16.518000,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.774931,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.897800,0.000000,9.411328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<16.774931,0.000000,9.288456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.897800,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,9.411328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.897800,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,9.288456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<17.143544,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,9.165584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.266416,0.000000,9.165584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,9.165584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,9.042713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.143544,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.020672,0.000000,9.042713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<17.020672,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,8.919841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<17.143544,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,8.919841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,8.796969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.266416,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,8.674100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<17.143544,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.897800,0.000000,8.674100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.897800,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.897800,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.774931,0.000000,8.796969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<16.774931,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.763247,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.640375,0.000000,9.411328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<18.640375,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.640375,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.394631,0.000000,9.411328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<18.394631,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.394631,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.271763,0.000000,9.288456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<18.271763,0.000000,9.288456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.271763,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.271763,0.000000,8.796969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.271763,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.271763,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.394631,0.000000,8.674100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<18.271763,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.394631,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.640375,0.000000,8.674100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<18.394631,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.640375,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.763247,0.000000,8.796969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<18.640375,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.763247,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.763247,0.000000,9.042713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<18.763247,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.763247,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.517503,0.000000,9.042713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<18.517503,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.020178,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.020178,0.000000,9.411328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<19.020178,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.020178,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.511662,0.000000,8.674100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<19.020178,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.511662,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.511662,0.000000,9.411328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<19.511662,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.768594,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.768594,0.000000,8.674100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.768594,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.768594,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.137206,0.000000,8.674100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<19.768594,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.137206,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.260078,0.000000,8.796969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<20.137206,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.260078,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.260078,0.000000,9.288456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<20.260078,0.000000,9.288456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.260078,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.137206,0.000000,9.411328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<20.137206,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.137206,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.768594,0.000000,9.411328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<19.768594,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.265425,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.265425,0.000000,9.165584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<21.265425,0.000000,9.165584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.265425,0.000000,9.165584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.511166,0.000000,9.411328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<21.265425,0.000000,9.165584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.511166,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.756909,0.000000,9.165584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<21.511166,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.756909,0.000000,9.165584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.756909,0.000000,8.674100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.756909,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.265425,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.756909,0.000000,9.042713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<21.265425,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259581,0.000000,9.288456>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,-26.563298,0> translate<22.259581,0.000000,9.288456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259581,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,9.042713>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<22.013841,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,8.796969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.013841,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.136709,0.000000,8.674100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<22.013841,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.136709,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,8.674100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<22.136709,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,8.796969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<22.382453,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,8.919841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<22.505325,0.000000,8.919841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,8.919841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,9.042713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<22.382453,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,9.042713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<22.013841,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.510672,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.510672,0.000000,9.165584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<23.510672,0.000000,9.165584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.510672,0.000000,9.165584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.756412,0.000000,9.411328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<23.510672,0.000000,9.165584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.756412,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.002156,0.000000,9.165584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<23.756412,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.002156,0.000000,9.165584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.002156,0.000000,8.674100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.002156,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.510672,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.002156,0.000000,9.042713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<23.510672,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.259087,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.750572,0.000000,9.411328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<24.259087,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.750572,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.750572,0.000000,9.288456>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.750572,0.000000,9.288456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.750572,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.259087,0.000000,8.796969>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,-44.997212,0> translate<24.259087,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.259087,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.259087,0.000000,8.674100>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.259087,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.376100,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.376100,0.000000,8.674100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.376100,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.376100,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.744712,0.000000,8.674100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<37.376100,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.744712,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.867584,0.000000,8.796969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<37.744712,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.867584,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.867584,0.000000,9.288456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<37.867584,0.000000,9.288456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.867584,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.744712,0.000000,9.411328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<37.744712,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.744712,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.376100,0.000000,9.411328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<37.376100,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.616000,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.124516,0.000000,9.411328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<38.124516,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.124516,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.124516,0.000000,9.042713>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.124516,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.124516,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.370256,0.000000,9.165584>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,-26.563589,0> translate<38.124516,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.370256,0.000000,9.165584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.493128,0.000000,9.165584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<38.370256,0.000000,9.165584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.493128,0.000000,9.165584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.616000,0.000000,9.042713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.493128,0.000000,9.165584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.616000,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.616000,0.000000,8.796969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.616000,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.616000,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.493128,0.000000,8.674100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<38.493128,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.493128,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.247384,0.000000,8.674100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.247384,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.247384,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.124516,0.000000,8.796969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<38.124516,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.621347,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.621347,0.000000,8.674100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.621347,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.621347,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.989959,0.000000,8.674100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<39.621347,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.989959,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.112831,0.000000,8.796969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<39.989959,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.112831,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.112831,0.000000,9.288456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<40.112831,0.000000,9.288456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.112831,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.989959,0.000000,9.411328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<39.989959,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.989959,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.621347,0.000000,9.411328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<39.621347,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.861247,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.615503,0.000000,9.288456>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,-26.563298,0> translate<40.615503,0.000000,9.288456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.615503,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.369763,0.000000,9.042713>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<40.369763,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.369763,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.369763,0.000000,8.796969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.369763,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.369763,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.492631,0.000000,8.674100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<40.369763,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.492631,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.738375,0.000000,8.674100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.492631,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.738375,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.861247,0.000000,8.796969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<40.738375,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.861247,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.861247,0.000000,8.919841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<40.861247,0.000000,8.919841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.861247,0.000000,8.919841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.738375,0.000000,9.042713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<40.738375,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.738375,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.369763,0.000000,9.042713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<40.369763,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.358078,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.235206,0.000000,9.411328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<42.235206,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.235206,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.989463,0.000000,9.411328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<41.989463,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.989463,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.866594,0.000000,9.288456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<41.866594,0.000000,9.288456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.866594,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.866594,0.000000,8.796969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.866594,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.866594,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.989463,0.000000,8.674100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<41.866594,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.989463,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.235206,0.000000,8.674100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<41.989463,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.235206,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.358078,0.000000,8.796969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<42.235206,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.358078,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.358078,0.000000,9.042713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<42.358078,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.358078,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.112334,0.000000,9.042713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.112334,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.615009,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.615009,0.000000,9.411328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<42.615009,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.615009,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.106494,0.000000,8.674100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<42.615009,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.106494,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.106494,0.000000,9.411328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<43.106494,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.363425,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.363425,0.000000,8.674100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.363425,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.363425,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.732038,0.000000,8.674100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<43.363425,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.732038,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.854909,0.000000,8.796969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<43.732038,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.854909,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.854909,0.000000,9.288456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<43.854909,0.000000,9.288456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.854909,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.732038,0.000000,9.411328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<43.732038,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.732038,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.363425,0.000000,9.411328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<43.363425,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.860256,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.983125,0.000000,9.411328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<44.860256,0.000000,9.288456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.983125,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.228869,0.000000,9.411328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.983125,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.228869,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.351741,0.000000,9.288456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<45.228869,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.351741,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.351741,0.000000,9.165584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.351741,0.000000,9.165584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.351741,0.000000,9.165584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.228869,0.000000,9.042713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.228869,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.228869,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.105997,0.000000,9.042713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<45.105997,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.228869,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.351741,0.000000,8.919841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<45.228869,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.351741,0.000000,8.919841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.351741,0.000000,8.796969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.351741,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.351741,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.228869,0.000000,8.674100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<45.228869,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.228869,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.983125,0.000000,8.674100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.983125,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.983125,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.860256,0.000000,8.796969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<44.860256,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.608672,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.608672,0.000000,8.919841>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.608672,0.000000,8.919841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.608672,0.000000,8.919841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.854413,0.000000,8.674100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<45.608672,0.000000,8.919841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.854413,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100156,0.000000,8.919841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<45.854413,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100156,0.000000,8.919841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100156,0.000000,9.411328>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<46.100156,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.357088,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.479956,0.000000,9.411328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<46.357088,0.000000,9.288456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.479956,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.725700,0.000000,9.411328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<46.479956,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.725700,0.000000,9.411328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.848572,0.000000,9.288456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<46.725700,0.000000,9.411328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.848572,0.000000,9.288456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.848572,0.000000,9.165584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.848572,0.000000,9.165584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.848572,0.000000,9.165584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.725700,0.000000,9.042713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<46.725700,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.725700,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.602828,0.000000,9.042713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<46.602828,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.725700,0.000000,9.042713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.848572,0.000000,8.919841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<46.725700,0.000000,9.042713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.848572,0.000000,8.919841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.848572,0.000000,8.796969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.848572,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.848572,0.000000,8.796969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.725700,0.000000,8.674100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<46.725700,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.725700,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.479956,0.000000,8.674100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<46.479956,0.000000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.479956,0.000000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.357088,0.000000,8.796969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<46.357088,0.000000,8.796969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.598100,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.598100,0.000000,2.299328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<35.598100,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.598100,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,2.299328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<35.598100,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,2.176456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<35.966712,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,2.053584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.089584,0.000000,2.053584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,2.053584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,1.930713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.966712,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,1.807841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<35.966712,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,1.684969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.089584,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,1.562100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<35.966712,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.598100,0.000000,1.562100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<35.598100,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.598100,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,1.930713>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<35.598100,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.346516,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.346516,0.000000,2.176456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<36.346516,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.346516,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.469384,0.000000,2.299328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<36.346516,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.469384,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.715128,0.000000,2.299328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.469384,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.715128,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.838000,0.000000,2.176456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<36.715128,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.838000,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.838000,0.000000,1.684969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.838000,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.838000,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.715128,0.000000,1.562100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<36.715128,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.715128,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.469384,0.000000,1.562100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.469384,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.469384,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.346516,0.000000,1.684969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<36.346516,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.346516,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.838000,0.000000,2.176456>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,-44.997212,0> translate<36.346516,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.094931,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.586416,0.000000,2.299328>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<37.094931,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.843347,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.843347,0.000000,2.299328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<37.843347,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.843347,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.211959,0.000000,2.299328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<37.843347,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.211959,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.334831,0.000000,2.176456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.211959,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.334831,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.334831,0.000000,1.930713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.334831,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.334831,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.211959,0.000000,1.807841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.211959,0.000000,1.807841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.211959,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.843347,0.000000,1.807841>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<37.843347,0.000000,1.807841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.089088,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.334831,0.000000,1.562100>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<38.089088,0.000000,1.807841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.591763,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.083247,0.000000,1.562100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<38.591763,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.083247,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.591763,0.000000,1.562100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<38.591763,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.088594,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.088594,0.000000,2.299328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<40.088594,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.088594,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.457206,0.000000,2.299328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<40.088594,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.457206,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.580078,0.000000,2.176456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<40.457206,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.580078,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.580078,0.000000,2.053584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.580078,0.000000,2.053584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.580078,0.000000,2.053584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.457206,0.000000,1.930713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.457206,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.457206,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.580078,0.000000,1.807841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<40.457206,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.580078,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.580078,0.000000,1.684969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.580078,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.580078,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.457206,0.000000,1.562100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<40.457206,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.457206,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.088594,0.000000,1.562100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<40.088594,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.088594,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.457206,0.000000,1.930713>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<40.088594,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.837009,0.000000,2.053584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.082750,0.000000,2.299328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<40.837009,0.000000,2.053584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.082750,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.082750,0.000000,1.562100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.082750,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.837009,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.328494,0.000000,1.562100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<40.837009,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.585425,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.076909,0.000000,2.299328>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<41.585425,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.579581,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.579581,0.000000,2.299328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<42.579581,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.333841,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.825325,0.000000,2.299328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.333841,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.082256,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.573741,0.000000,1.562100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<43.082256,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.573741,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.082256,0.000000,1.562100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<43.082256,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.070572,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.947700,0.000000,2.299328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<44.947700,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.947700,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.701956,0.000000,2.299328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.701956,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.701956,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.579087,0.000000,2.176456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<44.579087,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.579087,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.579087,0.000000,1.684969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.579087,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.579087,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.701956,0.000000,1.562100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<44.579087,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.701956,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.947700,0.000000,1.562100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.701956,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.947700,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.070572,0.000000,1.684969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<44.947700,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.070572,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.070572,0.000000,1.930713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<45.070572,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.070572,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.824828,0.000000,1.930713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.824828,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.327503,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.327503,0.000000,2.299328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<45.327503,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.327503,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.818987,0.000000,1.562100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<45.327503,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.818987,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.818987,0.000000,2.299328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<45.818987,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.075919,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.075919,0.000000,1.562100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.075919,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.075919,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.444531,0.000000,1.562100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<46.075919,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.444531,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.567403,0.000000,1.684969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<46.444531,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.567403,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.567403,0.000000,2.176456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<46.567403,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.567403,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.444531,0.000000,2.299328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<46.444531,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.444531,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.075919,0.000000,2.299328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<46.075919,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.572750,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.695619,0.000000,2.299328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<47.572750,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.695619,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.941363,0.000000,2.299328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<47.695619,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.941363,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.064234,0.000000,2.176456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<47.941363,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.064234,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.064234,0.000000,2.053584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<48.064234,0.000000,2.053584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.064234,0.000000,2.053584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.941363,0.000000,1.930713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<47.941363,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.941363,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.818491,0.000000,1.930713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<47.818491,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.941363,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.064234,0.000000,1.807841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<47.941363,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.064234,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.064234,0.000000,1.684969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<48.064234,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.064234,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.941363,0.000000,1.562100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<47.941363,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.941363,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.695619,0.000000,1.562100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<47.695619,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.695619,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.572750,0.000000,1.684969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<47.572750,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.321166,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.321166,0.000000,1.807841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<48.321166,0.000000,1.807841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.321166,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.566906,0.000000,1.562100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<48.321166,0.000000,1.807841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.566906,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.812650,0.000000,1.807841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<48.566906,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.812650,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.812650,0.000000,2.299328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<48.812650,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.069581,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.192450,0.000000,2.299328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<49.069581,0.000000,2.176456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.192450,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.438194,0.000000,2.299328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<49.192450,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.438194,0.000000,2.299328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.561066,0.000000,2.176456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<49.438194,0.000000,2.299328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.561066,0.000000,2.176456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.561066,0.000000,2.053584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<49.561066,0.000000,2.053584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.561066,0.000000,2.053584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.438194,0.000000,1.930713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<49.438194,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.438194,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.315322,0.000000,1.930713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<49.315322,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.438194,0.000000,1.930713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.561066,0.000000,1.807841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<49.438194,0.000000,1.930713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.561066,0.000000,1.807841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.561066,0.000000,1.684969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<49.561066,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.561066,0.000000,1.684969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.438194,0.000000,1.562100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<49.438194,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.438194,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.192450,0.000000,1.562100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<49.192450,0.000000,1.562100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.192450,0.000000,1.562100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.069581,0.000000,1.684969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<49.069581,0.000000,1.684969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.564344,0.000000,16.531584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.441472,0.000000,16.408713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.441472,0.000000,16.408713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.441472,0.000000,16.408713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.441472,0.000000,16.162969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.441472,0.000000,16.162969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.441472,0.000000,16.162969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.564344,0.000000,16.040100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<57.441472,0.000000,16.162969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.564344,0.000000,16.040100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,16.040100>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,0.000000,0> translate<57.564344,0.000000,16.040100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,16.040100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,16.162969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.055831,0.000000,16.040100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,16.162969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,16.408713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<58.178700,0.000000,16.408713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,16.408713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,16.531584>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<58.055831,0.000000,16.531584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,16.788516>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,16.788516>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<57.687216,0.000000,16.788516> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,16.788516>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,16.911384>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.055831,0.000000,16.788516> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,16.911384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,17.280000>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<58.178700,0.000000,17.280000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,17.280000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,17.280000>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.687216,0.000000,17.280000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,17.536931>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,17.536931>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.687216,0.000000,17.536931> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,17.536931>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,17.782672>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<57.687216,0.000000,17.782672> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,17.782672>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,17.905544>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<57.687216,0.000000,17.905544> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,18.160609>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,18.160609>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.687216,0.000000,18.160609> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,18.160609>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,18.406350>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<57.687216,0.000000,18.406350> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,18.406350>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,18.529222>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<57.687216,0.000000,18.529222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,19.152900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,18.907156>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.178700,0.000000,18.907156> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,18.907156>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,18.784288>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.055831,0.000000,18.784288> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,18.784288>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,18.784288>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<57.810088,0.000000,18.784288> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,18.784288>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,18.907156>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<57.687216,0.000000,18.907156> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,18.907156>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,19.152900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<57.687216,0.000000,19.152900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,19.152900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,19.275772>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.687216,0.000000,19.152900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,19.275772>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,19.275772>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<57.810088,0.000000,19.275772> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,19.275772>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,18.784288>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.932959,0.000000,18.784288> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,19.532703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,19.532703>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.687216,0.000000,19.532703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,19.532703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,19.901316>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,90.000000,0> translate<57.687216,0.000000,19.901316> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,19.901316>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,20.024188>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.687216,0.000000,19.901316> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,20.024188>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,20.024188>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<57.810088,0.000000,20.024188> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.564344,0.000000,20.403987>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,20.403987>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,0.000000,0> translate<57.564344,0.000000,20.403987> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,20.403987>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,20.526859>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<58.055831,0.000000,20.403987> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,20.281119>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,20.526859>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<57.687216,0.000000,20.526859> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,21.774219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.441472,0.000000,21.774219>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<57.441472,0.000000,21.774219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.441472,0.000000,21.528478>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.441472,0.000000,22.019963>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<57.441472,0.000000,22.019963> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,22.276894>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,22.276894>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.687216,0.000000,22.276894> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,22.276894>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,22.522634>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<57.687216,0.000000,22.522634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,22.522634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,22.645506>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<57.687216,0.000000,22.645506> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,23.023441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,23.269184>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<57.687216,0.000000,23.269184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,23.269184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,23.392056>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.687216,0.000000,23.269184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,23.392056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,23.392056>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<57.810088,0.000000,23.392056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,23.392056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,23.023441>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.178700,0.000000,23.023441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,23.023441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,22.900572>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.055831,0.000000,22.900572> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,22.900572>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,23.023441>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<57.932959,0.000000,23.023441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,23.023441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,23.392056>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<57.932959,0.000000,23.392056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,23.648988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,23.648988>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.687216,0.000000,23.648988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,23.648988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,24.017600>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,90.000000,0> translate<57.687216,0.000000,24.017600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,24.017600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,24.140472>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.687216,0.000000,24.017600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,24.140472>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,24.140472>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<57.810088,0.000000,24.140472> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,24.397403>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,24.766016>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,90.000000,0> translate<58.178700,0.000000,24.766016> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,24.766016>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,24.888888>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<58.055831,0.000000,24.888888> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,24.888888>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,24.766016>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.932959,0.000000,24.766016> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,24.766016>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,24.520272>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.932959,0.000000,24.520272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,24.520272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,24.397403>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<57.810088,0.000000,24.397403> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,24.397403>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,24.520272>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<57.687216,0.000000,24.520272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,24.520272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,24.888888>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<57.687216,0.000000,24.888888> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,25.268688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.564344,0.000000,25.268688>}
box{<0,0,-0.038100><0.614356,0.036000,0.038100> rotate<0,0.000000,0> translate<57.564344,0.000000,25.268688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.564344,0.000000,25.268688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.441472,0.000000,25.391559>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<57.441472,0.000000,25.391559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,25.145819>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,25.391559>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<57.810088,0.000000,25.391559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,25.767631>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,26.013375>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<58.178700,0.000000,26.013375> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,26.013375>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,26.136247>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<58.055831,0.000000,26.136247> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,26.136247>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,26.136247>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<57.810088,0.000000,26.136247> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,26.136247>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,26.013375>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.687216,0.000000,26.013375> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,26.013375>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,25.767631>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.687216,0.000000,25.767631> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,25.767631>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,25.644763>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<57.687216,0.000000,25.767631> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,25.644763>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,25.644763>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<57.810088,0.000000,25.644763> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,25.644763>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,25.767631>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.055831,0.000000,25.644763> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,26.393178>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,26.393178>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.687216,0.000000,26.393178> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,26.393178>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,26.638919>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<57.687216,0.000000,26.638919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,26.638919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,26.761791>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<57.687216,0.000000,26.761791> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,27.016856>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,27.016856>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.687216,0.000000,27.016856> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,27.016856>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,27.139725>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<57.687216,0.000000,27.139725> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,27.139725>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,27.262597>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.687216,0.000000,27.139725> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,27.262597>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,27.262597>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<57.810088,0.000000,27.262597> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,27.262597>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,27.385469>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<57.687216,0.000000,27.385469> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,27.385469>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,27.508341>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.687216,0.000000,27.385469> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,27.508341>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,27.508341>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<57.810088,0.000000,27.508341> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,28.133884>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,27.888141>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.178700,0.000000,27.888141> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,27.888141>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,27.765272>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.055831,0.000000,27.765272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.055831,0.000000,27.765272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,27.765272>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<57.810088,0.000000,27.765272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,27.765272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,27.888141>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<57.687216,0.000000,27.888141> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,27.888141>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,28.133884>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<57.687216,0.000000,28.133884> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,28.133884>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,28.256756>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.687216,0.000000,28.133884> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.810088,0.000000,28.256756>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,28.256756>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<57.810088,0.000000,28.256756> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,28.256756>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,27.765272>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.932959,0.000000,27.765272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.178700,0.000000,28.513687>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,28.513687>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.687216,0.000000,28.513687> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.932959,0.000000,28.513687>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,28.759428>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<57.687216,0.000000,28.759428> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,28.759428>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.687216,0.000000,28.882300>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<57.687216,0.000000,28.882300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.660672,0.000000,23.267325>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.660672,0.000000,22.775841>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.660672,0.000000,22.775841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.660672,0.000000,22.775841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.029288,0.000000,22.775841>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<58.660672,0.000000,22.775841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.029288,0.000000,22.775841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,23.021581>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,63.430471,0> translate<58.906416,0.000000,23.021581> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,23.021581>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,23.144453>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<58.906416,0.000000,23.144453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,23.144453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.029288,0.000000,23.267325>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.906416,0.000000,23.144453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.029288,0.000000,23.267325>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.275031,0.000000,23.267325>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<59.029288,0.000000,23.267325> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.275031,0.000000,23.267325>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,23.144453>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<59.275031,0.000000,23.267325> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,23.144453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,22.898709>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<59.397900,0.000000,22.898709> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,22.898709>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.275031,0.000000,22.775841>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.275031,0.000000,22.775841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,23.524256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,23.524256>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<58.906416,0.000000,23.524256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,23.524256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.660672,0.000000,23.769997>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<58.660672,0.000000,23.769997> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.660672,0.000000,23.769997>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,24.015741>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.660672,0.000000,23.769997> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,24.015741>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,24.015741>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<58.906416,0.000000,24.015741> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.029288,0.000000,23.524256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.029288,0.000000,24.015741>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<59.029288,0.000000,24.015741> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,25.021088>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,25.021088>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<58.906416,0.000000,25.021088> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,25.021088>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,25.143956>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<58.906416,0.000000,25.143956> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,25.143956>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.029288,0.000000,25.266828>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.906416,0.000000,25.143956> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.029288,0.000000,25.266828>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,25.266828>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<59.029288,0.000000,25.266828> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.029288,0.000000,25.266828>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,25.389700>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<58.906416,0.000000,25.389700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,25.389700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.029288,0.000000,25.512572>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.906416,0.000000,25.389700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.029288,0.000000,25.512572>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,25.512572>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<59.029288,0.000000,25.512572> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,25.892372>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,26.138116>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<58.906416,0.000000,26.138116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,26.138116>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.029288,0.000000,26.260988>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.906416,0.000000,26.138116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.029288,0.000000,26.260988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,26.260988>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<59.029288,0.000000,26.260988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,26.260988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,25.892372>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<59.397900,0.000000,25.892372> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,25.892372>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.275031,0.000000,25.769503>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.275031,0.000000,25.769503> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.275031,0.000000,25.769503>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.152159,0.000000,25.892372>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<59.152159,0.000000,25.892372> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.152159,0.000000,25.892372>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.152159,0.000000,26.260988>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<59.152159,0.000000,26.260988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,26.517919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,27.009403>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.906416,0.000000,26.517919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.397900,0.000000,26.517919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.906416,0.000000,27.009403>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<58.906416,0.000000,27.009403> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.030100,0.000000,7.785425>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.216606,0.000000,7.785425>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,0.000000,0> translate<62.216606,0.000000,7.785425> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.216606,0.000000,7.514263>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.216606,0.000000,8.056591>}
box{<0,0,-0.101600><0.542328,0.036000,0.101600> rotate<0,90.000000,0> translate<62.216606,0.000000,8.056591> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.030100,0.000000,8.720944>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.216606,0.000000,8.720944>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,0.000000,0> translate<62.216606,0.000000,8.720944> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.216606,0.000000,8.449781>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.216606,0.000000,8.992109>}
box{<0,0,-0.101600><0.542328,0.036000,0.101600> rotate<0,90.000000,0> translate<62.216606,0.000000,8.992109> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.125900,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.125900,-1.536000,39.586703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<42.125900,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.125900,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.812366,-1.536000,39.273169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<41.812366,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.812366,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.498831,-1.536000,39.586703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<41.498831,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.498831,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.498831,-1.536000,38.646100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.498831,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.190381,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.190381,-1.536000,38.802866>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.190381,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.190381,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.033616,-1.536000,38.646100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<41.033616,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.033616,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.563313,-1.536000,38.646100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<40.563313,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.563313,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.563313,-1.536000,38.489334>}
box{<0,0,-0.038100><0.783834,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.563313,-1.536000,38.489334> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.563313,-1.536000,38.489334>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.720081,-1.536000,38.332566>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<40.563313,-1.536000,38.489334> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.720081,-1.536000,38.332566>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.876847,-1.536000,38.332566>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<40.720081,-1.536000,38.332566> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.627794,-1.536000,39.429934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.784562,-1.536000,39.586703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.627794,-1.536000,39.429934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.784562,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.098097,-1.536000,39.586703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<39.784562,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.098097,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.254863,-1.536000,39.429934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<40.098097,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.254863,-1.536000,39.429934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.254863,-1.536000,39.273169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.254863,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.254863,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.098097,-1.536000,39.116400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<40.098097,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.098097,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.784562,-1.536000,39.116400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<39.784562,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.784562,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.627794,-1.536000,38.959634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<39.627794,-1.536000,38.959634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.627794,-1.536000,38.959634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.627794,-1.536000,38.802866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.627794,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.627794,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.784562,-1.536000,38.646100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<39.627794,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.784562,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.098097,-1.536000,38.646100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<39.784562,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.098097,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.254863,-1.536000,38.802866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.098097,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.849044,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.162578,-1.536000,38.646100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<38.849044,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.162578,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.319344,-1.536000,38.802866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.162578,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.319344,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.319344,-1.536000,39.116400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<39.319344,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.319344,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.162578,-1.536000,39.273169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<39.162578,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.162578,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.849044,-1.536000,39.273169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<38.849044,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.849044,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.692275,-1.536000,39.116400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.692275,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.692275,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.692275,-1.536000,38.959634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.692275,-1.536000,38.959634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.692275,-1.536000,38.959634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.319344,-1.536000,38.959634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<38.692275,-1.536000,38.959634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.383825,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.383825,-1.536000,39.273169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<38.383825,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.383825,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.913525,-1.536000,39.273169>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<37.913525,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.913525,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.756756,-1.536000,39.116400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.756756,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.756756,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.756756,-1.536000,38.646100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.756756,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.448306,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.978006,-1.536000,38.646100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<36.978006,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.978006,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.821238,-1.536000,38.802866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<36.821238,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.821238,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.978006,-1.536000,38.959634>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.821238,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.978006,-1.536000,38.959634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.291541,-1.536000,38.959634>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<36.978006,-1.536000,38.959634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.291541,-1.536000,38.959634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.448306,-1.536000,39.116400>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.291541,-1.536000,38.959634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.448306,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.291541,-1.536000,39.273169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<37.291541,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.291541,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.821238,-1.536000,39.273169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<36.821238,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.356022,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.042488,-1.536000,38.646100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<36.042488,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.042488,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.885719,-1.536000,38.802866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<35.885719,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.885719,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.885719,-1.536000,39.116400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<35.885719,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.885719,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.042488,-1.536000,39.273169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.885719,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.042488,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.356022,-1.536000,39.273169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<36.042488,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.356022,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.512788,-1.536000,39.116400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<36.356022,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.512788,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.512788,-1.536000,38.802866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.512788,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.512788,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.356022,-1.536000,38.646100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.356022,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.577269,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.577269,-1.536000,39.273169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<35.577269,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.577269,-1.536000,38.959634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.263734,-1.536000,39.273169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<35.263734,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.263734,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.106969,-1.536000,39.273169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<35.106969,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.797672,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.327372,-1.536000,38.646100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<34.327372,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.327372,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.170603,-1.536000,38.802866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<34.170603,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.170603,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.327372,-1.536000,38.959634>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.170603,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.327372,-1.536000,38.959634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.640906,-1.536000,38.959634>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<34.327372,-1.536000,38.959634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.640906,-1.536000,38.959634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.797672,-1.536000,39.116400>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.640906,-1.536000,38.959634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.797672,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.640906,-1.536000,39.273169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<34.640906,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.640906,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.170603,-1.536000,39.273169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<34.170603,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.926634,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.926634,-1.536000,39.586703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<32.926634,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.926634,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.456334,-1.536000,39.586703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.456334,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.456334,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.299566,-1.536000,39.429934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.299566,-1.536000,39.429934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.299566,-1.536000,39.429934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.299566,-1.536000,39.116400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.299566,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.299566,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.456334,-1.536000,38.959634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<32.299566,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.456334,-1.536000,38.959634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.926634,-1.536000,38.959634>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.456334,-1.536000,38.959634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.613100,-1.536000,38.959634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.299566,-1.536000,38.646100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.299566,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.991116,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.991116,-1.536000,39.586703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<31.991116,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.991116,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.364047,-1.536000,39.586703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<31.364047,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.991116,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.677581,-1.536000,39.116400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<31.677581,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.055597,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.055597,-1.536000,39.586703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<31.055597,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.055597,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.742063,-1.536000,39.273169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.742063,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.742063,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.428528,-1.536000,39.586703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<30.428528,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.428528,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.428528,-1.536000,38.646100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.428528,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.493009,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.806544,-1.536000,39.429934>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,26.563526,0> translate<29.493009,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.806544,-1.536000,39.429934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.120078,-1.536000,39.116400>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<29.806544,-1.536000,39.429934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.120078,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.120078,-1.536000,38.802866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.120078,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.120078,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.963313,-1.536000,38.646100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.963313,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.963313,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.649778,-1.536000,38.646100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<29.649778,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.649778,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.493009,-1.536000,38.802866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<29.493009,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.493009,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.493009,-1.536000,38.959634>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,90.000000,0> translate<29.493009,-1.536000,38.959634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.493009,-1.536000,38.959634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.649778,-1.536000,39.116400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<29.493009,-1.536000,38.959634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.649778,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.120078,-1.536000,39.116400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<29.649778,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.184559,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.027794,-1.536000,38.646100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.027794,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.027794,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.714259,-1.536000,38.646100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<28.714259,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.714259,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.557491,-1.536000,38.802866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<28.557491,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.557491,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.557491,-1.536000,39.429934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<28.557491,-1.536000,39.429934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.557491,-1.536000,39.429934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.714259,-1.536000,39.586703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.557491,-1.536000,39.429934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.714259,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.027794,-1.536000,39.586703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<28.714259,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.027794,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.184559,-1.536000,39.429934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<29.027794,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.184559,-1.536000,39.429934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.184559,-1.536000,39.273169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.184559,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.184559,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.027794,-1.536000,39.116400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<29.027794,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.027794,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.557491,-1.536000,39.116400>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<28.557491,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.313522,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.313522,-1.536000,39.586703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<27.313522,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.313522,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.686453,-1.536000,38.646100>}
box{<0,0,-0.038100><1.130464,0.036000,0.038100> rotate<0,-56.306216,0> translate<26.686453,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.686453,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.686453,-1.536000,39.586703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<26.686453,-1.536000,39.586703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.221238,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.907703,-1.536000,38.646100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<25.907703,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.907703,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.750934,-1.536000,38.802866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<25.750934,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.750934,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.750934,-1.536000,39.116400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<25.750934,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.750934,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.907703,-1.536000,39.273169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<25.750934,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.907703,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.221238,-1.536000,39.273169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<25.907703,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.221238,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.378003,-1.536000,39.116400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<26.221238,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.378003,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.378003,-1.536000,38.802866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.378003,-1.536000,38.802866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.378003,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.221238,-1.536000,38.646100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.221238,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.815416,-1.536000,39.586703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.815416,-1.536000,38.646100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.815416,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.815416,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.285719,-1.536000,38.646100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<24.815416,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.285719,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.442484,-1.536000,38.802866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<25.285719,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.442484,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.442484,-1.536000,39.116400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<25.442484,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.442484,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.285719,-1.536000,39.273169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<25.285719,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.285719,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.815416,-1.536000,39.273169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<24.815416,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.036666,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.350200,-1.536000,38.646100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<24.036666,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.350200,-1.536000,38.646100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.506966,-1.536000,38.802866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.350200,-1.536000,38.646100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.506966,-1.536000,38.802866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.506966,-1.536000,39.116400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<24.506966,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.506966,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.350200,-1.536000,39.273169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<24.350200,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.350200,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.036666,-1.536000,39.273169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<24.036666,-1.536000,39.273169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.036666,-1.536000,39.273169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.879897,-1.536000,39.116400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<23.879897,-1.536000,39.116400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.879897,-1.536000,39.116400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.879897,-1.536000,38.959634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.879897,-1.536000,38.959634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.879897,-1.536000,38.959634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.506966,-1.536000,38.959634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<23.879897,-1.536000,38.959634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,30.450784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<1.044619,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.290359,0.000000,30.696528>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<1.044619,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.290359,0.000000,30.696528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,30.450784>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<1.290359,0.000000,30.696528> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,29.959300>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.536103,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,30.327913>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<1.044619,0.000000,30.327913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.793034,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.793034,0.000000,30.450784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<1.793034,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.793034,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.161647,0.000000,30.450784>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<1.793034,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.161647,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,30.327913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.161647,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,29.959300>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.284519,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,30.573656>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,30.082169>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.664319,0.000000,30.082169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,30.082169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.787191,0.000000,29.959300>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<2.664319,0.000000,30.082169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.787191,0.000000,30.450784>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<2.541450,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.409006,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.163263,0.000000,29.959300>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<3.163263,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.163263,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.040394,0.000000,30.082169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<3.040394,0.000000,30.082169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.040394,0.000000,30.082169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.040394,0.000000,30.327913>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<3.040394,0.000000,30.327913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.040394,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.163263,0.000000,30.450784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<3.040394,0.000000,30.327913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.163263,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.409006,0.000000,30.450784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<3.163263,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.409006,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.531878,0.000000,30.327913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<3.409006,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.531878,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.531878,0.000000,30.205041>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.531878,0.000000,30.205041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.531878,0.000000,30.205041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.040394,0.000000,30.205041>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<3.040394,0.000000,30.205041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.788809,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.788809,0.000000,30.450784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<3.788809,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.788809,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.157422,0.000000,30.450784>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<3.788809,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.157422,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.280294,0.000000,30.327913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<4.157422,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.280294,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.280294,0.000000,29.959300>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.280294,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.537225,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.537225,0.000000,30.450784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<4.537225,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.537225,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.905838,0.000000,30.450784>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<4.537225,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.905838,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.028709,0.000000,30.327913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<4.905838,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.028709,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.028709,0.000000,29.959300>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.028709,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.408509,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.654253,0.000000,30.450784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<5.408509,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.654253,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.777125,0.000000,30.327913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<5.654253,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.777125,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.777125,0.000000,29.959300>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.777125,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.777125,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.408509,0.000000,29.959300>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<5.408509,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.408509,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.285641,0.000000,30.082169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<5.285641,0.000000,30.082169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.285641,0.000000,30.082169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.408509,0.000000,30.205041>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<5.285641,0.000000,30.082169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.408509,0.000000,30.205041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.777125,0.000000,30.205041>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<5.408509,0.000000,30.205041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.782472,0.000000,30.696528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.782472,0.000000,29.959300>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.782472,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.782472,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.273956,0.000000,29.959300>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<6.782472,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.899500,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.653756,0.000000,29.959300>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<7.653756,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.653756,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.530888,0.000000,30.082169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<7.530888,0.000000,30.082169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.530888,0.000000,30.082169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.530888,0.000000,30.327913>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<7.530888,0.000000,30.327913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.530888,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.653756,0.000000,30.450784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<7.530888,0.000000,30.327913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.653756,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.899500,0.000000,30.450784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<7.653756,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.899500,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.022372,0.000000,30.327913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<7.899500,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.022372,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.022372,0.000000,30.205041>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.022372,0.000000,30.205041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.022372,0.000000,30.205041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.530888,0.000000,30.205041>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<7.530888,0.000000,30.205041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.279303,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.279303,0.000000,30.450784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<8.279303,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.279303,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.647916,0.000000,30.450784>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<8.279303,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.647916,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.770788,0.000000,30.327913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<8.647916,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.770788,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.770788,0.000000,29.959300>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.770788,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.273459,0.000000,29.713559>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.396331,0.000000,29.713559>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<9.273459,0.000000,29.713559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.396331,0.000000,29.713559>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.519203,0.000000,29.836431>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.396331,0.000000,29.713559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.519203,0.000000,29.836431>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.519203,0.000000,30.450784>}
box{<0,0,-0.038100><0.614353,0.036000,0.038100> rotate<0,90.000000,0> translate<9.519203,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.519203,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.150588,0.000000,30.450784>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<9.150588,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.150588,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.027719,0.000000,30.327913>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<9.027719,0.000000,30.327913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.027719,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.027719,0.000000,30.082169>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.027719,0.000000,30.082169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.027719,0.000000,30.082169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.150588,0.000000,29.959300>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<9.027719,0.000000,30.082169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.150588,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.519203,0.000000,29.959300>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<9.150588,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.899003,0.000000,30.573656>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.899003,0.000000,30.082169>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.899003,0.000000,30.082169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.899003,0.000000,30.082169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.021875,0.000000,29.959300>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<9.899003,0.000000,30.082169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.776134,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.021875,0.000000,30.450784>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<9.776134,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.275078,0.000000,30.696528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.275078,0.000000,29.959300>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.275078,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.275078,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.397947,0.000000,30.450784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<10.275078,0.000000,30.327913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.397947,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.643691,0.000000,30.450784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<10.397947,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.643691,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.766563,0.000000,30.327913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<10.643691,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.766563,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.766563,0.000000,29.959300>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.766563,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.023494,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.146363,0.000000,30.450784>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<11.023494,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.146363,0.000000,30.450784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.146363,0.000000,30.327913>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.146363,0.000000,30.327913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.146363,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.023494,0.000000,30.327913>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<11.023494,0.000000,30.327913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.023494,0.000000,30.327913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.023494,0.000000,30.450784>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<11.023494,0.000000,30.450784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.023494,0.000000,30.082169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.146363,0.000000,30.082169>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<11.023494,0.000000,30.082169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.146363,0.000000,30.082169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.146363,0.000000,29.959300>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.146363,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.146363,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.023494,0.000000,29.959300>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<11.023494,0.000000,29.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.023494,0.000000,29.959300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.023494,0.000000,30.082169>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<11.023494,0.000000,30.082169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,29.477328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<1.413231,0.000000,29.477328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,29.477328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,29.108713>}
box{<0,0,-0.038100><0.521299,0.036000,0.038100> rotate<0,-44.997273,0> translate<1.044619,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,29.108713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<1.044619,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.793034,0.000000,29.354456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.915903,0.000000,29.477328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<1.793034,0.000000,29.354456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.915903,0.000000,29.477328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.161647,0.000000,29.477328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<1.915903,0.000000,29.477328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.161647,0.000000,29.477328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,29.354456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.161647,0.000000,29.477328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,29.354456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,29.231584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.284519,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.161647,0.000000,29.108713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.161647,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.161647,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.038775,0.000000,29.108713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<2.038775,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.161647,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,28.985841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.161647,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,28.985841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,28.862969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.284519,0.000000,28.862969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,28.862969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.161647,0.000000,28.740100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<2.161647,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.161647,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.915903,0.000000,28.740100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<1.915903,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.915903,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.793034,0.000000,28.862969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<1.793034,0.000000,28.862969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,29.354456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,29.477328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<2.541450,0.000000,29.354456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,29.477328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,29.477328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<2.664319,0.000000,29.477328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,29.477328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,29.354456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.910062,0.000000,29.477328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,29.354456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,29.231584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.032934,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,29.108713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.910062,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.787191,0.000000,29.108713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<2.787191,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,28.985841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.910062,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,28.985841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,28.862969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.032934,0.000000,28.862969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,28.862969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,28.740100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<2.910062,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,28.740100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<2.664319,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,28.862969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<2.541450,0.000000,28.862969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.038281,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.038281,0.000000,29.477328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<4.038281,0.000000,29.477328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.038281,0.000000,29.477328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.284022,0.000000,29.231584>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<4.038281,0.000000,29.477328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.284022,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.529766,0.000000,29.477328>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.284022,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.529766,0.000000,29.477328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.529766,0.000000,28.740100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.529766,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.786697,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.786697,0.000000,29.477328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<4.786697,0.000000,29.477328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.786697,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.278181,0.000000,29.108713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<4.786697,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.278181,0.000000,29.477328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.278181,0.000000,28.740100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.278181,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.535113,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.026597,0.000000,29.231584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<5.535113,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.026597,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.535113,0.000000,28.740100>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.535113,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.535113,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.026597,0.000000,28.740100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<5.535113,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.031944,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.523428,0.000000,29.108713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<7.031944,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.780359,0.000000,29.477328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.271844,0.000000,29.108713>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,36.867639,0> translate<7.780359,0.000000,29.477328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.271844,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.780359,0.000000,28.740100>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,-36.867406,0> translate<7.780359,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.277191,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.522931,0.000000,29.477328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<9.277191,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.522931,0.000000,29.477328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.522931,0.000000,28.740100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.522931,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.277191,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.768675,0.000000,28.740100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<9.277191,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,29.477328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.271347,0.000000,29.354456>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,-26.563298,0> translate<10.271347,0.000000,29.354456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.271347,0.000000,29.354456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,29.108713>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<10.025606,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,28.862969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.025606,0.000000,28.862969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,28.862969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.148475,0.000000,28.740100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<10.025606,0.000000,28.862969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.148475,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.394219,0.000000,28.740100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<10.148475,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.394219,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,28.862969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<10.394219,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,28.862969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,28.985841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<10.517091,0.000000,28.985841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,28.985841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.394219,0.000000,29.108713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<10.394219,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.394219,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,29.108713>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<10.025606,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,29.477328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,29.477328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<10.774022,0.000000,29.477328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,29.477328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,29.108713>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.774022,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.019763,0.000000,29.231584>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,-26.563589,0> translate<10.774022,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.019763,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.142634,0.000000,29.231584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<11.019763,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.142634,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,29.108713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<11.142634,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,28.862969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.265506,0.000000,28.862969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,28.862969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.142634,0.000000,28.740100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<11.142634,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.142634,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.896891,0.000000,28.740100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<10.896891,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.896891,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,28.862969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<10.774022,0.000000,28.862969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.270853,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.270853,0.000000,29.231584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<12.270853,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.270853,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.393722,0.000000,29.231584>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<12.270853,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.393722,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.516594,0.000000,29.108713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<12.393722,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.516594,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.516594,0.000000,28.740100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.516594,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.516594,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.639466,0.000000,29.231584>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.516594,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.639466,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.762338,0.000000,29.108713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<12.639466,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.762338,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.762338,0.000000,28.740100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.762338,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.019269,0.000000,28.740100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.019269,0.000000,29.231584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<13.019269,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.019269,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.142138,0.000000,29.231584>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<13.019269,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.142138,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.265009,0.000000,29.108713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<13.142138,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.265009,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.265009,0.000000,28.740100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.265009,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.265009,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.387881,0.000000,29.231584>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.265009,0.000000,29.108713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.387881,0.000000,29.231584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.510753,0.000000,29.108713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<13.387881,0.000000,29.231584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.510753,0.000000,29.108713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.510753,0.000000,28.740100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.510753,0.000000,28.740100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,28.135256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.167488,0.000000,28.258128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<1.044619,0.000000,28.135256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.167488,0.000000,28.258128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,28.258128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<1.167488,0.000000,28.258128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,28.258128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,28.135256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<1.413231,0.000000,28.258128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,28.135256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,28.012384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.536103,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,27.889513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<1.413231,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,27.766641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<1.413231,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,27.766641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,27.643769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.536103,0.000000,27.643769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,27.643769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,27.520900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<1.413231,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.167488,0.000000,27.520900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<1.167488,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.167488,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,27.643769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<1.044619,0.000000,27.643769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,27.643769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,27.766641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<1.044619,0.000000,27.766641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,27.766641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.167488,0.000000,27.889513>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<1.044619,0.000000,27.766641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.167488,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,28.012384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<1.044619,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,28.135256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<1.044619,0.000000,28.135256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.167488,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,27.889513>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<1.167488,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,28.258128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.038775,0.000000,28.135256>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,-26.563298,0> translate<2.038775,0.000000,28.135256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.038775,0.000000,28.135256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.793034,0.000000,27.889513>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<1.793034,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.793034,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.793034,0.000000,27.643769>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.793034,0.000000,27.643769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.793034,0.000000,27.643769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.915903,0.000000,27.520900>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<1.793034,0.000000,27.643769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.915903,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.161647,0.000000,27.520900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<1.915903,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.161647,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,27.643769>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<2.161647,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,27.643769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,27.766641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<2.284519,0.000000,27.766641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,27.766641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.161647,0.000000,27.889513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.161647,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.161647,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.793034,0.000000,27.889513>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<1.793034,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,28.135256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,28.258128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<2.541450,0.000000,28.135256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,28.258128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,28.258128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<2.664319,0.000000,28.258128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,28.258128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,28.135256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.910062,0.000000,28.258128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,28.135256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,28.012384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.032934,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,27.889513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.910062,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,27.766641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.910062,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,27.766641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,27.643769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.032934,0.000000,27.643769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,27.643769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,27.520900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<2.910062,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,27.520900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<2.664319,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,27.643769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<2.541450,0.000000,27.643769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,27.643769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,27.766641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<2.541450,0.000000,27.766641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,27.766641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,27.889513>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<2.541450,0.000000,27.766641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,28.012384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<2.541450,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,28.135256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<2.541450,0.000000,28.135256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,27.889513>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<2.664319,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.038281,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.038281,0.000000,28.258128>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<4.038281,0.000000,28.258128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.038281,0.000000,28.258128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.284022,0.000000,28.012384>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<4.038281,0.000000,28.258128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.284022,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.529766,0.000000,28.258128>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.284022,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.529766,0.000000,28.258128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.529766,0.000000,27.520900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.529766,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.786697,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.786697,0.000000,28.258128>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<4.786697,0.000000,28.258128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.786697,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.278181,0.000000,27.889513>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<4.786697,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.278181,0.000000,28.258128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.278181,0.000000,27.520900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.278181,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.535113,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.026597,0.000000,28.012384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<5.535113,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.026597,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.535113,0.000000,27.520900>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.535113,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.535113,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.026597,0.000000,27.520900>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<5.535113,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.031944,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.523428,0.000000,27.889513>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<7.031944,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.780359,0.000000,28.258128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.271844,0.000000,27.889513>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,36.867639,0> translate<7.780359,0.000000,28.258128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.271844,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.780359,0.000000,27.520900>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,-36.867406,0> translate<7.780359,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,28.135256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.148475,0.000000,28.258128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<10.025606,0.000000,28.135256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.148475,0.000000,28.258128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.394219,0.000000,28.258128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<10.148475,0.000000,28.258128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.394219,0.000000,28.258128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,28.135256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<10.394219,0.000000,28.258128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,28.135256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,28.012384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.517091,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.394219,0.000000,27.889513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.394219,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.394219,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,27.766641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<10.394219,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,27.766641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,27.643769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.517091,0.000000,27.643769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,27.643769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.394219,0.000000,27.520900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<10.394219,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.394219,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.148475,0.000000,27.520900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<10.148475,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.148475,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,27.643769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<10.025606,0.000000,27.643769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,27.643769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,27.766641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<10.025606,0.000000,27.766641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,27.766641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.148475,0.000000,27.889513>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<10.025606,0.000000,27.766641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.148475,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,28.012384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<10.025606,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,28.135256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<10.025606,0.000000,28.135256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.148475,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.394219,0.000000,27.889513>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<10.148475,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,27.520900>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<10.774022,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,28.012384>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.774022,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,28.135256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<11.265506,0.000000,28.135256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,28.135256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.142634,0.000000,28.258128>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<11.142634,0.000000,28.258128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.142634,0.000000,28.258128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.896891,0.000000,28.258128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<10.896891,0.000000,28.258128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.896891,0.000000,28.258128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,28.135256>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<10.774022,0.000000,28.135256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.270853,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.270853,0.000000,28.012384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<12.270853,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.270853,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.393722,0.000000,28.012384>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<12.270853,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.393722,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.516594,0.000000,27.889513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<12.393722,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.516594,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.516594,0.000000,27.520900>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.516594,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.516594,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.639466,0.000000,28.012384>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.516594,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.639466,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.762338,0.000000,27.889513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<12.639466,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.762338,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.762338,0.000000,27.520900>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.762338,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.019269,0.000000,27.520900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.019269,0.000000,28.012384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<13.019269,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.019269,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.142138,0.000000,28.012384>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<13.019269,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.142138,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.265009,0.000000,27.889513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<13.142138,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.265009,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.265009,0.000000,27.520900>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.265009,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.265009,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.387881,0.000000,28.012384>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.265009,0.000000,27.889513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.387881,0.000000,28.012384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.510753,0.000000,27.889513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<13.387881,0.000000,28.012384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.510753,0.000000,27.889513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.510753,0.000000,27.520900>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.510753,0.000000,27.520900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,26.424569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.167488,0.000000,26.301700>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<1.044619,0.000000,26.424569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.167488,0.000000,26.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,26.301700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<1.167488,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,26.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,26.424569>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<1.413231,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,26.424569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,26.916056>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<1.536103,0.000000,26.916056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,26.916056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,27.038928>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<1.413231,0.000000,27.038928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.413231,0.000000,27.038928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.167488,0.000000,27.038928>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<1.167488,0.000000,27.038928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.167488,0.000000,27.038928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,26.916056>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<1.044619,0.000000,26.916056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,26.916056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,26.793184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.044619,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.044619,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.167488,0.000000,26.670313>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<1.044619,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.167488,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.536103,0.000000,26.670313>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<1.167488,0.000000,26.670313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.793034,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.038775,0.000000,27.038928>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<1.793034,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.038775,0.000000,27.038928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.038775,0.000000,26.301700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.038775,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.793034,0.000000,26.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.284519,0.000000,26.301700>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<1.793034,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,27.038928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,27.038928>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<2.541450,0.000000,27.038928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,27.038928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,26.670313>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.541450,0.000000,26.670313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.787191,0.000000,26.793184>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,-26.563589,0> translate<2.541450,0.000000,26.670313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.787191,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,26.793184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<2.787191,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,26.670313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.910062,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,26.424569>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.032934,0.000000,26.424569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.032934,0.000000,26.424569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,26.301700>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<2.910062,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.910062,0.000000,26.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,26.301700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<2.664319,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.664319,0.000000,26.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.541450,0.000000,26.424569>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<2.541450,0.000000,26.424569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.038281,0.000000,26.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.038281,0.000000,27.038928>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<4.038281,0.000000,27.038928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.038281,0.000000,27.038928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.284022,0.000000,26.793184>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<4.038281,0.000000,27.038928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.284022,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.529766,0.000000,27.038928>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.284022,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.529766,0.000000,27.038928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.529766,0.000000,26.301700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.529766,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.786697,0.000000,26.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.786697,0.000000,27.038928>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<4.786697,0.000000,27.038928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.786697,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.278181,0.000000,26.670313>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<4.786697,0.000000,26.670313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.278181,0.000000,27.038928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.278181,0.000000,26.301700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.278181,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.535113,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.026597,0.000000,26.793184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<5.535113,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.026597,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.535113,0.000000,26.301700>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.535113,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.535113,0.000000,26.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.026597,0.000000,26.301700>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<5.535113,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.031944,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.523428,0.000000,26.670313>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<7.031944,0.000000,26.670313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.780359,0.000000,27.038928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.271844,0.000000,26.670313>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,36.867639,0> translate<7.780359,0.000000,27.038928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.271844,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.780359,0.000000,26.301700>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,-36.867406,0> translate<7.780359,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,27.038928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,27.038928>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<10.025606,0.000000,27.038928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,27.038928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,26.916056>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.517091,0.000000,26.916056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.517091,0.000000,26.916056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,26.424569>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,-44.997212,0> translate<10.025606,0.000000,26.424569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,26.424569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.025606,0.000000,26.301700>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.025606,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,26.916056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.896891,0.000000,27.038928>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<10.774022,0.000000,26.916056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.896891,0.000000,27.038928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.142634,0.000000,27.038928>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<10.896891,0.000000,27.038928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.142634,0.000000,27.038928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,26.916056>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<11.142634,0.000000,27.038928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,26.916056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,26.793184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.265506,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.142634,0.000000,26.670313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.142634,0.000000,26.670313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.142634,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,26.547441>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<11.142634,0.000000,26.670313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,26.547441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,26.424569>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.265506,0.000000,26.424569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.265506,0.000000,26.424569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.142634,0.000000,26.301700>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<11.142634,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.142634,0.000000,26.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.896891,0.000000,26.301700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<10.896891,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.896891,0.000000,26.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,26.424569>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<10.774022,0.000000,26.424569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,26.424569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,26.547441>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<10.774022,0.000000,26.547441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,26.547441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.896891,0.000000,26.670313>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<10.774022,0.000000,26.547441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.896891,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,26.793184>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<10.774022,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.774022,0.000000,26.916056>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<10.774022,0.000000,26.916056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.896891,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.142634,0.000000,26.670313>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<10.896891,0.000000,26.670313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.270853,0.000000,26.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.270853,0.000000,26.793184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<12.270853,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.270853,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.393722,0.000000,26.793184>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<12.270853,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.393722,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.516594,0.000000,26.670313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<12.393722,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.516594,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.516594,0.000000,26.301700>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.516594,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.516594,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.639466,0.000000,26.793184>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.516594,0.000000,26.670313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.639466,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.762338,0.000000,26.670313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<12.639466,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.762338,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.762338,0.000000,26.301700>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.762338,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.019269,0.000000,26.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.019269,0.000000,26.793184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<13.019269,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.019269,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.142138,0.000000,26.793184>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<13.019269,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.142138,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.265009,0.000000,26.670313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<13.142138,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.265009,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.265009,0.000000,26.301700>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.265009,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.265009,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.387881,0.000000,26.793184>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.265009,0.000000,26.670313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.387881,0.000000,26.793184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.510753,0.000000,26.670313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<13.387881,0.000000,26.793184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.510753,0.000000,26.670313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.510753,0.000000,26.301700>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.510753,0.000000,26.301700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.638800,0.000000,20.955497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.418397,0.000000,20.955497>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<5.638800,0.000000,20.955497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.028597,0.000000,21.345297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.028597,0.000000,20.565697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<6.028597,0.000000,20.565697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.977594,0.000000,20.955497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.757191,0.000000,20.955497>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<7.977594,0.000000,20.955497> }
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-0.000000,0> translate<60.407550,0.000000,9.861550>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-0.000000,0> translate<61.042550,0.000000,9.861550>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-0.000000,0> translate<61.677550,0.000000,9.861550>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-0.000000,0> translate<60.407550,0.000000,6.686550>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-0.000000,0> translate<61.042550,0.000000,6.686550>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-0.000000,0> translate<61.677550,0.000000,6.686550>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-90.000000,0> translate<61.042550,0.000000,8.274050>}
box{<-3.016250,0,-0.158750><3.016250,0.036000,0.158750> rotate<0,-270.000000,0> translate<63.519050,0.000000,8.299450>}
box{<-3.016250,0,-0.158750><3.016250,0.036000,0.158750> rotate<0,-270.000000,0> translate<59.772550,0.000000,8.299450>}
box{<-1.727200,0,-0.177800><1.727200,0.036000,0.177800> rotate<0,-180.000000,0> translate<61.645800,0.000000,5.461000>}
box{<-1.727200,0,-0.177800><1.727200,0.036000,0.177800> rotate<0,-180.000000,0> translate<61.645800,0.000000,11.125200>}
//BAT3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.293000,-1.536000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<48.768000,-1.536000,28.448000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<48.768000,-1.536000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<48.768000,-1.536000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.293000,-1.536000,38.100000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<48.768000,-1.536000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.293000,-1.536000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.293000,-1.536000,28.448000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,-90.000000,0> translate<58.293000,-1.536000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.572000,-1.536000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.912000,-1.536000,25.654000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.572000,-1.536000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.912000,-1.536000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.572000,-1.536000,40.894000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.572000,-1.536000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.716000,-1.536000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.191000,-1.536000,38.100000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.191000,-1.536000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.191000,-1.536000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.191000,-1.536000,28.448000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,-90.000000,0> translate<4.191000,-1.536000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.191000,-1.536000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.716000,-1.536000,28.448000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.191000,-1.536000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.402000,-1.536000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.606000,-1.536000,30.734000>}
box{<0,0,-0.203200><18.796000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.606000,-1.536000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.606000,-1.536000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.606000,-1.536000,32.689800>}
box{<0,0,-0.203200><1.955800,0.036000,0.203200> rotate<0,90.000000,0> translate<22.606000,-1.536000,32.689800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.606000,-1.536000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.606000,-1.536000,33.959800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<22.606000,-1.536000,33.959800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.606000,-1.536000,33.959800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.606000,-1.536000,35.814000>}
box{<0,0,-0.203200><1.854200,0.036000,0.203200> rotate<0,90.000000,0> translate<22.606000,-1.536000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.606000,-1.536000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.402000,-1.536000,35.814000>}
box{<0,0,-0.203200><18.796000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.606000,-1.536000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.402000,-1.536000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.402000,-1.536000,30.734000>}
box{<0,0,-0.203200><5.080000,0.036000,0.203200> rotate<0,-90.000000,0> translate<41.402000,-1.536000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.606000,-1.536000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.336000,-1.536000,32.689800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<21.336000,-1.536000,32.689800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.336000,-1.536000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.336000,-1.536000,33.959800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<21.336000,-1.536000,33.959800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.336000,-1.536000,33.959800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.606000,-1.536000,33.959800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<21.336000,-1.536000,33.959800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<40.259000,-1.536000,33.274000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<38.989000,-1.536000,33.274000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<38.989000,-1.536000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.273000,-1.536000,33.274000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.003000,-1.536000,33.274000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<24.003000,-1.536000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.638000,-1.536000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.638000,-1.536000,33.909000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<24.638000,-1.536000,33.909000> }
//BAT4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.191000,-1.536000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.716000,-1.536000,13.208000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.191000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.716000,-1.536000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.191000,-1.536000,3.556000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.191000,-1.536000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.191000,-1.536000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.191000,-1.536000,13.208000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,90.000000,0> translate<4.191000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.912000,-1.536000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.572000,-1.536000,16.002000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.572000,-1.536000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.572000,-1.536000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.912000,-1.536000,0.762000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.572000,-1.536000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<48.768000,-1.536000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.293000,-1.536000,3.556000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<48.768000,-1.536000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.293000,-1.536000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.293000,-1.536000,13.208000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,90.000000,0> translate<58.293000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.293000,-1.536000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<48.768000,-1.536000,13.208000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<48.768000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.082000,-1.536000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.878000,-1.536000,10.922000>}
box{<0,0,-0.203200><18.796000,0.036000,0.203200> rotate<0,0.000000,0> translate<21.082000,-1.536000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.878000,-1.536000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.878000,-1.536000,8.966200>}
box{<0,0,-0.203200><1.955800,0.036000,0.203200> rotate<0,-90.000000,0> translate<39.878000,-1.536000,8.966200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.878000,-1.536000,8.966200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.878000,-1.536000,7.696200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<39.878000,-1.536000,7.696200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.878000,-1.536000,7.696200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.878000,-1.536000,5.842000>}
box{<0,0,-0.203200><1.854200,0.036000,0.203200> rotate<0,-90.000000,0> translate<39.878000,-1.536000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.878000,-1.536000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.082000,-1.536000,5.842000>}
box{<0,0,-0.203200><18.796000,0.036000,0.203200> rotate<0,0.000000,0> translate<21.082000,-1.536000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.082000,-1.536000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<21.082000,-1.536000,10.922000>}
box{<0,0,-0.203200><5.080000,0.036000,0.203200> rotate<0,90.000000,0> translate<21.082000,-1.536000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.878000,-1.536000,8.966200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.148000,-1.536000,8.966200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<39.878000,-1.536000,8.966200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.148000,-1.536000,8.966200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.148000,-1.536000,7.696200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<41.148000,-1.536000,7.696200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.148000,-1.536000,7.696200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.878000,-1.536000,7.696200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<39.878000,-1.536000,7.696200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.225000,-1.536000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.495000,-1.536000,8.382000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.225000,-1.536000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.211000,-1.536000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<38.481000,-1.536000,8.382000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<37.211000,-1.536000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,7.747000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<37.846000,-1.536000,7.747000> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.936000,0.000000,17.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.936000,0.000000,16.464000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.936000,0.000000,16.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.736000,0.000000,17.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.736000,0.000000,16.464000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.736000,0.000000,16.464000> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.868000,0.000000,14.656000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.168000,0.000000,14.656000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<46.168000,0.000000,14.656000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.168000,0.000000,14.656000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.168000,0.000000,17.806000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.168000,0.000000,17.806000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.168000,0.000000,17.806000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.868000,0.000000,17.806000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<46.168000,0.000000,17.806000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.768000,0.000000,14.706000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.968000,0.000000,14.706000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.768000,0.000000,14.706000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.968000,0.000000,14.706000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.368000,0.000000,15.056000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<50.968000,0.000000,14.706000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.368000,0.000000,15.056000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.368000,0.000000,17.506000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,90.000000,0> translate<51.368000,0.000000,17.506000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.368000,0.000000,17.506000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.968000,0.000000,17.806000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<50.968000,0.000000,17.806000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.968000,0.000000,17.806000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.768000,0.000000,17.806000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.768000,0.000000,17.806000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.968000,0.000000,17.806000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.768000,0.000000,17.806000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.768000,0.000000,17.806000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.377000,0.000000,17.567000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.377000,0.000000,14.970000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.377000,0.000000,14.970000> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.576000,0.000000,12.538000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.176000,0.000000,12.538000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.576000,0.000000,12.538000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.576000,0.000000,11.338000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.176000,0.000000,11.338000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.576000,0.000000,11.338000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.532000,0.000000,34.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.132000,0.000000,34.128000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.532000,0.000000,34.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.532000,0.000000,32.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.132000,0.000000,32.928000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.532000,0.000000,32.928000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.478000,0.000000,38.176000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.178000,0.000000,38.176000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<53.478000,0.000000,38.176000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.178000,0.000000,38.176000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.178000,0.000000,35.026000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<55.178000,0.000000,35.026000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.178000,0.000000,35.026000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.478000,0.000000,35.026000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<53.478000,0.000000,35.026000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.578000,0.000000,38.126000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,38.126000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.378000,0.000000,38.126000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,38.126000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.978000,0.000000,37.776000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<49.978000,0.000000,37.776000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.978000,0.000000,37.776000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.978000,0.000000,35.326000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.978000,0.000000,35.326000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.978000,0.000000,35.326000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,35.026000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<49.978000,0.000000,35.326000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,35.026000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.578000,0.000000,35.026000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.378000,0.000000,35.026000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,35.026000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.578000,0.000000,35.026000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.378000,0.000000,35.026000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.969000,0.000000,35.265000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.969000,0.000000,37.862000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<51.969000,0.000000,37.862000> }
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.924000,0.000000,10.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.324000,0.000000,10.830000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.324000,0.000000,10.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.924000,0.000000,12.030000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.324000,0.000000,12.030000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.324000,0.000000,12.030000> }
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.266000,0.000000,20.142000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.966000,0.000000,20.142000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.266000,0.000000,20.142000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.966000,0.000000,20.142000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.966000,0.000000,16.992000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<9.966000,0.000000,16.992000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.966000,0.000000,16.992000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.266000,0.000000,16.992000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.266000,0.000000,16.992000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.366000,0.000000,20.092000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.166000,0.000000,20.092000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.166000,0.000000,20.092000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.166000,0.000000,20.092000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.766000,0.000000,19.742000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<4.766000,0.000000,19.742000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.766000,0.000000,19.742000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.766000,0.000000,17.292000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.766000,0.000000,17.292000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.766000,0.000000,17.292000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.166000,0.000000,16.992000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<4.766000,0.000000,17.292000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.166000,0.000000,16.992000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.366000,0.000000,16.992000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.166000,0.000000,16.992000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.166000,0.000000,16.992000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.366000,0.000000,16.992000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.166000,0.000000,16.992000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.757000,0.000000,17.231000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.757000,0.000000,19.828000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<6.757000,0.000000,19.828000> }
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.634000,0.000000,15.356000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.634000,0.000000,13.656000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<19.634000,0.000000,13.656000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.634000,0.000000,13.656000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.484000,0.000000,13.656000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.484000,0.000000,13.656000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.484000,0.000000,13.656000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.484000,0.000000,15.356000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.484000,0.000000,15.356000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.584000,0.000000,17.256000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.584000,0.000000,18.456000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<19.584000,0.000000,18.456000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.584000,0.000000,18.456000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.234000,0.000000,18.856000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,48.810853,0> translate<19.234000,0.000000,18.856000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.234000,0.000000,18.856000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.784000,0.000000,18.856000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.784000,0.000000,18.856000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.784000,0.000000,18.856000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.484000,0.000000,18.456000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-53.126596,0> translate<16.484000,0.000000,18.456000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.484000,0.000000,18.456000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.484000,0.000000,17.256000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<16.484000,0.000000,17.256000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.484000,0.000000,18.456000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.484000,0.000000,17.256000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<16.484000,0.000000,17.256000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.723000,0.000000,16.865000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.320000,0.000000,16.865000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.723000,0.000000,16.865000> }
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.924000,0.000000,13.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.324000,0.000000,13.116000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.324000,0.000000,13.116000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.924000,0.000000,14.316000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.324000,0.000000,14.316000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.324000,0.000000,14.316000> }
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.062000,0.000000,14.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.062000,0.000000,13.670000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.062000,0.000000,13.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.862000,0.000000,14.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.862000,0.000000,13.670000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.862000,0.000000,13.670000> }
//C12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.576000,0.000000,14.570000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.176000,0.000000,14.570000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.576000,0.000000,14.570000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.576000,0.000000,13.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.176000,0.000000,13.370000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.576000,0.000000,13.370000> }
//CT1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.922400,0.000000,29.489400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.922400,0.000000,12.700000>}
box{<0,0,-0.063500><16.789400,0.036000,0.063500> rotate<0,-90.000000,0> translate<64.922400,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.922400,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.200800,0.000000,12.700000>}
box{<0,0,-0.063500><7.721600,0.036000,0.063500> rotate<0,0.000000,0> translate<57.200800,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.200800,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.200800,0.000000,29.489400>}
box{<0,0,-0.063500><16.789400,0.036000,0.063500> rotate<0,90.000000,0> translate<57.200800,0.000000,29.489400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.200800,0.000000,29.489400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.922400,0.000000,29.489400>}
box{<0,0,-0.063500><7.721600,0.036000,0.063500> rotate<0,0.000000,0> translate<57.200800,0.000000,29.489400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.262000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.182000,0.000000,21.082000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<59.182000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.262000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.992000,0.000000,22.352000>}
box{<0,0,-0.063500><1.796051,0.036000,0.063500> rotate<0,44.997030,0> translate<62.992000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.992000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.992000,0.000000,19.812000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<62.992000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.992000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.262000,0.000000,21.082000>}
box{<0,0,-0.063500><1.796051,0.036000,0.063500> rotate<0,-44.997030,0> translate<62.992000,0.000000,19.812000> }
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.894000,0.000000,16.172000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.434000,0.000000,16.172000>}
box{<0,0,-0.101600><0.460000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.434000,0.000000,16.172000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.974000,0.000000,16.172000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.434000,0.000000,16.172000>}
box{<0,0,-0.101600><0.460000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.974000,0.000000,16.172000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.434000,0.000000,16.172000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.667800,0.000000,15.862000>}
box{<0,0,-0.101600><0.388281,0.036000,0.101600> rotate<0,52.973141,0> translate<43.434000,0.000000,16.172000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.408600,0.000000,16.156600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.215600,0.000000,15.862000>}
box{<0,0,-0.101600><0.352191,0.036000,0.101600> rotate<0,-56.766419,0> translate<43.215600,0.000000,15.862000> }
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.912000,0.000000,17.054000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.012000,0.000000,17.054000>}
box{<0,0,-0.063500><3.100000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.912000,0.000000,17.054000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.012000,0.000000,17.054000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.012000,0.000000,21.554000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.012000,0.000000,21.554000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.012000,0.000000,21.554000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.912000,0.000000,21.554000>}
box{<0,0,-0.063500><3.100000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.912000,0.000000,21.554000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.912000,0.000000,21.554000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.912000,0.000000,17.054000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.912000,0.000000,17.054000> }
difference{
cylinder{<12.462000,0,17.604000><12.462000,0.036000,17.604000>0.287100 translate<0,0.000000,0>}
cylinder{<12.462000,-0.1,17.604000><12.462000,0.135000,17.604000>0.160100 translate<0,0.000000,0>}}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<13.787000,0.000000,22.054000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<13.137000,0.000000,22.054000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<14.437000,0.000000,22.054000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<12.487000,0.000000,22.054000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<12.487000,0.000000,16.554000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<13.137000,0.000000,16.554000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<13.787000,0.000000,16.554000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<14.437000,0.000000,16.554000>}
//JP1 silk screen
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,5.334000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.082000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,5.334000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.717000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<22.987000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,3.429000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.622000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,2.794000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.987000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,2.794000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.717000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,3.429000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.082000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,5.334000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.637000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<17.907000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,3.429000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.542000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,2.794000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.907000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,5.334000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.542000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,5.334000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.177000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.447000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,3.429000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.082000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,2.794000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.447000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,2.794000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.177000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,3.429000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.542000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,3.429000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.002000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.002000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,2.794000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.002000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,2.794000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.637000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,5.334000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.257000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<25.527000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,3.429000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.162000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,2.794000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.527000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.622000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,2.794000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.622000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,2.794000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.257000,0.000000,2.794000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<22.352000,0.000000,4.064000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<19.812000,0.000000,4.064000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<17.272000,0.000000,4.064000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<24.892000,0.000000,4.064000>}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.193000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.828000,0.000000,28.067000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.193000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.828000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.193000,0.000000,29.972000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.193000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.193000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.828000,0.000000,30.607000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.193000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.828000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.193000,0.000000,32.512000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.193000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.193000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.828000,0.000000,33.147000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.193000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.828000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.193000,0.000000,35.052000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.193000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.193000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,27.432000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.383000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.748000,0.000000,28.067000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<15.748000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.748000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.748000,0.000000,29.337000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<15.748000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.748000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,29.972000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<15.748000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.748000,0.000000,30.607000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<15.748000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.748000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.748000,0.000000,31.877000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<15.748000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.748000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,32.512000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<15.748000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.748000,0.000000,33.147000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<15.748000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.748000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.748000,0.000000,34.417000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<15.748000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.748000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,35.052000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<15.748000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.193000,0.000000,29.972000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.383000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.193000,0.000000,32.512000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.383000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.193000,0.000000,35.052000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.383000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.828000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.828000,0.000000,34.417000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<20.828000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.828000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.828000,0.000000,31.877000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<20.828000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.828000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.828000,0.000000,29.337000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<20.828000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.163000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.163000,0.000000,28.067000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<21.163000,0.000000,28.067000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<19.558000,0.000000,28.702000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<17.018000,0.000000,28.702000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<17.018000,0.000000,31.242000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<19.558000,0.000000,31.242000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<17.018000,0.000000,33.782000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<19.558000,0.000000,33.782000>}
//JP4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,8.128000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.082000,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,8.128000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.717000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,7.493000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<22.987000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,6.223000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.622000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,5.588000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.987000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,5.588000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.717000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,6.223000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.082000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,8.128000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.637000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,7.493000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<17.907000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,6.223000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.542000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,5.588000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.907000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,8.128000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.542000,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,8.128000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.177000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,7.493000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.447000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,6.223000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.082000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,5.588000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.447000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,5.588000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.177000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,6.223000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.542000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,6.223000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.002000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,7.493000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.002000,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,5.588000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.002000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,5.588000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.637000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,8.128000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.257000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,7.493000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<25.527000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,6.223000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.162000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,5.588000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.527000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,7.493000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.622000,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,5.588000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.622000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,5.588000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.257000,0.000000,5.588000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<22.352000,0.000000,6.858000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<19.812000,0.000000,6.858000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<17.272000,0.000000,6.858000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<24.892000,0.000000,6.858000>}
//JP5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,8.128000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.164000,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,8.128000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,7.493000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.069000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,6.223000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.704000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,5.588000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.069000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,5.588000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,6.223000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.164000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,8.128000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.719000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,7.493000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<38.989000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,6.223000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.624000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,5.588000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.989000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,8.128000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.624000,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,8.128000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.259000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,7.493000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.529000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,6.223000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.164000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,5.588000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.529000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,5.588000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.259000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,6.223000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,6.223000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.084000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,7.493000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.084000,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,5.588000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<37.084000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,5.588000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.719000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,8.128000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.339000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,7.493000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<46.609000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,6.223000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.244000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,5.588000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.609000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,7.493000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.704000,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,5.588000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.704000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,5.588000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.339000,0.000000,5.588000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<43.434000,0.000000,6.858000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<40.894000,0.000000,6.858000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<38.354000,0.000000,6.858000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<45.974000,0.000000,6.858000>}
//JP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,5.334000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.164000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,5.334000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.069000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,3.429000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.704000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,2.794000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.069000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,2.794000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,3.429000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.164000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,5.334000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.719000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<38.989000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,3.429000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.624000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,2.794000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.989000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,5.334000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.624000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,5.334000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.259000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.529000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,3.429000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.164000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,2.794000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.529000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,2.794000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.259000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,3.429000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,3.429000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.084000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.084000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,2.794000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<37.084000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,2.794000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.719000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,5.334000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.339000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<46.609000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,3.429000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.244000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,2.794000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.609000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.704000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,2.794000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.704000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,2.794000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.339000,0.000000,2.794000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<43.434000,0.000000,4.064000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<40.894000,0.000000,4.064000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<38.354000,0.000000,4.064000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<45.974000,0.000000,4.064000>}
//JP7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,21.336000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.493000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,21.971000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<6.858000,0.000000,21.971000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,21.971000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,23.241000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.858000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,23.876000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.858000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.398000,0.000000,21.971000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.398000,0.000000,23.241000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.398000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.398000,0.000000,21.971000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<8.763000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.398000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,23.876000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<8.763000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,23.876000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.493000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,21.971000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,21.336000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.223000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.953000,0.000000,21.336000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.953000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.953000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.318000,0.000000,21.971000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.318000,0.000000,21.971000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.318000,0.000000,21.971000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.318000,0.000000,23.241000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<4.318000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.318000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.953000,0.000000,23.876000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.318000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.953000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,23.876000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.953000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,23.241000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<6.223000,0.000000,23.876000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<8.128000,0.000000,22.606000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<5.588000,0.000000,22.606000>}
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.080000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.144000,0.000000,11.430000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<5.080000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.080000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.144000,0.000000,16.002000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<5.080000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.054600,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.054600,0.000000,11.633200>}
box{<0,0,-0.063500><0.203200,0.036000,0.063500> rotate<0,90.000000,0> translate<5.054600,0.000000,11.633200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.144000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.144000,0.000000,11.633200>}
box{<0,0,-0.063500><0.203200,0.036000,0.063500> rotate<0,90.000000,0> translate<9.144000,0.000000,11.633200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.080000,0.000000,15.798800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.080000,0.000000,16.002000>}
box{<0,0,-0.063500><0.203200,0.036000,0.063500> rotate<0,90.000000,0> translate<5.080000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.144000,0.000000,15.798800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.144000,0.000000,16.002000>}
box{<0,0,-0.063500><0.203200,0.036000,0.063500> rotate<0,90.000000,0> translate<9.144000,0.000000,16.002000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.846000,0.000000,23.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.246000,0.000000,23.022000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.246000,0.000000,23.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.846000,0.000000,24.222000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.246000,0.000000,24.222000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.246000,0.000000,24.222000> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.246000,0.000000,20.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.846000,0.000000,20.920000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.246000,0.000000,20.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.246000,0.000000,19.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.846000,0.000000,19.720000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.246000,0.000000,19.720000> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.366000,0.000000,23.784000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.766000,0.000000,23.784000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.766000,0.000000,23.784000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.366000,0.000000,24.984000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.766000,0.000000,24.984000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.766000,0.000000,24.984000> }
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.350000,0.000000,3.856000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.350000,0.000000,3.256000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.350000,0.000000,3.256000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.150000,0.000000,3.856000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.150000,0.000000,3.256000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.150000,0.000000,3.256000> }
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.834000,0.000000,12.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.834000,0.000000,12.746000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.834000,0.000000,12.746000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.034000,0.000000,12.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.034000,0.000000,12.746000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.034000,0.000000,12.746000> }
//RB1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.994000,0.000000,16.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.994000,0.000000,16.810000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.994000,0.000000,16.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.194000,0.000000,16.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.194000,0.000000,16.810000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.194000,0.000000,16.810000> }
//RB2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.994000,0.000000,22.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.994000,0.000000,23.414000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.994000,0.000000,23.414000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.194000,0.000000,22.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.194000,0.000000,23.414000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.194000,0.000000,23.414000> }
//SJ2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,22.606000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,22.606000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<16.891000,0.000000,20.828000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<19.685000,0.000000,20.828000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<19.685000,0.000000,22.352000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<16.891000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,20.828000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.637000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,0.000000,20.828000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.939000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,20.574000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.764000,0.000000,21.590000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.764000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.304000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.812000,0.000000,21.590000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.304000,0.000000,21.590000> }
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<18.542000,0.000000,21.590000>}
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<18.034000,0.000000,21.590000>}
//SW2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.148000,-1.536000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.464000,-1.536000,18.415000>}
box{<0,0,-0.101600><11.684000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.464000,-1.536000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.464000,-1.536000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.148000,-1.536000,23.241000>}
box{<0,0,-0.101600><11.684000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.464000,-1.536000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.148000,-1.536000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.148000,-1.536000,22.479000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.148000,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.148000,-1.536000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.148000,-1.536000,18.415000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.148000,-1.536000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.148000,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.148000,-1.536000,19.177000>}
box{<0,0,-0.101600><3.302000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.148000,-1.536000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.464000,-1.536000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.464000,-1.536000,19.177000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,90.000000,0> translate<29.464000,-1.536000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.464000,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.464000,-1.536000,23.241000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,90.000000,0> translate<29.464000,-1.536000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.464000,-1.536000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.464000,-1.536000,22.479000>}
box{<0,0,-0.101600><3.302000,0.036000,0.101600> rotate<0,90.000000,0> translate<29.464000,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.208200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.208200,-1.536000,18.923000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<40.208200,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.208200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<39.293800,-1.536000,22.733000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<39.293800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<39.293800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<39.293800,-1.536000,22.733000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<39.293800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.293800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.208200,-1.536000,18.923000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.293800,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.938200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.938200,-1.536000,18.923000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<38.938200,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.938200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.023800,-1.536000,22.733000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<38.023800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.023800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.023800,-1.536000,22.733000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<38.023800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.023800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.938200,-1.536000,18.923000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<38.023800,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.668200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.668200,-1.536000,18.923000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<37.668200,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.668200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.753800,-1.536000,22.733000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<36.753800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.753800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.753800,-1.536000,22.733000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<36.753800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.753800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.668200,-1.536000,18.923000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<36.753800,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.398200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.398200,-1.536000,18.923000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<36.398200,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.398200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.483800,-1.536000,22.733000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<35.483800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.483800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.483800,-1.536000,22.733000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<35.483800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.398200,-1.536000,18.923000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<35.483800,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.128200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.128200,-1.536000,18.923000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<35.128200,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.128200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<34.213800,-1.536000,22.733000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<34.213800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<34.213800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<34.213800,-1.536000,22.733000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<34.213800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.213800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.128200,-1.536000,18.923000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<34.213800,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<33.858200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<33.858200,-1.536000,18.923000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<33.858200,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<33.858200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.943800,-1.536000,22.733000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<32.943800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.943800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.943800,-1.536000,22.733000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<32.943800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.943800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.858200,-1.536000,18.923000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<32.943800,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.588200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.588200,-1.536000,18.923000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<32.588200,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.588200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.673800,-1.536000,22.733000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<31.673800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.673800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.673800,-1.536000,22.733000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<31.673800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.673800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.588200,-1.536000,18.923000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<31.673800,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.318200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.318200,-1.536000,18.923000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<31.318200,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.318200,-1.536000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.403800,-1.536000,22.733000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<30.403800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.403800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.403800,-1.536000,22.733000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<30.403800,-1.536000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.403800,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.318200,-1.536000,18.923000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<30.403800,-1.536000,18.923000> }
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<39.751000,-1.536000,20.637500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<39.751000,-1.536000,20.002500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<39.751000,-1.536000,19.367500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<38.481000,-1.536000,20.637500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<38.481000,-1.536000,20.002500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<38.481000,-1.536000,19.367500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<37.211000,-1.536000,20.637500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<37.211000,-1.536000,20.002500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<37.211000,-1.536000,19.367500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<35.941000,-1.536000,20.637500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<35.941000,-1.536000,20.002500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<35.941000,-1.536000,19.367500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<34.671000,-1.536000,20.637500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<34.671000,-1.536000,20.002500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<34.671000,-1.536000,19.367500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<33.401000,-1.536000,20.637500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<33.401000,-1.536000,20.002500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<33.401000,-1.536000,19.367500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<32.131000,-1.536000,20.637500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<32.131000,-1.536000,20.002500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<32.131000,-1.536000,19.367500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<30.861000,-1.536000,20.637500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<30.861000,-1.536000,20.002500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<30.861000,-1.536000,19.367500>}
//U1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.991000,0.000000,7.671000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.991000,0.000000,14.681000>}
box{<0,0,-0.101600><7.010000,0.036000,0.101600> rotate<0,90.000000,0> translate<27.991000,0.000000,14.681000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.991000,0.000000,14.681000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.001000,0.000000,14.681000>}
box{<0,0,-0.076200><7.010000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.991000,0.000000,14.681000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.001000,0.000000,14.681000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.001000,0.000000,8.026000>}
box{<0,0,-0.101600><6.655000,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.001000,0.000000,8.026000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.646000,0.000000,7.671000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.991000,0.000000,7.671000>}
box{<0,0,-0.101600><6.655000,0.036000,0.101600> rotate<0,0.000000,0> translate<27.991000,0.000000,7.671000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.646000,0.000000,7.671000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.001000,0.000000,8.026000>}
box{<0,0,-0.101600><0.502046,0.036000,0.101600> rotate<0,-44.997030,0> translate<34.646000,0.000000,7.671000> }
difference{
cylinder{<35.153600,0,7.493000><35.153600,0.036000,7.493000>0.254000 translate<0,0.000000,0>}
cylinder{<35.153600,-0.1,7.493000><35.153600,0.135000,7.493000>0.050800 translate<0,0.000000,0>}}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.547300,0.000000,8.376000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.547300,0.000000,9.176000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.547300,0.000000,9.976000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.547300,0.000000,10.776000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.547300,0.000000,11.576000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.547300,0.000000,12.376000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.547300,0.000000,13.176000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.547300,0.000000,13.976000>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<34.296000,0.000000,15.227300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<33.496000,0.000000,15.227300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<32.696000,0.000000,15.227300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<31.896000,0.000000,15.227300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<31.096000,0.000000,15.227300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<30.296000,0.000000,15.227300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<29.496000,0.000000,15.227300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<28.696000,0.000000,15.227300>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.444700,0.000000,13.976000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.444700,0.000000,13.176000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.444700,0.000000,12.376000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.444700,0.000000,11.576000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.444700,0.000000,10.776000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.444700,0.000000,9.976000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.444700,0.000000,9.176000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.444700,0.000000,8.376000>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<28.696000,0.000000,7.124700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<29.496000,0.000000,7.124700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<30.296000,0.000000,7.124700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<31.096000,0.000000,7.124700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<31.896000,0.000000,7.124700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<32.696000,0.000000,7.124700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<33.496000,0.000000,7.124700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<34.296000,0.000000,7.124700>}
//U2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.648000,0.000000,20.956000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.948000,0.000000,20.956000>}
box{<0,0,-0.063500><19.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.948000,0.000000,20.956000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.648000,0.000000,36.956000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.948000,0.000000,36.956000>}
box{<0,0,-0.063500><19.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.948000,0.000000,36.956000> }
difference{
cylinder{<41.783000,0,21.971000><41.783000,0.036000,21.971000>0.444500 translate<0,0.000000,0>}
cylinder{<41.783000,-0.1,21.971000><41.783000,0.135000,21.971000>0.317500 translate<0,0.000000,0>}}
//Y1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.588000,0.000000,18.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.588000,0.000000,16.780000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.588000,0.000000,16.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.438000,0.000000,16.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.588000,0.000000,16.780000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.438000,0.000000,16.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.438000,0.000000,18.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.588000,0.000000,18.780000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.438000,0.000000,18.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.088000,0.000000,18.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.088000,0.000000,16.780000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.088000,0.000000,16.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.088000,0.000000,16.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.238000,0.000000,16.780000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.088000,0.000000,16.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.088000,0.000000,18.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.238000,0.000000,18.780000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.088000,0.000000,18.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.588000,0.000000,16.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.088000,0.000000,16.780000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.088000,0.000000,16.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.088000,0.000000,16.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.088000,0.000000,18.780000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<35.088000,0.000000,18.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.088000,0.000000,18.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.588000,0.000000,18.780000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.088000,0.000000,18.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.588000,0.000000,18.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.588000,0.000000,16.780000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<39.588000,0.000000,16.780000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  M328P_RFM69_NODE(-32.766000,0,-20.828000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//BAT3	1.5V - AA	BATTERY-AA-KIT
//BAT4	1.5V - AA	BATTERY-AA-KIT
//CT1	MUTUAL	MUTUAL
//JP1	ANTENNA	LUXEON-PAD
//SW2	Node ID	DIPSWITCH-08-50MIL
