onerror {quit -f}
vlib work
vlog -work work Main.vo
vlog -work work Main.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Main_vlg_vec_tst
vcd file -direction Main.msim.vcd
vcd add -internal Main_vlg_vec_tst/*
vcd add -internal Main_vlg_vec_tst/i1/*
add wave /*
run -all
