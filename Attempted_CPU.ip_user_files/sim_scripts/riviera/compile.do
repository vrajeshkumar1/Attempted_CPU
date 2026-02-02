transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+P:/2025.2/Vivado/data/rsb/busdef" -l xpm -l xil_defaultlib \
"P:/2025.2/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"P:/2025.2/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+P:/2025.2/Vivado/data/rsb/busdef" -l xpm -l xil_defaultlib \
"../../../Attempted_CPU.srcs/sources_1/new/top.v" \


vlog -work xil_defaultlib \
"glbl.v"

