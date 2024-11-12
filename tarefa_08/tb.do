
-- Multiplicador 8x8
-- Matheus Rodrigues da Cunha
-- Data: 10/11/2024

#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom adder.vhd counter.vhd mult.vhd mux_sel.vhd reg.vhd seven_segment_cntrl.vhd shifter.vhd mult_control.vhd multiplicador_8x8.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -radix binary /clk_t
add wave -radix binary /start_t
add wave -radix binary /reset_a_t

add wave -radix uns /tb_dataa
add wave -radix uns /tb_datab

add wave -radix binary /done_flag_t
add wave -radix binary /seg_out_t
add wave -radix uns /product8x8_out_t


#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps