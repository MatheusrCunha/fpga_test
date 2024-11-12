-- Nome: Matheus Rodrigues da Cunha
-- Tarefa 03

#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom mux_sel.vhd mux_when.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -label mux_sel_t -radix  binary /mux_sel_t
add wave -label mux_in_a_t -radix  binary /mux_in_a_t
add wave -label mux_in_b_t -radix  binary  /mux_in_b_t
add wave -label mux_sel_out -radix  binary  /mux_sel_out
add wave -label mux_when_out -radix  binary  /mux_when_out


#Simula até um 500ns
run 100ns

wave zoomfull
write wave wave.ps