--! Tarefa 06: Registrador de 16 bits
--! Aluno: Matheus Rodrigues da Cunha
--! Data: 02/11/2024

#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom reg.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -label clk_t -radix binary /clk_t
add wave -label sclr_in_t -radix binary /sclr_in_t
add wave -label clk_ena_t -radix binary /clk_ena_t
add wave -label datain_t  -radix hex  /datain_t
add wave -label reg_out_t  -radix unsigned  /reg_out_t

#Simula até um 500ns
run 100ns

wave zoomfull
write wave wave.ps