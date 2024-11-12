-------------------------------------------------------
--! Tarefa 04: shifter
--! Aluno: Matheus Rodrigues da Cunha
--! Data: 29/10/24
-------------------------------------------------------
#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom shifter.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -label input_t -radix binary /input_t
add wave -label shift_cntrl_t -radix unsigned /shift_cntrl_t
add wave -label shift_out_t  -radix binary /shift_out_t 

#Simula até um 500ns
run 100ns

wave zoomfull
write wave wave.ps