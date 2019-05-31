transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/srgoo/Desktop/PersonalProjects/32_Bit_MIPS/32Bit_MIPS {C:/Users/srgoo/Desktop/PersonalProjects/32_Bit_MIPS/32Bit_MIPS/dxp_mux2to1_v.v}
vlog -vlog01compat -work work +incdir+C:/Users/srgoo/Desktop/PersonalProjects/32_Bit_MIPS/32Bit_MIPS {C:/Users/srgoo/Desktop/PersonalProjects/32_Bit_MIPS/32Bit_MIPS/srg_32Bit_CLA.v}
vlog -vlog01compat -work work +incdir+C:/Users/srgoo/Desktop/PersonalProjects/32_Bit_MIPS/32Bit_MIPS {C:/Users/srgoo/Desktop/PersonalProjects/32_Bit_MIPS/32Bit_MIPS/srg_32mux2to1.v}
vlog -vlog01compat -work work +incdir+C:/Users/srgoo/Desktop/PersonalProjects/32_Bit_MIPS/32Bit_MIPS {C:/Users/srgoo/Desktop/PersonalProjects/32_Bit_MIPS/32Bit_MIPS/srg_32Bit_ALU.v}

vlog -vlog01compat -work work +incdir+C:/Users/srgoo/Desktop/PersonalProjects/32_Bit_MIPS/32Bit_MIPS {C:/Users/srgoo/Desktop/PersonalProjects/32_Bit_MIPS/32Bit_MIPS/srg_32Bit_ALU_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  srg_32Bit_ALU_tb

add wave *
view structure
view signals
run -all
